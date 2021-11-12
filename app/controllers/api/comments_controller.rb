class Api::CommentsController < ApplicationController
  load_and_authorize_resource

  def index
    @comments = Comment.where({ post_id: params[:post_id] }).order('created_at')
    render json: { success: true, data: { comments: @comments } }
  end

end
