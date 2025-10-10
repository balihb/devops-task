# Formlabs DevOps home assignment

[![Quality Gate Status](https://sonarcloud.io/api/project_badges/measure?project=balihb_devops-task&metric=alert_status)](https://sonarcloud.io/summary/new_code?id=balihb_devops-task)
[![Bugs](https://sonarcloud.io/api/project_badges/measure?project=balihb_devops-task&metric=bugs)](https://sonarcloud.io/summary/new_code?id=balihb_devops-task)
[![Code Smells](https://sonarcloud.io/api/project_badges/measure?project=balihb_devops-task&metric=code_smells)](https://sonarcloud.io/summary/new_code?id=balihb_devops-task)
[![Coverage](https://sonarcloud.io/api/project_badges/measure?project=balihb_devops-task&metric=coverage)](https://sonarcloud.io/summary/new_code?id=balihb_devops-task)
[![Duplicated Lines (%)](https://sonarcloud.io/api/project_badges/measure?project=balihb_devops-task&metric=duplicated_lines_density)](https://sonarcloud.io/summary/new_code?id=balihb_devops-task)
[![Reliability Rating](https://sonarcloud.io/api/project_badges/measure?project=balihb_devops-task&metric=reliability_rating)](https://sonarcloud.io/summary/new_code?id=balihb_devops-task)
[![Security Rating](https://sonarcloud.io/api/project_badges/measure?project=balihb_devops-task&metric=security_rating)](https://sonarcloud.io/summary/new_code?id=balihb_devops-task)
[![Technical Debt](https://sonarcloud.io/api/project_badges/measure?project=balihb_devops-task&metric=sqale_index)](https://sonarcloud.io/summary/new_code?id=balihb_devops-task)
[![Maintainability Rating](https://sonarcloud.io/api/project_badges/measure?project=balihb_devops-task&metric=sqale_rating)](https://sonarcloud.io/summary/new_code?id=balihb_devops-task)
[![Vulnerabilities](https://sonarcloud.io/api/project_badges/measure?project=balihb_devops-task&metric=vulnerabilities)](https://sonarcloud.io/summary/new_code?id=balihb_devops-task)

This repository contains a home assignment code for DevOps applicants for Formlabs.

See all open jobs at https://careers.formlabs.com/

## Task

0. Fork this repo.
1. Create a deployable docker image for the application.
    - Feel free to switch up technologies. For example you can use `buildah` instead of Docker.
2. Create a Kubernetes deployment and service for the application.
    - Just aim for the simplest setup, no ingress deployment is needed. Feel free to use Helm.
    - You can use [Minikube](https://minikube.sigs.k8s.io/docs/start/) or [k3s](https://k3s.io/) or any other Kubernetes distribution you are familiar with.
3. Create automation to build, test and deploy the application when a change happens in git.
    - Feel free to switch up technologies. For example you can use an Ansible playbook or a Jenkins pipeline.
4. Send us the fork where you did your work.

### Notes

- Explain as much as possible in the commit message(s) and/or comments if needed. See more on commit messages [here](https://chris.beams.io/posts/git-commit/).
- It would be great if you'd also write about why you choose a certain technology if there are alternatives to consider.

## License

This repository contains upstream code licensed under Apache-2.0 (see LICENSE) and newly added original work licensed under PUWL-2.0draft02 (see LICENSE.puwl).
