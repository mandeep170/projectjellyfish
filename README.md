# Project Jellyfish
## Marketing Site Source Code

This branch holds the source code for the Project Jellyfish marketing site. The directions below will walk you through how to get the Middleman application running, make edits, appropriately commit your changes and deploy site updates.

### Middleman

The marketing site is built in [Middleman](https://middlemanapp.com/), a ruby-based static site generator. In order to get Middleman working on your computer, follow these steps steps in your preferred terminal application:

1. Clone this repo: `git clone git@github.com:booz-allen-hamilton/projectjellyfish.git`
2. Pull down the `marketing` branch: `git pull origin marketing`
3. Checkout the `marketing` branch: `git checkout marketing`
4. Bundle the dependencies by using `bundle install`. You might need to run `gem install bundler` in order to get this step working
5. Run `middleman server` to run the Middleman server.
6. The site should now be accessible in your browser at `http://localhost:4567` unless your settings are different.

In the future, all you will need to do is navigate to the project folder and run the Middleman server to see the site in your browser.

### Editing

Editing should be broken down into two steps:

###### A. Prepare
Anytime you want to edit something, make sure that you are up-to-date by following these commands:
1. Checkout the `marketing` branch: `git checkout marketing`
2. Get the latest code: `git pull origin marketing`
3. Sometimes, you might need to run `bundle install` again (step 4 in the Middleman section from above)

###### B. Make Changes
Simply make changes to the site as necessary in your favorite IDE/text editor. A few notes for whenever you need to edit something:
- If you change anything on the homepage, it has a high chance of changing the layout.
- Always double-check by running the Middleman app and making sure everything still works before committing changes (see next section)
- When editing the documentation, refer to the “Editing Documentation” section below.

### Commit Changes

After you have finished making changes, you will need to commit them back to GitHub. This can easily be done by:

1. Run this command with a description of the changes you made included: `git commit -am “<place the description here>”`
2. Push the changes back up to GitHub: `git push origin marketing`
3. If you have problems when pushing back up to GitHub, you might need to run this command: `git pull --rebase origin marketing` and then running 2’s command again.

Remember that these actions do not deploy the changes to the live site unless you follow the next section

### Deploying

Once you have made changes to the site and feel comfortable making
the changes live, simply follow these two steps:

1. Run `middleman build` to rebuild the static website code base.
2. Run `middleman deploy` to push the newly built site live.

## Additional Resources

If you do not feel comfortable with Git, or would like to know more about it, head on over to [Try Git](http://try.github.io) and go through the tutorial.

## Editing Documentation

All documentation lives inside of the `documentation` folder—which is found inside of the `source` folder. Individual documentation pages are each written in markdown and involve a few pieces of [frontmatter](https://middlemanapp.com/basics/frontmatter/). Simply add the appropriate folders and files to the source code and Middleman will take care of the rest.

### Folders

Inside the documentation folder are a series of folders for each section of content. This is *not* what will be reflected in the documentation navigation, but it’s helpful to organize the folders in this way for two reasons:
- Helps keep everything organized in the same way it will be presented
- Creates the proper url structure (e.g. .../documentation/**section-title**/page-name

### Files

As mentioned before, each file must have a proper setup of [frontmatter](https://middlemanapp.com/basics/frontmatter/) for the page to display correctly. Here is an example of the proper frontmatter for Project Jellyfish documentation:

```
---
layout: document
priority: 1
section: A. Example Section
status: published
title: Example Title
---

Begin normal markdown page content here...
```

Each setting has a few rules:
- `layout` - this setting should always be set as `document`. If the page you created is not being displayed with any navigation or footer, this setting will be the culprit.
- `priority` - to change the order of which files are presented first in the document navigation, simply change this number. Ideally, no two documents should have the same number
- `section` - this value will create a new section in the documentation navigation. **Always begin a section with a letter delineator**—this will make sure that you can organize the sections in the way you want. If you want several documents in the same section, they will all need to match in this setting.
- `status` - only pages set to `published` will be displayed in the navigation. You may still access the file for preview by navigating to the correct URL.
- `title` - this will simply title the entire page. You will not need to duplicate the page title in the actual markdown content.
