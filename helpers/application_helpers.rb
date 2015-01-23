module ApplicationHelpers
  def page_title
    title = "Project Jellyfish"
    if data.page.title
      title << " :: " + data.page.title
    else
      title
    end
    title
  end

  def get_sections
    sitemap.resources
      .select{ |resource| resource.data.title? && resource.data.status == "published"}
      .sort_by{ |r| r.data.priority.to_i }
      .group_by{ |g| g.data.section }.sort
  end
end
