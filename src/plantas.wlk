import parcelas.*

class Planta {
	const property obtencion
	var property altura
	
	method toleranciaAlSol(){
		return 7
	}
	
	method esFuerte(){
		return self.toleranciaAlSol() > 9
	}
	
	method daNuevasSemillas(){
		return self.esFuerte()
	}
	
	method espacio()
	
	method sePuedePlantarEnLaParcela(unaParcela){
		return 	not unaParcela.estaLlena()
				||
				unaParcela.horasDeSol() - self.toleranciaAlSol() < 2
	}
	
	method esParcelaIdeal(unaParcela)
	
	method seAsociaBien(unaParcela){
		unaParcela.seAsociaBien(self)
	}
}


class Menta inherits Planta {
	
	override method daNuevasSemillas(){
		return 	super()
				||
				self.altura() > 0.4
	}
	
	override method espacio(){
		return self.altura() * 3
	}
	
	override method esParcelaIdeal(unaParcela){
		return unaParcela.superficie() > 6
	}
}


class Peperina inherits Menta {
	
	override method espacio() = super() * 2
}


class Soja inherits Planta {
	
	override method toleranciaAlSol(){
		return if(self.altura() < 0.5){
			6
		}
		else if(self.altura().between(0.5, 1)){
			8
		}
		else{
			12
		}
	}
	
	override method daNuevasSemillas(){
		return 	super()
				||
				self.condicionAlternativa()
	}
	
	method condicionAlternativa(){ 
		return 	self.obtencion() > 2007
				&&
				self.altura().between(0.75, 0.9)
	}	
	
	override method espacio(){
		return self.altura() / 2
	}
	
	override method esParcelaIdeal(unaParcela){
		return unaParcela.horasDeSol() == self.toleranciaAlSol()
	}
}


class SojaTransgenica inherits Soja {
	
	override method daNuevasSemillas() = false
	
	override method esParcelaIdeal(unaParcela){
		return unaParcela.esParaMonocultivo()
	}
}


class Quinoa inherits Planta {
	var property espacioQueOcupa
	
	override method toleranciaAlSol(){
		return if(self.espacio() < 0.3){
			10
		}
		else{
			super()
		}
	}
	
	override method daNuevasSemillas(){
		return 	super()
				||
				self.obtencion().between(2001, 2008)
	}
	
	override method espacio() = espacioQueOcupa
	
	override method esParcelaIdeal(unaParcela){
		const plantaAlta = {planta => planta.altura() > 1.5}
		
		return not unaParcela.plantas().any(plantaAlta)
	}
}
