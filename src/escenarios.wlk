import wollok.game.*
import cosasExtras.*
import enemigos.*
import armas.*
import cazador.*
import config.*

object primerEscenario {
	
	method iniciar() {
		
	game.ground("camino2.png")	
	
	config.configurarTeclas()
	
		
	// CASTILLO	
		
	game.addVisualIn(castillo, game.at(10,11))	
		
	/// CAMINOS
    // MODIFICAR CON FOREACH
    game.addVisualIn(new ParteDePasto(), game.at( 0, 0))
	game.addVisualIn(new ParteDePasto(), game.at( 0, 1))
	game.addVisualIn(new ParteDePasto(), game.at( 0, 2))
	game.addVisualIn(new ParteDePasto(), game.at( 0, 3))
	game.addVisualIn(new ParteDePasto(), game.at( 0, 4))
	game.addVisualIn(new ParteDePasto(), game.at( 0, 5))
	game.addVisualIn(new ParteDePasto(), game.at( 0, 6))
	game.addVisualIn(new ParteDePasto(), game.at( 0, 7))
	game.addVisualIn(new ParteDePasto(), game.at( 0, 8))
	game.addVisualIn(new ParteDePasto(), game.at( 0, 9))
	game.addVisualIn(new ParteDePasto(), game.at( 19, 0))
	game.addVisualIn(new ParteDePasto(), game.at( 19, 1))
	game.addVisualIn(new ParteDePasto(), game.at( 19, 2))
	game.addVisualIn(new ParteDePasto(), game.at( 19, 3))
	game.addVisualIn(new ParteDePasto(), game.at( 19, 4))
	game.addVisualIn(new ParteDePasto(), game.at( 19, 5))
	game.addVisualIn(new ParteDePasto(), game.at( 19, 6))
	game.addVisualIn(new ParteDePasto(), game.at( 19, 7))
	game.addVisualIn(new ParteDePasto(), game.at( 19, 8))
	game.addVisualIn(new ParteDePasto(), game.at( 19, 9))
	game.addVisualIn(new ParteDePasto(), game.at( 1, 9))
	game.addVisualIn(new ParteDePasto(), game.at( 2, 9))
	game.addVisualIn(new ParteDePasto(), game.at( 3, 9))
	game.addVisualIn(new ParteDePasto(), game.at( 4, 9))
	game.addVisualIn(new ParteDePasto(), game.at( 5, 9))
	game.addVisualIn(new ParteDePasto(), game.at( 6, 9))
	game.addVisualIn(new ParteDePasto(), game.at( 7, 9))
	game.addVisualIn(new ParteDePasto(), game.at( 8, 9))
	game.addVisualIn(new ParteDePasto(), game.at( 9, 9))
	game.addVisualIn(new ParteDePasto(), game.at( 11, 9))
	game.addVisualIn(new ParteDePasto(), game.at( 12, 9))
	game.addVisualIn(new ParteDePasto(), game.at( 13, 9))
	game.addVisualIn(new ParteDePasto(), game.at( 14, 9))
	game.addVisualIn(new ParteDePasto(), game.at( 15, 9))
	game.addVisualIn(new ParteDePasto(), game.at( 16, 9))
	game.addVisualIn(new ParteDePasto(), game.at( 17, 9))
	game.addVisualIn(new ParteDePasto(), game.at( 18, 9))
	game.addVisualIn(new ParteDePasto(), game.at( 19, 9))
    game.addVisualIn(new ParteDePasto(), game.at( 1, 0))
	game.addVisualIn(new ParteDePasto(), game.at( 2, 0))
	game.addVisualIn(new ParteDePasto(), game.at( 3, 0))
	game.addVisualIn(new ParteDePasto(), game.at( 4, 0))
	game.addVisualIn(new ParteDePasto(), game.at( 5, 0))
	game.addVisualIn(new ParteDePasto(), game.at( 6, 0))
	game.addVisualIn(new ParteDePasto(), game.at( 7, 0))
	game.addVisualIn(new ParteDePasto(), game.at( 8, 0))
	game.addVisualIn(new ParteDePasto(), game.at( 9, 0))
	game.addVisualIn(new ParteDePasto(), game.at( 10, 0))
	game.addVisualIn(new ParteDePasto(), game.at( 11, 0))
	game.addVisualIn(new ParteDePasto(), game.at( 12, 0))
	game.addVisualIn(new ParteDePasto(), game.at( 13, 0))
	game.addVisualIn(new ParteDePasto(), game.at( 15, 0))
	game.addVisualIn(new ParteDePasto(), game.at( 16, 0))
	game.addVisualIn(new ParteDePasto(), game.at( 17, 0))
	game.addVisualIn(new ParteDePasto(), game.at( 18, 0))
	game.addVisualIn(new ParteDePasto(), game.at( 19, 0))

	game.addVisualIn(cazador, game.at(14,0))
	
	/* 
	/// FANTASMAS
	 
	game.addVisualIn(new FantasmaPoderoso(), game.at( 12, 7))
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
    
    */ 
    }
}

object segundoEscenario {
    
    method iniciar() {
    	
    game.ground("pasto3.png")	
    
    game.addVisual(cazador)
	
	config.configurarTeclas()	
    		
    }
}
