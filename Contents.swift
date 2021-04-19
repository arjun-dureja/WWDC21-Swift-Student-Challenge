/*
 
 Welcome to my submission for the WWDC 2021 Swift Student Challenge.
 
 My Playground is about Non-Fungible Tokens - a popular new way to sell digital assets. In my Playground, you will learn all about them and how they are created on the Ethereum Blockchain. You will be going through a simulation and creating your very own NFT.
 
 I conducted a lot of research when putting this Playground together, a list of my sources can be seen below. The erc721.png image was created using https://carbon.now.sh/
 
 Thank you for viewing my submission!
 
 Sources:
 https://ethereum.org/en/developers/docs/standards/tokens/erc-721/
 https://medium.com/crypto-currently/the-anatomy-of-erc721-e9db77abfc24
 https://www.investopedia.com/terms/s/smart-contracts.asp
 https://hackernoon.com/everything-you-need-to-know-about-erc721-tokens-b4b232h4
 https://medium.com/superrare/how-to-create-your-own-nft-marketplace-in-minutes-66000eb339d7
 https://ethereum.org/en/developers/docs/gas/
 https://ethgasstation.info/calculatorTxV.php
 
 */

import UIKit
import PlaygroundSupport

//Create view with navigation controller
let viewRect = CGRect(x: 0, y: 0, width: 770, height: 540)
let vc = HomeViewController()
let nc = UINavigationController(rootViewController: vc)
nc.navigationBar.isHidden = true
nc.view.frame = viewRect
PlaygroundPage.current.liveView = nc.view
