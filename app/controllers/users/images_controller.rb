module Users
  class ImagesController < UsersController
    before_action :set_image, only: [:edit, :update, :destroy]
  
    # GET /images
    def index
      @images = current_user.images
    end
  
    # GET /images/new
    def new
      @image = current_user.images.build
    end
  
    # GET /images/1/edit
    def edit
    end
  
    # POST /images
    def create
      @image = current_user.images.build(image_params)
      p image_params
  
      if @image.save
        redirect_to edit_image_path(@image), notice: 'Image was successfully created.'
      else
        render :new
      end
    end
  
    # PATCH/PUT /images/1
    def update
      if @image.update(image_params)
        redirect_to edit_image_path(@image), notice: 'Image was successfully updated.'
      else
        render :edit
      end
    end
  
    # DELETE /images/1
    def destroy
      @image.destroy
      redirect_to images_path, notice: 'Image was successfully destroyed.'
    end
  
    private
      # Use callbacks to share common setup or constraints between actions.
      def set_image
        @image = current_user.images.find(params[:id])
      end
  
      # Only allow a trusted parameter "white list" through.
      def image_params
        params.require(:image).permit(:description, :upload)
      end
  end 
end

