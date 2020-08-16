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
1.
pip install django-cors-headers gunicorn psycopg2-binary whitenoise dj-database-url
