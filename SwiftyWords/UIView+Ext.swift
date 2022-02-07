//
//  VC+EXT.swift
//  SwiftyWords
//
//  Created by Andres Gutierrez on 2/6/22.
//

import UIKit


extension UIView {
    func addSubviews (_ views: UIView...) {
        for view in views { addSubview(view) }
    }
}
