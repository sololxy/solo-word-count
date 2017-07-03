module.exports =
class SoloWordCountView
  constructor: (serializedState) ->
    # Create root element
    @element = document.createElement('div')
    @element.classList.add('solo-word-count')

    # Create message element
    message = document.createElement('div')
    message.textContent = "我靠，终于可以运行了！"
    message.classList.add('message')
    @element.appendChild(message)

  # Returns an object that can be retrieved when package is activated
  serialize: ->

  # Tear down any state and detach
  destroy: ->
    @element.remove()

  getElement: ->
    @element

  setCount: (count) ->
    displayText = "总共有: #{count} words."
    @element.children[0].textContent = displayText
    console.log(displayText)
