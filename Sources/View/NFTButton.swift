import PlaygroundSupport
import UIKit

public class NFTButton: UIButton {
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .buttonColor
        self.setTitleColor(.backgroundColor, for: .normal)
        self.sizeToFit()
        self.contentEdgeInsets = UIEdgeInsets(top: 5.0, left: 5.0, bottom: 5.0, right: 5.0)
        self.layer.cornerRadius = 6
        self.layer.masksToBounds = true
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

