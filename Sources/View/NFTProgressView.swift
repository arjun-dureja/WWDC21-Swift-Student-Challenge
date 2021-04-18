import PlaygroundSupport
import UIKit

public class NFTProgressView: UIProgressView {
    
    var progressLabel: UILabel!
    var currentProgress = 0
    var progressTimer: Timer?
    var endVal = 0
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        self.trackTintColor = .textfieldBG
        self.progressTintColor = .metadataColor
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor.buttonColor.cgColor
        self.layer.cornerRadius = 8
        self.layer.masksToBounds = true
        self.translatesAutoresizingMaskIntoConstraints = false
        
        progressLabel = UILabel()
        progressLabel.text = "0%"
        progressLabel.font = UIFont.boldSystemFont(ofSize: 16)
        progressLabel.textColor = .backgroundColor
        progressLabel.translatesAutoresizingMaskIntoConstraints = false
        
        self.addSubview(progressLabel)
        
        progressLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        progressLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 12).isActive = true
    }
    
    public func animate(from startingVal: Int, to value: Float, duration: Double) {
        self.endVal = Int(value*100)
        self.currentProgress = startingVal
        UIView.animate(withDuration: duration, animations: { () -> Void in
            self.setProgress(value, animated: true)
        })
        DispatchQueue.main.async {
            self.progressTimer = Timer.scheduledTimer(timeInterval: duration/Double(Int(value)*100 - startingVal), target: self, selector: #selector(self.updateProgressLabel), userInfo: nil, repeats: true)
        }
    }
    
    @objc func updateProgressLabel() {
        currentProgress += 1
        self.progressLabel.text = "\(currentProgress)%"
        if (currentProgress == endVal) {
            progressTimer?.invalidate()
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

