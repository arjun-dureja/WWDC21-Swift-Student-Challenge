import PlaygroundSupport
import UIKit

public class NextButton: UIButton {
    public init(frame: CGRect, animationDelay: Int) {
        super.init(frame: frame)
        self.setImage(UIImage(systemName: "arrowtriangle.forward.circle.fill", withConfiguration: UIImage.SymbolConfiguration(pointSize: 40, weight: .bold, scale: .large)), for: .normal)
        self.tintColor = UIColor(red: 82/255, green: 79/255, blue: 233/255, alpha: 1)
        self.translatesAutoresizingMaskIntoConstraints = false
        DispatchQueue.main.asyncAfter(deadline: .now() + DispatchTimeInterval.seconds(animationDelay)) {
            Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.animateNext), userInfo: nil, repeats: true)
        }
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

