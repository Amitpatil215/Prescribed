## Getting Started

**Step 1:**

Fork this repo

**Step 2:**

Clone forked repo :

``` git
git clone "Forked Repo URL"

```

**Step 3:**

Set main repo as upstream:

``` git
git remote add upstream https://github.com/Amitpatil215/Doctor-Duniya.git
```

**Step 4:**

Fetch changes from the upstream repo:

[Every time you start working make sure ur up to date with upstream repo. Checkout to master branch and run ]

```git
git pull upstream
```

**Step 5:**

Go to project root and execute the following command in console to get the required dependencies:  

```flutter
flutter pub get
```

---------

## Contribute:

**Step 1:**

Make sure you created feature branch from master:

Name your branch as issueNo_detail

```git
git branch branch_name

git checkout branch_name
```


**Step 2:**

Stage and Commit your changes with helpful message:  

```git
git add .
git commit -m "your message"
```

**Step 3:**

Push changes to your forked repo: 

```git
git push origin branch_name
```

**Step 4:**

Create a pull request from forked repo **branch_name -> master** branch of upstream repo

*Note:*

* Write appropriate comments and commit messages
* Wait for all CI checks go green.
* Modify code only related to the issue assigned.
* Feel free to comment any one of the issue stating "I would like to be assigned to this issue"
* Ask for help if you stuck at anything we happy to help you out!