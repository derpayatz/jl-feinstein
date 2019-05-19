def markdown_responsive_image(post, payload)
  docExt = post.extname.tr('.', '')
  # only process if we deal with a markdown file
  if payload['site']['markdown_ext'].include? docExt
    newContent = post.content.gsub(/\!\[(.*)\s*\]\(\s*(.+?)\s*(\".+?\")?\s*\)(?:\{: ?\.?(.+?)\"?\})?/, '{% responsive_image path: \2 alt:"\1"  title:\3 class:"\4"%}').split(" .").join(' ')
    post.content = newContent
  end
end

Jekyll::Hooks.register :pages, :pre_render do |post, payload|
    markdown_responsive_image post, payload
end
Jekyll::Hooks.register :documents, :pre_render do |post, payload|
    markdown_responsive_image post, payload
end

# use example:
#![ alt text ]( path  "title"){: classes}
