# Definición de la clase MuevoVale.
class NuevoVale
	def preparar respuestas
		@respuestas = respuestas

		# Verificación de respuestas validas.
		resultados = Array.new
		for respuesta in @respuestas
			if respuesta != ''
				resultados.push true
			else
				resultados.push false
			end
		end

		if resultados.any? { |resultado| resultado == false}
			resultados = resultados.select { |resultado| resultado == false}
			puts "Fallado => " + resultados.length.to_s + " respuestas no contenían información."
			return false
		else
			return true
		end
	end

	def registrarNuevoVale
		# Creación de un objeto de la clase Time.
		tiempo = Time.new
		fechaActual = tiempo.strftime "%d/%m/%Y"
		# Extracción y empaquetado de las respuestas en una cadena.
		vale = ''
		for respuesta in @respuestas
			vale += respuesta + " | "
		end
		vale += fechaActual + " | " + "NR"
		# Creación de un objetos de la clase File.
		File.open 'Registro.txt', 'a+' do |registro|
			registro.puts vale
			puts "=> Vale registrado y en espera de aceptación."
		end
	end
end
# Fin clase.