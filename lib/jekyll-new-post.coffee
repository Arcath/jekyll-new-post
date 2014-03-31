JekyllNewPostView = require './jekyll-new-post-view'

module.exports =
  jekyllNewPostView: null

  activate: (state) ->
    @jekyllNewPostView = new JekyllNewPostView(state.jekyllNewPostViewState)

  deactivate: ->
    @jekyllNewPostView.destroy()

  serialize: ->
    jekyllNewPostViewState: @jekyllNewPostView.serialize()
