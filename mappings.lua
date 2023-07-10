---@type MappingsTable
local M = {}

M.general = {
  n = {
    [";"] = { ":", "enter command mode", opts = { nowait = true } },
    ["<leader>h"] = { "<cmd> nohlsearch <CR>", "Stop highlighting"},
  },
}

M.nvterm = {
  n = {
    ["<leader>gg"] = {
      function()
        local term = require("nvterm.terminal").new "float"
        vim.api.nvim_chan_send(term.job_id, "lazygit\n")
      end,
      "lazy git",
    },
  },
}

M.dap = {
  n = {
    ["<leader>db"] = {
      function()
        require("dap").toggle_breakpoint()
      end,
      "Set breakpoint",
    },
    ["<leader>dc"] = {
      function()
        require("dap").continue()
      end,
      "Continue",
    },
    ["<leader>di"] = {
      function()
        require("dap").step_into()
      end,
      "Step into",
    },
    ["<leader>do"] = {
      function()
        require("dap").step_over()
      end,
      "Step over",
    },
    ["<leader>ds"] = {
      function()
        require("dapui").toggle()
      end,
      "Toggle DAP UI",
    },
  },
}

M.hop = {
  n = {
    ["<S-q>"] = { "<cmd> HopLineStart <CR>", "Hop to line"},
    ["<S-w>"] = { "<cmd> HopWord <CR>", "Hop to word"},
  }
}

-- more keybinds!

return M
