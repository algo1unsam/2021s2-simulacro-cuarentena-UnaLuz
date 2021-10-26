object pandemia { // Es un well known object

	var property fase = 1

}

class Persona {

	var property edad
	var property tieneEnfermedades
	var property trabajos

	method sueldo() = trabajos.sum{ trabajo => trabajo.sueldo() }

}

class Familia {

	var property integrantes
	
}

class Trabajo {

	var property base
	var property bono

	method sueldo() = self.base() + self.extra()

	method extra()

}

class TrabajoNoEsencial inherits Trabajo {

	const property esPresencial = false
	const property fasePermitida

	method sePuedeRealizar() = pandemia.fase() >= fasePermitida

	override method extra() = 0

}

class TrabajoEsencial inherits Trabajo {

	const property esPresencial = true

	method sePuedeRealizar() = true

	override method extra() = bono * ((5 - pandemia.fase()) / 4 )

}

class TrabajoSanitario inherits TrabajoEsencial {

	override method extra() = super() + 5000

}

