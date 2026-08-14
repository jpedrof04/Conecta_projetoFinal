module ApplicationHelper
  def nav_active?(path)
    request.path == path || request.path.start_with?("#{path}/")
  end
end
