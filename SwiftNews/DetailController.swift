import UIKit
import Social

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
    
    @IBAction func twitter(sender: AnyObject) {
        // Twitterへ投稿できるかを確認
        if SLComposeViewController.isAvailableForServiceType(SLServiceTypeTwitter) {
            // コントローラを作る
            var controller = SLComposeViewController(forServiceType: SLServiceTypeTwitter)
            
            // リンクを作る
            var link = entry["link"] as String
            var url  = NSURL(string: link)
            controller.addURL(url)
            
            // テキストを追加する
            var title = entry["title"] as String
            controller.setInitialText(title)
            
            // 投稿画面を表示する
            presentViewController(controller, animated: true, completion: {})
        
        }
    }
    
    @IBAction func facebook(sender: AnyObject) {
        // Facebookへ投稿できるかを確認
        if SLComposeViewController.isAvailableForServiceType(SLServiceTypeTwitter) {
            // コントローラを作る
            var controller = SLComposeViewController(forServiceType: SLServiceTypeFacebook)
            
            // リンクを作る
            var link = entry["link"] as String
            var url  = NSURL(string: link)
            controller.addURL(url)
            
            // テキストを追加する
            var title = entry["title"] as String
            controller.setInitialText(title)
            
            // 投稿画面を表示する
            presentViewController(controller, animated: true, completion: {})
            
        }
    }
}