package mx.amib.sistemas.solicitante.catalogo

class TipoTelefono {
	String descripcion
	Boolean vigente

	static mapping = {
		table 't307_c_tipotelefono'
		
		descripcion column: 'ds_tipotelefono'
		vigente column: 'st_vigente'
		
		version false
	}

	static constraints = {
		descripcion maxSize: 100
	}
}
