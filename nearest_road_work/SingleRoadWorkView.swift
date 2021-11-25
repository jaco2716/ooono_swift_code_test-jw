//
//  SingleRoadWorkView.swift
//  nearest_road_work
//
//  Created by Wejeo - Jacob Welin on 23/11/2021.
//

import SwiftUI
import Foundation
import CoreLocation

struct SingleRoadWorkView: View {
    @State var roadWorkIndex: Int
    @EnvironmentObject var stateManager: StateManager
    
    var body: some View {
        VStack {
            Text(stateManager.roadWorksList[roadWorkIndex].street).font(.headline)
            List{
                Text(stateManager.roadWorksList[roadWorkIndex].city)
                Text(stateManager.roadWorksList[roadWorkIndex].country)
                Text("\(stateManager.roadWorksList[roadWorkIndex].votes) Votes")
                Text("Lat: \(String( format:"%.2f",  stateManager.roadWorksList[roadWorkIndex].coordinates.latitude))")
                Text("Long: \(String( format:"%.2f", stateManager.roadWorksList[roadWorkIndex].coordinates.longitude))")
            }
            Text("Upvote")
            Button(action: {
                stateManager.roadWorksList[roadWorkIndex].votes += 1
                print("Votes: \(stateManager.roadWorksList[roadWorkIndex].votes)")
            }) {
                Text("+").font(.headline).fontWeight(.medium).foregroundColor(Color.white)
            }.frame(width: 50, height: 50, alignment: .center).background(Color.green).clipShape(Capsule())
        }
    }
}

struct SingleRoadWorkView_Previews: PreviewProvider {
    static var previews: some View {
        SingleRoadWorkView(roadWorkIndex: 0).environmentObject(StateManager())
    }
}
