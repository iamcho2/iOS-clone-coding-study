# 당근마켓 첫 화면 clone

> 언젠가 나중에 찾아볼만한 것들 정리

### 1. segmented control 으로 뷰 전환하기

segmented control + container view 조합

container view는 segment 개수대로 겹쳐서 배치해준 후 outlet 연결

segment index값에 따라 case문으로 alpha값을 0이나 1로 조정

### + segmented control로 뷰 전환할 때 상단 버튼 하나 없애기

상단 버튼 3개를 stack view로 합쳐놓고, segment index가 0일때 1일때 button의 isHidden값을 true, false 전환

```swift
@IBAction func didIndexChanged(_ sender: UISegmentedControl) {
        segmentedControl.changeUnderlinePosition()
        
        switch sender.selectedSegmentIndex {
        case 0:
            tradingContainer.alpha = 1.0		//뷰 전환
            neighborContainer.alpha = 0.0
            categoryBtn.isHidden = false		//버튼 보이기
            break
        case 1:
            tradingContainer.alpha = 0.0		//뷰 전환
            neighborContainer.alpha = 1.0
          	categoryBtn.isHidden = true			//버튼 숨기기
            break
        default:
            break
        }
    }
```

### 2. segmented control custom

여러 글이 있지만.. 애플이 API로 제공하는게 아니라 보통 커스텀 뷰를 코드로 짜고 add view 하는 식으로 만드는 듯

[apple developer docs](https://developer.apple.com/documentation/uikit/uisegmentedcontrol#1653545)에 함수 몇 개 있긴 함.. 텍스트 설정이나 배경이미지 같은... ㄱ-

그래서 지금은 그냥 흰 배경으로만 만들고 놔뒀는데 라이브러리 쓰려면 [XLPagerTabStrip](https://github.com/xmartlabs/XLPagerTabStrip) 쓰면 된다

### 2-1. 그래서 써봤다 XLPagerTabStrip!

*  `sudo gem install cocoapods`

* 프로젝트 폴더에서 `pod init`

* `vi podfile`

  ```bash
  # Uncomment the next line to define a global platform for your project
  # platform :ios, '9.0'
  
  target 'carrot-market' do
    # Comment the next line if you don't want to use dynamic frameworks
    use_frameworks!
  
    # Pods for carrot-market
          pod 'XLPagerTabStrip', '~> 9.0' //이거 추가
  end
  ```

* `pod install`



### 3. imageView나 button 등 rounding주기

> 이건 그냥 extension으로 만들어놓는 게 편할듯

```swift
self.itemImageView.layer.cornerRadius = 8
self.itemImageView.clipsToBounds = true
```



### 4. UILabel 줄 개수 무제한

![](https://i.stack.imgur.com/svM3H.png)



### 5. underlined button text

버튼 outlet 연결 후 NSAttributedString 사용

```swift
@IBOutlet weak var myButton: UIButton!

  let yourAttributes: [NSAttributedString.Key: Any] = [
      .font: UIFont.systemFont(ofSize: 14),
      .foregroundColor: UIColor.blue,
      .underlineStyle: NSUnderlineStyle.single.rawValue]
         //.double.rawValue, .thick.rawValue

  override func viewDidLoad() {
     super.viewDidLoad()

     let attributeString = NSMutableAttributedString(string: "Your button text",
                                                     attributes: yourAttributes)
     myButton.setAttributedTitle(attributeString, for: .normal)
  }
```



### 더 하고 싶은 것

segemented view 라이브러리 사용

​	https://yagom.net/forums/topic/pageviewcontroller%EB%A1%9C-ui-%EA%B5%AC%EC%84%B1%ED%95%98%EA%B8%B0/

맨 왼쪽 위 v 버튼 클릭 시 토글 팝업 띄우기

table view 스크롤하면 segmented control 상단 뷰 스크롤되어 사라지게 만들기

​	https://stackoverflow.com/questions/46692316/how-to-hide-a-uiview-while-scrolling

​	https://stackoverflow.com/questions/40415590/hide-show-top-view-when-scroll-in-swift

​	https://stackoverflow.com/questions/32537535/scroll-parent-scroll-view-when-child-scroll-view-reaches-end