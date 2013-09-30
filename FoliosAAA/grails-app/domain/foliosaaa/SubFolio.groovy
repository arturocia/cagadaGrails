package foliosaaa

import java.awt.TexturePaintContext.Byte;
import java.util.Date;

class SubFolio {

	
	static belongsTo = [folio:Folio]
	
	Date fecha
	Integer numero
	Byte[] pdf
	
    static constraints = {
		fecha nullable:true
		numero nullable:true ,maxSize:6
    }
}
