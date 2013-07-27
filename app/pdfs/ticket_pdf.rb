class TicketPdf < Prawn::Document
  def initialize(ticket, customer)
    super(left_margin: 30)
    @ticket = ticket
    @customer = customer
    titles

  #  text "\##{@customer.name}"
  end
  
  def titles
      span(200, :position=> :right) do
        text "ORDER SOPORTE TECNICO"
        end
        stroke_horizontal_rule
        move_down 10
      
      text "DATOS PERSONALES"
        move_down 5
        personal
        move_down 10
      
      text "DATOS TECNICOS"
        move_down 5
        technical_data 
        move_down 10

      text "EQUIPO"
        move_down 5
        equipment
        move_down 10
      
      text "TIPO DE PROBLEMA"
        move_down 5
        type_failure
        move_down 10
 
        return_visit
        move_down 10
        footer 
  end
  def personal
     data = [["Clientes:", @customer.name], 
             ["Domicilio:", @customer.address],
             ["Entre:", @customer.reference_direction],
             ["Telefono:", @customer.phone_cus]
   ]
     table(data, :column_widths => [100, 400])
  end
  def technical_data
      table_data = [["Ip PC", "....", "IP Antena:","..."],
                   ["ABono", ".....", "Velocidad", "..."] 
                  ]

      table(table_data, :column_widths => [100, 150,100,150])
  end 

  def equipment

      data_equipment = [["Trasmisor:", "", "Mac:", ""],
                        ["Wifi:", "", "Mac:", ""],
                        ["Switch:","","Serial:", ""],
                        ["Otros","", "Mac", ""]
                        ]
      table(data_equipment, :column_widths => [80,200,80,140])
 end
 def type_failure
      data_failure = [["Problema", "Tarea Realizada"],
                      ["", ""]]  
      table(data_failure, :column_widths => [250,250]) 

      option_failure = [
                        ["","Cambio POE", "", "Orientacion Antena", "", "Cambio de ip"],
                        ["","Cambio Cable", "", "Reconfiguracion Eq.", "", "Pc con virus"],
                        ["","Cambio RJ45", "", "Reconfiguracion Wifi", "", "Cambio de senal"]
                        ] 
      move_down 10
      table(option_failure, :column_widths => [17,150,17,150,16,150])
  end 

  def return_visit

     data_return = [["", "Es Necesario Volver con:", "","Con Cargo"]]
     
      table(data_return, :column_widths=> [15,235,15,235])
      table([["", ""], ["",""], ["",""]], :column_widths => [250,250])


  end 


  def footer
    
    bounding_box([10,100], :width => 500, :height => 150) do
    text "Sr. Cliente: Recuerde verificar que lo escrito en 'TAREA REALIZADA' coincida con el trabajo realizado por el tecnico.
          Cualquier consulta llame al 0-810-333-1637, de Lun. a Vie. de 9:0 a 18:00 y Sab. de 9:00 a 13:00"
  end
end




end 
