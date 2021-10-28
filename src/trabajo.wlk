object pandemia { // Es un well known object

	var property fase = 1

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
