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
#  output:
#   workflowr::wflow_html:
#     code_folding: hide

# delete about.Rmd and license.Rmd in /analysis and -site.yml
# delete about.html and license.html in /docs


# Build the website -------------------------------------------------------

wflow_build()
wflow_status()
wflow_publish(c("analysis/index.Rmd"),
              "Publish the initial files for myproject")

## Step 1: Commits the 3 R Markdown files using the custom commit message
## Step 2: Builds the HTML files using wflow_build()
## Step 3: Commits the 3 HTML files plus the files that specify the style of the website (e.g. CSS and JavaScript files)

# Deploy the website ------------------------------------------------------

wflow_use_github("jens-daniel-mueller")
wflow_git_push(dry_run = TRUE)
wflow_git_push()
jens-daniel-mueller

## Lastly, now that your code is on GitHub, you need to tell GitHub that you want
## the files in docs/ to be published as a website.
## Go to Settings -> GitHub Pages and choose "master branch docs/ folder" as the Source (instructions).


# Add a new analysis file -------------------------------------------------

wflow_open("analysis/first-analysis.Rmd")

# After opening a new analysis file, do the following:

# change: author: "Jens Daniel Mueller"
# change: date:  "`r format(Sys.time(), '%d %B, %Y')`"

wflow_build()
wflow_publish("analysis/*", "surpressed report in index", republish = TRUE)

wflow_publish(republish = TRUE, message="changed navbar link name") # for changes only in _site.yml
wflow_git_push()
jens-daniel-mueller
