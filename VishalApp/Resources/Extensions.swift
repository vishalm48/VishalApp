//
//  Extensions.swift
//  VishalApp
//
//  Created by Amalnath N D on 21/11/22.
//

import Foundation


extension String {
    func capitalizeFirstLetter() -> String {
        return self.prefix(1).uppercased()+self.lowercased().dropFirst()
    }
}
