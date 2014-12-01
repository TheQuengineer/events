module RegistrationsHelper
  def register_link(event)
    if event.has_no_more_seats?
      content_tag(:strong, "No seats left. We are currently looking to make more room!")
    else
      link_to "Register!", new_event_registration_path(event), class: "button"
    end
  end
end
