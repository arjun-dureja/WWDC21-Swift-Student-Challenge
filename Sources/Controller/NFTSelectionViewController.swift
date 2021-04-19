import UIKit
import PlaygroundSupport

// Third Screen
public class NFTSelectionViewController: UIViewController {
    var nftTitle: UILabel!
    var nextButton: NextButton!
    var nftDescription: UILabel!
    var emojiStackView: UIStackView!
    var emojis: [UIButton] = []
    var selectedEmoji: String?
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        style()
        layout()
    }
    
    func style() {
        view.backgroundColor = .backgroundColor
        
        nftTitle = UILabel()
        nftTitle.text = "Let's Mint Our Own NFT!"
        nftTitle.font = UIFont.boldSystemFont(ofSize: 44)
        nftTitle.textColor = .titleColor
        nftTitle.translatesAutoresizingMaskIntoConstraints = false
        
        nftDescription = UILabel()
        nftDescription.text = StringConstants.nftSelectionIntro
        nftDescription.numberOfLines = 0
        nftDescription.font = UIFont.systemFont(ofSize: 26)
        nftDescription.textColor = .paragraphColor
        nftDescription.translatesAutoresizingMaskIntoConstraints = false
        
        // Create 5 emojis to choose from
        for i in 0..<5 {
            let emoji = UIButton()
            emoji.tag = i
            emoji.addTarget(self, action: #selector(emojiPressed), for: .touchUpInside)
            emoji.translatesAutoresizingMaskIntoConstraints = false
            emoji.titleLabel?.font = UIFont.systemFont(ofSize: 64)
            emojis.append(emoji)
        }
        
        emojis[0].setTitle("😀",  for: .normal)
        emojis[1].setTitle("🐶",  for: .normal)
        emojis[2].setTitle("🎉",  for: .normal)
        emojis[3].setTitle("🏀",  for: .normal)
        emojis[4].setTitle("👽",  for: .normal)
        
        // Add emojis to a stackview
        emojiStackView = UIStackView(arrangedSubviews: emojis)
        emojiStackView.axis = .horizontal
        emojiStackView.distribution = .equalSpacing
        emojiStackView.alignment = .center
        emojiStackView.translatesAutoresizingMaskIntoConstraints = false
        
        nextButton = NextButton(frame: .zero, animationDelay: 0)
        nextButton.stopAnimating()
        nextButton.addTarget(self, action: #selector(nextPressed), for: .touchUpInside)
    }

    func layout() {
        view.addSubview(nftTitle)
        view.addSubview(nftDescription)
        view.addSubview(emojiStackView)
        view.addSubview(nextButton)
        
        NSLayoutConstraint.activate([
            nftTitle.topAnchor.constraint(equalTo: view.topAnchor, constant: 32),
            nftTitle.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32),
            
            nftDescription.leadingAnchor.constraint(equalTo: nftTitle.leadingAnchor),
            nftDescription.topAnchor.constraint(equalTo: nftTitle.bottomAnchor, constant: 16),
            nftDescription.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -32),
            
            emojiStackView.topAnchor.constraint(equalTo: nftDescription.bottomAnchor, constant: 40),
            emojiStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 72),
            emojiStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -72),
            
            nextButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -32),
            nextButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -32),
        ])
    }
    
    // Handle pressing on an emoji - animate scale
    @objc func emojiPressed(sender: UIButton) {
        selectedEmoji = emojis[sender.tag].titleLabel?.text
        
        UIView.animate(withDuration: 0.25, animations: {
            self.emojis[sender.tag].transform = CGAffineTransform(scaleX: 1.5, y: 1.5)
        })
        
        for emoji in emojis {
            if emoji.tag != sender.tag {
                UIView.animate(withDuration: 0.25, animations: {
                    emoji.transform = CGAffineTransform(scaleX: 0.5, y: 0.5)
                })
            }
        }
        
        // Only start animating the first time the user selects an emoji
        if !nextButton.isUserInteractionEnabled {
            self.nextButton.startAnimating()
        }
    }
    
    @objc func nextPressed() {
        let vc = CreateContractViewController()
        vc.selectedEmoji = self.selectedEmoji!
        navigationController?.pushViewController(vc, animated: true)
    }
    
}
