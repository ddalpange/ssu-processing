## ssu-processing
숭실대 미디어경영학과 24학번 미디어앤테크 팀 프로젝트 - 2팀

2가지 실행 방법을 제공합니다.
* Processing - Java
  * 완성
* p5.js - TypeScript
  * 아직 미완성

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
npm install -g pnpm # install pnpm
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
(아직 준비중, Mac 환경 추천)
