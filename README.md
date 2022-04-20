# FPMI Music Band

***

## Name
FPMI Flutter Music Band

---

## Description
Streaming service for music made with Flutter by FAMCS students in Innowise Group.

***

## GitFlow
Configure your local config of the git-repository as shown in 
the file [GitFlow](https://innowise-group.atlassian.net/wiki/spaces/MD/pages/2191884296/GitFlow).

#### Branches
This repository holds two branches with infinite lifetime:
1. `main`
2. `develop`

And two other branches can be created:
* `feature`
* `bugfix`

`feature` is associated with implementing new logic for application, as the `bugfix` with repairing the current one.

#### Main branch
`main` keeps released application version. New application version is created from `develop` to
`main` via Merge Request. Merge Request must have title with new version name and description will 
all listed changed in this update:
```
Title:
    VersionName - 1.0.22
Description:
    * Fixed crash with uploading avatars.
    * Fixed bug with navigating from settings.
    * Implemented push-notification module.
    * and more...
```

Then tag should be added `v_global.feature.fixes`.

#### Develop branch
Branches `feature/name` is created from develop. Sub-branches `feature/name-deatails` can be created 
if the task is large and we want to split it into a smaller ones.

#### Testing
If bugs were found during testing, then new `bugfix/name-details` branch is created from develop 
and merged when bug is fixed.

#### Merge Request
Every Pull Request must have **title** and **description**. Title shortly describe implemented logic and 
description provides some additional details (problem, decision, edge case, and etc.):
```
Title: 
    Add forget password link to registration screen
Descrition: 
    Designer decided to add it as underline link instead of additional screen.

Title:
    Add login API request
Description:
    POST request with url = https://test.service/api/v1/login.
```

#### Commit name
`[Verb infinitive][description][.]` 

---

## Supported platforms
* Android
* IOS
* Web

---

## Project status
Active