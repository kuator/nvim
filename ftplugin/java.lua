local status_ok, jdtls = pcall(require, "jdtls")

if not status_ok then
  return
end

-- TODO https://github.com/mfussenegger/nvim-jdtls/discussions/187
-- TODO https://github.com/eclipse-jdtls/eclipse.jdt.ls/issues/1746
local config = {
  cmd = { vim.fn.stdpath("data") .. '/mason/bin/jdtls' },
  root_dir = vim.fs.dirname(vim.fs.find({ '.gradlew', '.git', 'mvnw' }, { upward = true })[1]),
  settings = {
    java = {
      completion = {
        overwrite = true
      },
      codeGeneration = {
        generateComments = true,
        useBlocks = true,
        toString = {
          template = "${object.className}{${member.name()}=${member.value}, ${otherMembers}}"
        }
      },
      templates = {
      fileHeader = {
          "/**",
          " * @author: ${user}",
          " * @date: ${date}",
          " * @description: ${file_name}",
          " */",
      },
      typeComment = {
          "/**",
          " * @author: ${user}",
          " * @date: ${date}",
          " * @description: ${type_name}",
          " */",
      }
      },
    }
  }
}


jdtls.start_or_attach(config)
