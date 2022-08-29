atget id id
set iteracion 0
data p "start" id id
send p
cprint "Iniciado" 
loop
read mens
rdata mens tipo valor1 valor2 valor3 
if(tipo == "alerta")
   inc iteracion
   cprint "Alerta en: longitud" valor1 ", latitud: " valor2 ", iteracion: " iteracion
   
end

if(tipo == "critico")
	cprint "Nodo descargado en: longitud" valor1 ", latitud: " valor2 ", iteracion: " iteracion
	data p "stop"	
	send p
	wait 1000
	stop
	
end

if(tipo == "maxMen")
	cprint "Nodo alcanzo max mensajes en: longitud" valor1 ", latitud: " valor2 ", iteracion: " iteracion
	data p "stop"	
	send p
	wait 1000
	stop

end
wait 100