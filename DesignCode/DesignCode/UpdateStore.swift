//
//  UpdateStore.swift
//  DesignCode
//
//  Created by xueming liu on 2020/8/28.
//  Copyright © 2020 xueming liu. All rights reserved.
//

import SwiftUI
import Combine

class UpdateStore: ObservableObject {
    @Published var score: Int = 0
    @Published var update = [Update]()

    init(updata: [Update] = []) {
        self.update = updata
    }
}
