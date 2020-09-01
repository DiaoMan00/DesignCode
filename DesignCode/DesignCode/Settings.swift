//
//  Settings.swift
//  DesignCode
//
//  Created by xueming liu on 2020/8/31.
//  Copyright © 2020 xueming liu. All rights reserved.
//

import SwiftUI

struct Settings: View {
    @State var receive = false
    @State var number = 1
    @State var select = 1
    @State var date = Date()
    @State var email = ""
    @State var submit = false
    
    var body: some View {
        NavigationView {
            Form {
                Toggle(isOn: $receive) {
                    Text("receive notification")
                }
                Stepper(value: $number, in: 1...10) {
                    Text("\(number) notification\(number > 1 ? "s" : "") per week ")
                }
                Picker(selection: $select, label: Text("Picker")) {
                    Text("SwiftUI").tag(1)
                    Text("Picker").tag(2)
                }
                DatePicker(selection: $date, label: { Text("Date") })
                Section(header: Text("Email").font(.title)) {
                    TextField("Your email", text: $email)
                }
                Button(action: { self.submit.toggle() }) {
                    Text("Submit")
                }
                .alert(isPresented: $submit) {
                    Alert(title: Text("Thanks"), message: Text("Email:\(email)"))
                }
                
            }.navigationBarTitle("Setting")
        }
    }
}

struct Settings_Previews: PreviewProvider {
    static var previews: some View {
        Settings()
    }
}
