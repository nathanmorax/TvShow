//
//  FavoritesTvShowDetailCell.swift
//  TvShow
//
//  Created by Nathan Mora on 21/03/24.
//

import UIKit
import SDWebImage

class FavoritesTvShowDetailCell: UITableViewCell {
   static let favoriteTvShowCell = "FavoriteTvShowCell"
   private let stack = UIStackView()
   let titleLabel = UILabel()
   let subtitleLabel = UILabel()
   let image = UIImageView()
   
   var showTv: TvShow! {
      didSet {
         titleLabel.text = showTv?.name
         subtitleLabel.text = showTv?.language?.rawValue
         let url = URL(string: showTv?.image?.medium ?? "")
         image.sd_setImage(with: url)
      }
   }
   override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
      super.init(style: style, reuseIdentifier: reuseIdentifier)
      
      self.configure()
      self.constraint()
   }
   
   required init?(coder aDecoder: NSCoder) {
      super.init(coder: aDecoder)
      
      self.configure()
      self.constraint()
   }
   
   private func configure() {
      
      //backgroundColor = .black
      
      stack.axis = .vertical
      stack.spacing = 4
      
      //image.backgroundColor = .systemGreen
      image.layer.cornerRadius = 8
      image.layer.masksToBounds = true
      image.image = UIImage(named: "background")
      
      titleLabel.font = .custom(style: .headline)
      subtitleLabel.font = .custom(style: .subheadline)
      
   }
   
   private func constraint() {
      
      addSubviews(image ,stack)
      stack.addArrangedSubviews(titleLabel, subtitleLabel)
      
      image.translatesAutoresizingMaskIntoConstraints = false
      stack.translatesAutoresizingMaskIntoConstraints = false
      
      NSLayoutConstraint.activate([
         
         image.centerYAnchor.constraint(equalTo: self.centerYAnchor),
         image.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 12),
         image.widthAnchor.constraint(equalToConstant: 80),
         image.heightAnchor.constraint(equalToConstant: 80),
         
         stack.centerYAnchor.constraint(equalTo: self.centerYAnchor),
         stack.leadingAnchor.constraint(equalTo: image.trailingAnchor, constant: 24),
         stack.trailingAnchor.constraint(equalTo: self.trailingAnchor),
         stack.heightAnchor.constraint(equalToConstant: 40)
      ])
      
   }
}

