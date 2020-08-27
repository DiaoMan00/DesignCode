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
    
    var body: some View {
        NavigationView() {
            NavigationLink(destination: ContentView()) {
                List(updates) { item in
                    HStack {
                        VStack(alignment: .leading) {
                            Text(item.title)
                                .font(.title)
                                .padding(.bottom, 20)
                            Text(item.text)
                                .padding(.bottom, 10)
                                .lineSpacing(5)
                            Text(item.date)
                        }
                        Image(systemName: item.image)
                    }
                }
            }
            .navigationBarTitle("UpdateList")
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

let UpdateData = [Update(title: "qwe", image: "doc.fill", date: "2020-08-11", text: "To show a modal (iOS 13 style)"),
                  Update(title: "rey", image: "doc.circle", date: "2020-08-11", text: "You just need a simple sheet with the ability to dismiss itself:"),
                  Update(title: "asd", image: "doc.on.doc", date: "2020-08-12", text: "You need to access to the ViewController. So you need some helper containers and environment stuff:"),
                  Update(title: "zxc", image: "calendar", date: "2020-08-13", text: "Then you should use implement this extension:"),
                  Update(title: "fsd", image: "link.circle.fill", date: "2020-08-14", text: "For iOS 14 and Xcode 12:"),
                  Update(title: "gfd", image: "link.circle", date: "2020-08-16", text: "Hope this answer can help you all! Comment below about your result."),
                  Update(title: "tyu", image: "person.circle", date: "2020-08-17", text: "number_Six")]
