package mx.amib.sistemas.solicitud

import mx.amib.sistemas.solicitante.Solicitante;
import mx.amib.sistemas.solicitud.catalogo.InstitutoCapacitador;
import mx.amib.sistemas.solicitud.catalogo.ModalidadCertificacion;
import mx.amib.sistemas.solicitud.catalogo.StatusSolicitud;
import mx.amib.sistemas.solicitud.catalogo.TipoServicio;
import mx.amib.sistemas.solicitud.catalogo.FormaPago;
import mx.amib.sistemas.solicitud.catalogo.Figura;
import mx.amib.sistemas.solicitud.catalogo.TipoExamen;
import mx.amib.sistemas.solicitud.catalogo.ModalidadCapacitacion;
import mx.amib.sistemas.solicitud.catalogo.HorarioExamen;

class Solicitud {	
	Date fechaSolicitud
	Integer folioAcreditacionEtica
	Integer matriculaAmib
	Integer folioAutorizacion
	String valorModalidadActualizacionCertificacion
	String otroInstitutoCapacitador
	String datoIntermediarioInstitucion
	String datoIntermediarioPuesto
	Date datoIntermediarioFechaInicioLabores
	Date datoIntermediarioFechaConsultaReporteCE
	String datoFactuacionRazonSocial
	String datoFacturacionCorreoEFactura
	
	FormaPago formaPago
	TipoExamen tipoExamen
	Solicitante solicitante
	ModalidadCertificacion modalidadActCertificacion
	TipoServicio tipoServicio
	HorarioExamen horarioExamen
	InstitutoCapacitador institutoCapacitador
	ModalidadCapacitacion modalidadCapacitacion
	Figura figura
	StatusSolicitud statusSolicitud
	
	static hasMany = [documentosAnexos: DocumentoAnexo]
	static belongsTo = [Solicitante, StatusSolicitud, TipoServicio, FormaPago, Figura, TipoExamen, ModalidadCapacitacion, HorarioExamen, ModalidadCertificacion, InstitutoCapacitador]

	static mapping = {
		table 't401_t_solicitud'
		
		fechaSolicitud column: 'fh_solicitud'
		folioAcreditacionEtica column: 'nu_folioacredetica'
		matriculaAmib column: 'nu_matriculaamib'
		folioAutorizacion column: 'nu_folioautorizacion'
		valorModalidadActualizacionCertificacion column: 'tx_modactcerti'
		otroInstitutoCapacitador column: 'tx_otroinstcapac'
		datoIntermediarioInstitucion column: 'nm_di_institucion'
		datoIntermediarioPuesto column: 'tx_di_puesto'
		datoIntermediarioFechaInicioLabores column: 'fh_di_iniciolaborles'
		datoIntermediarioFechaConsultaReporteCE column: 'fh_di_consulrepcredesp'
		datoFactuacionRazonSocial column: 'nm_df_razonsocial'
		datoFacturacionCorreoEFactura column: 'tx_df_correofactura'
		
		formaPago column: 'id_407_formapago'
		tipoExamen column: 'id_409_tipoexamen'
		solicitante column: 'id_301_solicitante'
		modalidadActCertificacion column: 'id_412_modalactcert'
		tipoServicio column: 'id_406_tiposervicio'
		horarioExamen column: 'id_411_horarioexamen'
		institutoCapacitador column: 'id_413_institutocapacitador'
		modalidadCapacitacion column: 'id_410_modalcapacitacion'
		figura column: 'id_408_figura'
		statusSolicitud column: 'id_404_statussolicitud'
		
		version false
	}

	static constraints = {
		folioAcreditacionEtica nullable: true
		matriculaAmib nullable: true
		folioAutorizacion nullable: true
		valorModalidadActualizacionCertificacion nullable: true, maxSize: 20
		otroInstitutoCapacitador maxSize: 200
		datoIntermediarioInstitucion nullable: true, maxSize: 200
		datoIntermediarioPuesto nullable: true, maxSize: 100
		datoIntermediarioFechaInicioLabores nullable: true
		datoIntermediarioFechaConsultaReporteCE nullable: true
		datoFactuacionRazonSocial nullable: true, maxSize: 254
		datoFacturacionCorreoEFactura nullable: true, maxSize: 254
	}
}
