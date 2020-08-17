History

1. 가상환경 설치

python3 -m venv venv

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

INSTALLED_APPS에
    'quiz',
    'rest_framework',
추가
7. migrate
python manage.py makemigrations
python manage.py migrate

8. 실행
python manage.py runserver

--------
<실행법>
1. 가상환경 키기
`source venv/bin/activate`
2. python manage.py runserver
(어드민 설정했을 때)
python manage.py makemigrations
python manage.py migrate

----------------
- models.py에 Quiz 모델 만들고
- serializers.py 만들기
  serializers 를 이용해서 내 데이터를 Json 으로 바꾸어주는것(아마 api 로 통신을 위해) (s)
- views.py 만들기
  - DRF(dart Rest Framework)가 어떤 식으로 작동하는지 (API 만들기)
- urls.py 설정 - views에 만든 걸 실행시키기 위해 url을 설정하기
  - (quiz폴더에 있는 urls(app앱관련)와 myapi에 있는 urls(전체 프로젝트 관련)는 다른것)
- admin.py 설정
- python manage.py makemigrations 와 python manage.py migrate 실행후
- 어드민 계정 설정 python manage.py createsuperuser
- http://localhost:8000/admin/ 에 아까 만든 계정으로 로그인 가능
- 여기서 add quiz를 통해 퀴즈를 넣어주고
- http://localhost:8000/quiz/3/  으로 들어가면 랜덤 3문제를 내준다.!!


--------------------------------
# 배포하기
1. 패키지 설치()
pip install django-cors-headers gunicorn psycopg2-binary whitenoise dj-database-url
django-cors-headers : cors 에러 방지
gunicorn : 배포를 위한 도구
psycopg2-binary, dj-database-url : Heroku에서 사용하는 DB인 postgresql을 위한 것
whitenoise : 정적 파일의 사용을 돕는 미들웨어

2. requirements.txt 파일 만들기 (패키지 의존성 관련 테스트 파일)
pip freeze > requirements.txt

3. myapi/settings.py 수정

4. Heroku에 필요한 파일들 가져오기

//heroku 할때 깃은 backend 부분에서만 한정되어서 해야함
1. heroku 설치 및 login
curl https://cli-assets.heroku.com/install.sh | sh
heroku login

2. heroku 프로젝트 만들기
heroku create flutter-n-drf-quiz-app

파이썬 에러 해결 url
- [Python 3.7] CentOS 7 파이썬 3.8.1 소스 설치, 기본 설정 변경
https://nirsa.tistory.com/112
- Ubuntu에서 Python 버전을 변경하는 방법
https://codechacha.com/ko/change-python-version/

3.7.8
git push heroku master

- 마이그레이션
heroku run python manage.py migrate

- 배포하면서 슈퍼계정이 리셋되었으므로 다시 만들어줘야함
heroku run python manage.py createsuperuser

- 배포한 페이지에 admin 붙여서 확인하기
