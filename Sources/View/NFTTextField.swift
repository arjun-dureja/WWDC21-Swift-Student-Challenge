import PlaygroundSupport
import UIKit

public class NFTTextField: UITextField {

    public init(frame: CGRect, placeholder: String) {
        super.init(frame: frame)
        self.placeholder = placeholder
        if let pholder = self.placeholder {
            self.attributedPlaceholder = NSAttributedString(string: pholder, attributes: [NSAttributedString.Key.foregroundColor: .placeholderColor])
        }
        let paddingView: UIView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 20))
        self.leftView = paddingView
        self.leftViewMode = .always
        self.backgroundColor = .textfieldBG
        self.textColor = .titleColor
        self.layer.cornerRadius = 8
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor.buttonColor.cgColor
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

