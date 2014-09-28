class BookReview < ActiveRecord::Base
  before_save :generate_body_html

  has_attached_file :image

  def generate_body_html
    return if self.review_text.blank?
    logger.debug "generate_body_html has been called".green
    markdown = Redcarpet::Markdown.new(
      Redcarpet::Render::HTML.new(:hard_wrap => true),
      :no_intra_emphasis => true,
      :autolink => true,
      :fenced_code_blocks => true)

    self.body_html = Redcarpet::Render::SmartyPants.render(
      SyntaxHighlighter.new(
        markdown.render(self.review_text)
      ).to_s
    )
  end
  
end