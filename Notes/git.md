Git
===
"Git is a mature, open-source project [https://github.com/git/git.git] that is actively maintained. It was originally developed in 2005 by Linus Torvalds, the famous creator of the Linux operating system kernel. A vast number of software projects rely on Git for version control, including commercial projects as well as open source projects of all sizes.

Git is a distributed version control system that serves as a content tracker, designed to track changes in computer files. It's widely used for coordinating collaborative work among programmers/developers during software development. Version control is a way to save changes over time without overwriting previous versions. Being distributed means that every developer working with a Git repository has a copy of that entire repository meaning every commit, every branch, and every file. A local clone of the project is a complete version control project/repository. These fully functional local repositories make it easy to work offline or remotely. Developers commit their work locally and then sync their copy of the repository with the copy on the server. Git allows and encourages you to have multiple local branches that can be entirely independent of each other. The creation, merging, and deletion of those lines of development takes seconds. Meaning you can do things like, frictionless context switching. Create a branch to try out an idea, commit a few times, and switch back to where you started with lightning-fast performance.."


Git status -v
Git show commit-id

Git stash
Git stash apply
Git stash pop

Git merge
Git rebase
squash
Git rebase -I


Git log
Git log --oneline
Git lg  [date and author name]
Git log --graph
Git log --oneline --decorate --all --graph shows a condensed, decorated graph of the commit history for all branches.
Git log --stat shows statistics for the number of files changed and lines added/deleted for each commit.
Git log -p [with file changes]
Git log -5
Git log --author='author name'
Git log --grep='string'
Git log --follow <file>
Git log -S <string> shows the commit history for commits that added or removed a specific string.
Git log --author=<author> shows the commit history for a specific author.
Git log --since=<date> shows the commit history since a specific date.
Git log --until=<date> shows the commit history until a specific date
Git log branch1..branch2 compares the logs between two branches and shows the commits that are unique to branch2.

Git shortlog [sort with author name]
Git shortlog -n [commit number]
Git shortlog -s [summary]
Git shortlog -e [emails]

Git log --pretty=format: "commit %h %s" shows the commit history in a custom format.

Git log --merges --oneline  [shows which branch is merged into which branch]
Git log --no-merges --oneline



Git Reset 
========
Mixed, soft, hard

Git reset HEAD~5

Dangerous, so better to work in local

Git Revert
=========
Mixed, soft, hard

To revert any changes to already pushed to remote, this can be help full.


Git commit --amend
Used to modify commit message, author name email of latest commit, but not to any older commits.


Git cherry-pick commit-d
Git cherry-pick --no-commit commit-id

Git reflog
Git reflog show branchName
Reflog stores events of 90 days




Git Basics
	1. Git Workflow:
	• Understanding the three states: working directory, local repository, and remote repository.
	• Basic Git commands: git init, git add, git commit, git log, git status, git branch, git merge, git push, and git pull.
	
	2. Git Branching:
	• Creating and managing branches.
	• Understanding the difference between local and remote branches.
	Basic branching strategies: feature branches, release branches, and hotfix branches.
	
	3. Git Aliases:
	• Creating shortcuts for frequently used Git commands.
	• Improving workflow efficiency with custom aliases.
	
Intermediate
	1. Commit Messages:
	• Writing effective commit messages.
	• Best practices for commit message formatting and content
	
	2. Branching Strategies:
	• Understanding different branching strategies: feature branches, release branches, and hotfix branches.
	• Choosing the right strategy for your project
	
	3. Merge Conflicts:
	• Understanding how merge conflicts occur.
	• Resolving merge conflicts effectively
	
	4. Rebasing:
	• Understanding the difference between git merge and git rebase.
	• Using git rebase to integrate commits from different branches

Advanced
	1. Git Hooks:
	• Understanding how to use hooks to automate tasks and enforce best practices.
	• Customizing hooks for specific workflows.
	
	2. Git Log and Filtering:
	• Advanced filtering options for git log.
	• Extracting specific information from commit history.
	
	3. Resetting, Checking Out, and Reverting:
	• Understanding the differences between git reset, git checkout, and git revert.
	• Using these commands to manage changes in the repository.
	
	4. Refs and Reflog:
	• Understanding Git's internal references (refs) and how they are used.
	• Using the reflog to track changes in the repository.
	
	5. Tagging:
	• Creating and managing tags in Git.
	• Using tags to mark significant points in the repository's history.
	
	6. Remote Repositories:
	• Managing remote repositories and tracking changes.
	• Using git remote and git fetch commands.
	
	7. Advanced Git Log:
	• Understanding advanced formatting and filtering options for git log.
	• Extracting specific information from commit history.
	
	8. Git Config:
	• Understanding the .git/config file and its role in Git configuration.
	• Using git config commands to manage configuration settings


GitHub Basics
	1. Repositories:
	• Creating and managing repositories.
	• Understanding the difference between public and private repositories.
	
	2. Branches:
	• Creating and managing branches.
	• Understanding the default branch (usually main or master).
	
	3. Commits:
	• Making commits to save changes.
	• Writing effective commit messages.
	
	4. Pull Requests:
	• Creating and managing pull requests.
	• Reviewing and merging pull requests.
	
GitHub Intermediate
	1. Forking:
	• Creating a fork of a repository.
	• Keeping your fork up-to-date with the original repository.
	
	2. GitHub Actions:
	• Understanding GitHub Actions for CI/CD.
	• Creating and customizing GitHub Actions workflows.
	
	3. GitHub Pages:
	• Hosting static websites using GitHub Pages.
	• Configuring custom domains and HTTPS.
	
	4. GitHub Issues:
	• Creating and managing issues.
	• Using issue templates and labels.
	
GitHub Advanced
	1. GitHub Apps and OAuth Apps:
	• Creating and managing GitHub Apps and OAuth Apps.
	• Integrating with GitHub's API.
	
	2. GitHub Packages:
	• Publishing and managing packages.
	• Configuring package registries.
	
	3. GitHub Codespaces:
	• Using cloud-based development environments.
	• Customizing and managing Codespaces.
	
	4. GitHub Discussions:
	• Creating and participating in discussions.
	• Using discussions for Q&A and collaboration.
	
	5. GitHub Marketplace:
	• Exploring and using GitHub Marketplace apps.
	• Publishing your own apps to the Marketplace


