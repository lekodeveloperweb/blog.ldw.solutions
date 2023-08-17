---
title: "How to Build and Run a Docker Container With Jenkins Running Inside the Docker Container"
date: 2023-08-20T19:00:00+03:00
lastmod: 2023-08-20T19:00:00+03:00
author: Alex Leko
tags: ["devOps", "docker"]
categories: ["Tutorial"]
toc:
  enable: false
---

There was the exact word that I used in a Google search recently, and it was challenging to find the correct answer. In the end, I didn't find it. So, I'm writing my solution to help others with that familiar doubt.
First, we must install Jenkins Docker; you can find how in the official documentation [here](https://www.jenkins.io/doc/book/installing/docker/).

But, if you only follow the documentation, you can run Jenkins to build standard pipelines and almost all kinds of projects. However, if you try to run a "Dockerized" project, you'll receive a permission access error.

To resolve this problem, I had to create a custom Jenkins image and install a Docker client together in this image, as you can see in the Dockerfile below.

```bash
FROM jenkins/jenkins:lts

# Switch the user to root to install the docker CLI
USER root
# Install docker CLI inside the container
RUN curl -sSL https://get.docker.com/ | sh
# Add Jenkins user to docker group (run without sudo)
RUN usermod -aG docker jenkins
# swittch back user to Jenkins
USER jenkins
```

Now, just run:

```bash
docker build -t my-custom-jenkins .
docker run -it -t -p 8080:8080 \
       --volume jenkins-data:/var/jenkins_home \
       --volume /var/run/docker.sock:/var/run/docker.sock my-custom-jenkins
```

After that, you can build and run a Docker container with Jenkins running inside the Docker container.
This simple blog post helps you as it helps me. Thank you. See you.
