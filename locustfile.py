from locust import HttpLocust, TaskSet

def login(l):
    l.client.get("/?s=search+query+here")

def index(l):
    l.client.get("/some/other/page")

def profile(l):
    l.client.get("/")

class UserBehavior(TaskSet):
    tasks = {index: 2, profile: 1}

    def on_start(self):
        login(self)

class WebsiteUser(HttpLocust):
    task_set = UserBehavior
    min_wait = 1
    max_wait = 2
