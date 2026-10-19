local M = {}

function M.setup()
  local requests = {}
  local group = vim.api.nvim_create_augroup("CodeCompanionFidget", { clear = true })

  local function finish(id, message)
    local request = requests[id]
    if not request then
      return
    end
    request.handle:report({ message = message })
    request.handle:finish()
    requests[id] = nil
  end

  vim.api.nvim_create_autocmd("User", {
    group = group,
    pattern = "CodeCompanionRequest*",
    callback = function(event)
      local data = event.data or {}
      if not data.id then
        return
      end

      if event.match == "CodeCompanionRequestStarted" then
        require("config.lazy").load({ "fidget.nvim" }, "config.fidget")
        finish(data.id, "Replaced")
        local adapter = data.adapter or {}
        requests[data.id] = {
          bufnr = data.bufnr,
          handle = require("fidget.progress").handle.create({
            title = adapter.formatted_name or adapter.name or "Request",
            message = "Working…",
            lsp_client = { name = "CodeCompanion" },
          }),
        }
      elseif event.match == "CodeCompanionRequestStreaming" then
        if requests[data.id] then
          requests[data.id].handle:report({ message = "Receiving response…" })
        end
      elseif event.match == "CodeCompanionRequestFinished" then
        local message = "Complete"
        if data.status == "error" then
          message = "Failed"
        elseif data.status == "cancelled" or data.status == "canceled" then
          message = "Cancelled"
        elseif data.status and data.status ~= "success" then
          message = tostring(data.status)
        end
        finish(data.id, message)
      end
    end,
  })

  vim.api.nvim_create_autocmd("User", {
    group = group,
    pattern = { "CodeCompanionChatStopped", "CodeCompanionChatClosed" },
    callback = function(event)
      local bufnr = (event.data or {}).bufnr
      if not bufnr then
        return
      end
      for id, request in pairs(requests) do
        if request.bufnr == bufnr then
          finish(id, "Cancelled")
        end
      end
    end,
  })
end

return M
