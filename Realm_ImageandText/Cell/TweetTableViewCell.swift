import UIKit

class TweetTableViewCell: UITableViewCell {

    @IBOutlet var tweetTextLabel: UILabel!
    @IBOutlet var tweetImageView: UIImageView!
    @IBOutlet var profileImageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    func setTweet(tweetText: String?, tweetImageURL: String?) {
        profileImageView.layer.cornerRadius = 25
        tweetTextLabel.text = tweetText
        
        tweetImageView.image = nil
        tweetImageView.image = getImage(tweetImageURL: tweetImageURL)
    }
}
