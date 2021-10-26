object pandemia { // Es un well known object

	var property fase = 1

}

class Persona {

	var property edad
	var property tieneEnfermedadesPreexistentes
	var property trabajos

	method sueldo() = trabajos.sum{ trabajo => trabajo.sueldo() }
	
	method estaEnRiesgo() = edad >= 65 or tieneEnfermedadesPreexistentes

	method trabajoPrincipal() = trabajos.max{ trabajo => trabajo.sueldo() }

	method estaInactivo() = trabajos.all{ trabajo => not trabajo.sePuedeRealizar() }

}

class Familia {

	var property integrantes
	
	method sueldo() = integrantes.sum{ integrante => integrante.sueldo() }

	method estaAislada() = integrantes.all{ miembro => miembro.estaEnRiesgo() }

	method trabajosPrincipales() = integrantes.map{ miembro => miembro.trabajoPrincipal() }

	method trabajadoresInactivos() = integrantes.filter{ integrante => integrante.estaInactivo() }

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

