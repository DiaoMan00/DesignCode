//
//  TabBar.swift
//  DesignCode
//
//  Created by xueming liu on 2020/8/31.
//  Copyright © 2020 xueming liu. All rights reserved.
//

import SwiftUI

struct TabBar: View {
    var body: some View {
        TabView {
            Home().tabItem {
                VStack {
                    Image(systemName: "house.fill")
                    Text("Home")
                }
            }.tag(1)
            ContentView().tabItem {
                VStack {
                    Image(systemName: "person.circle")
                    Text("ContentView")
                }
            }.tag(2)
            UpdateList().tabItem {
                VStack {
                    Image(systemName: "list.dash")
                    Text("UpdateList")
                }
            }.tag(3)
        }
    }
}

struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        TabBar().environment(\.colorScheme, .dark)
    }
}
