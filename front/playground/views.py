from django.shortcuts import render
from django.http import HttpResponse
import requests

# Create your views here.
def say_hello(request):
    backend_name = requests.get("http://0.0.0.0:80")
    return render(request, 'hello.html', {'name' : backend_name.content})