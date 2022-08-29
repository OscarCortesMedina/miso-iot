set ant 999
set ite 0
battery set 100
atget id id
getpos2 lonSen latSen
set sensorDescarga 0

if (id == sensorDescarga)
    battery set 10
end

loop
wait 10
read mens
rdata mens tipo valor



if((tipo=="start") && (ant == 999))
   set ant valor
   data mens tipo id
   send mens * valor
end

if(tipo=="alerta")
   send mens ant
end

if (tipo=="stop")
	data mens "stop"
	send mens * valor
	cprint "Para sensor: " id
	wait 1000
	stop
end

areadsensor tempSen
rdata tempSen SensTipo idSens temp

if( temp>30)
   data mens "alerta" lonSen latSen ite 
   inc ite
   print ite
   wait 10
   send mens ant
   if (ite >= 1000)
        data mens "maxMen" lonSen latSen ite  
	send mens ant
        stop
   end
   
else 
   print "estable, men: " ite
end

battery bat
if( bat<5 ) 
	data mens "critico" lonSen latSen ite 
	send mens ant
end