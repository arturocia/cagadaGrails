package mx.amib.sistemas.solicitud.catalogo

class StatusSolicitud {
	String descripcion
	Boolean vigente

	static mapping = {
		table 't404_c_statussolicitud'
		
		descripcion column: 'ds_statussolicitud'
		vigente column: 'st_vigente'
		
		version false
	}

	static constraints = {
		descripcion maxSize: 100
	}
}
