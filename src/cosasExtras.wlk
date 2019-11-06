import cazador.*

class NoColisionable {
	const puedeColisionar = false
	
}


object castillo inherits NoColisionable{
	const property image = "castillo.gif"
	const property position = 0
}


class Pared  inherits NoColisionable{
	const property position
	var image 
	
	method mover(direccion) {
		throw new Exception(message = "No puedes mover las paredes.")
	}
}