# sample ipython_config.py
c = get_config()

c.TerminalIPythonApp.display_banner = True

c.TerminalIPythonApp.extensions = [
    'autoreload',
    #'line_profiler',
    'memory_profiler',
]

c.InteractiveShellApp.log_level = 20
#c.InteractiveShellApp.extensions = ['autoreload', 'memory_profiler', 'line_profiler']
c.InteractiveShellApp.extensions = ['autoreload', 'memory_profiler']
#c.InteractiveShellApp.exec_lines = ['import numpy', 'import scipy']
c.InteractiveShellApp.exec_lines = ['%autoreload 2']
#c.InteractiveShellApp.exec_files = ['mycode.py', 'fancy.ipy']
c.InteractiveShell.autoindent = True
c.InteractiveShell.colors = 'Linux'
c.InteractiveShell.confirm_exit = False
c.InteractiveShell.editor = 'vim'
c.InteractiveShell.xmode = 'Context'

c.TerminalInteractiveShell.editing_mode = 'vi'

c.PrefilterManager.multi_line_specials = True

c.AliasManager.user_aliases = [('la', 'ls -al')]
