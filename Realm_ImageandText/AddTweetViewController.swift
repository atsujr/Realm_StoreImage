import Foundation
import UIKit
import RealmSwift

class AddTweetViewController: UIViewController {
    @IBOutlet weak var tweetTextField: UITextField!
    @IBOutlet weak var tweetIamgeImageview: UIImageView!

    let realm = try! Realm()

    override func viewDidLoad() {
        super.viewDidLoad()
        tweetTextField.delegate = self

    }

    @IBAction func saveTweet(_ sender: Any) {
        saveInputText()
        setAlert()
    }
    @IBAction func addImage() {
        let picker = UIImagePickerController()
        picker.sourceType = .photoLibrary
        picker.delegate = self
        present(picker, animated: true)
        self.present(picker, animated: true)
    }

    func saveInputText() {
        guard let setTweetText = tweetTextField.text else {return}

        let tweet = Tweet()
        tweet.tweetText = setTweetText
        if let setTweetImage = tweetIamgeImageview.image{
            let tweetImageurl = saveImage(image: setTweetImage)
            tweet.tweetImageName = tweetImageurl
        }
        try! realm.write({
            realm.add(tweet)
        })
    }
    func setAlert() {
        let alert = UIAlertController(title: "保存", message: "保存されました", preferredStyle: .alert)
        let ok = UIAlertAction(title: "OK", style: .default) { (action) in
            self.navigationController?.popViewController(animated: true)
        }
        alert.addAction(ok)
        present(alert, animated: true, completion: nil)
    }
}
extension AddTweetViewController: UITextFieldDelegate {
    //キーボードをreturnで閉じる
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        tweetTextField.resignFirstResponder()
        return true
    }
    //キーボードを画面タップで閉じる
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}
extension AddTweetViewController: UIImagePickerControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let selectedImage = info[.originalImage] as? UIImage {
            tweetIamgeImageview.image = selectedImage
        }
        self.dismiss(animated: true)
    }
}
extension AddTweetViewController: UINavigationControllerDelegate {
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        self.dismiss(animated: true)
    }
}
