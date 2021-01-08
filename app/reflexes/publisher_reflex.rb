# frozen_string_literal: true

class PublisherReflex < ApplicationReflex
  
  def publish
    image = Image.find(element.dataset[:image_id])
    image.update(published: true)
  end

  def unpublish
    image = Image.find(element.dataset[:image_id])
    image.update(published: false)
  end

end
