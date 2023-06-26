//
//  SUIGifView.swift
//  UIKitHelper
//
//  Created by sauron on 2023/6/24.
//  Copyright © 2023 com.sauronpi. All rights reserved.
//

import SwiftUI

public class SUIGifView: UIView {
    public let imageView: UIImageView
    
    override init(frame: CGRect) {
        self.imageView = UIImageView()
        super.init(frame: frame)
        self.clipsToBounds = true
        self.addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imageView.widthAnchor.constraint(equalTo: self.widthAnchor),
            imageView.heightAnchor.constraint(equalTo: self.heightAnchor),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func handleImage(index: Int, cgImage: CGImage, stopPointer: UnsafeMutablePointer<Bool>) {
        imageView .image = UIImage(cgImage: cgImage)
    }
    
    public func setGif(url: URL) {
        CGAnimateImageAtURLWithBlock(url as CFURL, nil) { [weak self] index, cgImage, stopPointer in
            if self == nil {
                stopPointer.pointee = true
            }
            self?.handleImage(index: index, cgImage: cgImage, stopPointer: stopPointer)
        }
    }
    
    public func setGif(data: Data) {
        CGAnimateImageDataWithBlock(data as CFData, nil) { [weak self] index, cgImage, stopPointer in
            if self == nil {
                stopPointer.pointee = true
            }
            self?.handleImage(index: index, cgImage: cgImage, stopPointer: stopPointer)
        }
    }
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}

struct SUIGifView_Previews: PreviewProvider {
    static var previews: some View {
        let url = Bundle.main.url(forResource: "GifRender", withExtension: "gif")!
        let view = { () -> UIView in
            let v = SUIGifView()
            v.setGif(url: url)
            return v
        }()
        PlatformViewRepresent(view)
        .ignoresSafeArea()
    }
}
