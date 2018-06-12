#!/bin/sh
# ref: https://help.github.com/articles/adding-an-existing-project-to-github-using-the-command-line/
#
# Usage example: /bin/sh ./git_push.sh wing328 swagger-petstore-perl "minor update"

git_user_id=$1
git_repo_id=$2
release_note=$3
tag_version=$4

if [ "$git_user_id" = "" ]; then
    git_user_id="GIT_USER_ID"
    echo "[INFO] No command line input provided. Set \$git_user_id to $git_user_id"
fi

if [ "$git_repo_id" = "" ]; then
    git_repo_id="GIT_REPO_ID"
    echo "[INFO] No command line input provided. Set \$git_repo_id to $git_repo_id"
fi

if [ "$release_note" = "" ]; then
    release_note="Minor update"
    echo "[INFO] No command line input provided. Set \$release_note to $release_note"
fi

if [ "$tag_version" = "v" ]; then
    echo "[INFO] No command line input provided. Set \$tag_version if you want to create a tag"
fi

# Initialize the local directory as a Git repository
git init

# Adds the files in the local repository and stages them for commit.
git add .

# Commits the tracked changes and prepares them to be pushed to a remote repository. 
git commit -m "$release_note"

# Sets the new remote
git_remote=`git remote`
if [ "$git_remote" = "" ]; then # git remote not defined

    if [ "$GIT_TOKEN" = "" ]; then
        echo "[INFO] \$GIT_TOKEN (environment variable) is not set. Using the git crediential in your environment."
        git remote add origin https://github.com/${github_org}/${git_repo_id}.git
    else
        git remote add origin https://${git_user_id}:${GIT_TOKEN}@github.com/${GITHUB_ORG}/${git_repo_id}
    fi

fi

git pull origin master

if [ "$tag_version" != "v" ]; then
	if git rev-parse "$tag_version^{tag}" >/dev/null 2>&1
	then
		echo "[WARN] Tag $tag_version already exists!"
	else
		git tag $tag_version
	fi
fi

# Pushes (Forces) the changes in the local repository up to the remote repository
echo "Git pushing to https://github.com/${GITHUB_ORG}/${git_repo_id}.git"
git push origin master --quiet --tags 2>&1 | grep -v 'To https'

