package mx.amib.sistemas.solicitante.catalogo

class Nacionalidad {
	String descripcion
	Boolean vigente

	static mapping = {
		table 't304_c_nacionalidad'
		
		descripcion column: 'ds_nacionalidad'
		vigente column: 'st_vigente'
		
		version false
	}

	static constraints = {
		descripcion maxSize: 50
	}
}
