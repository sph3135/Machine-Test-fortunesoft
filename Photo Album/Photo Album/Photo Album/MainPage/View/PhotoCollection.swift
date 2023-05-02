//
//  PhotoCollection.swift
//  Photo Album
//
//

import UIKit
import Kingfisher

class PhotoCollectionViewController: UIViewController {
    @IBOutlet weak var photoCollection: UICollectionView!

    var viewModel: PhotoCollectionViewModel = PhotoCollectionViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        viewModel = PhotoCollectionViewModel()
        photoCollection.delegate = self
        photoCollection.dataSource = self
        photoCollection.register(UINib(
                            nibName: "PhotoViewCell", bundle: Bundle.main), forCellWithReuseIdentifier: "photoViewCell")
        viewModel.fetchData(handler: {
            DispatchQueue.main.async {
                self.photoCollection.reloadData()
            }
        })
    }
    
}

extension PhotoCollectionViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        self.viewModel.getArray().count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "photoViewCell", for: indexPath) as! PhotoViewCell
        let array = viewModel.getArray()
        self.viewModel.downloadImage(index: array[indexPath.row], cell: cell)
        return cell
    }
}

extension PhotoCollectionViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
           return UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
       }
    
}
