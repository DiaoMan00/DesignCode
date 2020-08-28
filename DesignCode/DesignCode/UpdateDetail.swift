//
//  UpdateDetail.swift
//  DesignCode
//
//  Created by xueming liu on 2020/8/28.
//  Copyright © 2020 xueming liu. All rights reserved.
//

import SwiftUI

struct UpdateDetail: View {
    var title = ""
    var text = ""
    var image = ""
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text(title)
                .font(.largeTitle)
                .fontWeight(.medium)
            
            Image(image)
                .resizable()
                .aspectRatio(contentMode: .fit)
            
            Text(text)
                .font(.title)
            Spacer()
        }
    .padding(30)
    }
}

struct UpdateDetail_Previews: PreviewProvider {
    static var previews: some View {
        UpdateDetail()
    }
}
