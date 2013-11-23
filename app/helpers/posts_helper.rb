module PostsHelper

  def link_to_all_posts
    posts = Post.all 
    html = ""
    lists1 = posts.group_by { |p| p.created_at.strftime("%Y") }
    lists1.each do |year, list|
      html << "<h5><span><i class='arrow' id='#{year}'></i></span> "+ link_to_filter(year, list.size, "yy") +"</h5>"
      html << "<ul class='#{year}_posts main'>"
      lists = list.group_by { |p| p.created_at.strftime("%B") }
      lists.each do |date, list|
        html << "<li class='main'>"
        mm = list.first.created_at.strftime("%m")
        html << "<h5><span><i class='arrow' id='#{year}_#{mm}'></i></span>"+ link_to_filter(date, list.size, "mm_#{year}_#{mm}") +"</h5>"
        html << "<ul class='#{year}_#{mm}_posts'>"
        list.each do |post|
          html << "<li>" + post_url(post) + "</li>"
        end
        html << "</li></ul>"
      end
      html << "</ul>"
    end
    html.html_safe
  end
  
  def link_to_filter(date, count, type)
    txt = date.to_s + '('+ count.to_s + ')'
    if type == "yy"
      link_to txt, search_posts_path(date, nil)
    else
      yy, mm = type.scan(/\d+/)
      link_to txt, search_posts_path(yy, mm)
    end
  end

  def post_url(post)
    link_to post.title, post_show_path(yy: post.created_at.strftime("%Y"), mm: post.created_at.strftime("%m"), id: post.title.parameterize)
  end
  
  def format_content(data)
    simple_format(data) #OR
    #(h(data).gsub(/\n/, '<br/>')).html_safe 
  end
end
