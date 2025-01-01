class ReactionsController < ApplicationController
  before_action :authenticate_user!

  def post_with_reactions
      @posts = current_user.reactions
      post_ids = @reactions.map(&:post_id)
      @posts = Post.where(id: post_ids)
  end


  def user_reaction
      @user = current_user
      @post = Post.find(params[:post_id])
      reaction = Reaction.find_by(user_id: @user.id, post_id: @post.id)
      if reaction
        return flash.now[:alert] = 'Ya reacionaste a esta publicación'
      else
        @new_reaction = Reaction.new(user_id: @user.id, post_id: @post.id, kind: params[:kind])
        respond_to do |format|
          if @new_reaction.save!
            format.html { redirect_to post_path(@post), notice: " #{current_user.email} 
             has realizado  #{@new_reaction.kind} a la postulacion" }
          else
            format.html { redirect_to post_path(@post), status: :unprocessable_entity }
          end
        end
      end
    end

end