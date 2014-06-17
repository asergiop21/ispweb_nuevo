module TicketsHelper
  def nested_tickets(tickets)
    tickets.map do |ticket, sub_tickets|
      render(ticket)
    end.join.html_safe
    
  end 

  def nested_sub_tickets(tickets)
    tickets.map do |ticket, sub_tickets|
      render(:partial => "sub_tickets", :locals => {:ticket => ticket}) + content_tag(:div, nested_tickets(sub_tickets), :class => "nested_tickets")
    end.join.html_safe
    
  end 
end
