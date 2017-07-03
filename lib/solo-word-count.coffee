SoloWordCountView = require './solo-word-count-view'
{CompositeDisposable} = require 'atom'

module.exports = SoloWordCount =
  soloWordCountView: null
  modalPanel: null
  subscriptions: null

  activate: (state) ->
    @soloWordCountView = new SoloWordCountView(state.soloWordCountViewState)
    @modalPanel = atom.workspace.addModalPanel(item: @soloWordCountView.getElement(), visible: false)

    # Events subscribed to in atom's system can be easily cleaned up with a CompositeDisposable
    @subscriptions = new CompositeDisposable

    # Register command that toggles this view
    @subscriptions.add atom.commands.add 'atom-workspace', 'solo-word-count:toggle': => @toggle()

  deactivate: ->
    @modalPanel.destroy()
    @subscriptions.dispose()
    @soloWordCountView.destroy()

  serialize: ->
    soloWordCountViewState: @soloWordCountView.serialize()

  toggle: ->
    console.log 'SoloWordCount was toggled!'

    if @modalPanel.isVisible()
      @modalPanel.hide()
    else
      editor = atom.workspace.getActiveTextEditor()
      words = editor.getText().split(/\s+/).length
      @soloWordCountView.setCount(words)
      @modalPanel.show()
