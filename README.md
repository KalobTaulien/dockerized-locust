## Dockerized Locust

### Installation & Running the app
Requires Docker and Docker Compose. 

Run `make up` to build your container and bring it up. 

Afterwards, run `make enter` to enter the container. 

Inside your container, run `locust --host=http://example.com` (swap out example.com for your domain)

Head over to `http://localhost:8089/`, enter the number of users to simulate and how many users to spawn per second.

### Docs
Found at locust.io's docs site. https://docs.locust.io/en/stable/quickstart.html


