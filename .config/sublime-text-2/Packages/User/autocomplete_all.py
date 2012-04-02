# http://www.sublimetext.com/forum/viewtopic.php?f=2&t=4562&p=20998&hilit=Autocomplete+over+all+tabs%2Fproject#p23201
"""
        if(view.file_name() is None):
            extension = ''
        else:
            name, extension = view.file_name().rsplit('.',2)
        extension = '.' + extension

        views = []
        for v in window.views():
            fileName = v.file_name()
            if (fileName is None or v.buffer_id() != view.buffer_id() and fileName.endswith(extension)):
                views.append(v)
        # get results from each tab
        results = [v.extract_completions(prefix) for v in views]
        # the rest is the same
"""

import sublime_plugin, sublime

class AutocompleteAll(sublime_plugin.EventListener):

    def on_query_completions(self, view, prefix, locations):
        window = sublime.active_window()
        # get results from each tab
        results = [v.extract_completions(prefix) for v in window.views() if v.buffer_id() != view.buffer_id()]
        results = [(item,item) for sublist in results for item in sublist] #flatten
        results = list(set(results)) # make unique
        results.sort() # sort
        return results