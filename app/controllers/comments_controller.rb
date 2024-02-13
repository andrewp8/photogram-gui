class CommentsController < ApplicationController
  def create
    the_comment = Comment.new
    the_comment.photo_id = params.fetch("input_photo_id")
    the_comment.author_id = params.fetch("input_author_id")
    the_comment.body = params.fetch("input_comment")

    the_comment.save
    redirect_to("/photos/#{the_comment.photo_id}", :notice => "Photo updated successfully.")
  end
end
