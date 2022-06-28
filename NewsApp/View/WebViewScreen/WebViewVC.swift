//
//  WebViewVC.swift
//  NewsApp
//
//  Created by Angshuman Das on 07/04/1401 AP.
//

import UIKit
import WebKit

class WebViewVC: UIViewController {
    
    var webURL: String?

    @IBOutlet weak var webKit: WKWebView!
    override func viewDidLoad() {
        super.viewDidLoad()

        guard let url = URL(string: webURL!) else {
            return
        }
        webKit.load(URLRequest(url: url))
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
