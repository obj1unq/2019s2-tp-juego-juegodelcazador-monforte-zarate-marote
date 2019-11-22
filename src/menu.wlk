import wollok.game.*
import niveles.*
import objetosVisuales.*

object menu {
     method iniciar() {
        game.boardGround("menuInicial.jpg")
        game.addVisual(iniciarJuego)
        game.addVisual(configuracion)
        game.addVisual(salirJuego)
     
     //Configuracion de teclado en menu. 
        //keyboard.enter().onPressDo(pantallaDeCarga.iniciar())
        //keyboard.space().onPressDo(configuracionTeclado.iniciar())	 
        //keyboard.q().onPressDo(game.stop())	 
     }	
}

object pantallaDeCarga {
	method iniciar() {
		//game.clear()
		game.boardGround("pantallaCarga.jpg")
		game.addVisualIn(cargaDelJuego, game.at(8,7))
		//game.schedule(3000, {nivel1.iniciar()})
		
	}
}

object configuracionTeclado {	
	method iniciar() {
		//game.clear()
		game.boardGround("pantallaControles.jpg")
		game.addVisual(teclaUp)
		game.addVisual(teclaDown)
		game.addVisual(teclaLeft)
		game.addVisual(teclaRight)
        game.addVisual(tecla1)
		game.addVisual(tecla2)
		game.addVisual(tecla3)
		game.addVisual(tecla4)
		game.addVisual(teclaR)
		game.addVisual(teclaS)
		game.addVisual(teclaE)
		game.addVisual(teclaA)
		game.addVisual(volverAlMenu)
		
	   // Teclado en Configuraciones
	   //keyboard.q().onPressDo(menu.iniciar())
		
	}
}
//