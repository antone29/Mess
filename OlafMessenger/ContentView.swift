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

    @EnvironmentObject var manager: FavoritesDataManager
//    //added lines
    @Environment(\.managedObjectContext) private var viewContext
        @FetchRequest(sortDescriptors: []) private var favoriteArticles: FetchedResults<FavoriteArticleModel>

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
                AboutView()
                    .tabItem {
                                Label("About", systemImage: "tray.and.arrow.down.fill")
                            }
            }//.navigationTitle("Olaf Messenger")
            //.tabViewStyle(.page(indexDisplayMode: .always))
            .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
        }
    }

//    private func addItem() {
//        withAnimation {
//            let newItem = Item(context: viewContext)
//            newItem.timestamp = Date()
//
//            do {
//                try viewContext.save()
//            } catch {
//                // Replace this implementation with code to handle the error appropriately.
//                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
//                let nsError = error as NSError
//                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
//            }
//        }
//    }
//
//    private func deleteItems(offsets: IndexSet) {
//        withAnimation {
//            offsets.map { items[$0] }.forEach(viewContext.delete)
//
//            do {
//                try viewContext.save()
//            } catch {
//                // Replace this implementation with code to handle the error appropriately.
//                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
//                let nsError = error as NSError
//                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
//            }
//        }
//    }
}

//private let itemFormatter: DateFormatter = {
//    let formatter = DateFormatter()
//    formatter.dateStyle = .short
//    formatter.timeStyle = .medium
//    return formatter
//}()
//
//#Preview {
//    ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
//}


//List {
//    ForEach(items) { item in
//        NavigationLink {
//            Text("Item at \(item.timestamp!, formatter: itemFormatter)")
//        } label: {
//            Text(item.timestamp!, formatter: itemFormatter)
//        }
//    }
//    .onDelete(perform: deleteItems)
//}
//.toolbar {
//    ToolbarItem(placement: .navigationBarTrailing) {
//        EditButton()
//    }
//    ToolbarItem {
//        Button(action: addItem) {
//            Label("Add Item", systemImage: "plus")
//        }
//    }
//}
//Text("Select an item")
