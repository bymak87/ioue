require 'dotenv'
Dotenv.load
require 'twilio-ruby'

class EventsController < ApplicationController
  def new

  end

  def create
    @event = Event.create(:user_id=> current_user.id, :name => params[:name].capitalize, :pay_date => params[:pay_date], :friend=> params[:friend].capitalize, :amount=> params[:amount], :status=>"pending")


    #confirmation text

    account_sid = ENV['SID']
    auth_token = ENV['TOKEN']

    # set up a client to talk to the Twilio REST API
    @client = Twilio::REST::Client.new account_sid, auth_token

    #send text
    @client.account.messages.create(
    :from => '+18329812216',
    :to => '+15124847144', #current_user.cellphone
    :body => 'IOU Event with ... been created'
  )
    flash[:created] = "IOU successfully created"
    redirect_to "/users/#{current_user.id}/events/#{@event.id}"

  end

  def remind
    account_sid = ENV['SID']
    auth_token = ENV['TOKEN']

    # set up a client to talk to the Twilio REST API
    @client = Twilio::REST::Client.new account_sid, auth_token

    #send text
    @client.account.messages.create(
    :from => '+18329812216',
    :to => '+15124847144', #current_user.cellphone
    :body => 'IOU Event with ... been created'
    )
  end

  def paid
    @id = params[:event_id]
    @event = Event.find(@id)
    @event.status = "paid"
    @event.save

    account_sid = ENV['SID']
    auth_token = ENV['TOKEN']

    # set up a client to talk to the Twilio REST API
    @client = Twilio::REST::Client.new account_sid, auth_token

    #send text
    @client.account.messages.create(
    :from => '+18329812216',
    :to => '+15124847144', #current_user.cellphone
    :body => 'You have paid off your IOU with...'
  )
    redirect_to "/users/#{current_user.id}/events/#{@event.id}"

  end

  def index
    @events = current_user.events
  end

  def show
    @event = Event.find(params[:id])
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy
    redirect_to :back
    flash[:created] = "IOU event deleted"
  end
end
