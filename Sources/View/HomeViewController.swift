import UIKit
import PlaygroundSupport

public class HomeViewController: UIViewController {
    var nftTitle: UILabel!
    var nextButton: UIButton!
    var nftDescription: UILabel!
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        style()
        layout()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
            Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.animateNext), userInfo: nil, repeats: true)
        }
    }
    
    func style() {
        view.backgroundColor = UIColor(red: 29/255, green: 29/255, blue: 64/255, alpha: 1)
        
        nftTitle = UILabel()
        nftTitle.text = "Non-Fungible Tokens"
        nftTitle.font = UIFont.boldSystemFont(ofSize: 44)
        nftTitle.textColor = UIColor(red: 225/255, green: 225/255, blue: 230/255, alpha: 1)
        nftTitle.translatesAutoresizingMaskIntoConstraints = false
        
        nftDescription = UILabel()
        nftDescription.text = """
        Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum
        """
        nftDescription.numberOfLines = 0
        nftDescription.font = UIFont.systemFont(ofSize: 26)
        nftDescription.textColor = UIColor(red: 225/255, green: 225/255, blue: 230/255, alpha: 1)
        nftDescription.translatesAutoresizingMaskIntoConstraints = false
        
        nextButton = UIButton(type: .system)
        nextButton.setImage(UIImage(systemName: "arrowtriangle.forward.circle.fill", withConfiguration: UIImage.SymbolConfiguration(pointSize: 40, weight: .bold, scale: .large)), for: .normal)
        nextButton.tintColor = UIColor(red: 82/255, green: 79/255, blue: 233/255, alpha: 1)
        nextButton.translatesAutoresizingMaskIntoConstraints = false
        nextButton.addTarget(self, action: #selector(nextPressed), for: .touchUpInside)
    }
    
    @objc func animateNext() {
        UIView.animate(withDuration: 0.75, delay: 0.0, options: [.allowUserInteraction], animations: {
            self.nextButton.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
        }, completion: { _ in
            UIView.animate(withDuration: 0.75, delay: 0.0, options: [.allowUserInteraction]) {
                self.nextButton.transform = CGAffineTransform(scaleX: 1, y: 1)
            }
        })
    }
    
    func layout() {
        view.addSubview(nextButton)
        view.addSubview(nftDescription)
        view.addSubview(nftTitle)
        
        NSLayoutConstraint.activate([
            nftTitle.topAnchor.constraint(equalTo: view.topAnchor, constant: 32),
            nftTitle.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32),
            
            nftDescription.leadingAnchor.constraint(equalTo: nftTitle.leadingAnchor),
            nftDescription.topAnchor.constraint(equalTo: nftTitle.bottomAnchor, constant: 16),
            nftDescription.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -32),
            
            nextButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -32),
            nextButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -32),
        ])
    }
    
    
    @objc func nextPressed() {
        print("hey")
    }
    
}
