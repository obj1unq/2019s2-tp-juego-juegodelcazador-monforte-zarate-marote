import cazador.*

class MuroDeCastillo {
	const property image = "muroCastillo1.jpg"
	const property position = 0 
}

class PuertaDeCastillo {
	const property image = "puertaCastillo.jpg"
	const property position = 0 
} 

class VentanaDeCastillo {
	const property image = "ventanaCastillo.jpg"
	const property position = 0 
}

class Arbusto {
	const property image = "arbusto.png"
	const property position = 0  
}

class ParteDePasto {
	const property image = "pasto5.png"
	const property position = 0  

   method colisionasteConCazador() {
    	return self.position() == cazador.position()
    }

}

