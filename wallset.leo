<?xml version="1.0" encoding="utf-8"?>
<!-- Created by Leo: https://leo-editor.github.io/leo-editor/leo_toc.html -->
<leo_file xmlns:leo="http://leo-editor.github.io/leo-editor/namespaces/leo-python-editor/1.1" >
<leo_header file_format="2"/>
<globals/>
<preferences/>
<find_panel_settings/>
<vnodes>
<v t="caminhante.20240213010554.2"><vh>Wallset</vh></v>
<v t="caminhante.20240213010645.1"><vh>@path .</vh>
<v t="caminhante.20240213010725.7"><vh>/.git/</vh></v>
<v t="caminhante.20240213010725.6"><vh>/examples/</vh>
<v t="caminhante.20240213163258.2"><vh>/videos/</vh>
<v t="caminhante.20240213163300.5"><vh>abstract-city.mp4</vh></v>
<v t="caminhante.20240213163300.4"><vh>alien-city.mp4</vh></v>
<v t="caminhante.20240213163300.3"><vh>bee-hive.mp4</vh></v>
<v t="caminhante.20240213163300.2"><vh>car-on-the-streets.mp4</vh></v>
<v t="caminhante.20240213163300.1"><vh>other-car-lights.mp4</vh></v>
</v>
<v t="caminhante.20240213163258.1"><vh>/wallpapers/</vh>
<v t="caminhante.20240213163302.6"><vh>example-to-wallset-1.png</vh></v>
<v t="caminhante.20240213163302.5"><vh>example-to-wallset-2.jpg</vh></v>
<v t="caminhante.20240213163302.4"><vh>example-to-wallset-3.jpg</vh></v>
<v t="caminhante.20240213163302.3"><vh>example-to-wallset-4.jpg</vh></v>
<v t="caminhante.20240213163302.2"><vh>example-to-wallset-5.jpg</vh></v>
<v t="caminhante.20240213163302.1"><vh>example-to-wallset-6.jpg</vh></v>
</v>
</v>
<v t="caminhante.20240213010725.4"><vh>@auto README.md</vh></v>
<v t="caminhante.20240213010725.5"><vh>@edit LICENSE</vh></v>
<v t="caminhante.20240213010725.2"><vh>@file wallset</vh></v>
<v t="caminhante.20240213010725.1"><vh>wallset.leo</vh></v>
<v t="caminhante.20240213161011.1"><vh>wallset.leo.bak</vh></v>
</v>
<v t="caminhante.20230226160006.1"><vh>@settings</vh>
<v t="caminhante.20200618180759.1"><vh>@command terminal-here @key=Alt-T</vh></v>
<v t="caminhante.20230226160006.2"><vh>@data abbreviations</vh></v>
<v t="caminhante.20230226160006.3"><vh>@outline-data tree-abbreviations</vh></v>
<v t="caminhante.20230226160006.4"><vh>nodeActions</vh>
<v t="caminhante.20230421001433.1"><vh>@bin *</vh></v>
<v t="caminhante.20200604232050.1"><vh>@cmd *</vh></v>
<v t="caminhante.20211012181130.1"><vh>@cp *</vh></v>
<v t="caminhante.20211113172701.1"><vh>@files Makefile</vh></v>
<v t="caminhante.20210501142945.2"><vh>@mkdir *</vh></v>
<v t="caminhante.20211012180812.1"><vh>@mv *</vh></v>
<v t="caminhante.20210905232208.1"><vh>@rm *</vh></v>
<v t="caminhante.20210501142945.4"><vh>@rmdir /*/</vh></v>
<v t="caminhante.20200618203115.1"><vh>@run|@run .* [X]</vh></v>
<v t="caminhante.20230410165201.1"><vh>\@edit * [X]</vh></v>
<v t="caminhante.20230623143806.1"><vh>\@file * [X]</vh></v>
<v t="caminhante.20230623181912.1"><vh>/*/</vh></v>
<v t="caminhante.20231002175916.1"><vh>\@path * [X]</vh></v>
<v t="caminhante.20230623144919.1"><vh>*</vh></v>
</v>
</v>
</vnodes>
<tnodes>
<t tx="caminhante.20200604232050.1">import subprocess

def execute (cmd):
    return subprocess.run(cmd,shell=True,universal_newlines=True,stderr=subprocess.STDOUT,stdout=subprocess.PIPE).stdout

if c.isChanged(): c.save()

path = c.getNodePath(c.p)
g.os.chdir(path)

command = ''.join(c.p.h.split('@cmd ')[1:])
command = "cat &lt;&lt;'EOFEOFEOFEOFEOFEOF' | bash\n"+command+'\nEOFEOFEOFEOFEOFEOF'
g.es(c.p.h)
c.p.b += execute(command)

c.save()
</t>
<t tx="caminhante.20200618180759.1">@language python
import subprocess

def execute (cmd):
    return subprocess.Popen(cmd,shell=True,universal_newlines=True,stderr=subprocess.STDOUT,stdout=subprocess.PIPE).stdout

if c.isChanged(): c.save()
path = c.getNodePath(c.p)

execute('x-terminal-emulator --working-directory="'+path+'"')
</t>
<t tx="caminhante.20200618203115.1">@language python
import subprocess

# def getpath (p):
    # dict = c.scanAllDirectives(p)
    # d = dict.get("path")
    # if p.isAnyAtFileNode():
        # filename = p.anyAtFileNodeName()
        # filename = g.os_path_join(d,filename)
        # if filename:
            # d = g.os_path_dirname(filename)
    # if d is None:
        # return ""
    # else:
        # return g.os_path_normpath(d)

def execute (cmd):
    return subprocess.run(cmd,shell=True,universal_newlines=True,stderr=subprocess.STDOUT,stdout=subprocess.PIPE).stdout

path = c.getNodePath(c.p)
# g.os.chdir(path)

w = c.frame.body.wrapper
s1,s2 = w.getSelectionRange()

if s1 == s2:
    code = c.p.b
else:
    linebr = c.p.b.find('\n',s2)
    if linebr == -1: linebr = len(c.p.b)
    code = c.p.b[s1:s2]

g.es(c.p.h)

command = "cat &lt;&lt;'EOFEOFEOFEOFEOFEOF' | bash\ncd '"+path+"';\n"+code+'\nEOFEOFEOFEOFEOFEOF'

if c.isChanged(): c.save()

cpc = c.p.copy()
novoNo = cpc.insertAsLastChild()
novoNo.h = c.p.h + ' ['+code+']'
novoNo.b = execute(command)

c.save()
w.setSelectionRange(s1,s2)
c.redraw(c.p)
</t>
<t tx="caminhante.20210501142945.2">import subprocess

def execute (cmd):
    return subprocess.run(cmd,shell=True,universal_newlines=True,stderr=subprocess.STDOUT,stdout=subprocess.PIPE).stdout

path = c.getNodePath(c.p)
g.os.chdir(path)

path = ''.join(c.p.h.split('@mkdir ')[1:])
cmd = "mkdir -p -- '" + path + "'"
g.es(c.p.h)
execute(cmd)
c.p.h = '/'+path+'/'
c.p.b = '@path ' + path
</t>
<t tx="caminhante.20210501142945.4">import subprocess
import shutil

def execute (cmd):
    return subprocess.run(cmd,shell=True,universal_newlines=True,stderr=subprocess.STDOUT,stdout=subprocess.PIPE).stdout

ps = c.p.parents()
for par in ps:
    break
path = c.getNodePath(par)
g.os.chdir(path)

path = ''.join(c.p.h.split('@rmdir /')[1:]).split('/')[0]
shutil.rmtree(path)
c.p.b = 'deleted'
c.p.deleteAllChildren()
c.redraw(c.p)
</t>
<t tx="caminhante.20210905232208.1">import subprocess

def execute (cmd):
    return subprocess.run(cmd,shell=True,universal_newlines=True,stderr=subprocess.STDOUT,stdout=subprocess.PIPE).stdout

path = c.getNodePath(c.p)
g.os.chdir(path)

filename = ''.join(c.p.h.split('@rm ')[1:])
cmd = 'rm -vf -- "' + filename + '"'
g.es(c.p.h)
g.es(execute(cmd))
c.p.deleteAllChildren()
c.redraw(c.p)
</t>
<t tx="caminhante.20211012180812.1">import subprocess

def execute (cmd):
    return subprocess.run(cmd,shell=True,universal_newlines=True,stderr=subprocess.STDOUT,stdout=subprocess.PIPE).stdout

path = c.getNodePath(c.p)
g.os.chdir(path)

if 'file://' in c.p.h:
  path = ''.join(c.p.h.split('@mv file://')[1:])
else:
  path = ''.join(c.p.h.split('@mv ')[1:])

cmd = "mv -v -- '" + path + "' ./"
g.es(c.p.h)
g.es(execute(cmd))
</t>
<t tx="caminhante.20211012181130.1">import subprocess

def execute (cmd):
    return subprocess.run(cmd,shell=True,universal_newlines=True,stderr=subprocess.STDOUT,stdout=subprocess.PIPE).stdout

path = c.getNodePath(c.p)
g.os.chdir(path)

if 'file://' in c.p.h:
  path = ''.join(c.p.h.split('@cp file://')[1:])
else:
  path = ''.join(c.p.h.split('@cp ')[1:])

cmd = "cp -v -- '" + path + "' ./"
g.es(c.p.h)
g.es(execute(cmd))
</t>
<t tx="caminhante.20211113172701.1">@language python
import subprocess
import re

def execute (cmd):
    return subprocess.run(cmd,shell=True,universal_newlines=True,stderr=subprocess.STDOUT,stdout=subprocess.PIPE).stdout

if c.isChanged(): c.save()

path = c.getNodePath(c.p)
g.os.chdir(path)

cpc = c.p.copy()
novoNo = cpc.insertAfter()
novoNo.h = 'make return'
novoNo.b = execute('make')
c.redraw(c.p)
</t>
<t tx="caminhante.20230226160006.1">@tabwidth -2
</t>
<t tx="caminhante.20230226160006.2"></t>
<t tx="caminhante.20230226160006.3"></t>
<t tx="caminhante.20230226160006.4">@language python
</t>
<t tx="caminhante.20230410165201.1">path = ''.join(c.p.h.split('@edit ')[1:])
c.p.h = path
c.p.b = ''
</t>
<t tx="caminhante.20230421001433.1">import subprocess

def execute (cmd):
  return subprocess.run(
    cmd,shell=True,
    universal_newlines=True,
    stderr=subprocess.STDOUT,
    stdout=subprocess.PIPE).stdout

path = c.getNodePath(c.p)
g.os.chdir(path)

command = ''.join(c.p.h.split('@bin ')[1:])
command = "xxd -- '"+command+"'"

g.es(c.p.h)
c.p.b = execute(command)

c.save()
</t>
<t tx="caminhante.20230623143806.1">path = ''.join(c.p.h.split('@file ')[1:])
c.p.h = path
c.p.b = ''
c.p.deleteAllChildren()
c.redraw(c.p)
</t>
<t tx="caminhante.20230623144919.1">path = c.getNodePath(c.p)
g.os.chdir(path)

filename = c.p.h

at = c.atFileCommands
c.p.deleteAllChildren()
c.p.h = "@file " + filename
c.recreateGnxDict()
at.readFileAtPosition(c.p)

c.p.setDirty()
c.redraw(c.p)
c.p.contract()
</t>
<t tx="caminhante.20230623181912.1">c.p.deleteAllChildren()
c.p.setDirty()
c.redraw(c.p)
</t>
<t tx="caminhante.20231002175916.1">c.p.deleteAllChildren()
c.p.setDirty()
c.redraw(c.p)
</t>
<t tx="caminhante.20240213010554.2"></t>
<t tx="caminhante.20240213010645.1"></t>
<t tx="caminhante.20240213010725.1"></t>
<t tx="caminhante.20240213010725.6">@path examples</t>
<t tx="caminhante.20240213010725.7">@path .git</t>
<t tx="caminhante.20240213161011.1"></t>
<t tx="caminhante.20240213163258.1">@path wallpapers</t>
<t tx="caminhante.20240213163258.2">@path videos</t>
<t tx="caminhante.20240213163300.1"></t>
<t tx="caminhante.20240213163300.2"></t>
<t tx="caminhante.20240213163300.3"></t>
<t tx="caminhante.20240213163300.4"></t>
<t tx="caminhante.20240213163300.5"></t>
<t tx="caminhante.20240213163302.1"></t>
<t tx="caminhante.20240213163302.2"></t>
<t tx="caminhante.20240213163302.3"></t>
<t tx="caminhante.20240213163302.4"></t>
<t tx="caminhante.20240213163302.5"></t>
<t tx="caminhante.20240213163302.6"></t>
</tnodes>
</leo_file>
