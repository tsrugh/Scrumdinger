//
//  ScrumsView.swift
//  Scrumdinger
//
//  Created by Lucas Pereira on 21/05/24.
//

import SwiftUI

struct ScrumsView: View {
    
    @Binding var scrums: [DailyScrum]
    @Environment(\.scenePhase) private var scenePhase
    @State private var isPresentingNewScrumView = false
    
    let saveAction: () -> Void
    
    var body: some View {
        
        if #available(iOS 16.0, *){
            NavigationStack{
                List($scrums) { $scrum in
                    NavigationLink(destination: DetailView(scrum: $scrum)){
                        CardView(scrum: scrum)
                    }.listRowBackground(scrum.theme.mainColor)

                }.navigationTitle("Daily Srums")
                    .toolbar{
                        Button(action:{
                            isPresentingNewScrumView = true
                        }) {
                            Image(systemName: "plus")
                        }.accessibilityLabel("New Scrum")
       
                    }
            }
            .sheet(isPresented: $isPresentingNewScrumView) {
                NewScrumSheet(scrums: $scrums, isPresentingNewScrumView: $isPresentingNewScrumView)
            }
            .onChange(of: scenePhase) { oldValue, phase in
                if phase == .inactive {saveAction()}
            }
        }else {
            NavigationView{
                List($scrums) { $scrum in
                    NavigationLink(destination: DetailView(scrum: $scrum)){
                        CardView(scrum: scrum)
                    }.listRowBackground(scrum.theme.mainColor)

                }.navigationTitle("Daily Srums")
                    .toolbar{
                        Button(action:{
                            isPresentingNewScrumView = true
                        }) {
                            Image(systemName: "plus")
                        }.accessibilityLabel("New Scrum")
       
                    }
            }
            .sheet(isPresented: $isPresentingNewScrumView) {
                NewScrumSheet(scrums: $scrums, isPresentingNewScrumView: $isPresentingNewScrumView)
            }
            .onChange(of: scenePhase) { oldValue, phase in
                if phase == .inactive {saveAction()}
            }

        }
        

    }
}

#Preview {
    ScrumsView(scrums: .constant(DailyScrum.sampleData), saveAction: {})
}
