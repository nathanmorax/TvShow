//
//  UIStackView+Helpers.swift
//  TvShow
//
//  Created by Nathan Mora on 20/03/24.
//

import UIKit

extension UIStackView {
   func addArrangedSubviews(_ views: UIView...) {
      views.forEach { view in addArrangedSubview(view) }
   }
}
