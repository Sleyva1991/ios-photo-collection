//
//  PhotoController.swift
//  PhotoCollection
//
//  Created by Steven Leyva on 8/22/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation

class PhotoController {
    
    var photos: [Photo] = []
    
    func create(imageData: Data, title: String) {
        let photo = Photo(imageData: imageData, title: title)
        photos.append(photo)
    }
    
    func update(photo: Photo, imageData: Data, title: String) {
        guard let index = photos.firstIndex(of: photo) else { return }
        photos[index].imageData = imageData
        photos[index].title = title
        
        
    }
}
