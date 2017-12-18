//
//  ImageUtil.swift
//  firstMiniChallenge
//
//  Created by Bilal Abdullah on 18/12/2017.
//  Copyright © 2017 Vincenzo Aceto. All rights reserved.
//

import Foundation
import UIKit

class ImageUtil  {
    public static func loadImageFromUrl(imageUrlString: String, completionHandler: @escaping (_ image: UIImage) -> ()){
        let imageUrl:URL = URL(string: imageUrlString)!
        DispatchQueue.global(qos: .userInitiated).async {
            
            let imageData:NSData = NSData(contentsOf: imageUrl)!
            let newImage = UIImage(data: imageData as Data)
            completionHandler(newImage!)
        }
    }
}
