class EventsController < ApplicationController
	def events
		# raise params.inspect
		@events = current_user.events.where(start: (DateTime.parse(params[:start]))..DateTime.parse(params[:end]))
		# raise @events.inspect
		render json: @events
	end

	def new
		# raise params.inspect
		user = User.find(params[:user_id])
		user.events.create(start: DateTime.strptime(params[:startTime], '%m/%d/%Y %I:%M %p'), end: DateTime.strptime(params[:endTime], '%m/%d/%Y %I:%M %p'), title: params[:title], description: params[:description])
		redirect_to calendar_path
	end
end
