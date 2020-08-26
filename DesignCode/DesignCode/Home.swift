//
//  Home.swift
//  DesignCode
//
//  Created by xueming liu on 2020/8/25.
//  Copyright © 2020 xueming liu. All rights reserved.
//

import SwiftUI

struct Home: View {
    
    @State var show: Bool = false
    @State var showProfile: Bool = false
    
    var body: some View {
        ZStack {
            HomeList()
                .blur(radius: show ? 20 : 0)
                .scaleEffect(showProfile ? 0.95 : 1)
                .animation(.default)
            ContentView()
                .cornerRadius(30)
                .shadow(radius: 20)
                .animation(.spring())
                .offset(y: showProfile ? 50 : UIScreen.main.bounds.height)
            MenuButton(show: $show)
                .offset(x: -30, y: showProfile ? 0 : 88)
                .animation(.spring())
            
            MenuRight(show: $showProfile)
                .offset(x: -16, y: showProfile ? 0 : 88)
                .animation(.spring())
            
            MenuView(show: $show)
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}

struct MenuRow: View {
    var image = ""
    var text = ""
    var body: some View {
        HStack {
            Image(systemName: image)
                .imageScale(.large)
                .foregroundColor(Color.black)
                .frame(width: 30, height: 30)
            Text(text)
                .font(.headline)
            Spacer()
        }
    }
}

struct Menu: Identifiable {
    var id = UUID()
    var title: String
    var icon: String
}

let MenuData = [
    Menu(title: "My Account", icon: "person.crop.circle"),
    Menu(title: "Billing", icon: "creditcard"),
    Menu(title: "Team", icon: "person.and.person"),
    Menu(title: "sign out", icon: "arrow.uturn.down")
]

struct MenuView: View {
    var menuAry = ["My Account", "Billing", "Team", "sign out"]
    let menu = MenuData
    @Binding var show: Bool
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            ForEach(menu) { item in
                MenuRow(image: item.icon, text: item.title)
            }
            Spacer()
        }
        .padding(.top, 30)
        .padding(30)
        .frame(minWidth: 0, maxWidth: .infinity)
        .background(Color.white)
        .cornerRadius(30)
        .padding(.trailing, 60)
        .shadow(radius: 20)
        .rotation3DEffect(Angle(degrees: show ? 0 : 60), axis: (x: 0.0, y: 10.0, z: 0.0))
        .offset(x: show ? 0: -UIScreen.main.bounds.width)
        .animation(.default)
        .onTapGesture {
            self.show.toggle()
        }
    }
}

struct CircleButton: View {
    var icon: String
    var body: some View {
        HStack {
            Image(systemName: icon)
                .foregroundColor(.black)
        }
        .frame(width: 44, height: 44)
        .background(Color.white)
        .cornerRadius(30)
        .shadow(color: .gray, radius: 10, x: 0, y: 10)
    }
}

struct MenuButton: View {
    @Binding var show : Bool
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            Button(action: { self.show.toggle() }) {
                HStack {
                    Spacer()
                    Image(systemName: "list.dash")
                        .foregroundColor(.black)
                }
                .padding(.trailing, 20)
                .frame(width: 90, height: 60)
                .background(Color.white)
                .cornerRadius(30)
                .shadow(color: .gray, radius: 10, x: 0, y: 10)
                
            }
            Spacer()
                .padding(.leading, 20)
        }
    }
}

struct MenuRight: View {
    @Binding var show : Bool
    
    var body: some View {
        ZStack(alignment: .topTrailing) {
            HStack {
                Button(action: { self.show.toggle() }) {
                    CircleButton(icon: "person.crop.circle")
                    
                }
                Button(action: { self.show.toggle() }) {
                    CircleButton(icon: "bell")
                    
                }
            }
            Spacer()
            .padding(.leading, 20)
        }
    }
}
