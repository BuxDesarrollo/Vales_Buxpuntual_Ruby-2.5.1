# Definición de la clase Menú.
class Menu
	def preparar titulo, opciones, peticiones
		@titulo = titulo
		@opciones = opciones
		@peticiones = peticiones
	end

	def iniciar
		# Diseño del titulo.
		puts ("--- [" + @titulo + "] ---").center 40
		# Verificación de opciones disponibles.
		if @opciones != nil
			# Extracción de opciones.
			for clave, opcion in @opciones
				puts "[" + clave.to_s + "]" + ": " + opcion
			end
		end
		# Extracción de peticiones.
		respuestas = Array.new
		vueltas = 0
		for peticion in @peticiones
			vueltas += 1
			puts "> " + peticion + ":"
			respuestas.push gets.chomp

			if (vueltas == @peticiones.length)
				return respuestas
			end
		end
	end

	def validarOpcionMenu opcion
		# Verificación de la opción ingresada.
		if @opciones[opcion[0].to_i]
			return true
		else
			puts "=> Ingrese una opción valida."
			return false
		end
	end
end
# Fin clase.