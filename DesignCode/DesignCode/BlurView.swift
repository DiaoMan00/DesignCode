//
//  BlurView.swift
//  DesignCode
//
//  Created by xueming liu on 2020/8/26.
//  Copyright © 2020 xueming liu. All rights reserved.
//

import SwiftUI

struct BlurView: UIViewRepresentable {
    let stype : UIBlurEffect.Style
    
    func makeUIView(context: UIViewRepresentableContext<BlurView>)->UIView {
        let view = UIView(frame: CGRect.zero)
        view.backgroundColor = .clear
        
        let blurEffect = UIBlurEffect(style: stype)
        let blurView = UIVisualEffectView(effect: blurEffect)
        blurView.translatesAutoresizingMaskIntoConstraints = false
        view.insertSubview(blurView, at: 0)
        NSLayoutConstraint.activate([
            blurView.heightAnchor.constraint(equalTo: view.heightAnchor),
            blurView.widthAnchor.constraint(equalTo: view.widthAnchor
            )
        ])
        
        return view
    }
    func updateUIView(_ uiview: UIView,  context: UIViewRepresentableContext<BlurView>) {
        
    }
}

struct BlurView_Previews: PreviewProvider {
    static var previews: some View {
        BlurView(stype: .extraLight)
    }
}
