# Sass style include
presass_include = postcss.plugin 'presass_include', ->
  return (css, result) ->

    # Single line includes
    css.eachDecl (decl) ->

      # Store prop
      prop = decl.prop

      # If declaration starts with a '+'
      if prop[0] == '+'

        # Replace '+' with '@include'
        decl.prop = '@include ' + prop.slice(1)

        # Store value
        value = decl.value

        # If declaration has arguments
        if value

          # Clean arguments
          args = value
            .replace(/\s\s+/, ' ')     # Remove duplicate spaces
            .replace(/^\s+|\s+$/g, '') # Remove leading and trailing spaces

          # Output declaration
          decl.value = '(' + args + ')'
          decl.between = ''

    # Includes with content
    css.eachRule (rule) ->

      # Store selector
      selector = rule.selector

      # If selector starts with a '+'
      if selector[0] == '+'

        # Replace '+' with '@include'
        rule.selector = '@include ' + selector.slice(1)

        # Store index of ':'
        colon = rule.selector.indexOf(':')

        # If selector has arguments
        if colon != -1
          selector = rule.selector

          # Separate name from arguments
          name = selector.slice(0, colon)
          args = selector.slice(colon + 1)

          # Clean arguments
          args = args
            .replace(/\s\s+/, ' ')     # Remove duplicate spaces
            .replace(/^\s+|\s+$/g, '') # Remove leading and trailing spaces

          # Output selector
          rule.selector = name + '(' + args + ')'
