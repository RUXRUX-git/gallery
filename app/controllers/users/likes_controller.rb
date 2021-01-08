module Users
    class LikesController < UsersController
        before_action :set_image, only: [:create, :destroy]
        before_action :set_like, only: [:destroy]
    
        def create 
            if already_liked?
                flash[:notice] = "You already liked this image"
            else
                @image.likes.create(user_id: current_user.id)
            end
            redirect_back(fallback_location: root_path)
        end
    
        def destroy
            if !(already_liked?)
              flash[:notice] = "Cannot unlike"
            else
              @like.destroy
            end
            redirect_back(fallback_location: root_path)
          end
    
        private 
    
        def set_image
            @image = Image.find(params[:image_id])
        end
    
        def set_like
            @like = @image.likes.find(params[:id])
        end
    
        def already_liked?
            Like.where(user_id: current_user.id, image_id: params[:image_id]).exists?
        end
    end
end

