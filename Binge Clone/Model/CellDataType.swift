//
//  CellDataType.swift
//  Binge Clone
//
//  Created by MD. SHAYANUL HAQ SADI on 26/6/23.
//

import UIKit


struct CellDataType {
    let image: String?
    let label: String?
    let title: String?
    let genre: String?
    let progress: Float?
    let year: String?
    let duration: String?
    
    init(image: String? = nil, label: String? = nil, title: String? = nil, genre: String? = nil, progress: Float? = nil, year: String? = nil, duration: String? = nil) {
        self.image = image
        self.label = label
        self.title = title
        self.genre = genre
        self.progress = progress
        self.year = year
        self.duration = duration
    }
    
    
}
