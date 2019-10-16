# This script summarizes the central commands and steps to set-up and organize a R project
# using the Workflowr package.
# For details please refer to:
# https://jdblischak.github.io/workflowr/articles/wflow-01-getting-started.html

library("workflowr")

# Start project -----------------------------------------------------------

wflow_start("Diurnal_pCO2_variability_Baltic")

# After starting the project, do the following:

# Copy this Workflowr_project_managment.R file in folder /code

# include folders /data and /output in .gitignore after starting the project

# change -site.yml:
#  navbar:
#   title: XXX
#     - icon: fa-home
#       text: Jens' homepage
#       href: https://jens-daniel-mueller.github.io/
#  theme: flatly

# delete about.Rmd and license.Rmd in /analysis and -site.yml
# delete about.html and license.html in /docs


# Build the website -------------------------------------------------------

wflow_build()

## Current working directory: /tmp/RtmpP9PjyX/wflow-01-getting-started-4def77a57e/myproject
## Building 3 file(s):
## Building analysis/about.Rmd
## Building analysis/index.Rmd
## Building analysis/license.Rmd
## Summary from wflow_build
##
## Settings:
##  make: TRUE
##
## The following were built externally each in their own fresh R
## session:
##
## docs/about.html
## docs/index.html
## docs/license.html
##
## Log files saved in /tmp/RtmpP9PjyX/workflowr

wflow_status()

## Status of 3 files
##
## Totals:
##  3 Unpublished
##
## The following files require attention:
##
## Unp analysis/about.Rmd
## Unp analysis/index.Rmd
## Unp analysis/license.Rmd
##
## Key: Unp = Unpublished
##
## To publish your changes as part of your website, use
## `wflow_publish()`.
##
## To commit your changes without publishing them yet, use
## `wflow_git_commit()`.

wflow_publish(c("analysis/index.Rmd"),
              "Publish the initial files for myproject")

## Step 1: Commits the 3 R Markdown files using the custom commit message
##
## Step 2: Builds the HTML files using wflow_build()
##
## Step 3: Commits the 3 HTML files plus the files that specify the style of the website (e.g. CSS and JavaScript files)



## Current working directory: /tmp/RtmpP9PjyX/wflow-01-getting-started-4def77a57e/myproject
## Building 3 file(s):
## Building analysis/index.Rmd
## Building analysis/about.Rmd
## Building analysis/license.Rmd
## Summary from wflow_publish
##
## **Step 1: Commit analysis files**
##
## Summary from wflow_git_commit
##
## The following was run:
##
##   $ git add analysis/index.Rmd analysis/about.Rmd analysis/license.Rmd
##   $ git commit -m "Publish the initial files for myproject"
##
## The following file(s) were included in commit b341830:
## analysis/about.Rmd
## analysis/index.Rmd
## analysis/license.Rmd
##
## **Step 2: Build HTML files**
##
## Summary from wflow_build
##
## Settings:
##  clean_fig_files: TRUE
##
## The following were built externally each in their own fresh R
## session:
##
## docs/index.html
## docs/about.html
## docs/license.html
##
## Log files saved in /tmp/RtmpP9PjyX/workflowr
##
## **Step 3: Commit HTML files**
##
## Summary from wflow_git_commit
##
## The following was run:
##
##   $ git add docs/index.html docs/about.html docs/license.html docs/figure/index.Rmd docs/figure/about.Rmd docs/figure/license.Rmd docs/site_libs docs/.nojekyll
##   $ git commit -m "Build site."
##
## The following file(s) were included in commit 2c44f36:
## docs/about.html
## docs/index.html
## docs/license.html
## docs/site_libs/bootstrap-3.3.5/
## docs/site_libs/highlightjs-9.12.0/
## docs/site_libs/jquery-1.11.3/
## docs/site_libs/navigation-1.1/

wflow_status()
## Status of 3 files
##
## Totals:
##  3 Published
##
## Files are up-to-date


# Deploy the website ------------------------------------------------------

wflow_use_github("jens-daniel-mueller")

y## Summary from wflow_use_github():
## username: myname
## respository: myproject
## * The website directory is already named docs/
## * Output directory is already set to docs/
## * Set remote "origin" to https://github.com/myname/myproject.git
## * Added GitHub link to navigation bar
## * Committed the changes to Git
## To do: Create myname/myproject at github.com (if it doesn't already exist)
## To do: Run wflow_git_push() to push your project to GitHub

wflow_git_push(dry_run = TRUE)

## Summary from wflow_git_push
##
## Pushing to the branch "master" of the remote repository "origin"
##
## Using the HTTPS protocol
## The following Git command would be run:
##
##   $ git push origin master

wflow_git_push()
jens-daniel-mueller

## Lastly, now that your code is on GitHub, you need to tell GitHub that you want
## the files in docs/ to be published as a website.
## Go to Settings -> GitHub Pages and choose "master branch docs/ folder" as the Source (instructions).


# Add a new analysis file -------------------------------------------------

wflow_open("analysis/first-analysis.Rmd")

## wflow_open:
## - New file(s):
##   /tmp/RtmpP9PjyX/wflow-01-getting-started-4def77a57e/myproject/analysis/first-analysis.Rmd
## - Same working directory: /tmp/RtmpP9PjyX/wflow-01-getting-started-4def77a57e/myproject

wflow_build()
wflow_publish()
wflow_status()

wflow_publish(c("analysis/index.Rmd", "analysis/pCO2_Finnmaid.Rmd"),
              "Add my first analysis")

> wflow_publish(republish = TRUE, message="changes theme")

wflow_git_push()
