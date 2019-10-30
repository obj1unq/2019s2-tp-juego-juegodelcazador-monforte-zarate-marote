import wollok.game.*
import cosasExtras.*
import enemigos.*
import armas.*
import cazador.*
import config.*

object primerEscenario {
	
	method iniciar() {
		
	game.ground("camino1.png")	
	
	config.configurarTeclas()
	
		
	// CASTILLO	
	
	// var muroDeCastillo = new MuroDeCastillo()	
		
		
	// MODIFICAR CON FOREACH	
	game.addVisualIn(new MuroDeCastillo(), game.at(6, 14))
 	game.addVisualIn(new MuroDeCastillo(), game.at(7, 14))
 	game.addVisualIn(new MuroDeCastillo(), game.at(8, 14))
 	game.addVisualIn(new MuroDeCastillo(), game.at(9, 14))
 	game.addVisualIn(new MuroDeCastillo(), game.at(10, 14))
 	game.addVisualIn(new MuroDeCastillo(), game.at(11, 14))
 	game.addVisualIn(new MuroDeCastillo(), game.at(12, 14))
 	game.addVisualIn(new MuroDeCastillo(), game.at(13, 14))
 	game.addVisualIn(new MuroDeCastillo(), game.at(14, 14))
 	game.addVisualIn(new MuroDeCastillo(), game.at(15, 14))
 	game.addVisualIn(new MuroDeCastillo(), game.at(16, 14))
 	game.addVisualIn(new MuroDeCastillo(), game.at(17, 14))
 	game.addVisualIn(new MuroDeCastillo(), game.at(18, 14))
    game.addVisualIn(new MuroDeCastillo(), game.at(6, 13))
    game.addVisualIn(new MuroDeCastillo(), game.at(7, 13))
 	game.addVisualIn(new MuroDeCastillo(), game.at(8, 13))
 	game.addVisualIn(new MuroDeCastillo(), game.at(9, 13))
 	game.addVisualIn(new MuroDeCastillo(), game.at(10, 13))
 	game.addVisualIn(new MuroDeCastillo(), game.at(11, 13))
 	game.addVisualIn(new PuertaDeCastillo(), game.at(12, 13))
 	game.addVisualIn(new MuroDeCastillo(), game.at(13, 13))
 	game.addVisualIn(new MuroDeCastillo(), game.at(14, 13))
 	game.addVisualIn(new MuroDeCastillo(), game.at(15, 13))
 	game.addVisualIn(new MuroDeCastillo(), game.at(16, 13))
 	game.addVisualIn(new MuroDeCastillo(), game.at(17, 13))
 	game.addVisualIn(new MuroDeCastillo(), game.at(18, 13))
 	game.addVisualIn(new MuroDeCastillo(), game.at(19, 13))
 	game.addVisualIn(new MuroDeCastillo(), game.at(19, 14))
 	game.addVisualIn(new MuroDeCastillo(), game.at(20, 13))
 	game.addVisualIn(new MuroDeCastillo(), game.at(20, 14))
 	game.addVisualIn(new MuroDeCastillo(), game.at(5, 13))
 	game.addVisualIn(new MuroDeCastillo(), game.at(5, 14))
 	game.addVisualIn(new MuroDeCastillo(), game.at(4, 13))
 	game.addVisualIn(new MuroDeCastillo(), game.at(4, 14))
 
	/// CAMINOS

    game.addVisualIn(new ParteDePasto(), game.at( 0, 0))
	game.addVisualIn(new ParteDePasto(), game.at( 0, 1))
	game.addVisualIn(new ParteDePasto(), game.at( 0, 2))
	game.addVisualIn(new ParteDePasto(), game.at( 0, 3))
	game.addVisualIn(new ParteDePasto(), game.at( 0, 4))
	game.addVisualIn(new ParteDePasto(), game.at( 0, 5))
	game.addVisualIn(new ParteDePasto(), game.at( 0, 6))
	game.addVisualIn(new ParteDePasto(), game.at( 0, 8))
	game.addVisualIn(new ParteDePasto(), game.at( 0, 9))
	game.addVisualIn(new ParteDePasto(), game.at( 0, 10))
	game.addVisualIn(new ParteDePasto(), game.at( 0, 12))
	game.addVisualIn(new ParteDePasto(), game.at( 0, 13))
	game.addVisualIn(new ParteDePasto(), game.at( 0, 14))
	game.addVisualIn(new ParteDePasto(), game.at( 1, 3))
	game.addVisualIn(new ParteDePasto(), game.at( 1, 12))
	game.addVisualIn(new ParteDePasto(), game.at( 1, 13))
	game.addVisualIn(new ParteDePasto(), game.at( 1, 14))
	game.addVisualIn(new ParteDePasto(), game.at( 2, 0))
	game.addVisualIn(new ParteDePasto(), game.at( 2, 1))
	game.addVisualIn(new ParteDePasto(), game.at( 2, 3))
	game.addVisualIn(new ParteDePasto(), game.at( 2, 5))
	game.addVisualIn(new ParteDePasto(), game.at( 2, 6))
	game.addVisualIn(new ParteDePasto(), game.at( 2, 7))
	game.addVisualIn(new ParteDePasto(), game.at( 2, 8))
	game.addVisualIn(new ParteDePasto(), game.at( 2, 9))
	game.addVisualIn(new ParteDePasto(), game.at( 2, 10))
	game.addVisualIn(new ParteDePasto(), game.at( 2, 11))
	game.addVisualIn(new ParteDePasto(), game.at( 2, 12))
	game.addVisualIn(new ParteDePasto(), game.at( 2, 13))
	game.addVisualIn(new ParteDePasto(), game.at( 2, 14))
	game.addVisualIn(new ParteDePasto(), game.at( 3, 0))
	game.addVisualIn(new ParteDePasto(), game.at( 3, 1))
	game.addVisualIn(new ParteDePasto(), game.at( 3, 5))
	game.addVisualIn(new ParteDePasto(), game.at( 3, 6))
	game.addVisualIn(new ParteDePasto(), game.at( 3, 7))
	game.addVisualIn(new ParteDePasto(), game.at( 3, 8))
	game.addVisualIn(new ParteDePasto(), game.at( 3, 9))
	game.addVisualIn(new ParteDePasto(), game.at( 3, 10))
	game.addVisualIn(new ParteDePasto(), game.at( 3, 11))
	game.addVisualIn(new ParteDePasto(), game.at( 3, 12))
	game.addVisualIn(new ParteDePasto(), game.at( 3, 13))
	game.addVisualIn(new ParteDePasto(), game.at( 3, 14))
	game.addVisualIn(new ParteDePasto(), game.at( 4, 0))
	game.addVisualIn(new ParteDePasto(), game.at( 4, 1))
	game.addVisualIn(new ParteDePasto(), game.at( 4, 2))
	game.addVisualIn(new ParteDePasto(), game.at( 4, 4))
	game.addVisualIn(new ParteDePasto(), game.at( 4, 5))
	game.addVisualIn(new ParteDePasto(), game.at( 4, 6))
	game.addVisualIn(new ParteDePasto(), game.at( 4, 7))
	game.addVisualIn(new ParteDePasto(), game.at( 4, 8))
	game.addVisualIn(new ParteDePasto(), game.at( 4, 9))
	game.addVisualIn(new ParteDePasto(), game.at( 4, 10))
	game.addVisualIn(new ParteDePasto(), game.at( 4, 11))
	game.addVisualIn(new ParteDePasto(), game.at( 4, 12))
	game.addVisualIn(new ParteDePasto(), game.at( 5, 0))
	game.addVisualIn(new ParteDePasto(), game.at( 5, 1))
	game.addVisualIn(new ParteDePasto(), game.at( 5, 2))
	game.addVisualIn(new ParteDePasto(), game.at( 5, 4))
	game.addVisualIn(new ParteDePasto(), game.at( 5, 5))
	game.addVisualIn(new ParteDePasto(), game.at( 5, 6))
	game.addVisualIn(new ParteDePasto(), game.at( 5, 7))
	game.addVisualIn(new ParteDePasto(), game.at( 5, 11))
	game.addVisualIn(new ParteDePasto(), game.at( 5, 12))
	game.addVisualIn(new ParteDePasto(), game.at( 6, 0))
	game.addVisualIn(new ParteDePasto(), game.at( 6, 1))
	game.addVisualIn(new ParteDePasto(), game.at( 6, 2))
	game.addVisualIn(new ParteDePasto(), game.at( 6, 4))
	game.addVisualIn(new ParteDePasto(), game.at( 6, 5))
	game.addVisualIn(new ParteDePasto(), game.at( 6, 6))
	game.addVisualIn(new ParteDePasto(), game.at( 6, 7))
	game.addVisualIn(new ParteDePasto(), game.at( 6, 9))
	game.addVisualIn(new ParteDePasto(), game.at( 6, 11))
	game.addVisualIn(new ParteDePasto(), game.at( 6, 12))
	game.addVisualIn(new ParteDePasto(), game.at( 7, 0))
	game.addVisualIn(new ParteDePasto(), game.at( 7, 1))
	game.addVisualIn(new ParteDePasto(), game.at( 7, 2))
	game.addVisualIn(new ParteDePasto(), game.at( 7, 4))
	game.addVisualIn(new ParteDePasto(), game.at( 7, 5))
	game.addVisualIn(new ParteDePasto(), game.at( 7, 9))
	game.addVisualIn(new ParteDePasto(), game.at( 7, 11))
	game.addVisualIn(new ParteDePasto(), game.at( 7, 12))
	game.addVisualIn(new ParteDePasto(), game.at( 8, 0))
	game.addVisualIn(new ParteDePasto(), game.at( 8, 1))
	game.addVisualIn(new ParteDePasto(), game.at( 8, 2))
	game.addVisualIn(new ParteDePasto(), game.at( 8, 4))
	game.addVisualIn(new ParteDePasto(), game.at( 8, 5))
	game.addVisualIn(new ParteDePasto(), game.at( 8, 7))
	game.addVisualIn(new ParteDePasto(), game.at( 8, 8))
	game.addVisualIn(new ParteDePasto(), game.at( 8, 9))
	game.addVisualIn(new ParteDePasto(), game.at( 8, 11))
	game.addVisualIn(new ParteDePasto(), game.at( 8, 12))
	game.addVisualIn(new ParteDePasto(), game.at( 9, 0))
	game.addVisualIn(new ParteDePasto(), game.at( 9, 1))
	game.addVisualIn(new ParteDePasto(), game.at( 9, 2))
	game.addVisualIn(new ParteDePasto(), game.at( 9, 4))
	game.addVisualIn(new ParteDePasto(), game.at( 9, 5))
	game.addVisualIn(new ParteDePasto(), game.at( 9, 7))
	game.addVisualIn(new ParteDePasto(), game.at( 9, 8))
	game.addVisualIn(new ParteDePasto(), game.at( 9, 9))
	game.addVisualIn(new ParteDePasto(), game.at( 9, 12))
	game.addVisualIn(new ParteDePasto(), game.at( 10, 0))
	game.addVisualIn(new ParteDePasto(), game.at( 10, 1))
	game.addVisualIn(new ParteDePasto(), game.at( 10, 2))
	game.addVisualIn(new ParteDePasto(), game.at( 10, 4))
	game.addVisualIn(new ParteDePasto(), game.at( 10, 5))
	game.addVisualIn(new ParteDePasto(), game.at( 10, 7))
	game.addVisualIn(new ParteDePasto(), game.at( 10, 8))
	game.addVisualIn(new ParteDePasto(), game.at( 10, 9))
	game.addVisualIn(new ParteDePasto(), game.at( 10, 10))
	game.addVisualIn(new ParteDePasto(), game.at( 10, 12))
	game.addVisualIn(new ParteDePasto(), game.at( 11, 0))
	game.addVisualIn(new ParteDePasto(), game.at( 11, 1))
	game.addVisualIn(new ParteDePasto(), game.at( 11, 2))
	game.addVisualIn(new ParteDePasto(), game.at( 11, 4))
	game.addVisualIn(new ParteDePasto(), game.at( 11, 5))
	game.addVisualIn(new ParteDePasto(), game.at( 11, 7))
	game.addVisualIn(new ParteDePasto(), game.at( 11, 8))
	game.addVisualIn(new ParteDePasto(), game.at( 11, 9))
	game.addVisualIn(new ParteDePasto(), game.at( 11, 10))
	game.addVisualIn(new ParteDePasto(), game.at( 11, 12))
	game.addVisualIn(new ParteDePasto(), game.at( 13, 0))
	game.addVisualIn(new ParteDePasto(), game.at( 13, 1))
	game.addVisualIn(new ParteDePasto(), game.at( 13, 2))
	game.addVisualIn(new ParteDePasto(), game.at( 13, 4))
	game.addVisualIn(new ParteDePasto(), game.at( 13, 5))
	game.addVisualIn(new ParteDePasto(), game.at( 13, 7))
	game.addVisualIn(new ParteDePasto(), game.at( 13, 8))
	game.addVisualIn(new ParteDePasto(), game.at( 13, 9))
	game.addVisualIn(new ParteDePasto(), game.at( 13, 10))
	game.addVisualIn(new ParteDePasto(), game.at( 13, 12))
	game.addVisualIn(new ParteDePasto(), game.at( 14, 0))
	game.addVisualIn(new ParteDePasto(), game.at( 14, 1))
	game.addVisualIn(new ParteDePasto(), game.at( 14, 2))
	game.addVisualIn(new ParteDePasto(), game.at( 14, 4))
	game.addVisualIn(new ParteDePasto(), game.at( 14, 5))
	game.addVisualIn(new ParteDePasto(), game.at( 14, 7))
	game.addVisualIn(new ParteDePasto(), game.at( 14, 8))
	game.addVisualIn(new ParteDePasto(), game.at( 14, 9))
	game.addVisualIn(new ParteDePasto(), game.at( 14, 10))
	game.addVisualIn(new ParteDePasto(), game.at( 14, 12))
	game.addVisualIn(new ParteDePasto(), game.at( 15, 0))
	game.addVisualIn(new ParteDePasto(), game.at( 15, 1))
	game.addVisualIn(new ParteDePasto(), game.at( 15, 2))
	game.addVisualIn(new ParteDePasto(), game.at( 15, 4))
	game.addVisualIn(new ParteDePasto(), game.at( 15, 5))
	game.addVisualIn(new ParteDePasto(), game.at( 15, 7))
	game.addVisualIn(new ParteDePasto(), game.at( 15, 8))
	game.addVisualIn(new ParteDePasto(), game.at( 15, 9))
	game.addVisualIn(new ParteDePasto(), game.at( 15, 12))
	game.addVisualIn(new ParteDePasto(), game.at( 16, 0))
	game.addVisualIn(new ParteDePasto(), game.at( 16, 1))
	game.addVisualIn(new ParteDePasto(), game.at( 16, 2))
	game.addVisualIn(new ParteDePasto(), game.at( 16, 4))
	game.addVisualIn(new ParteDePasto(), game.at( 16, 5))
	game.addVisualIn(new ParteDePasto(), game.at( 16, 7))
	game.addVisualIn(new ParteDePasto(), game.at( 16, 8))
	game.addVisualIn(new ParteDePasto(), game.at( 16, 9))
	game.addVisualIn(new ParteDePasto(), game.at( 16, 11))
	game.addVisualIn(new ParteDePasto(), game.at( 16, 12))
	game.addVisualIn(new ParteDePasto(), game.at( 17, 0))
	game.addVisualIn(new ParteDePasto(), game.at( 17, 1))
	game.addVisualIn(new ParteDePasto(), game.at( 17, 2))
	game.addVisualIn(new ParteDePasto(), game.at( 17, 4))
	game.addVisualIn(new ParteDePasto(), game.at( 17, 5))
	game.addVisualIn(new ParteDePasto(), game.at( 17, 9))
	game.addVisualIn(new ParteDePasto(), game.at( 17, 11))
	game.addVisualIn(new ParteDePasto(), game.at( 17, 12))
	game.addVisualIn(new ParteDePasto(), game.at( 18, 0))
	game.addVisualIn(new ParteDePasto(), game.at( 18, 1))
	game.addVisualIn(new ParteDePasto(), game.at( 18, 2))
	game.addVisualIn(new ParteDePasto(), game.at( 18, 4))
	game.addVisualIn(new ParteDePasto(), game.at( 18, 5))
	game.addVisualIn(new ParteDePasto(), game.at( 18, 6))
	game.addVisualIn(new ParteDePasto(), game.at( 18, 7))
	game.addVisualIn(new ParteDePasto(), game.at( 18, 9))
	game.addVisualIn(new ParteDePasto(), game.at( 18, 11))
	game.addVisualIn(new ParteDePasto(), game.at( 18, 12))
	game.addVisualIn(new ParteDePasto(), game.at( 19, 0))
	game.addVisualIn(new ParteDePasto(), game.at( 19, 1))
	game.addVisualIn(new ParteDePasto(), game.at( 19, 2))
	game.addVisualIn(new ParteDePasto(), game.at( 19, 4))
	game.addVisualIn(new ParteDePasto(), game.at( 19, 5))
	game.addVisualIn(new ParteDePasto(), game.at( 19, 6))
	game.addVisualIn(new ParteDePasto(), game.at( 19, 7))
	game.addVisualIn(new ParteDePasto(), game.at( 19, 11))
	game.addVisualIn(new ParteDePasto(), game.at( 19, 12))
	game.addVisualIn(new ParteDePasto(), game.at( 20, 0))
	game.addVisualIn(new ParteDePasto(), game.at( 20, 1))
	game.addVisualIn(new ParteDePasto(), game.at( 20, 2))
	game.addVisualIn(new ParteDePasto(), game.at( 20, 4))
	game.addVisualIn(new ParteDePasto(), game.at( 20, 5))
	game.addVisualIn(new ParteDePasto(), game.at( 20, 6))
	game.addVisualIn(new ParteDePasto(), game.at( 20, 7))
	game.addVisualIn(new ParteDePasto(), game.at( 20, 8))
	game.addVisualIn(new ParteDePasto(), game.at( 20, 9))
	game.addVisualIn(new ParteDePasto(), game.at( 20, 10))
	game.addVisualIn(new ParteDePasto(), game.at( 20, 11))
	game.addVisualIn(new ParteDePasto(), game.at( 20, 12))
	game.addVisualIn(new ParteDePasto(), game.at( 21, 0))
	game.addVisualIn(new ParteDePasto(), game.at( 21, 1))
	game.addVisualIn(new ParteDePasto(), game.at( 21, 5))
	game.addVisualIn(new ParteDePasto(), game.at( 21, 6))
	game.addVisualIn(new ParteDePasto(), game.at( 21, 7))
	game.addVisualIn(new ParteDePasto(), game.at( 21, 8))
	game.addVisualIn(new ParteDePasto(), game.at( 21, 9))
	game.addVisualIn(new ParteDePasto(), game.at( 21, 10))
	game.addVisualIn(new ParteDePasto(), game.at( 21, 11))
	game.addVisualIn(new ParteDePasto(), game.at( 21, 12))
	game.addVisualIn(new ParteDePasto(), game.at( 21, 13))
	game.addVisualIn(new ParteDePasto(), game.at( 21, 14))
	game.addVisualIn(new ParteDePasto(), game.at( 22, 0))
	game.addVisualIn(new ParteDePasto(), game.at( 22, 1))
	game.addVisualIn(new ParteDePasto(), game.at( 22, 3))
	game.addVisualIn(new ParteDePasto(), game.at( 22, 5))
	game.addVisualIn(new ParteDePasto(), game.at( 22, 6))
	game.addVisualIn(new ParteDePasto(), game.at( 22, 7))
	game.addVisualIn(new ParteDePasto(), game.at( 22, 8))
	game.addVisualIn(new ParteDePasto(), game.at( 22, 9))
	game.addVisualIn(new ParteDePasto(), game.at( 22, 10))
	game.addVisualIn(new ParteDePasto(), game.at( 22, 11))
	game.addVisualIn(new ParteDePasto(), game.at( 22, 12))
	game.addVisualIn(new ParteDePasto(), game.at( 22, 13))
	game.addVisualIn(new ParteDePasto(), game.at( 22, 14))
	game.addVisualIn(new ParteDePasto(), game.at( 23, 3))
	game.addVisualIn(new ParteDePasto(), game.at( 23, 12))
	game.addVisualIn(new ParteDePasto(), game.at( 23, 13))
	game.addVisualIn(new ParteDePasto(), game.at( 23, 14))
	game.addVisualIn(new ParteDePasto(), game.at( 24, 0))
	game.addVisualIn(new ParteDePasto(), game.at( 24, 1))
	game.addVisualIn(new ParteDePasto(), game.at( 24, 2))
	game.addVisualIn(new ParteDePasto(), game.at( 24, 3))
	game.addVisualIn(new ParteDePasto(), game.at( 24, 4))
	game.addVisualIn(new ParteDePasto(), game.at( 24, 5))
	game.addVisualIn(new ParteDePasto(), game.at( 24, 6))
	game.addVisualIn(new ParteDePasto(), game.at( 24, 8))
	game.addVisualIn(new ParteDePasto(), game.at( 24, 9))
	game.addVisualIn(new ParteDePasto(), game.at( 24, 10))
	game.addVisualIn(new ParteDePasto(), game.at( 24, 12))
	game.addVisualIn(new ParteDePasto(), game.at( 24, 13))
	game.addVisualIn(new ParteDePasto(), game.at( 24, 14))
	
	
	/// FANTASMAS
	 
	game.addVisual(fantasmaFinal)
	game.addVisualIn(new Fantasma(), game.at( 12, 6))
    game.addVisualIn(new Fantasma(), game.at( 12, 10))
    game.addVisualIn(new Fantasma(), game.at( 7, 8)) 
    game.addVisualIn(new Fantasma(), game.at( 1, 8))
    game.addVisualIn(new Fantasma(), game.at( 23, 11)) 
    game.addVisualIn(new Fantasma(), game.at( 18, 8)) 
	
	
	game.addVisualIn(new Murcielago(), game.at( 15, 4)) 
    game.addVisualIn(new Ballesta(), game.at( 11, 5)) 
	game.addVisualIn(new ArmaDePlata(), game.at( 10, 5)) 
	game.addVisualIn(new Ajo(), game.at( 9, 5)) 
	game.addVisualIn(new EstacaYMartillo(), game.at( 8, 5)) 
	game.addVisualIn(new Bruja(), game.at( 7, 5)) 
	game.addVisualIn(dracula, game.at( 6, 5)) 
	
	// SALES
	
	game.addVisualIn(new Sal(), game.at( 21, 2))
    game.addVisualIn(new Sal(), game.at( 19, 8)) 
    game.addVisualIn(new Sal(), game.at( 1, 10))
    game.addVisualIn(new Sal(), game.at( 24, 11)) 
    game.addVisualIn(new Sal(), game.at( 5, 9))    
    
    game.addVisualIn(cazador, game.at(12,0))
    }
}

object segundoEscenario {
    
    method iniciar() {
    	
    game.ground("pasto3.png")	
    
    game.addVisual(cazador)
	
	config.configurarTeclas()	
    		
    }
}
