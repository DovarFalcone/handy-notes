# Branching Strategy and Pull Request (PR) Naming Convention

This repository adheres to a well-defined branching strategy to facilitate efficient change management. The primary branches are `develop` and `main`, associated respectively with the development and production sites. Please take note of the following guidelines for branch names and pull request (PR) naming conventions:

## Branching Strategy

1. **develop**: The primary development branch. It serves as the integration point for new features, bug fixes, and enhancements. Feature branches are typically merged into this branch.
   
2. **main**: The primary branch representing the production-ready state of the project. It should consistently mirror the state of the live production site.

## Pull Request (PR) Naming Convention

When submitting a pull request, follow these conventions for naming:

1. **Feature Branch PRs**:
   - **Branch Name Format**: `feature-description-of-feature`
   - **PR Name Format**: `[FEATURE] Add descriptive feature name`
   - **Example**: For a new search feature, the branch name could be `feature-add-search` and the PR name could be `[FEATURE] Add search functionality`

2. **Bug Fix Branch PRs**:
   - **Branch Name Format**: `bugfix-issue-number-description`
   - **PR Name Format**: `[BUGFIX] Fix issue #123: Short description of the issue`
   - **Example**: If addressing issue #123 about broken links, the branch name could be `bugfix-123-fix-broken-links` and the PR name could be `[BUGFIX] Fix issue #123: Broken links`

3. **Documentation Branch PRs**:
   - **Branch Name Format**: `docs-update-section-name`
   - **PR Name Format**: `[DOCS] Update documentation for section name`
   - **Example**: When revising the installation guide, the branch name could be `docs-update-install-guide` and the PR name could be `[DOCS] Update documentation for installation guide`

Please be mindful of keeping PR names succinct, clear, and informative. Aiming for a maximum of three words helps maintain brevity and clarity.

Additionally, a few important notes about the automated build and deployment process:

- **Initial PR Creation to Develop**: When an initial pull request is created to merge into the `develop` branch, Vela will perform a site build but won't trigger deployment. Automatic deployment will be initiated upon pushing or merging subsequent changes into the `develop` branch.

- **Develop to Main (Production)**: The `develop` branch should always be merged into the `main` branch to update the production site. Upon merging `develop` into `main`, Vela will automatically trigger a site build for the production site.

Your adherence to these guidelines greatly contributes to consistency and effective collaboration within the team.
