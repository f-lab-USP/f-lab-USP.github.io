# script from on the m2lines site

# If a command fails then the deploy stops
set -e

printf "\033[0;32mRebuilding website and pushing changes to GitHub...\033[0m\n"

# Commit changes.
msg="rebuilding site $(date)"
if [ -n "$*" ]; then
        msg="$*"
fi

# first pull
git pull && git add --all && git commit -m "$msg" && git push --set-upstream origin main;

# Build the project.
hugo -t hugo-hero-theme # if using a theme, replace with `hugo -t <YOURTHEME>`

# Go To Public folder
cd public

# Add changes to git.
git add .

git commit -m "$msg"

# Push source and build repos.
git push origin main
