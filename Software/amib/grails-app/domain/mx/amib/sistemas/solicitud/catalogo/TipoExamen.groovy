package mx.amib.sistemas.solicitud.catalogo

class TipoExamen {
	String descripcion
	Boolean vigente
	
	static mapping = {
		table 't409_c_tipoexamen'
		
		descripcion column: 'ds_tipoexamen'
		vigente column: 'st_vigente'
		
		version false
	}

	static constraints = {
		descripcion maxSize: 200
	}
}
