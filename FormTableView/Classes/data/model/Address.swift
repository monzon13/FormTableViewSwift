//
//  Address.swift
//  FormTableView
//
//  Created by José Miguel on 22/10/2018.
//

import Foundation
import MapKit

class Address {
    let title: String
    let subtitle: String
    
    @available(iOS 9.3, *)
    init(localSearch: MKLocalSearchCompletion) {
        self.title = localSearch.title
        self.subtitle = localSearch.subtitle
    }
}
