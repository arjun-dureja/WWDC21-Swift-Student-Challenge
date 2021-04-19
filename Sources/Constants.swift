import Foundation
import UIKit
import PlaygroundSupport


// All multi-line strings needed for each screen
public enum StringConstants {
    static let introDescription = """
        Non-Fungible Tokens (NFTs) have been gaining a lot of attention in the past few months and you might be wondering what they are. NFTs allow people to sell digital assets such as art, music, images, videos, etc to others with the use of blockchain technology. Every NFT is completely unique and cannot be duplicated or exchanged.\n\nThe purpose of this Playground is to show you how NFTs are created (also called "minted") behind the scenes and how the overall technology works. We will be creating our own NFT using a simulated blockchain.
        """
    static let ethSmartContractsDescription = """
        Before we mint our own NFT, we must understand how it all works. Most Cryptocurrencies utilize a blockchain which is essentially a decentralized public database used as a ledger for transactions. NFTs make use of the Ethereum blockchain specifically because of the ERC-721 token standard which defines a set of behaviors needed for storing information about an NFT.\n\nThis information is stored on a Smart Contract which is a digital agreement between a buyer and a seller that is automatically executed through code. These contracts are coded in the Solidity programming language and are stored directly on the blockchain.
        """
    static let nftSelectionIntro = """
        We can now start minting our own NFT! For the purpose of this demonstration, we'll be using an emoji. Typically, an NFT should be something completely unique that you've created, it just needs to be digital.\n\nPlease select an emoji to get started:
        """
    static let createSmartContractDescription = """
        Great choice! Now we need to build a Smart Contract for the NFT. Below is the interface for the ERC-721 standard. Don't worry, it's not that complicated! We simply need to provide details about the NFT and its owner, which we will provide next.
        """
    static let contractDetailsDescription = """
        The values you need to set are the token name and the token symbol. These will be shown to anyone looking up your NFT in the blockchain. To ensure the contract is unique, we will also need to provide a token address and token ID. The address is automatically generated for you with the use of cryptographic algorithms, and the ID is a random integer. Lastly, there needs to be metadata associated with the NFT, this could be anything that describes the token, in our case it will contain an emoji. Once all the values are set, go ahead and tap the Create Contract button.\n\nNFT Values                    \u{200c}Unique Identifers                     \u{200c}Metadata
        """
    static let gasDescription = """
        Unfortunately, minting an NFT is not free. Since the Smart Contract is stored directly on the blockchain, there is a fee you need to pay for the computational power. The amount of computation needed is called "gas". The price for gas varies depending on the current traffic on the blockchain. As of April 2021, it could cost as much as $1000 to create a single Smart Contract! The price is increasing every day as NFTs become more popular. There are clever solutions to this problem however, such as using a different blockchain, or only storing a URL to the NFT rather than the whole NFT itself so that less gas is needed.\n\nThe fees are paid in Ethereum using a wallet of your choice - we will be using a simulated one. Please tap the button below to pay the fees and deploy the contract.
        """
    static let endDescription = """
        You have successfully minted your own NFT! If it was on the real blockchain, people would now be able to lookup your NFT and see that it belongs to you. You would also be able to list it for sale on various websites at a price of your choice. Thanks to the Smart Contract, the ownership of the NFT can be easily transfered to anyone else.\n\nThank you for viewing my Playground;\nI hope you learned something new!\n\n-Arjun Dureja
        """
}

// Colors used throughout the playground
extension UIColor {
    static var backgroundColor: UIColor { return UIColor(red: 31/255, green: 31/255, blue: 69/255, alpha: 1) }
    static var titleColor: UIColor { return .white }
    static var paragraphColor: UIColor { return UIColor(red: 225/255, green: 225/255, blue: 230/255, alpha: 1) }
    static var buttonColor: UIColor { return UIColor(red: 82/255, green: 79/255, blue: 233/255, alpha: 1) }
    static var textfieldBG: UIColor { return UIColor(red: 20/255, green: 20/255, blue: 49/255, alpha: 1) }
    static var placeholderColor: UIColor { return UIColor(red: 81/255, green: 81/255, blue: 102/255, alpha: 1) }
    static var metadataColor: UIColor { return UIColor(red: 113/255, green: 206/255, blue: 154/255, alpha: 1) }
    static var errorRed: UIColor { return UIColor(red: 111/255, green: 2/255, blue: 10/255, alpha: 1) }
    static var cardColor: UIColor { return UIColor(red: 77/255, green: 47/255, blue: 202/255, alpha: 1) }
    static var startGradient: UIColor { return UIColor(red: 19/255, green: 44/255, blue: 173/255, alpha: 1) }
    static var endGradient: UIColor { return UIColor(red: 137/255, green: 97/255, blue: 250/255, alpha: 1) }
}
