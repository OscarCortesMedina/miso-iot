atget id id
set stop 0
data p "start" id id
send p
cprint "Iniciado" 
loop
read mens
rdata mens tipo valor1 valor2 
if(tipo == "alerta")
   cprint "Alerta en: longitud" valor1 ", latitud: " valor2 ", iteración: " valor3
end

if(tipo == "critico")
	cprint "Nodo descargado en: longitud" valor1 ", latitud: " valor2 ", iteración: " valor3
	data p "stop"	
	send p
	wait 1000
	stop
	
end

if(tipo == "maxMen")
	cprint "Nodo alcanzo max mensajes en: longitud" valor1 ", latitud: " valor2
	data p "stop"	
	send p
	wait 100
	stop

end
wait 100