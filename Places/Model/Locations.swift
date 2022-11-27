//
//  Locations.swift
//  Places
//
//  Created by MacBook on 4/4/22.
//

import Foundation
import RealmSwift
class Locations {
    static let shared = Locations();
    var LandMarks:Results<LandMark>!
    var userLat:Double = 0.0
    var userLon:Double = 0.0
    
}
