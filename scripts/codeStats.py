# ../Main 경로의 모든 .pde 파일을 읽어서 코드 라인 수를 세는 스크립트
# 결과는 콘솔에 출력됨

import os

def countLines(file):
    with open(file, 'r', encoding='utf-8') as f:
        lines = f.readlines()
        return len(lines)
    
def main():
    script_dir = os.path.dirname(os.path.abspath(__file__))  # 스크립트의 절대 경로를 얻습니다.
    path = os.path.join(script_dir, './../Main')  # 스크립트의 경로를 기준으로 상대 경로를 설정합니다.
    files = os.listdir(path)
    files = [file for file in files if file[-4:] == '.pde']
    
    totalLines = 0
    for file in files:
        totalLines += countLines(os.path.join(path, file))  # 파일의 절대 경로를 얻습니다.
    
    print('Total files:', len(files))
    print('Total lines:', totalLines)

if __name__ == '__main__':
    main()