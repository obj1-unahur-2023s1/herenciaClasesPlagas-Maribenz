import plagas.*

class Hogar {
	var property nivelMugre
	var property nivelConfort

	method esBueno() = nivelMugre <= nivelConfort / 2
	
	method recibirAtaque(unaPlaga) {
		nivelMugre += unaPlaga.nivelDanio()
	}	
}

class Huerta {
	var property capacidadProduccion = 0		
	var property nivelDeProduccion = produccion	//Esto es para que no quede atado al objeto producción
	
	method esBueno() = capacidadProduccion > nivelDeProduccion.nivelDeProduccion()
	
	method recibirAtaque(unaPlaga) {
		capacidadProduccion = 0.max(capacidadProduccion - unaPlaga.nivelDanio() * 0.1)
		if(unaPlaga.transmiteEnfermedades()) {
			capacidadProduccion = 0.max(capacidadProduccion - 10)
		}
	}
}

object produccion {
	var property nivelDeProduccion
}

class Mascota {
	var property nivelSalud = 0

	method esBueno() = nivelSalud > 250
	
	method recibirAtaque(unaPlaga) {
		if(unaPlaga.transmiteEnfermedades()) nivelSalud = 0.max(nivelSalud - unaPlaga.nivelDanio())
	}
}

/*
# Plagas

Se trata de desarrollar un modelo que permita estudiar los efectos que se producen cuando una **plaga** ataca a 
* un **elemento**.

Vamos a armarlo por partes.


## Elementos que pueden ser atacados.

El modelo incluye los posibles blancos de un ataque, a los que llamamos **elementos**. De cada elemento, nos 
* interesa saber si es bueno o no para la vida de los humanos.
Debemos contemplar estos elementos

- **Hogar**  
	De cada hogar se manejan dos parámetros: el _nivel de mugre_ y el _confort que ofrece_. Estos valores, los 
	* dos numéricos varían de hogar en hogar.  
	Se considera que un hogar _es bueno_ si su nivel de mugre es la mitad del confort que ofrece, o menos. 
	
- **Huerta**  
	De cada huerta se conoce la _capacidad de producción_ medida en kilos por mes; a efectos de este modelo es un 
	* simple número.  
	Se considera que una huerta _es buena_ si su capacidad de producción supera un nivel que no es fijo, pero es 
	* el mismo para todas las huertas.
	
- **Mascota**    
	De cada mascota se conoce el _nivel de salud_, un número. Cuanto más alto es este número, se considera que la 
	* mascota es más saludable.  
	Se considera que una mascota _es buena_ si su nivel de salud supera las 250 unidades.
	
	
A su vez, los elementos se agrupan en **barrios**; en cada barrio hay varios elementos.
 */