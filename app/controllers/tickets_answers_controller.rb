class TicketsAnswersController < ApplicationController

 before_filter :all_tickets
 
 def index
    @tickets_answers = @tickets.ticket_answer
   #@tickets_answers = TicketsAnswer.all
    respond_to do |format|
      format.html
      format.json {render json: @tickets_answers}
    end

  end

  def new
    @ticket_answer = @tickets.ticket_answer.new 
#    1.times {@ticket.ticket_answer.build} if @ticket[:status] != 'cerrado'

    respond_to do |format|
      format.html
      format.json {render json: @ticket_answer}
    end

  end


  def show

  end

private

  def all_tickets
    @customer = Customer.find(params[:customer_id])
    @tickets = @customer.tickets.find(params[:ticket_id])
  end


end
