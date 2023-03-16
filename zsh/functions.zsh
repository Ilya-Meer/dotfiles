#!/usr/bin/env bash

# Pull up cheatsheet for Oh-My-Zsh Git aliases
function ghelp() {
	open https://github.com/ohmyzsh/ohmyzsh/wiki/Cheatsheet
	echo "Cheatsheet Opened"
}


# Start Python Simple Server
function serve() {
        python -m SimpleHTTPServer $1
}


# Check out branch utility
function co() {
    if [ $# -eq 0 ]
    then
        cat << EOF
Usage: co <pattern>

Example: co 123 (will search for branches with 123 in the name)
EOF
    return
    fi

    OPTIONS=()

    # Push all local branch names into array
    for branch in $(git branch --format='%(refname:short)' | grep $1); do
        OPTIONS+=($branch)
    done

    # If no branch names in array, exit
    if  [ ${#OPTIONS[@]} -eq 0 ]; then
        echo "No branch found matching pattern!"
        return
    fi

    # If a single branch is found matching specified pattern,
    # Run `git checkout on it`
    if  [ ${#OPTIONS[@]} -eq 1 ]; then
        echo "Found single branch matching pattern --> ${OPTIONS[@]}"
        git checkout ${OPTIONS[@]}
        return
    fi

    # If multiple matches found, display options to user
    PS3='Multiple branches found, select branch: '
    select branch in ${OPTIONS[@]}
    do
        git checkout $branch
        break
    done
}

# Open output of fzf in vim buffer
function vv() {
	vim -o `fzf`
}

# Create new zettel with date id
function zl() {
  touch $(zd)-$1.md
}

# Run appium server
function appium-server() {
	cd /usr/local/lib/node_modules/appium/node_modules/appium-webdriveragent && \

	xcodebuild -project WebDriverAgent.xcodeproj -scheme WebDriverAgentRunner -destination 'id=F5EADBC9-A7EF-4031-B23B-AB4D39C53B45' test
}
