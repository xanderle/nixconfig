{ pkgs, lib, ... }:

let vim-maximizer = pkgs.vimUtils.buildVimPlugin {
    pname = "vim-maximizer";
    version ="2015-08-22";
    src = pkgs.fetchFromGitHub {
      owner = "szw";
      repo = "vim-maximizer";
      rev = "2e54952fe91e140a2e69f35f22131219fcd9c5f1";
      sha256 = "031brldzxhcs98xpc3sr0m2yb99xq0z5yrwdlp8i5fqdgqrdqlzr";
    };
    meta.homepage = "https://github.com/szw/vim-maximizer";
  };

in
{

  home.sessionVariables.EDITOR = "nvim";
  programs.neovim = {
    vimAlias = true;
    enable = true;
    withPython3 = true;

    plugins= with pkgs.vimPlugins; [
      {
        plugin=vimspector;
        config=''
          nnoremap <leader>m :MaximizerToggle!<CR>
          nnoremap <leader>dd :call vimspector#Launch()<CR>
          nnoremap <leader>dc :call GotoWindow(g:vimspector_session_windows.code)<CR>
          nnoremap <leader>dt :call GotoWindow(g:vimspector_session_windows.tagpage)<CR>
          nnoremap <leader>dv :call GotoWindow(g:vimspector_session_windows.variables)<CR>
          nnoremap <leader>dw :call GotoWindow(g:vimspector_session_windows.watches)<CR>
          nnoremap <leader>ds :call GotoWindow(g:vimspector_session_windows.stack_trace)<CR>
          nnoremap <leader>do :call GotoWindow(g:vimspector_session_windows.output)<CR>
          nnoremap <leader>de :call vimspector#Reset()<CR>
          
          nnoremap <leader>dtcb :call vimspector#CleanLineBreakpoint()<CR>
          
          nmap <leader>dl <Plug>VimspectorStepInto
          nmap <leader>dj <Plug>VimspectorStepOver
          nmap <leader>dk <Plug>VimspectorStepOut
          nmap <leader>d_ <Plug>VimspectorRestart
          nnoremap <leader>d<space> :call vimspector#Continue()<CR>
          
          nmap <leader>drc <Plug>VimspectorRunToCursor
          nmap <leader>dbp <Plug>VimspectorToggleBreakpoint
          nmap <leader>dcbp <Plug>VimspectorToggleConditionalBreakpoint
          fun! GotoWindow(id)
            call win_gotoid(a:id)
            MaximizerToggle
          endfun
       '';
      }
      vim-nix
      coc-nvim
      {
        plugin=coc-go;
        config=''
        autocmd BufWritePre *.go :call CocAction('runCommand', 'editor.action.organizeImport')
        '';
      }
      coc-tsserver
      coc-yaml
      coc-rls
      coc-json
      {
        plugin=coc-prettier;
        config=''
          command! -nargs=0 Prettier :CocCommand prettier.formatFile
        '';
      }
      typescript-vim
      { 
        plugin=vim-jsx-typescript;
        config=''
          " set filetypes as typescriptreact
          autocmd BufNewFile,BufRead *.tsx,*.jsx set filetype=typescriptreact
          '';
      }
      fzf-vim
      vim-tmux-navigator
      vim-dispatch
      { 
        plugin=nerdtree;
        config = '' 
          map <C-n> :NERDTreeToggle<CR>
          let g:NERDTreeGitStatusUseNerdFonts = 1
          let g:nerdtree_tabs_autoclose=0
      '';
      }
      nerdtree-git-plugin
      vim-devicons
      vim-nerdtree-syntax-highlight
      vim-maximizer
      vim-markdown-composer
      fugitive
      airline
    ];
    extraConfig = ''
      source $HOME/.config/nvim/plug-config/coc.vim
      set nocompatible
      filetype plugin indent on                        " enable filetype detection
      set tabstop=4 softtabstop=4
      set shiftwidth=4
      set expandtab
      set nowrap
      let mapleader = " "
      set relativenumber
      set nu
      set nohlsearch
      set autoread
      '';
  };
  xdg.configFile."nvim/coc-settings.json".text = ''
    {
    "rust-client.disableRustup": true,
    "diagnostic.checkCurrentLine": true,
    "languageserver": {
    "golang": {
      "command": "gopls",
      "rootPatterns": ["go.mod", ".vim/", ".git/", ".hg/"],
      "filetypes": ["go"],
      "initializationOptions": {
        "usePlaceholders": true
      }
    }
  }
    }
    '';
  xdg.configFile."nvim/plug-config/coc.vim".source= ./plug-config/coc.vim;

}
