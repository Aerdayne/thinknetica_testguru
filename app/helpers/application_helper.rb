module ApplicationHelper
  def github_url(author, repo)
    link_to 'GitHub', "https://github.com/#{author}/#{repo}", target: "_blank"
  end

  def current_year
    Time.current.year
  end
end
