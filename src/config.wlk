import wollok.game.*
import personaje.*
import enemigos.*
import armas.*
import cosasExtras.*
import niveles.*
import direcciones.*
import protecciones.*

object config {
 	
 	// TECLADO
	method teclado(){
 	keyboard.up().onPressDo{ cazador.mover(cazador.position().up(1), arriba)}
	keyboard.down().onPressDo{ cazador.mover(cazador.position().down(1), abajo)}
	keyboard.left().onPressDo{ cazador.mover(cazador.position().left(1), izquierda)}
	keyboard.right().onPressDo{ cazador.mover(cazador.position().right(1), derecha)}
	keyboard.t().onPressDo({ cazador.trampaDeSal()})//solo para probara sonido
    keyboard.r().onPressDo({ cazador.recoger(game.colliders(cazador).first())})
    keyboard.e().onPressDo({ cazador.soltar()})
    keyboard.a().onPressDo({ cazador.ataqueA()})
	keyboard.num1().onPressDo({ cazador.equipar(ballesta) })
    keyboard.num2().onPressDo({ cazador.equipar(estacaYMartillo) })
    keyboard.num3().onPressDo({ cazador.equipar(pistolaDePlata) })
	}
        //////////////CARTEL CONTADOR DE PUNTOS/////////////////////////////
    method cartel(){ 
 	game.addVisual(new GraficaParaCartel("CartelVidas.png",game.at(0, 14)))
 	game.addVisual(new Encabezado("encabezado.png", game.at(-1, 15)))
 	game.errorReporter(cazador)
 	}
 }