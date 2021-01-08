# frozen_string_literal: true

class LikerReflex < ApplicationReflex
  delegate :current_user, to: :connection
  
  def like
    if already_liked?
        flash[:notice] = "You already liked this image"
    else
        Image.find(element.dataset[:image_id]).likes.create(user_id: current_user.id)
    end
  end

  def unlike
    if !(already_liked?)
      flash[:notice] = "Cannot unlike"
    else
      current_like.destroy
    end
  end

  private

  def current_like
    Like.where(user_id: current_user.id, image_id: element.dataset[:image_id]).first
  end

  def already_liked?
    Like.where(user_id: current_user.id, image_id: element.dataset[:image_id]).exists?
  end

end
