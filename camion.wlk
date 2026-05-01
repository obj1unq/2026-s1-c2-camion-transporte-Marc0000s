import cosas.*

object camion {
	const property cosas = #{}
	const pesoCamion = 1000
	

	method cargar(unaCosa){ 
		if(cosas.contains(unaCosa)){ 
			self.error("El camion ya tiene esa cosa")
		}
		else { cosas.add(unaCosa) }
	}

	method descargar(unaCosa) {
		if(cosas.contains(unaCosa)){ 
			self.error("El camion no tiene esta cosa")
		}
		else { cosas.remove(unaCosa) } 
	}

	method cosas(){ 
		return cosas
	}

	method elPesoTotalEsPar() {
	  return cosas.all({cosas => self.esPar(cosas.peso())})
	}

	method esPar(peso) {
	  return (peso%2) == 0 
	}

	method algoPesa(peso) {
		return cosas.any({cosas => cosas.peso() == peso})
	}
	
	method pesoTotalCamion(){
		return pesoCamion + cosas.sum({cosas => cosas.peso()})
	}

	method excedePeso() {
	  return self.pesoTotalCamion() > 2500
	}

	method cosaConNivelDePeligrosidad(nivel) {
	  return cosas.find({cosas => cosas.nivelPeligrosidad() == nivel})
	}

	method cosaMasPeligrosaQue(unaCosa){ 
		return self.cosaQueSuperaNivelDePeligrosidad(unaCosa.nivelPeligrosidad())
	}

	method cosaQueSuperaNivelDePeligrosidad(numero){
	 return cosas.filter({cosas => cosas.nivelPeligrosidad() > numero})
	}

	method puedeCircular(){ 
		return (not self.excedePeso() && cosas.all{cosas => cosas.nivelPeligrosidad() <  20 })
	}

	method cosaMasPesada(){ 
		return cosas.max({cosas => cosas.peso()})
	}
	method listaDePesos(){
		return cosas.map({cosas => cosas.peso() })
	}

	method cantidadDeBultos() {
	  return cosas.sum({cosas => cosas.bulto()})
	}

	method accidentarse(){ 
		return cosas.forEach({cosas => cosas.accidentarObjeto()})
	}

	method transportarADestino(destino, camino) {
	  if(camino.soportaViajeDe(self)){
		destino.depositarCosas(self.cosas())
		cosas.removeAll(cosas)
	  }
	  else{ self.error("No cumple con los requisitos para el viaje")}
	}
	
}
object almacen {
	var deposito = []

	method deposito(){
		return deposito
	}
	method depositar(unaCosa){
		return deposito.add(unaCosa)
	}
	method depositarCosas(listaDeCosas){
		 deposito.addAll(listaDeCosas)
	}


}
object ruta9 {
	method soportaViajeDe(vehiculo) {
	  return vehiculo.puedeCircular()
	}
}
object caminosVecinales { 
	var pesoMaximo = 0 

	method pesoMaximo() {
	  return pesoMaximo
	}
	method pesoMaximo(_pesoMaximo){
		pesoMaximo = _pesoMaximo 
	}
	method soportaViajeDe(vehiculo){ 
		return (vehiculo.pesoTotal() < self.pesoMaximo() )
	}
}
