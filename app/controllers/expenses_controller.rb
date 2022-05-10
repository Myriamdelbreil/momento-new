class ExpensesController < ApplicationController
  def create
    @trip = Trip.find(params[:trip_id])
    @new_expense = Expense.new(expense_params)
    @participant = Participant.find_by(user: current_user, trip: @trip)
    @new_expense.participant = @participant
    if @new_expense.save!
      redirect_to trip_path(@participant.trip), notice: "Dépense ajoutée !"
    else
      redirect_to trip_path(@participant.trip), alert: "Ca n'a pas marché, désolés... Réessaie!"
    end
  end

  def destroy
    @expense = Expense.find(params[:id])
    @trip = Trip.find(params[:trip_id])
    @expense.destroy
    redirect_to trip_path(@trip)
  end

  private

  def expense_params
    params.require(:expense).permit(:title, :amount, :mutual, :participant_id, :expense_date, :trip_id)
  end
end
