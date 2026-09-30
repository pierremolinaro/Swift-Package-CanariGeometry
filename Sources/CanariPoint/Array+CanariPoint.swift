//--------------------------------------------------------------------------------------------------
//  Created by Pierre Molinaro on 18/09/2025.
//--------------------------------------------------------------------------------------------------

import Foundation

//--------------------------------------------------------------------------------------------------

extension Array where Element == CanariPoint {

  // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  var ptValues : [CGPoint] {
    var result = [CGPoint] ()
    for p in self {
      result.append (p.ptValue)
    }
    return result
  }

  // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  public func aligning (on inUnit : CanariLength) -> [CanariPoint] {
    var result = [CanariPoint] ()
    for p in self {
      result.append (p.aligning (on: inUnit))
    }
    return result
  }

  // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  public func areAligned (on inUnit : CanariLength) -> Bool {
    for p in self {
      if !p.isAligned (on: inUnit) {
        return false
      }
    }
    return true
  }

  // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  var xMirrored : [CanariPoint] {
    var result = [CanariPoint] ()
    for p in self {
      result.append (p.xMirrored)
    }
    return result
  }

  // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  var yMirrored : [CanariPoint] {
    var result = [CanariPoint] ()
    for p in self {
      result.append (p.yMirrored)
    }
    return result
  }

  // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

}

//--------------------------------------------------------------------------------------------------
