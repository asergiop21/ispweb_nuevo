class CustomerBandwidth < ActiveRecord::Base
  attr_accessible :customer, :gdr, :gur, :ip_device, :mdr, :mup

        def self.create_mikrotik
                #mkt = Mktcx.all
                #++++++Centralizado
                @IP = '10.255.0.13'
                @USER = 'sergio'
                @PASS ='123456'

                #+++Distribuido+++++
                #mkt.each do |s|
                #        @ip = s.mkcip
                #        @user = s.mkcusuario
                #        @pass = s.password
                #end
                #++++++++++++++++++++++++++++
                #        @ip_customer = targetaddr
                #            # Connect to the device:
                #            mt = MTik::Connection.new :host => @ip, :user=> @user, :pass => @pass
                #            # Be verbose in output
                #            MTik::verbose = true
                #            mt.get_reply("/ip/firewall/address-list/add",
                #            "=address=#{@ip_customer}",
                #            "=list=cortados")
                #
                #            #+++++++++Eliminacion de los clientes en mikrotik+++++++++++++++++++++++++++++++++
                #            #    @users = {}
                #            #   mt.get_reply_each('/queue/simple/print') do |r,s|
                #            #   @users [s['name']] = {:id => s['.id'] } 
                #            #   mt.get_reply_each('/queue/simple/remove', "=.id=#{@users[s['name']][:id]}") 
                #            #  end
                #            #+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
                #
                #            #++++++++++++++++++Agregar Array de clientes++++++++++++++++++++++++++++++++++++++
                #
                @customers_mkt = CustomerBandwidths.all 

                @customers_mkt.each do |s|
                        mt.get_reply_each(
                                "/queue/simple/add",
                                "=name=#{s.customer}",
                                "=target-addresses=#{s.ip_device}",
                                "=max-limit=#{s.mdr.to_s + "/" + s.mur.to_s}",
                        )
                end
        end

end
