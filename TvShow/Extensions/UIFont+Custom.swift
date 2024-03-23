//
//  UIFont+Custom.swift
//  TvShow
//
//  Created by Nathan Mora on 20/03/24.
//


import UIKit

extension UIFont {
   private static var headline: UIFont {
      UIFontMetrics(forTextStyle: .headline)
         .scaledFont(for: .systemFont(ofSize: 16, weight: .semibold))
   }
   
   private static var subheadline: UIFont {
      UIFontMetrics(forTextStyle: .subheadline)
         .scaledFont(for: .systemFont(ofSize: 12, weight: .light))
   }
   private static var title2: UIFont {
       UIFontMetrics(forTextStyle: .title2)
           .scaledFont(for: .systemFont(ofSize: 18, weight: .bold))
   }
   private static var button: UIFont {
      UIFontMetrics(forTextStyle: .title2)
           .scaledFont(for: .systemFont(ofSize: 16, weight: .semibold))
   }
}

extension UIFont {
   enum Style {
      case headline
      case subheadline
      case title2
      case button
   }
   
   static func custom(style: Style) -> UIFont {
      switch style {
      case .headline: return headline
      case .subheadline: return subheadline
      case .title2: return title2
      case .button: return button
      }
   }
}
