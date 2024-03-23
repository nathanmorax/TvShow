//
//  FavoritesTVShowVC.swift
//  TvShow
//
//  Created by Nathan Mora on 20/03/24.
//

import UIKit

class FavoritesTVShowVC: UIViewController {
   
   fileprivate let favoriteTvShowCell = "cell"
   let tableView = UITableView(frame: .zero)
   var tvShow = UserDefaults.standard.savedTvShow()
   
   override func viewDidLoad() {
      super.viewDidLoad()
      configure()
      constraint()
   }
   
   override func viewWillAppear(_ animated: Bool) {
      super.viewWillAppear(animated)
      tvShow = UserDefaults.standard.savedTvShow()
      tableView.reloadData()
   }
   
   func configure() {
      view.backgroundColor    = .systemBackground
      navigationController?.navigationBar.prefersLargeTitles = true

      tableView.register(FavoritesTvShowDetailCell.self, forCellReuseIdentifier: favoriteTvShowCell)
      tableView.delegate = self
      tableView.dataSource = self
      
   }
   
   func constraint() {
      view.addSubview(tableView)
      
      tableView.translatesAutoresizingMaskIntoConstraints = false
      NSLayoutConstraint.activate([
         view.topAnchor.constraint(equalTo: tableView.topAnchor),
         view.leftAnchor.constraint(equalTo: tableView.leftAnchor),
         view.rightAnchor.constraint(equalTo: tableView.rightAnchor),
         view.bottomAnchor.constraint(equalTo: tableView.bottomAnchor),
      ])
   }
   
}

extension FavoritesTVShowVC: UITableViewDataSource, UITableViewDelegate {
   func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      return tvShow.count
   }
   
   func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      
      if indexPath.row < tvShow.count {
         let cell = tableView.dequeueReusableCell(withIdentifier: favoriteTvShowCell, for: indexPath)
         if let cell = cell as? FavoritesTvShowDetailCell {
            cell.showTv = self.tvShow[indexPath.row]
            print("Name:::", tvShow[indexPath.row].image?.medium)
            return cell
         }
         Alert.showNoMorefavorites(on: self, with: "Delete", message: "No more favorites")
         return UITableViewCell()
         
         
      }
      return UITableViewCell()
      
   }
   func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
      return 110
   }
   
   func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
      
      let selectedTvSHow = self.tvShow[indexPath.row]
      
      let deleteAction = UIContextualAction(style: .destructive, title: "Delete") { index,_,_  in
         

         self.tvShow.remove(at: indexPath.row)
         self.tableView.deleteRows(at: [indexPath], with: .automatic)
         UserDefaults.standard.deleteTvShow(tvShow: selectedTvSHow)
         print("Count:", self.tvShow.count)
         tableView.reloadData()
         
         Alert.showFavoriteDelete(on: self, with: "Favorite removed", message: "it was deleted")
         
      }
      deleteAction.image = UIImage(systemName: "trash")
      deleteAction.backgroundColor = .red
      
      let config = UISwipeActionsConfiguration(actions: [deleteAction])
      config.performsFirstActionWithFullSwipe = false
      return config
   }
   
   
}


