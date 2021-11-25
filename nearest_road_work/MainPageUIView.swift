//
//  MainPageUIView.swift
//  nearest_road_work
//
//  Created by Wejeo - Jacob Welin on 23/11/2021.
//

import SwiftUI

struct MainPageUIView: View {
    
    @EnvironmentObject var stateManager: StateManager
    @State private var timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    @State private var timeRemaining: Int = 15
    let roadWorksSortingHelper: RoadWorksSortingHelper = RoadWorksSortingHelper()
    @State private var sortAscending: Bool = true
    @State private var sortingArrow: String = "▲"
    
    var body: some View {
        NavigationView{
            VStack {
                
                Text("Update in: \(timeRemaining)")
                    .font(.largeTitle)
                    .fontWeight(.bold).padding()
                    .onDisappear{
                        //Stop timer when navigationview changes destination.
                        timer.upstream.connect().cancel()
                    }.onAppear{
                        //resume timer when view is visable again.
                        timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
                    }
                Text("\(stateManager.roadWorksList.count) Roard works near you").font(.headline)
                HStack{
                    Text("Sort by \(sortingArrow)")
                    Button(action: {
                        sortAscending.toggle()
                        sortByStreet()
                    }) {
                        Text("Street")
                    }.padding()
                    
                    Button(action: {
                        sortAscending.toggle()
                        sortByCity()
                    }) {
                        Text("City")
                    }.padding()
                    
                    Button(action: {
                        sortAscending.toggle()
                        sortByVotes()
                    }) {
                        Text("Votes")
                    }.padding()
                }
                List {
                    ForEach(stateManager.roadWorksList, id: \.id) { roadWorks in
                        NavigationLink(
                            destination: {
                                //Go to detailed view of a single Road Work, parsing the index to reference its place in the list when changing values.
                                
                                SingleRoadWorkView(roadWorkIndex: stateManager.roadWorksList.firstIndex(where: {$0.id == roadWorks.id}) ?? -1).environmentObject(stateManager)
                            },
                            label: {
                                HStack {
                                    Text("\(roadWorks.street)")
                                    Spacer()
                                    Text("\(roadWorks.votes) Votes")
                                }
                            }
                        )
                    }
                }
            }
            
        }.onAppear {
            stateManager.roadWorksList = GetRoadWorksHelper.shared.getRoadWorks()
        }.onReceive(timer){time in
            //Update List of Road Works every 15 secounds and reset timer.
            if self.timeRemaining > 0 {
                self.timeRemaining -= 1
            }else{
                timeRemaining = 15
                stateManager.roadWorksList = GetRoadWorksHelper.shared.getRoadWorks()
                sortByStreet()
            }
        }
    }
    
    func sortByStreet(){
        sortingArrow = sortAscending ? "▲" : "▼"
        stateManager.roadWorksList = roadWorksSortingHelper.sortRoadWorksByStreet(list: stateManager.roadWorksList, ascending: sortAscending)
    }
    func sortByCity(){
        sortingArrow = sortAscending ? "▲" : "▼"
        stateManager.roadWorksList = roadWorksSortingHelper.sortRoadWorksByCity(list: stateManager.roadWorksList, ascending: sortAscending)
    }
    func sortByVotes(){
        sortingArrow = sortAscending ? "▲" : "▼"
        stateManager.roadWorksList = roadWorksSortingHelper.sortRoadWorksByVotes(list: stateManager.roadWorksList, ascending: sortAscending)
    }
}

struct MainPageUIView_Previews: PreviewProvider {
    static var previews: some View {
        MainPageUIView().environmentObject(StateManager())
    }
}
