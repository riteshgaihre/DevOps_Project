#!/bin/bash
#Author - Ritesh
#Date - Mon 31 Mar 2025
#Script - This scripts provides the list of users with read access

USERNAME="$username"
TOKEN="$token"
REPO_OWNER="$1"
REPO_NAME="$2"
GITHUB_API="https://api.github.com"

function get_request {
	local endpoint="$1"
	local url="${GITHUB_API}/${endpoint}"
	curl -s -u "${USERNAME}:${TOKEN}" "$url"
}

function list_users_with_read_access {
	local endpoint="repos/${REPO_OWNER}/${REPO_NAME}/collaborators"
	collaborators="$(get_request "$endpoint" | jq -r '.[] | select(.permissions.pull == true) | .login')"

	if [[ -z "$collaborators" ]]; then
		echo "No user with read access for ${REPO_OWNER}/${REPO_NAME}"
	else
		echo "User with read access for ${REPO_OWNER}/${REPO_NAME}:"
		echo "$collaborators"
	fi
}
list_users_with_read_access
