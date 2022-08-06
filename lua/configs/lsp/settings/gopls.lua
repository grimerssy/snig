return {
  settings = {
    gopls = {
      allExperiments = true,
      analyses = {
        unusedparams = true,
        shadow = true,
        unusedvariable = true,
      },
      gofumpt = true,
      staticcheck = true,
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
