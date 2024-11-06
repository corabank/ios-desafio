import UIKit

public extension Notification {
    static var keyboardSize: CGSize? {
        let height = UserDefaults.standard.float(forKey: "KeyboardSize")
        return CGSize(width: UIScreen.main.bounds.width, height: CGFloat(height))
    }
    
    var keyboardSize: CGSize? {
        guard let size = (userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue.size else {
            let height = UserDefaults.standard.float(forKey: "KeyboardSize")
            return CGSize(width: UIScreen.main.bounds.width, height: CGFloat(height))
        }
        
        UserDefaults.standard.setValue(size.height, forKey: "KeyboardSize")
        return size
    }
    
    var keyboardFrame: CGRect? {
        return (userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue
    }
    
    var keyboardAnimationDuration: Double {
        return userInfo?[UIResponder.keyboardAnimationDurationUserInfoKey] as? Double ?? 0.0
    }
}
