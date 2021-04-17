import PlaygroundSupport
import UIKit

public class NFTTextField: UITextField {

    public init(frame: CGRect, placeholder: String) {
        super.init(frame: frame)
        self.placeholder = placeholder
        if let pholder = self.placeholder {
            self.attributedPlaceholder = NSAttributedString(string: pholder, attributes: [NSAttributedString.Key.foregroundColor: UIColor(red: 81/255, green: 81/255, blue: 102/255, alpha: 1)])
        }
        let paddingView: UIView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 20))
        self.leftView = paddingView
        self.leftViewMode = .always
        self.backgroundColor = UIColor(red: 20/255, green: 20/255, blue: 49/255, alpha: 1)
        self.textColor = .titleColor
        self.layer.cornerRadius = 8
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

