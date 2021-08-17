# CI/CD pipeline for containerized application
## Introduction
We’ve deliberately left the specific implementation details out we want to give
your space to be creative with your approach to the problem and impress us
with your skills and experience.
We prefer that you share the results of the assignment in a git
repository.
You can either send it as an email attachment or create a
private repository on github.com, gitlab.org, or bitbucket.org, please do
not make this assignment publicly available in any form.

Please ensure that your README includes the "How to run" section as well as all the versions of components used.

*When you are running out of time, we prefer to have a working solution that
doesn't include all the features over a tool where you tried to implement
everything but doesn't work at all.*
 
## Rules:
1. Complete the challenge on your own.
1. Referencing online resources is expected. You should comment with a reference when you do.
1. Using Open Source components is expected, but not required.
1. You are encouraged to ask us clarifying questions. (Your recruiter will forward the questions, so expect delays in response.) Note any deviations from the specification.
1. Be prepared to talk about the challenge in later interview rounds.
 
  
## Instructions:
1. Install minikube or [the kind cluster](https://kind.sigs.k8s.io/docs/user/quick-start/)
1. Write a Docker file and k8s manifest(s) for our `test-app`.
1. Configure any free SaaS CI for it, that pushes the image to the docker registry. We are not asking for self-hosted CI/CD.
1. Install our `test-app` via CD (CD as in Continuous Deployment :) ) in your cluster
1. Write a `notifications-app` that takes Gitlab webhook and sends notifications (via email/telegram/discord/slack, logging to stdout is also fine)       
  * on a new version of `test-app` being successfully deployed; 
  * on `test-app` pipeline failures;
  * on MRs being posted on Gitlab
1. Deploy `notifications-app` in your cluster as well.

## Suggestions:
1. Consider using Gitlab with its own CI/CD and registry.

## Bonus 
1. our `test-app` has 3 branches. Their names are supposed to help you identify the requested feature for your notifications app, so that you can easily test requested functionality. If you can come up with any other common feature for such a pipeline feel free to implement it as well
 
## Grading

1. We will focus on your CI/CD pipeline in the first place. Make it easy to understand, extend, maybe even make a template out of it. 
1. We will look at your notification app. We will try to see if notification messages are clear, distinguishable from each other etc. The code quality doesn't have to be great, but we value clean code.
1. We will look at your Dockerfiles and k8s manifests for both apps
