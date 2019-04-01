class VerifyDataChannel < ApplicationCable::Channel
  def subscribed
  	reject and return unless current_user
    stream_from "verify_data_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
