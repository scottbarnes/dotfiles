local M = {}
M.attach_python_debugger = function(args)
  local dap = require "dap"
  local host = args[1] -- This should be configured for remote debugging if your SSH tunnel is setup.
  -- You can even make nvim responsible for starting the debugpy server/adapter:
  --  vim.fn.system({"${some_script_that_starts_debugpy_in_your_container}", ${script_args}})
  pythonAttachAdapter = {
    type = "server";
    host = host;
    port = tonumber(3000);
  }
  pythonAttachConfig = {
    type = "python";
    request = "attach";
    connect = {
      port = tonumber(3000);
      host = host;
    };
    mode = "remote";
    name = "Remote Attached Debugger";
    cwd = vim.fn.getcwd();
    pathMappings = {
      {
        localRoot = vim.fn.getcwd(); -- Wherever your Python code lives locally.
        remoteRoot = "/openlibrary"; -- Wherever your Python code lives in the container.
      };
    };
  }
  local session = dap.attach(host, tonumber(3000), pythonAttachConfig)
  if session == nil then
    io.write("Error launching adapter");
  end
  dap.repl.open()
end

return M
