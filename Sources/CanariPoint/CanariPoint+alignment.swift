//--------------------------------------------------------------------------------------------------
//  Created by Pierre Molinaro on 02/06/2026.
//--------------------------------------------------------------------------------------------------

import AppKit

//--------------------------------------------------------------------------------------------------

extension CanariPoint {

  // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  public var µmAligning : CanariPoint {
    CanariPoint (x: self.x.µmAligning, y: self.y.µmAligning)
  }

  // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  public func aligning (on inUnit : CanariLength?) -> CanariPoint {
    CanariPoint (x: self.x.aligning (on: inUnit), y: self.y.aligning (on: inUnit))
  }

  // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  public mutating func align (on inUnit : CanariLength?) {
    self = self.aligning (on: inUnit)
  }

  // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  public func isAligned (on inUnit : CanariLength) -> Bool {
    self.x.isAligned (on: inUnit) && self.y.isAligned (on: inUnit)
  }

  // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

}

//--------------------------------------------------------------------------------------------------
