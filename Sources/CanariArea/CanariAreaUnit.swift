//--------------------------------------------------------------------------------------------------
//  Created by Pierre Molinaro on 19/09/2025.
//--------------------------------------------------------------------------------------------------

import AppKit

//--------------------------------------------------------------------------------------------------

public enum CanariAreaUnit : Sendable, Equatable {

  // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  case mm2
  case cm2
  case inch2
  case mil2
  case µm2
  case pt2
  case cu2

  // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  public var cu2Value : Int {
    switch self {
      case .mm2   : return CanariLengthUnit.mm.cuValue * CanariLengthUnit.mm.cuValue
      case .cm2   : return CanariLengthUnit.cm.cuValue * CanariLengthUnit.cm.cuValue
      case .inch2 : return CanariLengthUnit.inch.cuValue * CanariLengthUnit.inch.cuValue
      case .mil2  : return CanariLengthUnit.mil.cuValue * CanariLengthUnit.mil.cuValue
      case .µm2   : return CanariLengthUnit.µm.cuValue * CanariLengthUnit.µm.cuValue
      case .cu2   : return CanariLengthUnit.cu.cuValue * CanariLengthUnit.cu.cuValue
      case .pt2   : return CanariLengthUnit.pt.cuValue * CanariLengthUnit.pt.cuValue
    }
  }

  // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  public var unitString : String {
    switch self {
      case .mm2   : return "mm²"
      case .cm2   : return "cm²"
      case .inch2 : return "in²"
      case .mil2  : return "mil²"
      case .µm2   : return "µm²"
      case .cu2   : return "cu²"
      case .pt2   : return "pt²"
    }
  }

  // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  public var area : CanariArea { .cu2 (self.cu2Value) }

  // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

}

//--------------------------------------------------------------------------------------------------
