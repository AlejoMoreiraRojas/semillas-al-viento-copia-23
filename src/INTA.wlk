import plantas.*
import parcelas.*

object inta {
	const property parcelas = []
	
	method promedioDePlantas(){
		const plantasPorParcela = {parcela => parcela.plantas().size()}
		
		return self.parcelas().sum(plantasPorParcela) / self.cantidadDeParcelas()
	}
	
	method cantidadDeParcelas(){
		return self.parcelas().size()
	}
	
	method parcelaMasAutosustentable(){
		const lasBienAsociadas = {parcela => parcela.cantidadDeBienAsociadas()}
		
		return self.candidatasAAutosustentables().max(lasBienAsociadas)
	}
	
	method candidatasAAutosustentables(){
		const masDeCuatro = {parcela => parcela.plantas().size() >= 4}
		
		return self.parcelas().filter(masDeCuatro)
	}
}
