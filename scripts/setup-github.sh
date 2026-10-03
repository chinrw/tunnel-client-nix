#!/usr/bin/env bash
set -euo pipefail

repository=${GH_REPO:?Set GH_REPO to the repository that should receive these settings}
gh api --method PUT "repos/$repository/actions/permissions/workflow" \
  -f default_workflow_permissions=read -F can_approve_pull_request_reviews=true
gh repo edit "$repository" --enable-auto-merge --delete-branch-on-merge
