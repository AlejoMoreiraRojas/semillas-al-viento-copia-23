import plantas.*

class Parcela {
	var property ancho
	var property largo
	var property horasDeSol
	const property plantas = []
	
	
	method superficie(){
		return self.ancho() * self.largo()
	}
	
	method cantidadMaximaDePlantas(){
		return if(self.largo() > 3){
			self.largo() + 4
		}
		else{
			self.superficie() / 2
		}
	}
	
	method sangreJoven(){
		const esJoven = { planta => planta.obtencion() > 2012 }
		
		return self.plantas().any(esJoven)
	}
	
	method plantar(unaPlanta){
		if(self.sePuedePlantar(unaPlanta)){
			self.plantas().add(unaPlanta)
		}
		else{
			throw new Exception(message =  "No se puede plantar.")
		}		
	}
	
	method sePuedePlantar(unaPlanta){
		return 	unaPlanta.sePuedePlantarEnLaParcela(self)
	}
	
	method estaLlena(){
		return (self.plantas().size() + 1) > self.cantidadMaximaDePlantas()
	}
	
	method esParaMonocultivo(){
		return self.cantidadMaximaDePlantas() == 1
	}
	
	method lasBienAsociadas(){
		const bienAsociadas = {planta => planta.seAsociaBien(self)}
		
		return self.plantas().count(bienAsociadas)
	}
	
	method seAsociaBien(unaPlanta)
}


class ParcelaEcologica inherits Parcela {
	override method seAsociaBien(unaPlanta){
		return 	self.sangreJoven()
				&&
				unaPlanta.esParcelaIdeal(self)
	}
}


class ParcelaIndustrial inherits Parcela{
	override method seAsociaBien(unaPlanta){
		return 	self.plantas().size() <= 2
				&&
				unaPlanta.esFuerte()
	}
}










