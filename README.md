Bootstrap Hacks
===============
[![Build Status](https://travis-ci.org/danielnixon/bootstrap-hacks.svg?branch=master)](https://travis-ci.org/danielnixon/bootstrap-hacks)
[![npm version](https://img.shields.io/npm/v/bootstrap-hacks.svg)](https://www.npmjs.com/package/bootstrap-hacks)
![Bower version](https://img.shields.io/bower/v/bootstrap-hacks.svg)
[![Maven Central](https://maven-badges.herokuapp.com/maven-central/org.webjars.npm/bootstrap-hacks/badge.svg)](https://maven-badges.herokuapp.com/maven-central/org.webjars.npm/bootstrap-hacks)

Tweaks (with a security and accessibility focus) for Bootstrap version 3.

Installation
============
* Install with npm: `npm install bootstrap-hacks`
* Install with Bower: `bower install bootstrap-hacks`
* Add a WebJar dependency to build.sbt: `libraryDependencies += "org.webjars.npm" % "bootstrap-hacks" % "0.2.0"`

Included Hacks
==============

Accessible variables
--------------------
Bootstrap's default placeholder color (`#999`) doesn't meet WCAG 2.0 AA's [color contrast](http://www.w3.org/TR/UNDERSTANDING-WCAG20/visual-audio-contrast-contrast.html) requirement. Include `accessible-variables.less` to override `@input-color-placeholder` with a darker shade of gray (`#767676`).

Bootstrap's default colors for `@brand-primary`, `@brand-success`, `@brand-danger`, `@state-info-text` and `@state-danger-text` do not meet WCAG 2.0 AA's [color contrast](http://www.w3.org/TR/UNDERSTANDING-WCAG20/visual-audio-contrast-contrast.html) requirement. They are replaced with accessible alternatives.

Progress bar
------------

Enables use of Bootstrap's [progress bar component](http://getbootstrap.com/components/#progress) without requiring inline styles, in turn allowing [CSP](https://developer.mozilla.org/en-US/docs/Web/Security/CSP) headers to exclude the 'unsafe-inline' style-src.

### Usage

1. Include progressbar.less in your project however you like.
2. Remove the inline style attribute from your progress bars; progressbar.less will style them appropriately.

    Before:
    
    ```html
    <div class="progress">
      <div class="progress-bar" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: 60%;">
        <span class="sr-only">60% Complete</span>
      </div>
    </div>
    ```
    
    After:
    
    ```html
    <div class="progress">
      <div class="progress-bar" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100">
        <span class="sr-only">60% Complete</span>
      </div>
    </div>
    ```

### Caveats

* Only works for integral values of `aria-valuenow` (e.g. `aria-valuenow="60"` will work, `aria-valuenow="60.1"` won't).
* Only works when the progress bar displays values between 0 and 100 (i.e. `aria-valuemin="0"` and  `aria-valuemax="100"`).

Prevent zoom on focus on iOS
----------------------------

iOS can automatically zoom in when a form input element receives focus. Developers often disable this behaviour by setting restrictive values for the `viewport` meta element. This can [negatively affect accessibility](https://www.w3.org/TR/mobile-accessibility-mapping/#zoom-magnification):

> Ensure that the browser pinch zoom is not blocked by the page's viewport meta element so that it can be used to zoom the page to 200%. Restrictive values for user-scalable and maximum-scale attributes of this meta element should be avoided.

Instead, include `prevent-ios-zoom-on-focus.less` to set the font size of form inputs to `16px` when in the extra small responsive breakpoint. This will prevent iOS from zooming automatically when an input receives focus but continue to allow users to pinch to zoom.
