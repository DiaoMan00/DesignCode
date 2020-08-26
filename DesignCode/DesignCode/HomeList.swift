//
//  HomeList.swift
//  DesignCode
//
//  Created by xueming liu on 2020/8/25.
//  Copyright © 2020 xueming liu. All rights reserved.
//

import SwiftUI

struct HomeList: View {
    @State var show = false
    let courses = CourseData
    
    var body: some View {
        VStack {
            HStack {
                VStack(alignment: .leading) {
                    Text("Course View")
                        .font(.largeTitle)
                        .fontWeight(.heavy)
                    Text("22 Course")
                        .foregroundColor(.gray)
                        .padding(.top, 20)
                }
                .padding(.leading, 36)
                Spacer()
            }
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 30) {
                    ForEach(courses) { item in
                        CourseView(title: item.title,
                                   image: item.image,
                                   color: item.color,
                                   shadowColor: item.shadowColor)
                            .sheet(isPresented: self.$show, content: { ContentView() })
                            .onTapGesture {
                                self.show.toggle()
                        }
                    }
                }
                .padding(.leading, 30)
                .padding(.bottom, 100)
            }
            Spacer()
        }
    }
}

struct HomeList_Previews: PreviewProvider {
    static var previews: some View {
        HomeList()
        
    }
}

struct CourseView: View {
    var title: String = ""
    var image: String = ""
    var color: Color = Color.white
    var shadowColor: Color = Color.gray
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .foregroundColor(.white)
                .font(.title)
                .fontWeight(.medium)
                .padding(20)
                .lineLimit(3)
                .frame(width: 150)
            Spacer()
            Image(image)
                .renderingMode(.original)
        }
        .background(color)
        .cornerRadius(30)
        .frame(width: 246, height: 360)
        .shadow(color: shadowColor, radius: 20, x: 0, y: 20)
    }
}

struct Course: Identifiable {
    var id = UUID()
    var title: String
    var image: String
    var color: Color
    var shadowColor: Color
}

let CourseData = [
    Course(title: "Number One",
           image: "community_banner_snap",
           color: Color.blue,
           shadowColor: Color.gray),
    Course(title: "Number Two",
           image: "community_banner_snap",
           color: Color.pink,
           shadowColor: Color.gray),
    Course(title: "Number Three",
           image: "community_banner_snap",
           color: Color.purple,
           shadowColor: Color.gray)
]
