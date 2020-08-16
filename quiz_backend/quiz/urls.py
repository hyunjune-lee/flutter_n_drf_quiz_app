from django.urls import path, include
from .views import helloAPI, randomQuiz

#여기의 url은 app에 관한 url
#myapi 폴더에 있는 urls는 전체 프로젝트에 대한 url을 관리

urlpatterns = [
    path("hello/", helloAPI),
    path("<int:id>/", randomQuiz),
]
