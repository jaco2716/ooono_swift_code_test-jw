//
//  ListSortingHelper.swift
//  nearest_road_work
//
//  Created by Wejeo - Jacob Welin on 24/11/2021.
//

import Foundation

class RoadWorksSortingHelper{
    
    ///Sort a list of Roadworks by the Street name.
    func sortRoadWorksByStreet(list:[RoadWorks], ascending:Bool) -> [RoadWorks] {
        if ascending{
            return list.sorted { $0.street < $1.street }
        } else {
            return list.sorted { $0.street > $1.street }
        }
        
    }
    
    ///Sort a list of Roadworks by the amount of Votes.
    func sortRoadWorksByVotes(list:[RoadWorks], ascending:Bool) -> [RoadWorks] {
        if ascending{
            return list.sorted { $0.votes < $1.votes }
        } else {
            return list.sorted { $0.votes > $1.votes }
        }
    }
    
    ///Sort a list of Roadworks by the City name.
    func sortRoadWorksByCity(list:[RoadWorks], ascending:Bool) -> [RoadWorks] {
        if ascending{
            return list.sorted { $0.city < $1.city }
        } else {
            return list.sorted { $0.city > $1.city }
        }
        
    }
    
}
