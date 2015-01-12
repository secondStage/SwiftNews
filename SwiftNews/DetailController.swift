import UIKit

class DetailController: UIViewController {
    
    @IBOutlet weak var webView: UIWebView!
    var entry = NSDictionary()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // WebビューでURLを読み込む
        var url = NSURL(string: self.entry["link"] as String)!
        var request = NSURLRequest(URL: url)
        webView.loadRequest(request)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}