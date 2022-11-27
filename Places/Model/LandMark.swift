//
//  LandMarks.swift
//  Places
//
//  Created by MacBook on 4/4/22.
//

import Foundation
import RealmSwift
class LandMark:Object{
    @objc dynamic var name:String=""
    @objc dynamic var details:String=""
    @objc dynamic var time: Date = Date()
    @objc dynamic var lat:Double = 0.0
    @objc dynamic var lon:Double = 0.0
}
