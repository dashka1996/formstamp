FormStamp
====

FormStamp is a pure AngularJS widgets library designed for rich
front-end web applications. FormStamp core principes are:

* all widgets are written from scratch
* maximum AngularJS compatibility (support ngDisabled, ngModel and
  other standard directives)
* styled with Twitter Bootstrap
* clean & minimalistic codebase.

[Live Demo](http://formstamp.github.io/)

Installation
------------

FormStamp can be installed via [Bower Package Manager](http://bower.io/):

    bower install formstamp

Structure
------------

There are 3 levels of directives:

* Form Builder - orchestrates building of complex forms; provides
  simple DSL-like markup for describing forms and hides complex markup
  from you.
* Widget directives - most often used widgets
* Low-level directives - common concerns for widgets construction, can
  be used to build you own custom widgets

Form Builder
-----------

* `fsFromFor` - root form builder directive
* `fsInput` - renders row with input in form builder
* `fsRow` - renders custom row

Widget Directives
---------

* `fsSelect` - select input with freetext support (select/combo)
* `fsMultiselect` - multiple select input with freetext support
* `fsTime` - time input
* `fsDate` - date input with `fsCalendar` inside dropdown
* `fsDatetime` - widget composed from `fsTime` and `fsDate` to enter
  both date and time
* `fsRadio` - radio buttons group
* `fsCheck` - checkboxes group

Low-level Directives
---------

* `fsList` - render list of items and allows to move selection up and
  down (with custom templating for items)
* `fsNullForm` - hides input with ngModel binding from parent form
* `fsInput` - simplify keyboard & focus events handling
* `fsCalendar` - draws a calendar and allows to mark one day as selected

TODO
----
  * I18n support

Development Environment
-----------

### Node.js

    curl https://raw.github.com/creationix/nvm/master/install.sh | sh # install nvm
    nvm install 0.10
    cd /path/to/formstamp
    nvm use 0.10
    npm install # server deps
    bower install # demo deps
    `npm bin`/grunt watch # Then start watching changes
    node server.js 3000 # Run server default port 17405

NOTE: This script adds `nvm` command to `.bash_profile`. It may not
work if you are not using `bash` shell (like `zsh`). In this case you
have to manually configure profile file.

License
-----------

FormStamp is released under
[MIT License](https://raw.github.com/formstamp/formstamp/master/MIT-LICENSE).
