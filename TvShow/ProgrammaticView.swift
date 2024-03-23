//
//  ProgrammaticView.swift
//  TvShow
//
//  Created by Nathan Mora on 20/03/24.
//

import UIKit

class ProgrammaticView: UIView {
   
   @available(*, unavailable, message: "Don't use init(coder:), override init(frame:) instead")
   required init?(coder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
   }
   
   
   override init(frame: CGRect) {
      super.init(frame: frame)
      
      configure()
      constraint()
   }
   
   
   func configure() {}
   func constraint() {}
}
