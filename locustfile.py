from locust import User, HttpUser, TaskSet, task
from locust.contrib.fasthttp import FastHttpUser

class SpamBot(FastHttpUser):

    @task
    def my_task(self):
        self.client.get('http://yourwebsitehere.com')

