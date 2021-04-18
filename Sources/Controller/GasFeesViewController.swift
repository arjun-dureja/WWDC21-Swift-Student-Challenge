import UIKit
import PlaygroundSupport

public class GasFeesViewController: UIViewController {
    var gasTitle: UILabel!
    var nextButton: NextButton!
    var gasDescription: UILabel!
    var payFeesButton: NFTButton!
    var gasFeesProgressView: NFTProgressView!
    var selectedEmoji = ""
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        style()
        layout()
    }
    
    func style() {
        view.backgroundColor = .backgroundColor
        
        gasTitle = UILabel()
        gasTitle.text = "Ethereum Gas Fees"
        gasTitle.font = UIFont.boldSystemFont(ofSize: 34)
        gasTitle.textColor = .titleColor
        gasTitle.translatesAutoresizingMaskIntoConstraints = false
        
        gasDescription = UILabel()
        gasDescription.text = StringConstants.gasDescription
        gasDescription.numberOfLines = 0
        gasDescription.font = UIFont.systemFont(ofSize: 22)
        gasDescription.textColor = .paragraphColor
        gasDescription.translatesAutoresizingMaskIntoConstraints = false
        
        payFeesButton = NFTButton(type: .system)
        payFeesButton.setTitle("Pay Gas Fees", for: .normal)
        payFeesButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 22)
        payFeesButton.addTarget(self, action: #selector(payFeesPressed), for: .touchUpInside)
        
        gasFeesProgressView = NFTProgressView(progressViewStyle: .bar)
        gasFeesProgressView.setProgress(0.95, animated: false)
        gasFeesProgressView.progressLabel.text = "95%"
        
        nextButton = NextButton(frame: .zero, animationDelay: 0)
        nextButton.stopAnimating()
        nextButton.addTarget(self, action: #selector(nextPressed), for: .touchUpInside)
    }
    
    func layout() {
        view.addSubview(gasTitle)
        view.addSubview(gasDescription)
        view.addSubview(payFeesButton)
        view.addSubview(gasFeesProgressView)
        view.addSubview(nextButton)
        
        NSLayoutConstraint.activate([
            gasTitle.topAnchor.constraint(equalTo: view.topAnchor, constant: 32),
            gasTitle.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32),
            
            gasDescription.leadingAnchor.constraint(equalTo: gasTitle.leadingAnchor),
            gasDescription.topAnchor.constraint(equalTo: gasTitle.bottomAnchor, constant: 16),
            gasDescription.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -32),
            
            payFeesButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -32),
            payFeesButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32),
            
            gasFeesProgressView.topAnchor.constraint(equalTo: payFeesButton.topAnchor),
            gasFeesProgressView.leadingAnchor.constraint(equalTo: payFeesButton.trailingAnchor, constant: 16),
            gasFeesProgressView.widthAnchor.constraint(equalToConstant: 400),
            gasFeesProgressView.heightAnchor.constraint(equalToConstant: 35),
            
            nextButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -32),
            nextButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -32),
        ])
    }
    
    @objc func payFeesPressed() {
        payFeesButton.isUserInteractionEnabled = false
        payFeesButton.backgroundColor = .gray
        gasFeesProgressView.animate(from: 95, to: 1.0, duration: 1)
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            self.gasFeesProgressView.progressLabel.text = "Success! The Smart Contract has been deployed."
            self.nextButton.startAnimating()
        }
    }
    
    @objc func nextPressed() {
        let vc = NFTSelectionViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
}
