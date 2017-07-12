class HelloTrema < Trema::Controller

  def start
    puts "Hello, Trema!"
  end

  def switch_ready(dpid)
    puts "Hello, #{dpid.to_hex}!"
    send_flow_mod_add(
       dpid,
       priority:0
    )
    ins = ApplyAction.new( actions:SendOutPort.new(1) )
    send_flow_mod_add(
       dpid,
       priority:10,
       match:Match.new( in_port:2 ),
       instructions:[ins]
    )
    ins2 = ApplyAction.new( actions:SendOutPort.new(2) )
    send_flow_mod_add(
       dpid,
       priority:10,
       match:Match.new( in_port:1 ),
       instructions:[ins2]
    )
  end
end
