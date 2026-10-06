//--------------------------------------------------------------------------------------------------
//  Created by Pierre Molinaro on 20/12/2025.
//--------------------------------------------------------------------------------------------------

import Foundation

//--------------------------------------------------------------------------------------------------
//  struct CanariRect
//--------------------------------------------------------------------------------------------------

public extension CanariRect {

  // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  func intersects (_ inRect : CanariRect) -> Bool {
    if self.isEmpty || inRect.isEmpty {
      return false
    }else{
      let minX = max (self.minX, inRect.minX)
      let maxX = min (self.maxX, inRect.maxX)
      var result = minX < maxX
      if result {
        let minY = max (self.minY, inRect.minY)
        let maxY = min (self.maxY, inRect.maxY)
        result = minY < maxY
      }
      return result
    }
  }

  // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  //   Intersection
  // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  func intersection (_ inOtherRect : CanariRect) -> CanariRect {
    if self.isEmpty || inOtherRect.isEmpty {
      return .empty // Empty Rect
    }else{
      let left   = max (self.left, inOtherRect.left)
      let bottom = max (self.bottom, inOtherRect.bottom)
      let right  = min (self.left + self.width,  inOtherRect.left + inOtherRect.width)
      let top    = min (self.bottom + self.height, inOtherRect.bottom + inOtherRect.height)
      return CanariRect (left: left, bottom: bottom, width: right - left, height: top - bottom)
    }
  }

  // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

}

//--------------------------------------------------------------------------------------------------

