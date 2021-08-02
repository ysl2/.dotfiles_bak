// leave at least 2 line with only a star on it below, or doc generation fails
/**
 *
 *
 * Placeholder for custom user javascript
 * mainly to be overridden in profile/static/custom/custom.js
 * This will always be an empty file in IPython
 *
 * User could add any javascript in the `profile/static/custom/custom.js` file.
 * It will be executed by the ipython notebook at load time.
 *
 * Same thing with `profile/static/custom/custom.css` to inject custom css into the notebook.
 *
 *
 * The object available at load time depend on the version of IPython in use.
 * there is no guaranties of API stability.
 *
 * The example below explain the principle, and might not be valid.
 *
 * Instances are created after the loading of this file and might need to be accessed using events:
 *     define([
 *        'base/js/namespace',
 *        'base/js/events'
 *     ], function(IPython, events) {
 *         events.on("app_initialized.NotebookApp", function () {
 *             IPython.keyboard_manager....
 *         });
 *     });
 *
 * __Example 1:__
 *
 * Create a custom button in toolbar that execute `%qtconsole` in kernel
 * and hence open a qtconsole attached to the same kernel as the current notebook
 *
 *    define([
 *        'base/js/namespace',
 *        'base/js/events'
 *    ], function(IPython, events) {
 *        events.on('app_initialized.NotebookApp', function(){
 *            IPython.toolbar.add_buttons_group([
 *                {
 *                    'label'   : 'run qtconsole',
 *                    'icon'    : 'icon-terminal', // select your icon from http://fortawesome.github.io/Font-Awesome/icons
 *                    'callback': function () {
 *                        IPython.notebook.kernel.execute('%qtconsole')
 *                    }
 *                }
 *                // add more button here if needed.
 *                ]);
 *        });
 *    });
 *
 * __Example 2:__
 *
 * At the completion of the dashboard loading, load an unofficial javascript extension
 * that is installed in profile/static/custom/
 *
 *    define([
 *        'base/js/events'
 *    ], function(events) {
 *        events.on('app_initialized.DashboardApp', function(){
 *            require(['custom/unofficial_extension.js'])
 *        });
 *    });
 *
 * __Example 3:__
 *
 *  Use `jQuery.getScript(url [, success(script, textStatus, jqXHR)] );`
 *  to load custom script into the notebook.
 *
 *    // to load the metadata ui extension example.
 *    $.getScript('/static/notebook/js/celltoolbarpresets/example.js');
 *    // or
 *    // to load the metadata ui extension to control slideshow mode / reveal js for nbconvert
 *    $.getScript('/static/notebook/js/celltoolbarpresets/slideshow.js');
 *
 *
 * @module IPython
 * @namespace IPython
 * @class customjs
 * @static
 */

// enable the 'Ctrl-C' mapping
// change the code mirror configuration
var cm_config = require("notebook/js/cell").Cell.options_default.cm_config;
delete cm_config.extraKeys['Ctrl-C'];
// change settings for existing cells
Jupyter.notebook.get_cells().map(function(cell) {
    var cm = cell.code_mirror;
    if (cm) {
        delete cm.getOption('extraKeys')['Ctrl-C'];
    }
});
// map the keys
CodeMirror.Vim.map("<C-c>", "<Esc>", "insert");
// Run and scroll to top
Jupyter.keyboard_manager.actions.register({
    'help': 'run selected cells',
    'handler': function(env, event) {
        env.notebook.command_mode();
        var actions = Jupyter.keyboard_manager.actions;
        actions.call('jupyter-notebook:run-cell', event, env);
        actions.call('jupyter-notebook:scroll-cell-top', event, env);
        env.notebook.edit_mode();
    }
}, 'run-and-top', 'vim-binding');

// Run and scroll to top and select next
Jupyter.keyboard_manager.actions.register({
    'help': 'run selected cells',
    'handler': function(env, event) {
        env.notebook.command_mode();
        var actions = Jupyter.keyboard_manager.actions;
        actions.call('jupyter-notebook:run-cell', event, env);
        actions.call('jupyter-notebook:scroll-cell-top', event, env);
        actions.call('jupyter-notebook:select-next-cell', event, env);
        env.notebook.edit_mode();
    }
}, 'run-and-next-and-top', 'vim-binding');

// Add two keyboard shortcuts for the new actions
require([
  'nbextensions/vim_binding/vim_binding',
  'base/js/namespace',
], function(vim_binding, ns) {
  // Add post callback
  vim_binding.on_ready_callbacks.push(function(){
    var km = ns.keyboard_manager;
    // Indicate the key combination to run the commans
    km.edit_shortcuts.add_shortcut('ctrl-enter', 'vim-binding:run-and-top', true);
    km.edit_shortcuts.add_shortcut('shift-enter', 'vim-binding:run-and-next-and-top', true);
    // Update Help
    km.edit_shortcuts.events.trigger('rebuild.QuickHelp');
  });
});
