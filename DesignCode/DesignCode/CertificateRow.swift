//
//  CertificateRow.swift
//  DesignCode
//
//  Created by xueming liu on 2020/9/1.
//  Copyright © 2020 xueming liu. All rights reserved.
//

import SwiftUI

struct CertificateRow: View {
    let certificates = CertificateData
    var body: some View {
        VStack {
            Text("Certificate")
                .font(.system(size: 20))
                .fontWeight(.heavy)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(certificates) { item in
                        CertificateView()
                    }
                }
                .padding(20)
                .padding(.leading, 20)
            }
        }
    }
}

struct CertificateRow_Previews: PreviewProvider {
    static var previews: some View {
        CertificateRow()
    }
}

struct Certificate: Identifiable {
    var id = UUID()
    var title: String
    var image: String
    var width: Int
    var height: Int
}

let CertificateData = [Certificate(title: "Certificate_One", image: "", width: 100, height: 200),
                       Certificate(title: "Certificate_Two", image: "", width: 100, height: 200),
                       Certificate(title: "Certificate_Three", image: "", width: 100, height: 200),
                       Certificate(title: "Certificate_Four", image: "", width: 100, height: 200),
                       Certificate(title: "Certificate_One", image: "", width: 100, height: 200),
                       Certificate(title: "Certificate_One", image: "", width: 100, height: 200)]
