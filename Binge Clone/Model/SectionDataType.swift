//
//  SectionDataType.swift
//  Binge Clone
//
//  Created by MD. SHAYANUL HAQ SADI on 28/6/23.
//

import UIKit


struct SectionDataType {
    let headerFooter: SupplementaryDataType
    var cells: [CellDataType]
    
    init(headerFooter: SupplementaryDataType, cells: [CellDataType]) {
        self.headerFooter = headerFooter
        self.cells = cells
    }
}
