//
//  Alert.swift
//  TvShow
//
//  Created by Nathan Mora on 22/03/24.
//

import UIKit

struct Alert {
   
   static func showFavoriteAlert(on vc: UIViewController, with title: String, message: String) {
      let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
      alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
      vc.present(alert, animated: true)
   }
   
   static func showAddedFavoriteAlert(on vc: UIViewController, with title: String, message: String) {
      let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
      alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
      vc.present(alert, animated: true)
   }
   
   static func showFavoriteDelete(on vc: UIViewController, with title: String, message: String) {
      let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
      alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
      vc.present(alert, animated: true)
   }
   static func showNoMorefavorites(on vc: UIViewController, with title: String, message: String) {
      let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
      alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
      vc.present(alert, animated: true)
   }
   static func showFetchError(on vc: UIViewController, with title: String, message: String) {
      let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
      alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
      vc.present(alert, animated: true)
   }
}
