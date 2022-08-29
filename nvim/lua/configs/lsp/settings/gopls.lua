return {
  settings = {
    gopls = {
      analyses = {
        unusedparams = true,
        shadow = true,
        unusedvariable = true,
      },
      buildFlags = {
        '-tags=wireinject',
      },
      hints = {
        assignVariableTypes = true,
        compositeLiteralFields = true,
        compositeLiteralTypes = true,
        constantValues = true,
        functionTypeParameters = true,
        parameterNames = true,
        rangeVariableTypes = true,
      },
    },
  },
}
