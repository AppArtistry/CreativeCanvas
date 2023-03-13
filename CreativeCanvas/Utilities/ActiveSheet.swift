//
//  ActiveSheet.swift
//

import Foundation

enum ActiveSheet: Identifiable {
    case rainbowLoading, batman,
         retroFlipStepper, onOffToggle,
         progressStep, podcast
    
    var id: ActiveSheet { self }
}
