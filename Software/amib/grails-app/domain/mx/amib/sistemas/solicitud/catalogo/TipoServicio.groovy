package mx.amib.sistemas.solicitud.catalogo

class TipoServicio {
	String descripcion
	Boolean vigente

	static mapping = {
		table 't406_c_tiposervicio'
		
		descripcion column: 'ds_tiposervicio'
		vigente column: 'st_vigente'
		
		version false
	}

	static constraints = {
		descripcion maxSize: 100
	}
}
