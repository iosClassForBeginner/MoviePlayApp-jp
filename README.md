# 第24回: １時間でiPhoneアプリを作ろう
## 動画再生アプリ

  <div style="text-align:center"><img src ="https://github.com/iosClassForBeginner/MoviePlayApp-jp/blob/master/gifs%2Bimgs/demo.gif" width="50%" height="50%"/></div>

  当アカウントへ訪れていただき、誠にありがとうございます。第24回アプリ教室では、動画再生アプリを作ります。自分のペースで勉強したい、勉強前に予習したい、内容を復習したい場合、ご利用ください。

## アプリ教室に興味ある方、歓迎します。
  Meetup
  http://www.meetup.com/ios-dev-in-namba/

## 別途アプリ教室(有料)も開いております
  http://ios-class-for-beginners.com/jp

## 問い合わせ
  株式会社ジーライブ
  http://geelive-inc.com

## 開発環境
  Xcode 10.1 / Swift 4.2

  ・<a href="https://github.com/learn-co-students/reading-ios-intro-to-xcode-qa-public-001">What is Xcode?</a>

## アプリ作成手順

## 0, プロジェクト作成

> 0-1. Xcodeを起動。
>
> 0-2. "Create a new Xcode project"を選択。
>
> 0-3. "Single View Application"を選択して"Next"をクリック。
>
> 0-4. "Product name"を適当に入力して"Next"をクリック。
>
> 0-5. プロジェクトの場所を指定して"Create"をクリック。

## 1, ボタン画像を用意する

1-1. ドラッグ&ドロップで "Assets.xcassets" に画像ファイルを入れる

画像は [ここ](https://github.com/iosClassForBeginner/MoviePlayApp-jp/blob/master/icons.zip?raw=true) から取得してください。

> <details><summary>詳細画像をみる</summary><div style="text-align:center"><img src ="https://github.com/iosClassForBeginner/MoviePlayApp-jp/blob/master/gifs%2Bimgs/0.gif" /></div></details>

## 2, アプリをデザインする。

#### 🗂 Main.storyboard

2-1. UIView(動画再生用) を storyboad に追加

> <details><summary>詳細画像をみる</summary><div style="text-align:center"><img src ="https://github.com/iosClassForBeginner/MoviePlayApp-jp/blob/master/gifs%2Bimgs/1.gif" /></div></details>

2-2. UIButton を storyboad に追加（再生、停止、リトライ）

> <details><summary>詳細画像をみる</summary><div style="text-align:center"><img src ="https://github.com/iosClassForBeginner/MoviePlayApp-jp/blob/master/gifs%2Bimgs/2.gif" /></div></details>
> <details><summary>詳細画像をみる</summary><div style="text-align:center"><img src ="https://github.com/iosClassForBeginner/MoviePlayApp-jp/blob/master/gifs%2Bimgs/3.gif" /></div></details>

storyboardのイメージ
<div style="text-align:center"><img src ="https://github.com/iosClassForBeginner/MoviePlayApp-jp/blob/master/gifs%2Bimgs/4.png" width="30%" height="30%"/></div>

## 3, UI部品 を "ViewController.swift" に紐付ける

#### 🗂 Main.storyboard -> ViewController.swift

3-1. UIView を "ViewController.swift" に紐付ける（connection を Outlet にする）

★ controlを押しながらドラッグ

> <details><summary>詳細画像をみる</summary><div style="text-align:center"><img src ="https://github.com/iosClassForBeginner/MoviePlayApp-jp/blob/master/gifs%2Bimgs/5.gif" /></div></details>

3-2. UIButton を "ViewController.swift" に紐付ける（connection を actionにする）

★ controlを押しながらドラッグ

> <details><summary>詳細画像をみる</summary><div style="text-align:center"><img src ="https://github.com/iosClassForBeginner/MoviePlayApp-jp/blob/master/gifs%2Bimgs/7.gif" /></div></details>

## 4, 下記のコードを"ViewController.swift"に追加

#### 🗂 ViewController.swift

```Swift
import UIKit
import AVFoundation

class ViewController: UIViewController {

    @IBOutlet weak var playerView: UIView!
    var player: AVPlayer!
    var playerLayer: AVPlayerLayer!

    override func viewDidLoad() {
        super.viewDidLoad()
        initPlayer()
    }

    func initPlayer() {
        let videoUrl = URL(string: "https://clips.vorwaerts-gmbh.de/big_buck_bunny.mp4")
        player = AVPlayer(url: videoUrl!)
        playerLayer = AVPlayerLayer(player: player)
        playerView.layer.addSublayer(playerLayer)
    }

    override func viewDidLayoutSubviews() {
        playerLayer.frame = playerView.bounds
    }

    @IBAction func play(_ sender: Any) {
        player.play()
    }

    @IBAction func stop(_ sender: Any) {
        player.pause()
    }

    @IBAction func retry(_ sender: Any) {
        player.seek(to: CMTime.zero)
    }
}

```
