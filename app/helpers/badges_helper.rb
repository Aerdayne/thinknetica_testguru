module BadgesHelper
  def amount_of_badges(given_badge)
    given_badge.amount
  end

  def render_icon(image_path)
    tag.img src: "/badges/#{image_path}", alt: 'No icon'
  end

  def badge_header(badge)
    action = badge.new_record? ? 'Create new' : 'Edit'
    "#{action} Badge"
  end
end
