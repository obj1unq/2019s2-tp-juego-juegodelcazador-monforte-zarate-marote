import hector.*
import wollok.game.*
import cultivos.*

object inicializador {
	method iniciar() {
		config.configurarTeclas()
	}
}

object config {
	method configurarTeclas() {
		keyboard.left().onPressDo({ hector.irA(hector.position().left(1))})
		keyboard.right().onPressDo({ hector.irA(hector.position().right(1))})
		keyboard.up().onPressDo({ hector.irA(hector.position().up(1))})
		keyboard.down().onPressDo({ hector.irA(hector.position().down(1))})
		keyboard.m().onPressDo({ hector.sembrar(new Maiz())})
		keyboard.t().onPressDo({ hector.sembrar(new Trigo())})	
        keyboard.o().onPressDo({ hector.sembrar(new Tomaco())})	
        keyboard.r().onPressDo({ hector.regar()})		
        keyboard.v().onPressDo({ hector.vender(game.uniqueCollider(hector))})	
	}	
}