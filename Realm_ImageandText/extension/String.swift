import Foundation
import UIKit

extension String {
    func getImage(tweetImageURL: String?) -> UIImage?{
        // 画像のパスを取得
        if let tweetImageName = tweetImageURL {
            let path = getImageURL(fileName: tweetImageName).path
            if FileManager.default.fileExists(atPath: path) { //pathにファイルが存在しているかチェック
                if let imageData = UIImage(contentsOfFile: path) {  //pathに保存されている画像を取得
                    return imageData
                } else {
                    print("Failed to load the image. path = ", path)
                }
            } else {
                print("Image file not found. path = ", path)
            }
        }
        return nil
    }
}
