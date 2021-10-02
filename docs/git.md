
## Links
- [my git ex](https://your-account.github.io)
- [my git](https://github.com/satfaat/web.git)
- [learngitbranching](https://learngitbranching.js.org/?locale=ru_RU)
- [gitexplorer](https://gitexplorer.com/)
- [](docs.atlassian.com/bitbucketserver/docs-0610/Using+SSH+keys+to+secure+Git+operations)
- [](https://confluence.atlassian.com/bitbucketserver0610/creating-ssh-keys-989761219.html)


## keywords:
dev-git
dev-hm

show commands
snapshot снимок
init = initialize


## Info
`git commit --help`
> `git help -a` and `git help -g` list available subcommands and some
> concept guides. See `git help <command>` or `git help <concept>`
> to read about a specific subcommand or concept.

```
git input_command_name -help
git help --all
git log
git show HEAD
```


## To view all of your settings and where they are coming from:

### different scopes: local, global and system
```
git config --list --local
git config --list --global
git config --list --system
```

### Show the location of Git config files where these settings are defined:
```
git config --list
git config --list --show-origin
```

```bash
git config --global user.name "YourName"  # sf
git config --global user.email you@example.com  # sf@gmail.com
git config --global --edit
```

```bash
git config --local user.name sf
git config --local user.email sf@gmail.com
```

```bash
git remote -v  # to see link to repo
git log  # to see logs 
```

********************************
* git fetch origin             *
* git status                   *
* git pull                     *
* 	or git merge origin/master *
********************************
	
1. git clone https://github.com/satfaat/backend_test_homework.git
2. git status or git status --short
	- status flags:
		- ?? - untracked
		- A - files added to stage
		- M - modified files
		- D - deleted files
    OR git fetch -all
3. git add . || git add --all || git add filename / git commit -a || git add -A
	a. git rm --cached <file> # to unstaged
4. git commit -m "My first commit"  # -m is for message
	a. git commit --amend -m "First commit: new files added"
3 and 4. git commit -am 'update'
5. git push
	
git diff	

> use "git restore <file>..." to discard changes in working directory
> use "git restore --staged <file>..." to unstage

### DELETE
```
	git branch -d branch_name

git remote -?
git remote -v
git remote add alias_name https://github.com/satfaat/web.git
	git remote remove remote_name
git fetch
```

### To return to old commit:
#### откатили изменения до предыдушего коммита
```
	git reset 1234567
	git reset HEAD program.py
```
#### откатили изменения во всех файлах до предыдущего коммита
`git reset HEAD`
	
### To cancel changes:
`git reset --hard`

## other
	
	*** git push origin master ***
	git log
	git show HEAD
	git checkout HEAD file_name
	git reset HEAD file_name
	
	git checkout newImage; git commit
	git checkout -b [your_branch_name]
		or
	git branch bugFix
	git checkout bugFix

	
## Branches and merging
```
	git merge bugFix
	git checkout bugFix; git merge master
	
	git rebase master
	
	git checkout master^
	git checkout HEAD~4 # let's specify a number of commits back.
	
	git branch -f master HEAD~3
	
	git reset commit_SHA
```
```
git checkout branch_name
git checkout master
```
	
## BITBUCKET:
	`ssh -v git@bitbucket.org`


## Git interface

```bash
git gui&
gitk&  # log interface
```

*********
## ALIAS
*********
	`alias graph='git log --all --decorate --oneline --graph'`


**********
## DOCKER
**********
```
    cd project_name
		docker build -t docker101tutorial .

git clone https://github.com/docker/getting-started.git
cd getting-started
docker build -t docker101tutorial .
docker run -d -p 80:80 --name docker-tutorial docker101tutorial
docker run -dp 80:80 docker/getting-started

docker tag docker101tutorial satfaat/docker101tutorial
docker push satfaat/docker101tutorial
```
