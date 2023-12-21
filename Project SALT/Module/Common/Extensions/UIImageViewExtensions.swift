//
//  UIImageExtensions.swift
//  Project SALT
//
//  Created by Arya Ilham on 22/12/23.
//

import UIKit
import AlamofireImage

extension UIImageView {
    func setOnlineImage(url: URL) {
        self.af.setImage(withURL: url)
    }
}
