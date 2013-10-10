package mx.amib.sistemas.solicitud.catalogo

class FormaPago {
	String descripcion
	Boolean vigente

	static mapping = {
		table 't407_c_formapago'
		
		descripcion column: 'ds_formapago'
		vigente column: 'st_vigente'
		
		version false
	}

	static constraints = {
		descripcion maxSize: 100
	}
}
