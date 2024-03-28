//
//  BooksCollectionViewController.swift
//  MachineTest_03_26
//
//  Created by csuftitan on 3/26/24.
//

import UIKit
import Kingfisher

private let reuseIdentifier = "BooksCollectionViewCell"

class BooksCollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout{

    //var apiDataFetch = APIDataFetch()
    @IBOutlet weak var collectionViewFlowLayout: UICollectionViewFlowLayout!
    
    @IBOutlet var booksCollectionView: UICollectionView!
    
    var bookImage : String?
    var booksCell : BooksCollectionViewCell?
    var booksArray : Books?
    
    var url : URL?
    var urlRequest : URLRequest?
    var urlSession : URLSession?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerCollectionViewCell()
        initializeCollectionView()
        booksAPI()
        // Register cell classes
//        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        collectionViewFlowLayout.scrollDirection = .vertical
        collectionViewFlowLayout.minimumLineSpacing = 5.0
        collectionViewFlowLayout.minimumInteritemSpacing = 0
        
    }
    
    //register
    func registerCollectionViewCell(){
        var uiNib = UINib(nibName: reuseIdentifier, bundle: nil)
        booksCollectionView.register(uiNib, forCellWithReuseIdentifier: reuseIdentifier)
    }
    
    //initialize
    func initializeCollectionView(){
        booksCollectionView.dataSource = self
        booksCollectionView.delegate = self
    }
        
    func booksAPI(){
        print("in booksAPI")
        guard let url = URL(string: "https://api.itbook.store/1.0/new") else{
            return
        }
        urlRequest = URLRequest(url: url)
        urlRequest?.httpMethod = "GET"
        urlSession = URLSession(configuration: .default)
        urlSession?.dataTask(with: urlRequest!, completionHandler: { data, response, error in
            
            do{
                let jsonResponse = try JSONDecoder().decode(Books.self, from: data!)
                self.booksArray = jsonResponse
                //print(self.booksArray)
            }
            catch{
                print(error.localizedDescription)
            }
            
        }).resume()
        
        DispatchQueue.main.async {
            self.booksCollectionView.reloadData()
        }
    }
    
    //numberOfItemsInSection
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let count = booksArray?.books.count else{
            return 0
        }
        print(count)
        return count
    }

    //binding data
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        booksCell = booksCollectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! BooksCollectionViewCell
        booksCell?.isbnLabel.text = booksArray?.books[indexPath.item].isbn13
        booksCell?.priceLabel.text = booksArray?.books[indexPath.item].price
        var bookImageUrl = URL(string: (booksArray?.books[indexPath.item].image)!)
        booksCell?.imageView.kf.setImage(with: bookImageUrl)
        
        return booksCell!
        
    }

    //cell size and layout
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
//        let flowlayout = collectionViewLayout as! UICollectionViewFlowLayout
//
//        let spaceBetweenTheCells : CGFloat = (flowlayout.minimumInteritemSpacing ?? 0.0) + (flowlayout.sectionInset.left ?? 0.0) + (flowlayout.sectionInset.right ?? 0.0)
//
//        let size = (booksCollectionView.frame.width - spaceBetweenTheCells) / 2
        
        return CGSize(width: 120, height: 120)

    }
    

}
