import elementos.*

class Barrio {
	const property elementos = []
	
	method agregarElemento(elemento) = elementos.add(elemento)
	method eliminarElemento(elemento) = elementos.remove(elemento)
	
	method elementosBuenos() = elementos.count({ e => e.esBueno() })
	method elementosMalos() = elementos.count({ e => not e.esBueno() })
	method esCopado() = self.elementosBuenos() > self.elementosMalos()
	//method esCopado() = self.elementosBuenos() > elementos.size() - self.elementosBuenos()
}

/* *Requerimientos**  
- Saber si un elemento es, o no, bueno.
- Saber si un barrio es _copado_, la condición es que tenga más elementos buenos 
* que no-buenos. 
* P.ej. si un barrio tiene 7 elementos, 5 son buenos y 2 no, entonces es copado, pero si 3 son buenos y 4 no, 
* entonces el barrio no es copado.
 */