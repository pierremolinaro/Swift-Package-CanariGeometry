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

  public var pt2Value : Double {
    switch self {
      case .mm2   : return CanariLengthUnit.mm.ptValue * CanariLengthUnit.mm.ptValue
      case .cm2   : return CanariLengthUnit.cm.ptValue * CanariLengthUnit.cm.ptValue
      case .inch2 : return CanariLengthUnit.inch.ptValue * CanariLengthUnit.inch.ptValue
      case .mil2  : return CanariLengthUnit.mil.ptValue * CanariLengthUnit.mil.ptValue
      case .µm2   : return CanariLengthUnit.µm.ptValue * CanariLengthUnit.µm.ptValue
      case .cu2   : return CanariLengthUnit.cu.ptValue * CanariLengthUnit.cu.ptValue
      case .pt2   : return CanariLengthUnit.pt.ptValue * CanariLengthUnit.pt.ptValue
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

  public var area : CanariArea { .pt2 (self.pt2Value) }

  // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

}

//--------------------------------------------------------------------------------------------------
