//
//  PhotoCollectionViewModel.swift
//  Photo Album
//
//

import Foundation
import Kingfisher

class PhotoCollectionViewModel: NSObject{
    var apiManager: ApiManager = ApiManager()
    var detailsArray: [Details]?
    
    func fetchData(handler: @escaping () -> ()) {
        apiManager.fetchData(handler: { data in
            self.detailsArray = data
            handler()
        })
    }
    
    func getArray() -> [Details] {
        guard let array = detailsArray else {
            return []
        }
        return array
    }
    
    func downloadImage(index: Details, cell: PhotoViewCell) {
        let urlString = index.image
        guard let url = URL.init(string: urlString) else {
            return
        }
        let resource = ImageResource(downloadURL: url)

        KingfisherManager.shared.retrieveImage(with: resource, options: nil, progressBlock: nil) { result in
            switch result {
            case .success(let value):
                cell.photoImageView.image = value.image
                cell.titleLabel.text = index.title
            case .failure(_): break
                
            }
        }
    }

}
