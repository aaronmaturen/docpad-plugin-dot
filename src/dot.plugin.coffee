# Export Plugin
module.exports = (BasePlugin) ->
    # Define Plugin
    class dotPlugin extends BasePlugin
        # Plugin name
        name: 'dot'

        # Render some content
        render: (opts,next) ->
            # Prepare
            {inExtension,templateData} = opts

            # Check extensions
            if inExtension is 'dot'
                # Requires
                dot = require('dot')

                # Render
                render = dot.template(opts.content)

                opts.content = render(templateData)

            # Done, return back to DocPad
            return next()