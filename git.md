https://your-account.github.io
https://github.com/satfaat/web.git
dev-git
dev-hm

show commands
snapshot снимок
init = initialize

git clone https://github.com/satfaat/web.git
git status

#use "git restore <file>..." to discard changes in working directory

git add filename / git commit -a
	git add -A
	git add .
# use "git restore --staged <file>..." to unstage

git config --global user.email sf@gmail.com
git config --global user.name satfaat
===
git config --local user.name sf
git config --local user.email sf@gmail.com


To view all of your settings and where they are coming from:
	git config --list --show-origin
	
	git config --global user.email "you@example.com"
	git config --global user.name "Your name"
	
	git config --global --edit
	
	*** git status ***
	git diff
	*** git commit -m "Complete first line of dialogue" ***
	*** git commit -a -m "some tex" ***
	git commit -m "popmob"
	*** git push origin master ***
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
	
# Branches and merging
	git merge bugFix
	git checkout bugFix; git merge master
	
	git rebase master
	
	git checkout master^
	git checkout HEAD~4 # let's specify a number of commits back.
	
	git branch -f master HEAD~3
	
	git reset commit_SHA
	
	
DELET 
	git branch -d branch_name

git remote -?
git remote -v
git remote add alias_name https://github.com/satfaat/web.git
	git remote remove remote_name
git fetch

===
git checkout branch_name
git checkout master
********************************
* git fetch origin             *
* git status                   *
* git pull                     *
* 	or git merge origin/master *
********************************

*********
* ALIAS *
*********
	alias graph='git log --all --decorate --oneline --graph'


**********
* DOCKER *
**********
	cd project_name
		docker build -t docker101tutorial .

git clone https://github.com/docker/getting-started.git
cd getting-started
docker build -t docker101tutorial .
docker run -d -p 80:80 --name docker-tutorial docker101tutorial
docker run -dp 80:80 docker/getting-started

docker tag docker101tutorial satfaat/docker101tutorial
docker push satfaat/docker101tutorial