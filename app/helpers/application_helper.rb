module ApplicationHelper
  def github_url(author, repo)
    link_to 'GitHub', "https://github.com/#{author}/#{repo}", target: "_blank"
  end

  def current_year
    Time.current.year
  end

  def flash_message(type)
    content_tag :p, flash[type], class: "alert #{bs_alert_class(type)}" unless flash[type].nil?
  end

  def bs_alert_class(type)
    case type
    when :alert
      'alert-danger'
    else
      'alert-warning'
    end
  end

  def brand
    link_to 'Test Guru', root_path, class: 'navbar-brand'
  end

  def signup_link
    content_tag :li, class: 'nav-item' do
      link_to 'Sign up', signup_path, class: 'nav-link' unless logged_in?
    end
  end

  def signin_link
    content_tag :li, class: 'nav-item' do
      link_to 'Sign in', signin_path, class: 'nav-link' unless logged_in?
    end
  end

  def signout_link
    content_tag :li, class: 'nav-item' do
      link_to 'Sign out', signout_path, method: :delete, class: 'nav-link' if logged_in?
    end
  end

  def welcome_message
    content_tag :span, "Welcome, #{current_user.username} Guru", class: 'navbar-text' if logged_in?
  end
end
