//
//  ShowTvDetailView.swift
//  TvShow
//
//  Created by Nathan Mora on 20/03/24.
//

import UIKit
import SDWebImage

class ShowTvDetailView: UIViewController {
   private lazy var headerView = UIView()
   private lazy var informationView = UIView()
   var itemsViews: [UIView] = []
   
   var showTvId: String?
   var tvShow: TvShow!
   var savedTvShow = UserDefaults.standard.savedTvShow()

   override func viewDidLoad() {
      super.viewDidLoad()
      tabBarController?.tabBar.isHidden = true
      setupNavigationBarButton()
      configure()
      constraint()
      
   }
 
   func configure() {
      self.addChild(childVC: ShowTvDetailHeader(tvShow: tvShow), to: self.headerView)
      self.addChild(childVC: ShowTvDetailsInformation(tvShow: tvShow), to: self.informationView)
      navigationItem.title = tvShow.name
      view.backgroundColor = .black
      informationView.layer.cornerRadius = 10
   }
   
   func addChild(childVC: UIViewController, to containerView: UIView) {
      addChild(childVC)
      containerView.addSubview(childVC.view)
      childVC.view.frame = containerView.bounds
      childVC.didMove(toParent: self)
   }
   
   
   func constraint() {

      view.addSubviews(headerView, informationView)
      
      headerView.translatesAutoresizingMaskIntoConstraints = false
      informationView.translatesAutoresizingMaskIntoConstraints = false
      NSLayoutConstraint.activate([
         
         headerView.topAnchor.constraint(equalTo: view.topAnchor),
         headerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
         headerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
         headerView.heightAnchor.constraint(equalToConstant: 510),
         
         informationView.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: 36),
         informationView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8),
         informationView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8),
         informationView.heightAnchor.constraint(equalToConstant: 90)
         
      ])
   }
   
   func setupNavigationBarButton() {
      let savedTvShow = UserDefaults.standard.savedTvShow()
      let hasFavorited = savedTvShow.firstIndex(where: { $0.name == self.tvShow?.name && $0.id == self.tvShow?.id }) != nil
      if hasFavorited {
         // setting up our heart icon
         navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "heart"), style: .plain, target: nil, action: nil)
         Alert.showAddedFavoriteAlert(on: self, with: "Favorite", message: "Already added")
      } else {
         navigationItem.rightBarButtonItems = [
            UIBarButtonItem(title: "Add Favorite", style: .plain, target: self, action: #selector(handleSaveFavorite)),
         ]
      }
   }
   
   @objc fileprivate func handleSaveFavorite() {
      
      guard let tvShow = self.tvShow else { return }
      
      var listOfTvShow = UserDefaults.standard.savedTvShow()
      listOfTvShow.append(tvShow)
      
      let data = NSKeyedArchiver.archivedData(withRootObject: listOfTvShow)
      
      UserDefaults.standard.set(data, forKey: UserDefaults.favoritedTvShowKey)
      navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "heart"), style: .plain, target: nil, action: nil)
      
      Alert.showFavoriteAlert(on: self, with: "Favorite", message: "Added successfully")

      
   }
   
}
