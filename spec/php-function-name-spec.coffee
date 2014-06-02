{WorkspaceView} = require 'atom'
PhpFunctionName = require '../lib/php-function-name'

# Use the command `window:run-package-specs` (cmd-alt-ctrl-p) to run specs.
#
# To run a specific `it` or `describe` block add an `f` to the front (e.g. `fit`
# or `fdescribe`). Remove the `f` to unfocus the block.

describe "PhpFunctionName", ->
  activationPromise = null

  beforeEach ->
    atom.workspaceView = new WorkspaceView
    activationPromise = atom.packages.activatePackage('php-function-name')

  describe "when the php-function-name:toggle event is triggered", ->
    it "attaches and then detaches the view", ->
      expect(atom.workspaceView.find('.php-function-name')).not.toExist()

      # This is an activation event, triggering it will cause the package to be
      # activated.
      atom.workspaceView.trigger 'php-function-name:toggle'

      waitsForPromise ->
        activationPromise

      runs ->
        expect(atom.workspaceView.find('.php-function-name')).toExist()
        atom.workspaceView.trigger 'php-function-name:toggle'
        expect(atom.workspaceView.find('.php-function-name')).not.toExist()
