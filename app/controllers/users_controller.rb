class UsersController < ApplicationController
    before_action :set_user, only: %i[ show new edit update destroy ]


      # POST /pets or /pets.json
  def create
    @user = user.new(user_params)
 
    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: "Pet was successfully created." }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def show
    # @observations = @user.observation 
    @posts = @user.post 
    
  end

    private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_params
      params.require(:user).permit(:email, :name, :photo, images)
    end

end