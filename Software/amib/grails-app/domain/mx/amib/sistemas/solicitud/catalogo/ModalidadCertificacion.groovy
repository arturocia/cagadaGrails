package mx.amib.sistemas.solicitud.catalogo

class ModalidadCertificacion {
	String descripcion
	Boolean vigente

	static mapping = {
		table 't412_c_modalactcert'
		
		descripcion column: 'ds_modalactcert'
		vigente column: 'st_vigente'
		
		version false
	}
	static constraints = {
		descripcion maxSize: 50
	}
}
