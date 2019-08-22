//
//  Photo.swift
//  PhotoCollection
//
//  Created by Steven Leyva on 8/22/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation

struct Photo: Equatable {
    var imageData: Data
    var title: String
    
    init(imageData: Data, title: String) {
        self.imageData = imageData
        self.title = title
    }
}
