//
//  UpdateList.swift
//  DesignCode
//
//  Created by xueming liu on 2020/8/26.
//  Copyright © 2020 xueming liu. All rights reserved.
//

import SwiftUI

struct UpdateList: View {
    @State var show = false
    
    var body: some View {
        NavigationView {
            NavigationLink(destination: ContentView()) {
                List(0 ..< 20) { item in
                    Text("Navigation")
                }
            }
            .navigationBarTitle(Text("NavigationTitle"))
            .navigationBarItems(trailing:
                HStack {
                    Image(systemName: "hammer")
                        .onTapGesture {
                            
                    }
                    Image(systemName: "hammer")
                    Image(systemName: "hammer")
                }
                
            )
        }
    }
}

struct UpdateList_Previews: PreviewProvider {
    static var previews: some View {
        UpdateList()
    }
}

struct updateListModel: Identifiable {
    var  id = UUID()
    var title: String
    var icon: String
    
}
