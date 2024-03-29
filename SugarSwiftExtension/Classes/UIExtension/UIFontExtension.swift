//
//  UIFontExtension.swift
//  SugarSwiftExtension
//
//  Created by 张宇 on 2019/9/1.
//

/// SugarExtensions
public enum FontType: String {
    case None               = ""
    case Regular            = "Regular"
    case Bold               = "Bold"
    case DemiBold           = "DemiBold"
    case Light              = "Light"
    case UltraLight         = "UltraLight"
    case Italic             = "Italic"
    case Thin               = "Thin"
    case Book               = "Book"
    case Roman              = "Roman"
    case Medium             = "Medium"
    case MediumItalic       = "MediumItalic"
    case CondensedMedium    = "CondensedMedium"
    case CondensedExtraBold = "CondensedExtraBold"
    case SemiBold           = "SemiBold"
    case BoldItalic         = "BoldItalic"
    case Heavy              = "Heavy"
}

/// SugarExtensions
public enum FontName: String {
    case HelveticaNeue
    case Helvetica
    case Futura
    case Menlo
    case Avenir
    case AvenirNext
    case Didot
    case AmericanTypewriter
    case Baskerville
    case Geneva
    case GillSans
    case SanFranciscoDisplay
    case Seravek
}

extension UIFont {
    
    /// SugarExtensions
    public class func Font(_ name: FontName, type: FontType, size: CGFloat) -> UIFont! {
        //Using type
        let fontName = name.rawValue + "-" + type.rawValue
        if let font = UIFont(name: fontName, size: size) {
            return font
        }
        
        //That font doens't have that type, try .None
        let fontNameNone = name.rawValue
        if let font = UIFont(name: fontNameNone, size: size) {
            return font
        }
        
        //That font doens't have that type, try .Regular
        let fontNameRegular = name.rawValue + "-" + "Regular"
        if let font = UIFont(name: fontNameRegular, size: size) {
            return font
        }
        
        return nil
    }
    
    /// SugarExtensions
    public class func HelveticaNeue(type: FontType, size: CGFloat) -> UIFont {
        return Font(.HelveticaNeue, type: type, size: size)
    }
    
    /// SugarExtensions
    public class func AvenirNext(type: FontType, size: CGFloat) -> UIFont {
        return Font(.AvenirNext, type: type, size: size)
    }
    
    /// SugarExtensions
    public class func AvenirNextDemiBold(size: CGFloat) -> UIFont {
        return Font(.AvenirNext, type: .DemiBold, size: size)
    }
    
    /// SugarExtensions
    public class func AvenirNextRegular(size: CGFloat) -> UIFont {
        return Font(.AvenirNext, type: .Regular, size: size)
    }
}
