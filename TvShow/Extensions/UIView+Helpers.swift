//
//  UIView+Helpers.swift
//  TvShow
//
//  Created by Nathan Mora on 20/03/24.
//

import UIKit

extension UIView {
   func addSubviews(_ views: UIView...) {
      views.forEach { view in addSubview(view) }
   }
}
