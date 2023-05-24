class Plaga {
	var property poblacion 
	
 	method transmiteEnfermedades() {
 		return poblacion >= 10
 	}
 	
 	method atacar(unElemento) {
 		unElemento.recibirAtaque(self)
 		//poblacion *= 1.1 //poblacion += poblacion * 0.1
 		poblacion += self.coeficiente()
 	}
 	method coeficiente() = 1.1
}

class Cucaracha inherits Plaga {
	var property pesoPromedio = 0
	
	override method transmiteEnfermedades() =  super() and pesoPromedio >= 10  
	method nivelDanio() = poblacion / 2
	override method atacar(unElemento) {
		super(unElemento)
		pesoPromedio += 2
	}
}

class Pulga inherits Plaga {
	
	method nivelDanio() = poblacion * 2	
}

class Garrapata inherits Pulga {
	/*override method atacar(unElemento) {
		unElemento.recibirAtaque(self)
		poblacion *= 1.2
	}*/
	override method coeficiente() = 1.2
}

class Mosquito inherits Plaga {
	
	method nivelDanio() = poblacion
	override method transmiteEnfermedades() = super() and poblacion % 3 == 0
	
}

/*
/*
 # Plagas
Como ya indicamos, el propósito de este modelo es estudiar el _ataque_ de una plaga a un elemento.  
Este modelo incluye **cuatro tipos de plaga**: de _cucarachas_, de _mosquitos_, de _pulgas_ y de _garrapatas.  
De cada plaga, sea del tipo que sea, se conoce la _población_, esto es, la cantidad de bichos que la integran.

Está claro que puede haber varias plagas del mismo tipo, que pueden (o no) variar en la población: puede 
* haber tres plagas de mosquitos dando vueltas, dos de 50 mosquitos cada uno y una de 70.

El objetivo de esta parte es modelar las plagas y calcular, para cada una: el _nivel de daño_ que producen al 
* atacar, y si _transmiten enfermedades_ o no, de acuerdo a lo que se indica a continuación.

Para que **cualquier plaga** transmita enfermedades, su población debe ser de al menos 10 bichos. Lo que se 
* indica para cada tipo de plaga es una condición **adicional**.

- Plaga de **cucarachas**:  
	De estas plagas se conoce, además, el _peso promedio_ de cada bicho. P.ej. podemos tener una plaga de 
	* 30 cucarachas que pesan, en promedio, 8 gramos.  
	El _nivel de daño_ que produce una plaga de cucarachas equivale a la mitad de su población.  
	Para _transmitir enfermedades_, el peso promedio debe ser de 10 gramos o más (además de la condición 
	* común para todas las plagas).  
	
- Plaga de **pulgas**:  
	El _nivel de daño_ que produce una plaga de pulgas equivale al doble de su población.   
	Las plagas de pulgas no agregan ninguna condición adicional para _transmitir enfermedades_.  
	
- Plaga de **garrapatas**:  
	El _nivel de daño_ que producen, y el criterio para determinar si _transmiten enfermedades_, son iguales
	*  a los de la plaga de pulgas. Más adelante va a aparecer una diferencia entre pulgas y garrapatas. 

- Plaga de **mosquitos**:  
	El _nivel de daño_ que producen las plagas de este tipo equivale a la población.  
	Para _transmitir enfermedades_, la población debe ser un número múltiplo de 3 (además de la condición 
	* común para todas las plagas); la cuenta es `poblacion % 3 == 0`.
	
 */