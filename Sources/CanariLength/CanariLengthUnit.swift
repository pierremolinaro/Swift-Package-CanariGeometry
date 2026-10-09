//--------------------------------------------------------------------------------------------------
//  Created by Pierre Molinaro on 19/09/2025.
//--------------------------------------------------------------------------------------------------

import Foundation

//--------------------------------------------------------------------------------------------------
// L'unité de longueur utilisée dans canari est le 1/90 µm [cu = Canari Unit]
// 1 µm = 90 cu
// 1 mm = 90 000 cu
// 1 cm = 900 000 cu
// 1 pouce = 2,54 cm = 2 286 000 cu
// 1 mil = 0,001 pouce = 2 286 cu
// Le point Cocoa est 1/72 pouce
// 1 pt = 1/72 pouce = 31 750 cu
// Dans certains logiciels, le point est le 1/96 pouce
// 1/96 pouce = 23 812.5 cu
//--------------------------------------------------------------------------------------------------

private let CANARI_UNITS_PER_µM    = 90
private let CANARI_UNITS_PER_MM    = CANARI_UNITS_PER_µM * 1000
private let CANARI_UNITS_PER_CM    = CANARI_UNITS_PER_MM * 10
private let CANARI_UNITS_PER_M     = CANARI_UNITS_PER_CM * 100
private let CANARI_UNITS_PER_INCH  = CANARI_UNITS_PER_µM * 25_400
private let CANARI_UNITS_PER_MIL   = CANARI_UNITS_PER_INCH / 1_000
private let CANARI_UNITS_PER_POINT = CANARI_UNITS_PER_INCH / 72

//--------------------------------------------------------------------------------------------------

public enum CanariLengthUnit : Sendable, Equatable, CaseIterable {

  // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  case mm
  case cm
  case inch
  case mil
  case µm
  case m
  case pt   // Cocoa point, 1/72 inch
  case cu

  // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  public var cuValue : Int {
    switch self {
      case .mm   : return CANARI_UNITS_PER_MM
      case .cm   : return CANARI_UNITS_PER_CM
      case .m    : return CANARI_UNITS_PER_M
      case .inch : return CANARI_UNITS_PER_INCH
      case .mil  : return CANARI_UNITS_PER_MIL
      case .µm   : return CANARI_UNITS_PER_µM
      case .cu   : return 1
      case .pt   : return CANARI_UNITS_PER_POINT
    }
  }

  // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  public var unitString : String {
    switch self {
      case .mm   : return "mm"
      case .cm   : return "cm"
      case .m    : return "m"
      case .inch : return "inch"
      case .mil  : return "mil"
      case .µm   : return "µm"
      case .pt   : return "pt"
      case .cu   : return "cu"
    }
  }

  // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  public var length : CanariLength { .cu (self.cuValue) }

  // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  public init (fromNearestLength inCanariUnitLength : Int) {
    var r = Self.mm
    var nearestUnit = Int.max
    for unit in Self.allCases {
      let d = abs (unit.cuValue - inCanariUnitLength)
      if d == 0 {
        self = unit
        return
      }else if d < nearestUnit {
        nearestUnit = d
        r = unit
      }
    }
    self = r
  }

  // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

}

//--------------------------------------------------------------------------------------------------
