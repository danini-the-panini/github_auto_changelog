# Github Auto Changelog

Easily turn milestones into changelogs from the issues attached to the milestone.

## How to use

1. `bundle install`
2. Add a GitHub auth token with "repo" scope to a `.env` file, and the repo:
    ```
    GITHUB_USER_TOKEN=...
    GITHUb_REPO=foo/bar
    ```
3. Run `gac.rb`
4. Milestones will be listed with their number, title and status
    ```
    3. Newer stuff (open)
    2. New stuff (closed)
    1. First Milestone (closed)
    ```
5. Enter the milestone number at the prompt:
    ```
    Which milestone? 3
    ```
6. Receive your auto changelog:
    ```
    - Feature: new things
    - Fixed: some annoying bug
    ```