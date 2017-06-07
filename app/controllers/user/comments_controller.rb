class User::CommentsController < User::ApplicationController
  def index
    @comments = Post.find(params[:post_id]).comments.page(params[:page]).per(10)
    render json: @comments
  end

  def show
  end

  def new
  end

  def edit
  end

  def create
    @comment = Comment.new(params.permit(:body, :post_id))
    respond_to do |format|
      if @comment.save
        format.html { redirect_to @comment.post, notice: 'Comment was successfully created.' }
        format.json { render json: {
          formatted_created_date: helpers.date_format(@comment.created_at),
          body: @comment.body
        }, status: :created }
      else
        format.html { render :new }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
  end

  def destroy
  end
end
