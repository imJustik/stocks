import UIKit
import OAuthSwift

class WebViewController: OAuthWebViewController {
    static var targetURL : NSURL?
    static var webView : UIWebView = UIWebView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        WebViewController.webView.frame = view.bounds
        WebViewController.webView.autoresizingMask = UIViewAutoresizing.FlexibleHeight
        WebViewController.webView.scalesPageToFit = true
        view.addSubview(WebViewController.webView)
        

        WebViewController.loadAddressURL()
    }
    class func loadAddressURL() {
        if let targetURL = targetURL {
            let req = NSURLRequest(URL: targetURL)
            WebViewController.webView.loadRequest(req)
            print(webView.request?.URL!.absoluteString)
        }
    }
}
