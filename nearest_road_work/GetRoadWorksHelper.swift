//
//  GetRoadWorksHelper.swift
//  nearest_road_work
//
//  Created by Emil Andersen on 16/11/2021.
//

import Foundation
import CoreLocation

class GetRoadWorksHelper {

    static var shared = GetRoadWorksHelper()

    fileprivate let roadWorks: [RoadWorks] = [
        RoadWorks(id: 1, street: "Hovedvejen", city: "Glostrup", country: "Denmark", coordinates: CLLocationCoordinate2D(latitude: 55.6654, longitude: 12.3899), votes: 6),
        RoadWorks(id: 2, street: "Albertslundvej", city: "Albertslun", country: "Denmark", coordinates: CLLocationCoordinate2D(latitude: 55.6471, longitude: 12.3552), votes: 3),
        RoadWorks(id: 3, street: "Vestskovvej", city: "Rødovre", country: "Denmark", coordinates: CLLocationCoordinate2D(latitude: 55.6830, longitude: 12.3581), votes: 9),
        RoadWorks(id: 5, street: "Holmeagervej", city: "Karlslunde", country: "Denmark", coordinates: CLLocationCoordinate2D(latitude: 55.5744, longitude: 12.2737), votes: 21),
        RoadWorks(id: 9, street: "Klosterengen", city: "Roskilde", country: "Denmark", coordinates: CLLocationCoordinate2D(latitude: 55.6444, longitude: 12.0931), votes: 888),
        RoadWorks(id: 13, street: "Dronning Margrethes vej", city: "Roskilde", country: "Denmark", coordinates: CLLocationCoordinate2D(latitude: 55.6430, longitude: 12.0847), votes: 443)
    ]

    public func getRoadWorks() -> [RoadWorks] {
        return roadWorks.shuffled().dropLast(Int.random(in: 0..<3))
    }
}
