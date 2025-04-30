return
{
  -- FZF for Windows
  { "junegunn/fzf",                             build = "powershell -exec bypass ./install.ps1" },
  { "junegunn/fzf.vim" },
  { "nvim-telescope/telescope-fzf-native.nvim", build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build", dependencies = { "nvim-telescope/telescope.nvim" } }
}
