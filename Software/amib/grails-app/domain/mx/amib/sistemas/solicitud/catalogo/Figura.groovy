package mx.amib.sistemas.solicitud.catalogo

class Figura {
	String descripcion
	Boolean vigente

	static mapping = {
		table 't408_c_figura'
		
		descripcion column: 'ds_figura'
		vigente column: 'st_vigente'
		
		version false
	}

	static constraints = {
		descripcion maxSize: 200
	}
}
