package mx.amib.sistemas.solicitud.catalogo

class TipoDocumento {
	String descripcion
	Boolean vigente

	static mapping = {
		table 't405_c_tipodoc'
		
		descripcion column: 'ds_tipodoc'
		vigente column: 'st_vigente'
		
		version false
	}

	static constraints = {
		descripcion maxSize: 150
	}
}
