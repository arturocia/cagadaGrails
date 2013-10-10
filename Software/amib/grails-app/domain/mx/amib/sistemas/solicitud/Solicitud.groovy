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

	Date fhSolicitud
	Integer nuFolioacredetica
	Integer nuMatriculaamib
	Integer nuFolioautorizacion
	String txModactcerti
	String txOtroinstcapac
	String nmDiInstitucion
	String txDiPuesto
	Date fhDiIniciolaborles
	Date fhDiConsulrepcredesp
	String nmDfRazonsocial
	String txDfCorreofactura
	FormaPago t407CFormapago
	TipoExamen t409CTipoexamen
	Solicitante t301TSolicitante
	ModalidadCertificacion t412CModalactcert
	TipoServicio t406CTiposervicio
	HorarioExamen t411CHorarioexamen
	InstitutoCapacitador t413CInstitutocapacitador
	ModalidadCapacitacion t410CModalcapacitacion
	Figura t408CFigura
	StatusSolicitud t404CStatussolicitud

	static hasMany = [t402TDocanexos: DocumentoAnexo]
	static belongsTo = [Solicitante, StatusSolicitud, TipoServicio, FormaPago, Figura, TipoExamen, ModalidadCapacitacion, HorarioExamen, ModalidadCertificacion, InstitutoCapacitador]

	static mapping = {
		version false
	}

	static constraints = {
		nuFolioacredetica nullable: true
		nuMatriculaamib nullable: true
		nuFolioautorizacion nullable: true
		txModactcerti nullable: true, maxSize: 20
		txOtroinstcapac maxSize: 200
		nmDiInstitucion nullable: true, maxSize: 200
		txDiPuesto nullable: true, maxSize: 100
		fhDiIniciolaborles nullable: true
		fhDiConsulrepcredesp nullable: true
		nmDfRazonsocial nullable: true, maxSize: 254
		txDfCorreofactura nullable: true, maxSize: 254
	}
}
