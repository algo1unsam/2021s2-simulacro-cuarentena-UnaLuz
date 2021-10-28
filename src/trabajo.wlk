object pandemia { // Es un well known object

	var fase = 1
	
	method fase() = fase
	
	method fase(n) {
		if(n >= 1 and n <= 5){
			fase = n
		} else {
			self.error("No se puede tener una fase " + n.toString())
		}
	}

}

class Trabajo {

	var property base
	var property bono

	method sueldo() = self.base() + self.extra()

	method extra()

}

class TrabajoNoEsencial inherits Trabajo {

	const property fasePermitida

	method sePuedeRealizar() = pandemia.fase() >= fasePermitida

	override method extra() = bono - 1000

}

class TrabajoEsencial inherits Trabajo {

	method sePuedeRealizar() = true

	override method extra() = bono * ((5 - pandemia.fase()) / 4 )

}

class TrabajoSanitario inherits TrabajoEsencial {

	override method extra() = super() + 5000

}
