local function get_file_name(file)
  return file:match("[^/]*.lua$")
end

local function get_file_folder(filePath, relativePathOfThisFile)
  local filename = get_file_name(filePath)
  if filename == 'init.lua' then
    return relativePathOfThisFile .. '.'
  else
    local folderOfThisFile = relativePathOfThisFile:match("(.-)[^%.]+$")
    return folderOfThisFile
  end
end

return get_file_folder
