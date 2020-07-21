module StaticPagesHelper
  def full_title page_title
    basic_title = "Welcome to travel"
    page_title.blank? ? basic_title : " #{page_title} | #{basic_title}"
  end

  def slide title, content
    title = "Welcome to travel" if title.blank?
    {title: title, content: content}
  end
end
