module.exports =

  config:
      computeOnKeys:
          type: 'array'
          default: [40, 39, 38, 37, 34, 33]

  activate: (state) ->
      me = this
      atom.workspaceView.eachEditorView (editor) ->
          editor.on 'keydown', (evt) =>
              if evt.which in atom.config.get 'function-name-in-status-bar.computeOnKeys'
                  me.showFunctionNameInStatus(evt)

          editor.on 'click', (evt) =>
              me.showFunctionNameInStatus(evt)

  deactivate: ->
    # @phpFunctionNameView.destroy()

  serialize: ->
    phpFunctionNameViewState: @phpFunctionNameView.serialize()


  getCurrentFunctionName: ->
      func = atom.workspace.getActiveEditor().getText().split("\n").slice(0, atom.workspace.getActiveEditor().getCursor().getBufferPosition().row+2).reverse().join('\n').match(/function (.*)\(/)
      if func && func.length > 0
          return func[1]

      return ''

  updateStatus: (text) ->
      el = atom.workspaceView.find('.current-path .function-info')
      if (el.length > 0)
          el[0].innerHTML = text
      else
          atom.workspaceView.find('.current-path').append("<span class=\"function-info\">#{text}</span>")

  showFunctionNameInStatus: (evt)->

      @updateStatus(" @ " + @getCurrentFunctionName())
