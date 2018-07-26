class PostController < ApplicationController

  def index
    @posts = current_user.posts
  end

  def create

    
  end
  
  def show
  	accountSid = 'AC23c2f52fea6c41b3c74b52ae3b104e88'; 
	authToken = '119b186212bd9a67384a4b6f62f57e1e'; 
  	 client = Twilio::REST::Client.new accountSid, authToken
    message = client.messages.create from: '+13852174470', to: '+917509154216', body: 'First ever MyMedy notifcation test.'
    @post = Post.find(params[:id])
  end
end
