import trabajo.*

class Persona {

	var property edad
	var property tieneEnfermedadesPreexistentes
	var property trabajos
	const actividades = []

	method agregarActividad(unaActividad) {
		actividades.add(unaActividad)
	}

	method actividades() = actividades

	method salirA(unaActividad) {
		if(unaActividad.puedeRealizarActividad(self)) self.agregarActividad(unaActividad)
	}

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
	
	method salirA(actividad) {
		if(self.algunoPuedeSalirA(actividad)) integrantes.forEach{ i => i.salirA(actividad) }
	}
	
	method algunoPuedeSalirA(actividad) = integrantes.any{ integrante => actividad.puedeRealizarActividad(integrante) }

}

class Actividad {

	method puedeRealizarActividad(persona) = not persona.estaEnRiesgo()

}

class Comprar inherits Actividad {

}

class Trabajar inherits Actividad {

	override method puedeRealizarActividad(persona) = super(persona) and not persona.estaInactivo()

}

class Ejercitar inherits Actividad {

	override method puedeRealizarActividad(persona) = super(persona) and pandemia.fase() > 3

}

class Pasear inherits Ejercitar {

	override method puedeRealizarActividad(persona) = if (pandemia.fase() == 5) true else super(persona)

}

