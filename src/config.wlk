import wollok.game.*
import cazador.*

object inicializador {
	method iniciar() {
		config.configurarTeclas()
	}
}

object config {
	method configurarTeclas() {
		keyboard.left().onPressDo({ cazador.irA(cazador.position().left(1))})
    	keyboard.right().onPressDo({ cazador.irA(cazador.position().right(1))})
	    keyboard.up().onPressDo({ cazador.irA(cazador.position().up(1))})
	    keyboard.down().onPressDo({ cazador.irA(cazador.position().down(1))})
	    keyboard.c().onPressDo({ cazador.cambiarDeEscenario(game.colliders(cazador).first())})
        keyboard.e().onPressDo({ cazador.recogerArmaOProteccion(game.colliders(cazador).first())})
	  //keyboard.a().onPressDo({ cazador.atacar(arma)})	
	}	
}