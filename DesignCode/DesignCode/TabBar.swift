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
                Image(systemName: "house.fill")
                Text("Home")
            }.tag(1)
            ContentView().tabItem {
                Image(systemName: "doc.append")
                Text("ContentView")
            }.tag(2)
            UpdateList().tabItem {
                Image(systemName: "person.circle")
                Text("ContentView")
            }
            Settings().tabItem {
                Image(systemName: "checkmark.seal.fill")
                Text("Settings")
            }
        }.tag(3)
    }
}


struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        TabBar().environment(\.colorScheme, .dark)
    }
}
