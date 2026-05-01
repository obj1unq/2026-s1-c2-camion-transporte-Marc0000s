object knightRider {
	method peso() { return 500 }
	method nivelPeligrosidad() { return 10 }
	method bulto(){ return 1 }
	method accidentarObjeto() { }
}
object arenaAGranel {
	var peso = 0
	method peso(_peso) {
	  peso = _peso
	}
	method peso() { return peso }
	method nivelPeligrosidad() { return 1 }
	method bulto(){ return 1}
	method accidentarObjeto(){ 
		 peso = peso + 20 
	}
}
object bumblebee {
	var estaTransformadoEnRobot = false 

	method peso(){ return 800 }

	method nivelPeligrosidad(){ 
		 return if(estaTransformadoEnRobot == true) 30 else 15 
	}
	method estaTransformadoEnRobot(valor) {
	  estaTransformadoEnRobot = valor
	}
	method bulto(){ return 2}

	method accidentarObjeto() {
		if(estaTransformadoEnRobot) {
			self.estaTransformadoEnRobot(false)
		}
		else { self.estaTransformadoEnRobot(true)}
	  
	}
	method estaTransformadoEnRobot(){
		return estaTransformadoEnRobot
	}
}
object paqueteDeLadrillos { 
	var cantidadDeLadrillos = 0

	method cantidadDeLadrillos(numero) {
	  cantidadDeLadrillos = numero
	}
	method cantidadDeLadrillos(){
		return cantidadDeLadrillos
	}
	method peso(){return 2*cantidadDeLadrillos}
	method nivelPeligrosidad() { return 2 }
	method bulto() { 
		return if(cantidadDeLadrillos <= 100) 1 
		else if(cantidadDeLadrillos <= 300) 2 else 3
	}
	method accidentarObjeto(){ 
		if(cantidadDeLadrillos < 12){ 
			self.cantidadDeLadrillos(0)
		}
		else{ cantidadDeLadrillos = cantidadDeLadrillos - 12}
	}

}
object bateriaAntiaerea {
	var estaConMisiles = false 

	method peso() {
	  return if(estaConMisiles == true) 300 else 200
	}
	method nivelPeligrosidad() {
	  return if(estaConMisiles == true) 100 else 0
	}
	method estaConMisiles(){ 
		return estaConMisiles
	}
	method estaConMisiles(valor) {
	  estaConMisiles = valor 
	}
	method bulto(){ 
		return if(estaConMisiles) 2 else 1
	}
	method accidentarObjeto(){ 
		return self.estaConMisiles(false)
	}
}
object residuosRadioactivos { 
	var peso = 0 

	method peso(_peso){ 
		peso = _peso
	}
	method peso(){ 
		return peso 
	}
	method nivelPeligrosidad(){ 
		return 200
	}
	method bulto() { return 1}
	method accidentarObjeto(){ 
		 peso = peso + 15
	}
  
}
object contenedorPortuario {
	const cosasEnContenedor = #{}
	var peso = 100 
	
	method peso(){ 
		return peso + cosasEnContenedor.sum({cosasEnContenedor.peso()}) 
	}
	method cosasEnContenedor(){
		return cosasEnContenedor
	}
	method colocarCosa(unaCosa){ 
		cosasEnContenedor.add(unaCosa)
	}
	method nivelPeligrosidad(){ 
		return if(cosasEnContenedor.isEmpty()) 0 else cosasEnContenedor.map({cosas => cosas.nivelPeligrosidad()}).max()
	}
	method bulto(){ return 1 + cosasEnContenedor.sum({cosas => cosas.bulto()})}

	method accidentarObjeto(){ 
		return cosasEnContenedor.forEach({cosas => cosas.accidentarObjeto()})
	}
}
object embalajeDeSeguridad { 
	var cosaEmbalada = null 

	method embalar(unaCosa) {
	  cosaEmbalada = unaCosa
	}
	method peso(){ cosaEmbalada.peso()}
	method nivelPeligrosidad() { 
		return cosaEmbalada.nivelPeligrosidad() /2
	}
	method bulto(){ return 2 }
	method accidentarObjeto() {}


}
