//--------------------------------------------------------------------------------------------------
//  Created by Pierre Molinaro on 19/09/2025.
//--------------------------------------------------------------------------------------------------

import AppKit

//--------------------------------------------------------------------------------------------------

extension CanariLength {

  // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  public func aligning (on inUnit : CanariLength?) -> CanariLength {
    if let unit = inUnit, !unit.isZero {
      if self.cuValue > 0 {
        return .cu (((self.cuValue + unit.cuValue / 2) / unit.cuValue) * unit.cuValue)
      }else if self.cuValue < 0 {
        return -.cu (((-self.cuValue + unit.cuValue / 2) / unit.cuValue) * unit.cuValue)
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

  public var µmAligned : CanariLength {
    let µm = CanariLengthUnit.µm.cuValue
    if self.cuValue > 0 {
      return .cu (((self.cuValue + µm / 2) / µm) * µm)
    }else if self.cuValue < 0 {
      return -.cu (((-self.cuValue + µm / 2) / µm) * µm)
    }else{
      return .zero
    }
  }

  // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  public func isAligned (on inUnit : CanariLength) -> Bool {
    return (self.cuValue % inUnit.cuValue) == 0
  }


  // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

}

//--------------------------------------------------------------------------------------------------
