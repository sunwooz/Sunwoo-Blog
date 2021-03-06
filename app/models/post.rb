class Post < ActiveRecord::Base
  extend FriendlyId
  friendly_id :title, use: [:slugged]
  acts_as_taggable

  before_save :generate_body_html

  has_attached_file :image, styles: { large: "1555×1037" }
  validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]

  def generate_body_html
    return if self.content.blank?
    logger.debug "generate_body_html has been called".green
    markdown = Redcarpet::Markdown.new(
      Redcarpet::Render::HTML.new(:hard_wrap => true),
      :no_intra_emphasis => true,
      :autolink => true,
      :fenced_code_blocks => true)

    self.body_html = Redcarpet::Render::SmartyPants.render(
      SyntaxHighlighter.new(
        markdown.render(self.content)
      ).to_s
    )
  end

end
