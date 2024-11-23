#!/usr/bin/env bash

# 변수 설정
REPOSITORY=/home/ec2-user/cicd_test  # 배포할 경로
APP_NAME=cicd_test                   # 애플리케이션 이름

# 프로젝트 디렉토리로 이동
cd $REPOSITORY

# 최신 JAR 파일 찾기
JAR_NAME=$(ls $REPOSITORY/build/libs/ | grep 'SNAPSHOT.jar' | tail -n 1)
JAR_PATH=$REPOSITORY/build/libs/$JAR_NAME

# 실행 중인 애플리케이션 PID 확인
CURRENT_PID=$(pgrep -f $APP_NAME)

# 애플리케이션 중단
if [ -z "$CURRENT_PID" ]; then
  echo "> 실행 중인 애플리케이션이 없습니다."
else
  echo "> 실행 중인 애플리케이션 종료 중: $CURRENT_PID"
  kill -15 $CURRENT_PID
  sleep 5
fi

# 새 애플리케이션 배포
echo "> 새 애플리케이션 배포: $JAR_PATH"
nohup java -jar $JAR_PATH > /dev/null 2>&1 &
