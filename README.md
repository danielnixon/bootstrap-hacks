Bootstrap Hacks [![Build Status](https://travis-ci.org/danielnixon/bootstrap-hacks.svg?branch=master)](https://travis-ci.org/danielnixon/bootstrap-hacks)
===============

Tweaks (with a security and accessibility focus) to the Bootstrap framework.

Included Hacks
==============

Accessible variables
--------------------
Bootstrap's default placeholder color (`#999`) doesn't meet WCAG 2.0 AA's [color contrast](http://www.w3.org/TR/UNDERSTANDING-WCAG20/visual-audio-contrast-contrast.html) requirement. Include `accessible-variables.less` to override `@input-color-placeholder` with a darker shade of gray (`#767676`).

Progress bar
------------

Enables use of Bootstrap's [progress bar component](http://getbootstrap.com/components/#progress) without requiring inline styles, in turn allowing [CSP](https://developer.mozilla.org/en-US/docs/Web/Security/CSP) headers to exclude the 'unsafe-inline' style-src.

### Usage

1. Include progressbar.less (or progressbar.css) in your project however you like.
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
