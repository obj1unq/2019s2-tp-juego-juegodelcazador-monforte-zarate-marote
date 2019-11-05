import cazador.*

object castillo {
	const property image = "castillo.gif"
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

