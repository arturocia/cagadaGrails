package mx.amib.sistemas.solicitud.catalogo

class InstitutoCapacitador {
	String nombre
	Boolean vigente

	static mapping = {
		table 't413_c_institutocapacitador'
		
		nombre column: 'nm_institutocapacitador'
		vigente column: 'st_vigente'
		
		version false
	}

	static constraints = {
		nombre maxSize: 200
	}
}
