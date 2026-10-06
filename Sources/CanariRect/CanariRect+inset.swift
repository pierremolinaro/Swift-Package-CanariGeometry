//--------------------------------------------------------------------------------------------------
//  Created by Pierre Molinaro on 20/12/2025.
//--------------------------------------------------------------------------------------------------

import Foundation

//--------------------------------------------------------------------------------------------------
//  struct CanariRect
//--------------------------------------------------------------------------------------------------

public extension CanariRect {

  // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  func insetBy (dx inDx : CanariLength = .zero,
                dy inDy : CanariLength = .zero) -> CanariRect {
    if self.isEmpty {
      return .empty
    }else{
      let right = self.left + inDx
      let bottom = self.bottom + inDy
      let width = self.width - 2.0 * inDx
      let height = self.height - 2.0 * inDy
      return CanariRect (left: right, bottom: bottom, width: width, height: height)
    }
  }

  // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

}

//--------------------------------------------------------------------------------------------------

