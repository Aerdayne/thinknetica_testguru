module ApplicationHelper
  def github_url(author, repo)
    link_to 'GitHub', "https://github.com/#{author}/#{repo}", target: "_blank"
  end

  def current_year
    Time.current.year
  end

  def flash_message(type)
    content_tag :p, flash[type].html_safe, class: "alert #{bs_alert_class(type)}" unless flash[type].nil?
  end

  def bs_alert_class(type)
    hash = { 'alert' => 'alert-danger',
             'notice' => 'alert-success' }
    hash.default = 'alert-warning'
    hash[type]
  end

  def brand
    link_to 'Test Guru', root_path, class: 'navbar-brand'
  end

  def tests_link
    if current_user&.admin?
      content_tag :li, class: 'nav-item' do
        link_to 'View tests', admin_tests_path, class: 'nav-link'
      end
    else
      content_tag :li, class: 'nav-item' do
        link_to 'View tests', tests_path, class: 'nav-link'
      end
    end
  end

  def gists_link
    content_tag :li, class: 'nav-item' do
      link_to 'View gists', admin_gists_path, class: 'nav-link' if current_user.admin?
    end
  end

  def signup_link
    content_tag :li, class: 'nav-item' do
      link_to 'Sign up', new_user_registration_path, class: 'nav-link' unless signed_in?
    end
  end

  def signin_link
    content_tag :li, class: 'nav-item' do
      link_to 'Sign in', new_user_session_path, class: 'nav-link' unless signed_in?
    end
  end

  def signout_link
    content_tag :li, class: 'nav-item' do
      link_to 'Sign out', destroy_user_session_path, method: :delete, class: 'nav-link' if signed_in?
    end
  end

  def welcome_message
    content_tag :span, "You are logged in as #{current_user.email}", class: 'navbar-text' if signed_in?
  end
end
