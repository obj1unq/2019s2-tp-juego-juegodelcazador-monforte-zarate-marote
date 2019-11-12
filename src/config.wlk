import wollok.game.*
import cazador.*
import enemigos.*
import armas.*
import cosasExtras.*
import escenarios.*
import direcciones.*
import protecciones.*

object config {
 	
 	// TECLADO
	method teclado(){
 	keyboard.up().onPressDo{ cazador.mover(cazador.position().up(1), arriba)}
	keyboard.down().onPressDo{ cazador.mover(cazador.position().down(1), abajo)}
	keyboard.left().onPressDo{ cazador.mover(cazador.position().left(1), izquierda)}
	keyboard.right().onPressDo{ cazador.mover(cazador.position().right(1), derecha)}
	keyboard.c().onPressDo({ game.sound("hauntingpiano.mp3")})
		//game.whenCollideDo(cazador, {puerta => primerEscenario.cambioDeEscenario(cazador,puerta)})})
    keyboard.e().onPressDo({ cazador.recoger(game.colliders(cazador).first())})
    keyboard.a().onPressDo({ cazador.ataqueA()})
    //keyboard.r().onPressDo({ cazador.activarProteccion() })
	keyboard.num1().onPressDo({ cazador.equipar(ballesta, "ballesta") })
    keyboard.num2().onPressDo({ cazador.equipar(estacaYMartillo, "estaca y el martillo") })
    keyboard.num3().onPressDo({ cazador.equipar(pistolaDePlata, "pistola de plata") })
	keyboard.num4().onPressDo({ cazador.equipar(4, "sal") })
	}
        //////////////CARTEL CONTADOR DE PUNTOS/////////////////////////////
    method cartel(){ 
 	game.addVisual(new GraficaParaCartel("CartelVidas.png",game.at(0, 13)))
 	}
 }