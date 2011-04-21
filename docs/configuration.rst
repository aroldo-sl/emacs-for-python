Configuration
=============

Enabled Features
----------------

"Emacs for Python" lets you choose which features it sets up in your
Emacs configuration. Add the following snippet to your
:file:`.emacs.el` and add as many features as you like:

.. sourcecode:: common-lisp

   (setq efp-features
         '( efp-feature-python-mode
            efp-feature-dummy))

The following features are provided by "Emacs for Python":

``efp-feature-python-mode``
   Enables Python programming mode.
   Options:

   * ``efp-python-mode`` -- preferred Python mode, either
     ``pymode-builtin`` or ``pymode-pydist`` (default).


Options
-------

Either edit your :file:`.emacs.el` or from within Emacs type :kbd:`M-x
customize-group [RET] efp [RET]` to configure "Emacs for Python".
