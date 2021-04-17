import PlaygroundSupport
import UIKit

public class NextButton: UIButton {
    
    var timer: Timer?
    
    public init(frame: CGRect, animationDelay: Int) {
        super.init(frame: frame)
        self.setImage(UIImage(systemName: "arrowtriangle.forward.circle.fill", withConfiguration: UIImage.SymbolConfiguration(pointSize: 40, weight: .bold, scale: .large)), for: .normal)
        self.tintColor = .buttonColor
        self.translatesAutoresizingMaskIntoConstraints = false
        if animationDelay == 0 { return }
        DispatchQueue.main.asyncAfter(deadline: .now() + DispatchTimeInterval.seconds(animationDelay)) {
            self.timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.animateNext), userInfo: nil, repeats: true)
        }
    }
    
    public func stopAnimating() {
        self.isUserInteractionEnabled = false
        self.tintColor = .gray
    }
    
    public func startAnimating() {
        self.isUserInteractionEnabled = true
        self.tintColor = .buttonColor
        self.timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.animateNext), userInfo: nil, repeats: true)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func animateNext() {
        UIView.animate(withDuration: 0.75, delay: 0.0, options: [.allowUserInteraction], animations: {
            self.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
        }, completion: { _ in
            UIView.animate(withDuration: 0.75, delay: 0.0, options: [.allowUserInteraction]) {
                self.transform = CGAffineTransform(scaleX: 1, y: 1)
            }
        })
    }
}

