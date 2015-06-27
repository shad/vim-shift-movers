module.exports = VimShiftMovers =

  activate: (state) ->
    atom.commands.add 'atom-text-editor', 'vim-shift-movers:shift-text-down': => @shiftdown()
    atom.commands.add 'atom-text-editor', 'vim-shift-movers:shift-text-up': => @shiftup()

  deactivate: ->

  serialize: ->

  shiftdown: ->
    if editor = atom.workspace.getActiveTextEditor()
      marker = editor.markBufferPosition(editor.getCursorBufferPosition())

      editor.moveToBeginningOfLine()
      editor.insertNewline()

      editor.setCursorBufferPosition(marker.getStartBufferPosition())

  shiftup: ->
    if editor = atom.workspace.getActiveTextEditor()
      marker = editor.markBufferPosition(editor.getCursorBufferPosition())

      editor.moveToBeginningOfLine()
      editor.moveUp()
      point = editor.getCursorBufferPosition()

      text = editor.lineTextForBufferRow(point.row)

      if text.match(/^\s*$/)
        editor.selectLinesContainingCursors()
        editor.delete()
      editor.setCursorBufferPosition(marker.getStartBufferPosition())
