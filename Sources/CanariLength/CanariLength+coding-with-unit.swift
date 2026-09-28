//--------------------------------------------------------------------------------------------------
//  Created by Pierre Molinaro on 19/09/2025.
//--------------------------------------------------------------------------------------------------

import AppKit

//--------------------------------------------------------------------------------------------------

extension CanariLength {

  // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  public var valueEncodedWithUnit : String { // §
    if self == .zero {
      return "0"
    }else if self.isAligned (CanariLengthUnit.cm.length) {
      return "\(self.cuValue / CanariLengthUnit.cm.length.cuValue)cm"
    }else if self.isAligned (CanariLengthUnit.mm.length) {
      return "\(self.cuValue / CanariLengthUnit.mm.length.cuValue)mm"
    }else if self.isAligned (CanariLengthUnit.µm.length) {
      return "\(self.cuValue / CanariLengthUnit.µm.length.cuValue)µm"
    }else if self.isAligned (CanariLengthUnit.inch.length) {
      return "\(self.cuValue / CanariLengthUnit.inch.length.cuValue)in"
    }else if self.isAligned (CanariLengthUnit.mil.length) {
      return "\(self.cuValue / CanariLengthUnit.mil.length.cuValue)mil"
    }else if self.isAligned (CanariLengthUnit.pt.length) {
      return "\(self.cuValue / CanariLengthUnit.pt.length.cuValue)pt"
    }else{
      return "\(self.cuValue)"
    }
  }

  // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

}

//--------------------------------------------------------------------------------------------------

extension Scanner {

  // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  public func scanCanariLengthEncodedWithUnit () -> CanariLength? { // §
    if let v = self.scanInt () {
      if self.scanString ("mm") != nil {
        return .mm (v)
      }else if self.scanString ("cm") != nil {
        return .cm (v)
      }else if self.scanString ("µm") != nil {
        return .µm (v)
      }else if self.scanString ("in") != nil {
        return .inch (v)
      }else if self.scanString ("mil") != nil {
        return .mil (v)
      }else if self.scanString ("pt") != nil {
        return .pt (v)
      }else{
        return .cu (v)
      }
    }else{
      return nil
    }
  }

  // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

}

//--------------------------------------------------------------------------------------------------

extension String {

  // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  public func decodedCanariLengthWithUnit () -> CanariLength? { // §
    let scanner = Scanner (string: self)
    return scanner.scanCanariLengthEncodedWithUnit ()
  }

  // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

}

//--------------------------------------------------------------------------------------------------
