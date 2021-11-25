//
//  RoadWorks.swift
//  nearest_road_work
//
//  Created by Emil Andersen on 16/11/2021.
//

import Foundation
import CoreLocation

struct RoadWorks {
    var id: Int
    var street: String
    var city: String
    var country: String
    var coordinates: CLLocationCoordinate2D
    var votes: Int
}
