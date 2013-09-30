package foliosaaa

import java.awt.TexturePaintContext.Byte;
import java.util.Date;

class SubFolio {

	Folio folio
		
	Date fecha
	Integer numero
	Byte[] pdf2
	
    static constraints = {
		fecha nullable:true
		numero nullable:true ,maxSize:6
    }
}
