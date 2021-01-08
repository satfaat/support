https://your-account.github.io
https://github.com/satfaat/web.git
https://learngitbranching.js.org/?locale=ru_RU
https://gitexplorer.com/
dev-git
dev-hm

show commands
snapshot снимок
init = initialize

git commit --help
'git help -a' and 'git help -g' list available subcommands and some
concept guides. See 'git help <command>' or 'git help <concept>'
to read about a specific subcommand or concept.

To view all of your settings and where they are coming from:
	git config --list
	git config --list --show-origin
	git config --global user.name "Your Name" 
	git config --global user.email you@example.com 
	git config --global --edit
	
	1) git clone https://github.com/satfaat/backend_test_homework.git
	2) git status
	3) git add . || git add --all
		a. git rm --cached <file> # to unstaged
	4) git commit -m "My first commit"
		a. git commit --amend -m "First commit: new files added"
	5) git push
	
	git diff
	git commit -m "Complete first line of dialogue"
	git log
	git show HEAD
	git checkout HEAD file_name
	git reset HEAD file_name
	
	git commit
	git checkout newImage; git commit
	git checkout -b [your_branch_name]
		or
	git branch bugFix
	git checkout bugFix
	
## Branches and merging
	git merge bugFix
	git checkout bugFix; git merge master
	
	git rebase master
	
	git checkout master^
	git checkout HEAD~4 # let's specify a number of commits back.
	
	git branch -f master HEAD~3
	
	git reset commit_SHA
	
	
## DELETE 
	git branch -d branch_name
	
Take info:
	git log
	git show HEAD
	
To return to old commit:
	git reset 1234567
	git reset HEAD program.py
	# откатили изменения до предыдушего коммита
	git reset HEAD
	# откатили изменения во всех файлах до предыдущего коммита
	
To cancel changes:
	git reset --hard
	
BITBUCKET:
	ssh -v git@bitbucket.org
