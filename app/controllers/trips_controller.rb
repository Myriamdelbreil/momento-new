class TripsController < ApplicationController
  def index
    @user = current_user
    @trip = Trip.new
    @trips = Participant.where(user: @user).map(&:trip)
    @new_participant = Participant.new
    @coming_trips = @trips.select { |trip| trip.start_date > Time.now && trip.end_date > Time.now }
    @past_trips = @trips.select { |trip| trip.start_date < Time.now && trip.end_date < Time.now }
    @current_trips = @trips.select { |trip| trip.start_date < Time.now && trip.end_date > Time.now }
    unless @trips == []
      @markers = @trips.each do |trip|
        if trip.geocoded?
          {
            lat: trip.latitude,
            lng: trip.longitude
          }
        end
      end
    end
  end

  def show
    @trip = Trip.find(params[:id])
    @participants = @trip.participants
    @participant = @participants.find_by(user: current_user)
    if @participant.nil?
      redirect_to trips_path, alert: "Tu ne participes pas à ce voyage"
    else
      # relatif aux transports
      @transportations = @participant.transportations
      @new_transportation = Transportation.new

      # relatif aux accomodations
      @accomodations = @trip.accomodations
      @new_accomodation = Accomodation.new
      if @accomodations.count.positive?
        @markers = @accomodations.geocoded.map do |accomodation|
          {
            lat: accomodation.latitude,
            lng: accomodation.longitude,
            # info_window: render_to_string(partial: "info_window", locals: { accomodations: accomodation }),
            # image_url: helpers.asset_url("emplacement.png")
          }
        end
      end
      @new_accomodation_vote = AccomodationVote.new
      @accomodations.each do |accomodation|
        @accomodation_votes = accomodation.accomodation_votes
      end

      # relatif aux amis
      if params[:query].present?
        sql_query = " \
          users.username ILIKE :query \
          OR users.email ILIKE :query \
        "
        @users = User.where(sql_query, query: "%#{params[:query]}%").reject { |user| user.id == current_user.id }
      end
      @new_participant = Participant.new

      # relatif aux dépenses :
      @mutual_expenses = @trip.expenses.where(mutual: true)
      @individual_expenses = @participant.expenses.where(mutual: false)
      @my_expenses = [@mutual_expenses, @individual_expenses]
      # additionner toutes les dépenses mutuelles :
      @sum_mutual_expenses = @trip.expenses.where(mutual: true).sum(:amount)
      # additionner toutes les dépenses personnelles du participant
      @sum_individual_expenses = @participant.expenses.where(mutual: false).sum(:amount)
      # total par participant
      @total_participant_expenses = @sum_individual_expenses + (@sum_mutual_expenses/@trip.participants.count)
      # créer une nouvelle dépense
      @new_expense = Expense.new

      # relatif aux messages :
      @messages = @trip.messages

      # relatifs à l'agenda
      @new_event = Event.new
      @events = @trip.events
      @new_event_participant = EventParticipant.new
      @events.each do |event|
        @event_participants = event.event_participants
      end
    end
  end

  def create
    @new_trip = Trip.new(trip_params)
    @user = current_user
    @new_trip.user = @user
    if @new_trip.save
      @participant = Participant.create!(user: @user, trip: @new_trip)
      redirect_to trip_path(@new_trip), notice: "Cool ! You're ready to plan your holidays "
    else
      render "trips/index", alert: "Your trip couldn't have been created, sorry ! Try again"
    end
  end

  def update
    @trip = Trip.find(params[:id])
    if @trip.update(trip_params)
      redirect_to trip_path
    else
      render "trips/index", alert: "Your trip couldn't have been edited, sorry ! Try again"
    end
  end

  def destroy
    @trip = Trip.find(params[:id])
    @trip.destroy
    redirect_to trips_path
  end

  private

  def trip_params
    params.require(:trip).permit(:start_date, :end_date, :title, :description, :city, :photos, :longitude, :latitude)
  end
end
