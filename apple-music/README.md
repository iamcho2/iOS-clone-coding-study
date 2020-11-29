# 애플뮤직 Browse 탭 clone

> 줌회의 참석 못해서 먄합니다.....s2

### collectionview의 노예... 전체샷...

![Screen-Recording-2020-11-30-at-1 (1)](https://user-images.githubusercontent.com/28949235/100545799-1e099500-32a1-11eb-9a8e-a6ca1289bec8.gif)

### 네비게이션 바

![Screen-Recording-2020-11-29-at-1 (2)](https://user-images.githubusercontent.com/28949235/100544750-31196680-329b-11eb-8a88-33a9145a41f1.gif)

### Paging

> 각 cell단위로 paging을 해서 양쪽에 이전, 다음 셀이 살짝씩 보이게끔 paging 구현

![Screen-Recording-2020-11-29-at-1 (3)](https://user-images.githubusercontent.com/28949235/100544777-6e7df400-329b-11eb-8881-6788f968417f.gif)  
![Screen-Recording-2020-11-29-at-1 (4)](https://user-images.githubusercontent.com/28949235/100544939-84d87f80-329c-11eb-873e-11e6383e02c6.gif)

모든셀이 다 이런 식이라 굳이 녹화 안할게요... ( ◠‿◠ ) 



### TableViewCell 안에 CollectionView 안에 TableView

![Screen-Recording-2020-11-29-at-1 (5)](https://user-images.githubusercontent.com/28949235/100545056-3d9ebe80-329d-11eb-880c-a5ba6a31d5c8.gif)

### xib로 셀 관리

너무 셀이 많고 복잡하고 ... 이럴 땐 xib로 관리하면 깔끔하니까 xib로 모든 셀을 관리했습니다  

![image](https://user-images.githubusercontent.com/28949235/100545195-0ed51800-329e-11eb-97cf-10c41bb92cef.png)![image](https://user-images.githubusercontent.com/28949235/100545182-041a8300-329e-11eb-9d79-2ec972b069ee.png)

TableViewCell <																             > CollectionViewCell

### 셀 재사용

똑같이 생긴 Cell들은 하나만 만들어두고 재사용!  
위에서 만들어 둔 CollectionViewCell을

`You Gotta Hear` , `Here's to the Weekend` , `New Music`, `Daily Top 100`, `We're Loving`, `Take It Easy`, `Coming Soon` 셀에서 사용했고, 다른 중복되는 셀들도 재사용

모델들도 어느정도 비슷하면 재사용했으나, 값의 의미가 변수명과 너무 다른 경우에는 그에 따른 새 모델을 작성해서 사용

![Screen-Recording-2020-11-30-at-1](https://user-images.githubusercontent.com/28949235/100545546-b141cb00-329f-11eb-8974-86274605e7ab.gif)

> 데이터 넣기 넘 귀찮아서....



### TableView 안에 TableView

![image](https://user-images.githubusercontent.com/28949235/100545585-dfbfa600-329f-11eb-8401-c2fbf994540e.png)

### 고정 재생 바

![image](https://user-images.githubusercontent.com/28949235/100545604-f82fc080-329f-11eb-891f-a5e89db63390.png)

opacity를 주긴 줬는데 원래 앱 처럼 뒤에가 blur처리되게는 못 했음다...



### 안 한 것

- [ ] See All 누르면 화면 전환
- [ ] 재생 bar 뒷배경 blur처리