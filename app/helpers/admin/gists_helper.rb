module Admin::GistsHelper
  def gist_link(url)
    url.split('/')[-1]
  end
end
