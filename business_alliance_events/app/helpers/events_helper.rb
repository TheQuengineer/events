module EventsHelper
  def image_for(event)
    if event.image_file_name.blank?
      image_tag 'IMG_2543.JPG'
    else
      image_tag event.image_file_name
    end
  end
end
