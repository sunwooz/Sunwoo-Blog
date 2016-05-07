$ ->
  postTagList = $('#post_tag_list')
  tagListWithSpaces = postTagList.val()
  replaced = tagListWithSpaces.replace(' ', ', ');
  postTagList.val(replaced)
