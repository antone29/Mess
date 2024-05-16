//
//  ContentView.swift
//  OlafMessenger
//
//  Created by Bekki Antonelli on 5/10/24.
//

import SwiftUI
import CoreData


//Notes: the ids being passed into ArticleList correspond with the category id for each section. If for whatever reason, these change, the articles wont show up anymore. You can see what the id is in the JSON
struct ContentView: View {
    var body: some View {
        NavigationView {
            TabView{
                ArticleList(category: 7)
                    .tabItem {
                                Label("News", systemImage: "newspaper.fill")
                            }
                ArticleList(category: 4)
                    .tabItem {
                                Label("A&E", systemImage: "theatermask.and.paintbrush.fill")
                            }
                ArticleList(category: 6)
                    .tabItem {
                                Label("Opinions", systemImage: "lightbulb.fill")
                            }
                ArticleList(category: 8)
                    .tabItem {
                                Label("Sports", systemImage: "sportscourt.fill")
                            }
                ArticleList(category: 16)
                    .tabItem {
                                Label("Variety", systemImage: "music.note")
                            }
                FavoriteArticleView()
                    .tabItem {
                                Label("Favorites", systemImage: "heart.fill")
                            }
                AboutView()
                    .tabItem {
                                Label("About", systemImage: "tray.and.arrow.down.fill")
                            }
            }//.navigationTitle("Olaf Messenger")
        }.onAppear(){
          
        }
    }

}

