module.exports = VimShiftMovers =

  activate: (state) ->
    atom.commands.add 'atom-text-editor', 'vim-shift-movers:shift-text-down': => @shiftdown()
    atom.commands.add 'atom-text-editor', 'vim-shift-movers:shift-text-up': => @shiftup()

    atom.commands.add 'atom-text-editor', 'vim-shift-movers:swap-text-up': => @swapup()
    atom.commands.add 'atom-text-editor', 'vim-shift-movers:swap-text-down': => @swapdown()

  deactivate: ->

  serialize: ->

  shiftdown: ->
    if editor = atom.workspace.getActiveTextEditor()
      marker = editor.markBufferPosition(editor.getCursorBufferPosition())

      editor.transact 2000, ->
        editor.moveToBeginningOfLine()
        editor.insertNewline()
        editor.setCursorBufferPosition(marker.getStartBufferPosition())

  shiftup: ->
    if editor = atom.workspace.getActiveTextEditor()
      marker = editor.markBufferPosition(editor.getCursorBufferPosition())

      editor.transact 2000, ->
        editor.moveToBeginningOfLine()
        editor.moveUp()
        point = editor.getCursorBufferPosition()
        text = editor.lineTextForBufferRow(point.row)
        if text.match(/^\s*$/)
          editor.selectLinesContainingCursors()
          editor.delete()
        editor.setCursorBufferPosition(marker.getStartBufferPosition())

  swapdown: ->
    if editor = atom.workspace.getActiveTextEditor()
      marker = editor.markBufferPosition(editor.getCursorBufferPosition())

      editor.transact 2000, ->
        editor.moveToBeginningOfLine()
        editor.moveDown()
        previousRowText = editor.lineTextForBufferRow(marker.getStartBufferPosition().row + 1)
        editor.deleteLine()
        editor.moveUp()
        # editor.insertText(previousRowText)
        editor.insertText(previousRowText + "\n", {autoindent:false})
        # editor.insertNewline()
        editor.setCursorBufferPosition(marker.getStartBufferPosition())

  swapup: ->
    if editor = atom.workspace.getActiveTextEditor()
      marker = editor.markBufferPosition(editor.getCursorBufferPosition())

      editor.transact 2000, ->
        editor.moveToBeginningOfLine()
        editor.moveUp()
        previousRowText = editor.lineTextForBufferRow(marker.getStartBufferPosition().row - 1)
        editor.deleteLine()
        editor.moveDown()
        editor.insertText(previousRowText + "\n", {autoindent:false})
        # editor.insertNewline()
        editor.setCursorBufferPosition(marker.getStartBufferPosition())
