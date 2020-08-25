//
//  HomeList.swift
//  DesignCode
//
//  Created by xueming liu on 2020/8/25.
//  Copyright © 2020 xueming liu. All rights reserved.
//

import SwiftUI

struct HomeList: View {
    var body: some View {
        VStack {
            Text("Build an app!")
                .font(.title)
                .fontWeight(.medium)
                .foregroundColor(.black)
            Image("swiftUI_test_2")
            .cornerRadius(20)
            .shadow(radius: 20)
            Spacer()
        }
        .padding(.top, 40)
    }
}

struct HomeList_Previews: PreviewProvider {
    static var previews: some View {
        HomeList()
    }
}
