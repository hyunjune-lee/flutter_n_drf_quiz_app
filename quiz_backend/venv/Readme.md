History

1. 가상환경 설치

`python3 -m venv venv'

2. 가상환경 실행

`source venv/bin/activate`

3. 장고 설치
'pip install django djangorestframework'

4. 프로젝트 생성
'django-admin startproject myapi . '

5. 앱 만들어주기
python manage.py startapp quiz

6. 설정 해주기
- myapi의 settings.py 에서
ALLOWED_HOSTS = ['*'] 로 모든 호스트 설정
TIME_ZONE = 'Asia/Seoul'
import os
맨 아래에 추가
STATIC_ROOT = os.path.join(BASE_DIR, 'staticfiles')
=> 정적 파일 관리에 대한 코드 작성

7. 실행 시켜보기
python manage.py makemigrations
python manage.py migrate
