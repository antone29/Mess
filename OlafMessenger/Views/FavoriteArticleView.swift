//
//  FavoriteArticleView.swift
//  OlafMessenger
//
//  Created by Bekki Antonelli on 5/15/24.
//

import SwiftUI

struct FavoriteArticleView: View {
    @EnvironmentObject var manager: DataManager
    //added lines
    @Environment(\.managedObjectContext) private var viewContext
        @FetchRequest(sortDescriptors: []) private var todoItems: FetchedResults<Article>
    
    var body: some View {

            List {
                //updated 24/25
                ForEach(todoItems) { item in
//                    ArticleRow(articleModel: ArticleModel(date: item.date, title: item.title, content: item.content, author: Int(item.author as! String), categories: item.categories as? [Int], url: item.url))
//                    Label(item.taskName ?? "no name", systemImage: "circle\(item.isCompleted ? ".fill" : "")")
//                        .frame(maxWidth: .infinity, alignment: .leading).contentShape(Rectangle())
//                        .onTapGesture {
//                            item.isCompleted = !item.isCompleted
//                           // manager.objectWillChange.send()
//                        }
                }
            }
            .navigationTitle("TODO")
            .navigationBarItems(trailing: Button(action: addItem, label: {
                Image(systemName: "plus")
            }))
        
    }
    
    private func addItem() {
//        presentTextInputAlert(title: "Add Task", message: "Enter your task name") { name in
//           // manager.favoriteArticles.append(TodoItem(task: name))
//            let newTask = Article(context: viewContext)
//                       newTask.taskName = name
//                       try? viewContext.save()
//        }
    }
}

func presentTextInputAlert(title: String, message: String, completion: @escaping (_ text: String) -> Void) {
    let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
    alert.addTextField()
    let submitAction = UIAlertAction(title: "Save", style: .default) { _ in
        if let text = alert.textFields?.first?.text, !text.isEmpty {
            completion(text)
        }
    }
    alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
    alert.addAction(submitAction)
    UIApplication.shared.windows.first?.rootViewController?.present(alert, animated: true)
}

#Preview {
    FavoriteArticleView()
}
