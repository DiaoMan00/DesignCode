//
//  UpdateList.swift
//  DesignCode
//
//  Created by xueming liu on 2020/8/26.
//  Copyright © 2020 xueming liu. All rights reserved.
//

import SwiftUI

struct UpdateList: View {
    let updates = UpdateData
    @ObservedObject var store = UpdateStore(updata: UpdateData)
    
    func addStore() {
        let up = Update(title: "newTitle", image: "home_welfare_4", date: "2020-08-28", text: "new_Title")
        store.update.append(up)
    }
    func moveItem(star: Int, to: Int) {
        ///这些都是交换两个元素
//        store.update.swapAt(star, to)
//        (store.update[star], store.update[to]) = (store.update[to], store.update[star])
        
//        let a = store.update[star]
//        store.update[star] = store.update[to]
//        store.update[to] = a
        if star > to {
            store.update.insert(store.update[star], at: to)
            store.update.remove(at: star + 1)
            
        } else {
            store.update.insert(store.update[star], at: to)
            store.update.remove(at: star)
            
        }
    }
    var body: some View {
        NavigationView() {
            VStack {
                Button(action: {
                    self.addStore()
                }) {
                    Text("Add Store")
                        .foregroundColor(.blue)
                }
                List {
                    ForEach(store.update) { item in
                        NavigationLink(destination: UpdateDetail(title: item.title,
                                                                 text: item.text,
                                                                 image: item.image)) {
                            HStack {
                                Image(item.image)
                                    .resizable()
                                    .frame(width: 80, height: 80)
                                
                                VStack(alignment: .leading) {
                                    Text(item.title)
                                        .font(.headline)
                                        .fontWeight(.medium)
                                        .padding(.bottom, 10)
                                        .foregroundColor(.primary)
                                    Text(item.text)
                                        .font(.subheadline)
                                        .padding(.bottom, 10)
                                        .lineSpacing(5)
                                        .foregroundColor(.primary)
                                    Text(item.date)
                                        .font(.caption)
                                        .foregroundColor(.blue)
                                }
                            }
                        }
                        .padding(.vertical, 8)
                    }.onDelete { (indexPath) in
                        self.store.update.remove(at: indexPath.first ?? 0)
                    }
                    .onMove { (indexPath, index) in
                        self.moveItem(star: indexPath.first ?? 0, to: index)
                    }
                }
                .navigationBarTitle("UpdateList")
                .navigationBarItems(trailing:
                    EditButton()
                )
            }
        }
        .foregroundColor(.black)
    }
}

struct UpdateList_Previews: PreviewProvider {
    static var previews: some View {
        UpdateList()
    }
}

struct Update: Identifiable {
    var id = UUID()
    var title: String
    var image: String
    var date: String
    var text: String
    
}

let UpdateData = [Update(title: "qwe", image: "cellOne", date: "2020-08-11", text: "To show a modal (iOS 13 style)"),
                  Update(title: "rey", image: "home_welfare_2", date: "2020-08-11", text: "You just need a simple sheet with the ability to dismiss itself:"),
                  Update(title: "asd", image: "home_welfare_3", date: "2020-08-12", text: "You need to access to the ViewController. So you need some helper containers and environment stuff:"),
                  Update(title: "zxc", image: "home_welfare_2", date: "2020-08-13", text: "Then you should use implement this extension:"),
                  Update(title: "fsd", image: "home_welfare_4", date: "2020-08-14", text: "For iOS 14 and Xcode 12:"),
                  Update(title: "gfd", image: "home_welfare_5", date: "2020-08-16", text: "Hope this answer can help you all! Comment below about your result."),
                  Update(title: "tyu", image: "home_welfare_6", date: "2020-08-17", text: "number_Six")]
