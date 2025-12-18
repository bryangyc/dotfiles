-- Enable Windows clipboard ONLY when running inside WSL
if vim.fn.has("wsl") == 1 then
  -- Prevent LazyVim from picking wl-copy due to leaked Wayland env vars
  vim.env.WAYLAND_DISPLAY = nil
  vim.env.XDG_SESSION_TYPE = nil

  vim.g.clipboard = {
    name = "win32yank (WSL)",
    copy = {
      ["+"] = "win32yank.exe -i --crlf",
      ["*"] = "win32yank.exe -i --crlf",
    },
    paste = {
      ["+"] = "win32yank.exe -o --lf",
      ["*"] = "win32yank.exe -o --lf",
    },
    cache_enabled = 0,
  }
end
