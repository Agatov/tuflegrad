class CommentsController < ApplicationController
  def index
    @comments = Comment.where(moderated: true).order('id desc')
  end

  def create
  end
end