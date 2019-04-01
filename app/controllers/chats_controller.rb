class ChatsController < ApplicationController

	def new
		
	end
	def index
		@chat = Chat.new
	end

	def create
		ActionCable.server.broadcast("verify_data_channel", params[:chat][:title])
	end
end
