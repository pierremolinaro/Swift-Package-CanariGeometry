//--------------------------------------------------------------------------------------------------
//  Created by Pierre Molinaro on 19/09/2025.
//--------------------------------------------------------------------------------------------------

import AppKit

//--------------------------------------------------------------------------------------------------

extension CanariLength {

  // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  public func aligning (on inUnit : CanariLength?) -> CanariLength {
    if let unit = inUnit, !unit.isZero {
      let cu = self.cuValue
      let unitCu = unit.cuValue
      if cu > 0 {
        return .cu (((cu + unitCu / 2) / unitCu) * unitCu)
      }else if cu < 0 {
        return -.cu (((-cu + unitCu / 2) / unitCu) * unitCu)
      }else{
        return .zero
      }
    }else{
      return self
    }
  }

  // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  public mutating func align (on inUnit : CanariLength?) {
    self = self.aligning (on: inUnit)
  }

  // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  public var µmAligning : CanariLength {
    self.aligning (on: CanariLength.µm (1))
  }

  // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  public func isAligned (on inUnit : CanariLength) -> Bool {
    self.cuValue % inUnit.cuValue == 0
  }


  // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

}

//--------------------------------------------------------------------------------------------------
