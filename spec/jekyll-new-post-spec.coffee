JekyllNewPost = require '../lib/jekyll-new-post'
{WorkspaceView} = require 'atom'

# Use the command `window:run-package-specs` (cmd-alt-ctrl-p) to run specs.
#
# To run a specific `it` or `describe` block add an `f` to the front (e.g. `fit`
# or `fdescribe`). Remove the `f` to unfocus the block.

describe "JekyllNewPost", ->
  activationPromise = null

  beforeEach ->
    atom.workspaceView = new WorkspaceView
    activationPromise = atom.packages.activatePackage('jekyll-new-post')

  describe "when the jekyll-new-post:new-post event is triggered", ->
    it "attaches and then detaches the view", ->
      expect(atom.workspaceView.find('.jekyll-new-post')).not.toExist()

      # This is an activation event, triggering it will cause the package to be
      # activated.
      atom.workspaceView.trigger 'jekyll-new-post:new-post'

      waitsForPromise ->
        activationPromise

      runs ->
        expect(atom.workspaceView.find('.jekyll-new-post')).toExist()
        atom.workspaceView.trigger 'jekyll-new-post:new-post'
        expect(atom.workspaceView.find('.jekyll-new-post')).not.toExist()
