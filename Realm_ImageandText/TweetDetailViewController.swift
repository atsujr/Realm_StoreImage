import UIKit
import RealmSwift

class TweetDetailViewController: UIViewController {

    @IBOutlet weak var tweetTextField: UITextField!
    @IBOutlet weak var tweetImageVIew: UIImageView!
    var tweets: [Tweet]!
    var tweetNumber: Int = 0
    let realm = try! Realm()

    override func viewDidLoad() {
        super.viewDidLoad()
        setTweetData()
    }
    @IBAction func addImage(_ sender: Any) {
        
    }
    @IBAction func saveTweet(_ sender: Any) {
    }
    func setTweetData(){
        tweets = Array(realm.objects(Tweet.self)).reversed()
        tweetTextField.text = tweets[tweetNumber].tweetText
        if let tweetImageName = tweets[tweetNumber].tweetImageName {
            let path = getImageURL(fileName: tweetImageName).path
            if FileManager.default.fileExists(atPath: path) { //pathにファイルが存在しているかチェック
                if let imageData = UIImage(contentsOfFile: path) {  //pathに保存されている画像を取得
                    tweetImageVIew.image = imageData
                } else {
                    print("Failed to load the image. path = ", path)
                }
            } else {
                print("Image file not found. path = ", path)
            }
        }
    }
    func getImageURL(fileName: String) -> URL {
        let docDir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        return docDir.appendingPathComponent(fileName)
    }

}
