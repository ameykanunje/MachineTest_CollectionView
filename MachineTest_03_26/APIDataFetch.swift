////
////  APIDataFetch.swift
////  MachineTest_03_26
////
////  Created by csuftitan on 3/26/24.
////
//
//import Foundation
//
//class APIDataFetch{
//    
//    var collectionViewController : BooksCollectionViewController = BooksCollectionViewController()
//    var booksArray : Books?
//    
//    var url : URL?
//    var urlRequest : URLRequest?
//    var urlSession : URLSession?
//    
//    func booksAPI(){
//        print("in booksAPI")
//        guard let url = URL(string: "https://api.itbook.store/1.0/new") else{
//            return
//        }
//        urlRequest = URLRequest(url: url)
//        urlRequest?.httpMethod = "GET"
//        urlSession = URLSession(configuration: .default)
//        urlSession?.dataTask(with: urlRequest!, completionHandler: { data, response, error in
//            
//            do{
//                let jsonResponse = try JSONDecoder().decode(Books.self, from: data!)
//                self.booksArray = jsonResponse
//                print(self.booksArray)
//            }
//            catch{
//                print(error.localizedDescription)
//            }
//            
//        }).resume()
//        
//        DispatchQueue.main.async {
//            self.collectionViewController.collectionView.reloadData()
//        }
//    }
//    
//}
