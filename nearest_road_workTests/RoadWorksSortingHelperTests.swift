//
//  RoadWorksSortingHelperTests.swift
//  nearest_road_workTests
//
//  Created by Wejeo - Jacob Welin on 24/11/2021.
//

import XCTest
@testable import nearest_road_work

class RoadWorksSortingHelperTests: XCTestCase {

    let roadWorksSortingHelper = RoadWorksSortingHelper()
    
    func testSortRoadWorksByStreet() throws {
        let roadWorksList = GetRoadWorksHelper.shared.getRoadWorks()
        var sortedRoadWorksList: [RoadWorks] = roadWorksSortingHelper.sortRoadWorksByStreet(list: roadWorksList, ascending: true)
        
        for i in 0..<roadWorksList.count-1 {
            XCTAssert(compareTwoStringsOrder(comparisonOrder: ComparisonResult.orderedAscending, firstString: sortedRoadWorksList[i].street, secoundString: sortedRoadWorksList[i+1].street))
        }
        sortedRoadWorksList = roadWorksSortingHelper.sortRoadWorksByStreet(list: roadWorksList, ascending: false)
        for i in 0..<roadWorksList.count-1 {
            XCTAssert(compareTwoStringsOrder(comparisonOrder: ComparisonResult.orderedDescending, firstString: sortedRoadWorksList[i].street, secoundString: sortedRoadWorksList[i+1].street))
        }
    }
    
    func testSortRoadWorksByVotes() throws {
        let roadWorksList = GetRoadWorksHelper.shared.getRoadWorks()
        var sortedRoadWorksList: [RoadWorks] = roadWorksSortingHelper.sortRoadWorksByVotes(list: roadWorksList, ascending: true)
        
        for i in 0..<roadWorksList.count-1 {
            XCTAssert(sortedRoadWorksList[i].votes <= sortedRoadWorksList[i+1].votes)
        }
        sortedRoadWorksList = roadWorksSortingHelper.sortRoadWorksByVotes(list: roadWorksList, ascending: false)
        for i in 0..<roadWorksList.count-1 {
            XCTAssert(sortedRoadWorksList[i].votes >= sortedRoadWorksList[i+1].votes)
        }
    }
    
    func testSortRoadWorksByCity() throws {
        let roadWorksList = GetRoadWorksHelper.shared.getRoadWorks()
        var sortedRoadWorksList: [RoadWorks] = roadWorksSortingHelper.sortRoadWorksByCity(list: roadWorksList, ascending: true)
        
        for i in 0..<roadWorksList.count-1 {
            XCTAssert(compareTwoStringsOrder(comparisonOrder: ComparisonResult.orderedAscending, firstString: sortedRoadWorksList[i].city, secoundString: sortedRoadWorksList[i+1].city))
        }
        sortedRoadWorksList = roadWorksSortingHelper.sortRoadWorksByCity(list: roadWorksList, ascending: false)
        for i in 0..<roadWorksList.count-1 {
            XCTAssert(compareTwoStringsOrder(comparisonOrder: ComparisonResult.orderedDescending, firstString: sortedRoadWorksList[i].city, secoundString: sortedRoadWorksList[i+1].city))
        }
    }
    
    func compareTwoStringsOrder(comparisonOrder:ComparisonResult, firstString: String, secoundString: String) -> Bool{
        if (firstString.compare(secoundString) == comparisonOrder) || (firstString.compare(secoundString) == ComparisonResult.orderedSame){
            return true
        }else {
            return false
        }
    }

}
