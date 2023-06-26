//
//  UIImageViewDemoViewController.swift
//  UIKitHelper
//
//  Created by sauron on 2023/6/22.
//  Copyright © 2023 com.sauronpi. All rights reserved.
//

import SwiftUI

class UIImageViewDemoViewController: SUIScrollViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        title = "UIImageView"
        configurationView()
    }
    
    private func configurationView() {
//        let gifView = UIImageView()
//        self.stackView.addArrangedSubview(gifView)
        
//        guard let url = Bundle.main.url(forResource: "GifRender", withExtension: "gif") else {
//            return
//        }
//
//        let options: [CFString: Any] = [kCGImageAnimationLoopCount: 0]
//
//        let _ = CGAnimateImageAtURLWithBlock(url as CFURL, options as CFDictionary) {[weak gifView] index, cgImage, stopPointer in
//            gifView?.image = UIImage(cgImage: cgImage)
//            print(index)
//        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

struct UIImageViewDemoViewController_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            PlatformViewControllerRepresent(UIImageViewDemoViewController()).ignoresSafeArea()
        }
    }
}

