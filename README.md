# SSU 숭실대

- https://github.com/jungkeechu/ProcessingLevel1
- https://processing.org/

## Processing JAVA

### How To Install?

[프로세스 공홈](https://prorecssing.org)에서 processing 다운로드.

brew 같은거 없고 java랑 다르니 받아야함.

#### Sound 라이브러리 설치

- Processing 프로그램 실행
- 상단 탭바 - 스케치 - 내부라이브러리 - Manage Libraries
- sound 검색
- sound ( author : the processing foundation ) 클릭 후 install

![image](https://github.com/ddalpange/ssu-processing/assets/13113921/e3bae62b-fa14-4f9b-8270-c0dc457c404a)

#### (Optional) VSCode Environment Setup

- https://processing.org/ 여기서 processing-java를 다운받으세요.
- 그러면 cli에 processing-java가 없다고 떠요
- Processing Application을 킨 후 Instal `Processing Java`를 키세요
- 저장되어 있는 기본 경로에서 vscode ./를 하세요
- 폴더명과 스케치파일명을 맞춰놓으세요. 안맞추면 컴파일 안되는데 왜 안되는지 모르겠어요.
- Command(Window Ctrl) + Shift + B를 누르면 현재 열려있는 파일을 컴파일 할 수 있어요 (.vscode/tasks.json) 참고.
- 적절히 rebuild 숏컷을 추가로 등록해서 사용하세요.

## P5.js (typescript)

### How to Install?

#### Mac
```
brew install nvm
nvm install 20  # install node 20
npm i -g pnpm # install pnpm
pnpm i # install node_modules
pnpm dev # start dev server
```

#### Windows
https://nodejs.org/en/download/prebuilt-installer

https://pnpm.io/ko/installation

PowerShell
```
nvm install 20  # install node 20
npm i -g pnpm # install pnpm
pnpm i # install node_modules
pnpm dev # start dev server
```

### How to Convert?

### Migration Plan

씬과 Drawable(상속 포함) 오브젝트들은 맨 나중에 스크립트를 짜서 정규식으로 치환해볼 예정
그 외의 인터페이스, 매니저 같은 것들을 src/interfaces 안에 전부 구현해야함.

[Java to Ts 컨버터](https://www.codeconvert.ai/java-to-typescript-converter) 이거 써보니 잘해주는데 하루에 10개까지만 사용 가능 ...
