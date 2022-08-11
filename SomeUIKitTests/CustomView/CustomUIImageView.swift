//
//  CustomUIImageView.swift
//  SomeUIKitTests
//
//  Created by Павел Кай on 10.08.2022.
//

import UIKit

let imageCache = NSCache<AnyObject, AnyObject>()

class CustomUIImageView: UIImageView {

    var task: URLSessionDataTask!
    let loadingView = UIActivityIndicatorView(style: .large)
    
    func loadImage(for url: URL) {
        image = nil
        
        setLoadingView()
        
        if let task = task {
            task.cancel()
        }
        
        if let imageCache = imageCache.object(forKey: url.absoluteURL as AnyObject) as? UIImage {
            self.image = imageCache
            removeLoadingView()
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, resp, error in
            
            guard let data = data, let image = UIImage(data: data) else {
                print("data nil loh")
                return
            }
            
            imageCache.setObject(image, forKey: url.absoluteURL as AnyObject)
            
            DispatchQueue.main.async {
                self.image = image
                self.removeLoadingView()
            }
            
        }
        task.resume()
                
    }
    
    func setLoadingView() {
        addSubview(loadingView)
        loadingView.translatesAutoresizingMaskIntoConstraints = false
        
        loadingView.startAnimating()
        
        NSLayoutConstraint.activate([
            loadingView.centerXAnchor.constraint(equalTo: centerXAnchor),
            loadingView.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
    
    func removeLoadingView() {
        loadingView.removeFromSuperview()
    }

}
