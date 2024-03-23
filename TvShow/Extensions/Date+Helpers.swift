//
//  Date+Helpers.swift
//  TvShow
//
//  Created by Nathan Mora on 23/03/24.
//

import UIKit

extension String {
    func dateFormatter(style: DateFormatter.Style) -> String? {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        formatter.timeZone = .current
        formatter.dateStyle = style
        formatter.locale = Locale(identifier: "es_AR")
        return formatter.string(from: Date())
    }
}
