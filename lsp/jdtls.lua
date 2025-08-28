return {
  cmd = { "jdtls" },
  settings = {
    java = {
      completion = {
        overwrite = true,
      },
      codeGeneration = {
        generateComments = true,
        useBlocks = true,
        toString = {
          template = "${object.className}{${member.name()}=${member.value}, ${otherMembers}}",
        },
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
        },
      },
    },
  },
}
