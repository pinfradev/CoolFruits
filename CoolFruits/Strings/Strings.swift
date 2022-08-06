//
//  Strings.swift
//  CoolFruits
//
//  Created by Fray Pineda on 6/8/22.
//

import Foundation

struct Strings {
    
    struct FruitsList {
        
        static let navigationTitle = NSLocalizedString("fruits_list.navigation_title", comment: "")
        static let citrusGenus = NSLocalizedString("fruits_list.citrus_genus", comment: "")
    }
    
    struct Alert {
        
        static let acceptButtonTitle = NSLocalizedString("alert.accept_button_title", comment: "")
        static let errorTitle = NSLocalizedString("alert.error_title", comment: "")
        static let genericError = NSLocalizedString("alert.generic_error", comment: "")
    }
}
