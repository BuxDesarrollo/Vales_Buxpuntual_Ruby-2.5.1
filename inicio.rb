# Inicio del programa Vales de caja - Practica 1.

# Importación de módulos.
require './dependencias/clase_menu'
require './dependencias/clase_nuevo_vale'

def procesoPrincipal
	# Definición de los datos.
	titulo = "Bienvenido a vales de caja"
	opciones = Hash.new
	opciones = {
		1 => "Nuevo vale",
		2 => "Recibir vale"
	}
	peticiones = Array.new
	peticiones = ["Ingrese una opción"]

	# Creación de un objeto de la clase Menú.
	menu = Menu.new
	menu.preparar titulo, opciones, peticiones

	# Creación del primer proceso repetitivo del programa.
	while true
		respuesta = menu.iniciar

		if menu.validarOpcionMenu respuesta
			if respuesta[0].to_i == 1
				# Llamada al segundo proceso del programa.
				procesoNuevoVale
			end
			if respuesta[0].to_i == 2
				# Llamada al tercer proceso del programa.
				procesoMostrarVales
			end
		end
	end
end

def procesoNuevoVale
	# Definición de los datos.
	titulo = "Nuevo vale"
	opciones = nil
	peticiones = Array.new
	peticiones = [
		"Ingrese la cantidad que se solicita por el concepto",
		"Ingrese la cantidad especificada en letra",
		"Ingrese descripción una breve concepto",
		"Ingrese nombre de la persona quien autoriza el vale"
	]
	
	# Creación de un objeto de la clase Menu.
	menu = Menu.new
	menu.preparar titulo, opciones, peticiones
	respuestas = menu.iniciar
	# Creación de un objeto de la clase NuevoVale.
	nuevoVale = NuevoVale.new
	
	if nuevoVale.preparar respuestas
		nuevoVale.registrarNuevoVale
	end
end

def procesoMostrarVales
	# Definición de los datos.
	titulo = "Recibir vale"
	opciones = Hash.new
	# Extracción de los vales del archivo Registros.txt
	indice = 0
	registros = File.open './datos/Registro.txt', 'r'
	registros.each do |registro|
		indice += 1
		opciones[indice] = registro
	end
	registros.close
	if (opciones.length == 0)
		opciones[1] = "Salir"
	else
		opciones[(indice + 1)] = "Salir"
	end
	peticiones = Array.new
	peticiones = ["Ingrese una opción"]

	# Creación de un objeto de la clase Menú.
	menu = Menu.new
	menu.preparar titulo, opciones, peticiones
	
	# Creación del segundo proceso repetitivo del programa.
	while true
		respuesta = menu.iniciar

		if menu.validarOpcionMenu respuesta
			if (opciones[respuesta[0].to_i] == 'Salir')
				procesoPrincipal
			else
				# Definición de los datos.
				titulo = opciones[respuesta[0].to_i].chomp
				opciones_1 = Hash.new
				opciones_1 = {
					1 => "Recibir",
					2 => "No recibir"
				}
				peticiones = Array.new
				peticiones = ["Ingrese una opción"]

				# Creación de un objeto de la clase Menú.
				menu = Menu.new
				menu.preparar titulo, opciones_1, peticiones

				# Creación del tercer proceso repetitivo del programa.
				while true
					respuesta_1 = menu.iniciar

					if menu.validarOpcionMenu respuesta_1
						if respuesta_1[0].to_i == 1
							opciones.delete respuesta[0].to_i
							puts "=> El vale ha sido recibido."
							procesoPrincipal
						end
						if respuesta_1[0].to_i == 2
							procesoMostrarVales
						end
					end
				end
			end
		end
	end
end

# Llamada al procedimiento principal.
procesoPrincipal
