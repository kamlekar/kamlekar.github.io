---
layout: post
title: My preferred Git setup for Wordpress project
subtitle: ""
date: 2017-10-19 07:59:44.000000000 +05:30
categories:
- technical
tags:
- posts
- wordpress
- git
- xampp
status: publish
type: post
published: true
author: Venkateshwar
header-img: "img/home-bg.jpg"
---


> Disclaimer: This article explains to make the wordpress project deployment on live server easier using git.

It is kind of hard to decide where to init the git inside the Wordpress project folder.  The usual way to init is the whole Wordpress project folder which I think is not needed because we actually won't change anything outside our `theme/` folder. So, here I am sharing my preferred git setup where I git only those folders which we possibly change.

Though we change inside our theme i.e `wp-content/themes/{my-theme}`, other changes occur outside this directory as well i.e plugin installations and images added through Wordpress admin panel. So actually, all the changes are taking place inside `wp-content/`.  

So, lets `git init` the `wp-content/` folder in CLI. 

```css
$MyWordpress/wp-content > git init
$MyWordpress/wp-content > git remote add origin git@www.gitsetup.com:/my/setup.git
```

Now, before committing the files inside `wp-content`, we need to make sure we aren't committing unnecessary files like "wordpress default themes" and "node_modules" folder (_if you are using npm packages to automate tasks_). Here is the `.gitignore` setup which I use:

```css
themes/*
!themes/MyTheme/
themes/MyTheme/node_modules/
```

> Note: In the above setup, I initialized npm packages in my theme folder.

All this setup I am doing so that it would be easier for me to deploy to staging/live site. Now, the only thing which isn't covered above is Database, which actually keeps on modifying while we do changes in wp-admin, while developing. So, I made mandatory in my team to commit the modified SQL<sup>1</sup> file whenever they did changes in `wp-admin` in their local server, under `wp-content/MyTheme/misc/dump.sql`. Now, whenever my team mates commit, I will have track of all the files even including the updated Sql file.

> 1: If you using XAMPP, then you can visit `localhost/phpmyadmin` and export the database which is connected to this wordpress project.

For consideration, the local server `dump.sql` file when imported on staging or live site won't work directly because that sql file is registered to local server site url which usually looks like `http://localhost/mytheme`.  So, now this sql file should be re-registered with staging/live site url which can be done either by simple replace with `http://localhost/mytheme` with `http://staging.mystagingurl.com` by editing the sql file in notepad or after importing this sql file in staging/live database running SQL `REPLACE()` function. 

Since, I am trying to automate the deployment, I will use `REPLACE` SQL function inside a shell script which I will run whenever I need to deploy the latest code on live/staging server. So, the shell script which I run on staging/live server looks as shown below:

```css
git pull;
mysqladmin drop MyThemeDatabase --force;
mysqladmin create MyThemeDatabase;
mysql MyThemeDatabase < /path/to/project/wp-content/themes/mytheme/misc/dump.sql;
mysql MyThemeDatabase -e "UPDATE wp_options SET option_value = replace(option_value, 'http://localhost/mytheme', 'http://staging.mystagingurl.com') WHERE option_name = 'home' OR option_name = 'siteurl'; UPDATE wp_posts SET guid = replace(guid, 'http://localhost/mytheme','http://staging.mystagingurl.com'); UPDATE wp_posts SET post_content = replace(post_content, 'http://localhost/mytheme', 'http://staging.mystagingurl.com'); UPDATE wp_postmeta SET meta_value = replace(meta_value, 'http://localhost/mytheme', 'http://staging.mystagingurl.com'); UPDATE wp_posts SET post_excerpt = replace(post_excerpt, 'http://localhost/mytheme', 'http://staging.mystagingurl.com');";
```
    
Explanation to above commands:

- [`git pull`] Pulling the latest code from git.
- [`mysqladmin drop MyThemeDatabase`] Removing the existing Database which is old one.
- [`mysqladmin create MyThemeDatabase`]  Creating the new Database.
- [`mysql MyThemeDatabase < ./dump.sql`] Importing the latest sql dump in the Database.
- And the last big query with `REPLACE` SQL function is to replace `http://localhost/mytheme` with `http://staging.mystagingurl.com` in the Database. The replace is done under wordpress database tables `wp_options`, `wp_postmeta` and `wp_posts`.

Also, once after the complete deployment, do refresh the permalinks by just visiting `wp-admin -> settings -> permalinks` and click on "Save" button. This will make sure that the new pages are visible. 

Hope this helps. Happy coding :)


