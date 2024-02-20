# Bit Connect
![GitHub last commit](https://img.shields.io/github/last-commit/rina-reimer/bit-connect?style=flat-square)
![GitHub repo size](https://img.shields.io/github/repo-size/rina-reimer/bit-connect?style=flat-square)
![GitHub Actions Workflow Status](https://img.shields.io/github/actions/workflow/status/rina-reimer/bit-connect/publish-javadoc.yml?style=flat-square&logo=github&label=deploy%20javadoc)
![GitHub deployments](https://img.shields.io/github/deployments/rina-reimer/bit-connect/github-pages?style=flat-square&logo=githubactions&logoColor=white&label=page%20deployment)

Extended implementation of my WINFO Hackathon 2024 project. Shoutout to the [Women in Informatics Club](http://winfo.ischool.uw.edu/) at UW for this great opportunity to work with other students and connect with companies' mentors to aid our development. \
You can access documentation on the implementation at [this website](https://rina-reimer.github.io/bit-connect).

## Table of Contents
> [Problem Statement](https://github.com/rina-reimer/bit-connect/#problem-statement) \
> [Program Description](https://github.com/rina-reimer/bit-connect/#what-the-program-does) \
> [Implementation Strategy](https://github.com/rina-reimer/bit-connect/#implementation-strategy) \
> [Programming Notes](https://github.com/rina-reimer/bit-connect/#programming-notes) 

## Problem Statement
UW is a big place and it’s hard to find friends amid the crowds. With Bit Connect, students can make real-time in-person connections with people with similar majors and interests. When you turn on the search mode, you are automatically connected to other Bit Connect users around you who share similar interests/studies. If you and another person meet each other’s search filters, you can match and contact each other to meet up!

## What the Program Does
Bit Connect is intended to be an app used by students at the University of Washington-Seattle to meet like-minded students on campus. Each student who is willing to meet with other people can toggle their search mode on, connecting them to the network of other students nearby. All users have a profile that contains information about them such as their major and interests as well as a search filter to find other users. The filters from both users must match the other's profile to denote them as a match. A list of all matches for each user is created, and once both users match with each other, they can find the other nearby. The intent is that students meet each other while walking around campus or studying in a library in real-time.

## Implementation Strategy
I developed this program architecture design during the hackathon and programmed it in the months following.


![BitConnect drawio](https://github.com/rina-reimer/bit-connect/assets/102627869/842a6ca4-b4b8-4686-a0a5-e9d0daf5d7f1)

## Programming Notes
bounds for latitude: (47°39'04.4"N, 47°39'40.1"N )
bounds for longitude: (122°18'43.5"W, 122°18'03.6"W)


to be included:
- guarantees/invariants
- think about the audience
- multiple versions
- tech spec
