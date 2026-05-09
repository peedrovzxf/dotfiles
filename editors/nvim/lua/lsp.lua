vim.lsp.config("lua_ls", {
    cmd = { 'lua-language-server' },
    filetypes = { 'lua' },
    root_markers = {
        '.luarc.json',
        '.luarc.jsonc',
        '.luacheckrc',
        '.stylua.toml',
        'stylua.toml',
        'selene.toml',
        'selene.yml'
    }
})
vim.lsp.enable("lua_ls")

vim.lsp.config("clangd", {
    cmd = {
        'clangd',
        '--clang-tidy',
        '--background-index',
        '--offset-encoding=utf-8',
    },
    root_markers = { '.clangd', 'compile_commands.json' },
    filetypes = { 'c', 'cpp' },
})

vim.lsp.enable("clangd")

vim.lsp.config("pyright", {
    cmd = { "pyright-langserver", "--stdio" },
    filetypes = { "python" },
    root_markers = { "pyproject.toml", "setup.py", "requirements.txt", ".git", ".venv" },
    settings = {
        python = {
            analysis = { autoSearchPaths = true, useLibraryCodeForTypes = true }
        }
    }
})

vim.lsp.enable("pyright")

vim.lsp.config("rust_analyzer", {
    cmd = { 'rust-analyzer' },
    root_markers = { 'Cargo.toml' },
    filetypes = { 'rust' },
    settings = {
        ['rust-analyzer'] = {
            checkOnSave = true,
        },
    },
})

vim.lsp.enable('rust_analyzer')

vim.lsp.config("intelephense", {
    cmd = { "intelephense", "--stdio" },
    filetypes = { "php" },
    root_markers = {
        "plugin.yml"
    },
    settings = {
        intelephense = {
            files = {
                max_size = 1000000,
            },
            environment = {
                includePaths = { "/home/peedrovzxf/dev/pm-dev/server/src/" },
                phpVersion = "7.0.3"
            },
            stubs = {
                "apache", "bcmath", "bz2", "calendar", "com_dotnet", "Core", "ctype", "curl", "date",
                "dba", "dom", "enchant", "exif", "FFI", "fileinfo", "filter", "fpm", "ftp", "gd", "gettext",
                "gmp", "hash", "iconv", "imap", "intl", "json", "ldap", "libxml", "mbstring", "meta", "mysqli",
                "oci8", "odbc", "openssl", "pcntl", "pcre", "PDO", "pdo_ibm", "pdo_mysql", "pdo_pgsql", "pdo_sqlite",
                "pgsql",
                "Phar", "posix", "pspell", "readline", "Reflection", "session", "shmop", "SimpleXML", "snmp", "soap",
                "sockets", "sodium", "SPL", "sqlite3", "standard", "superglobals", "sysvmsg", "sysvsem", "sysvshm",
                "tidy",
                "tokenizer", "xml", "xmlreader", "xmlrpc", "xmlwriter", "xsl", "Zend OPcache", "zip", "zlib",
                "wordpress", "phpunit",
            },
            diagnostics = {
                enable = true,
            },
            format = {
                enable = true
            }
        }
    }
})

vim.lsp.enable("intelephense")

vim.lsp.config("gopls", {
    cmd = { "gopls" },
    filetypes = { "go", "gomod", "gowork" },
    root_markers = { "go.mod", "go.work", ".git" },
    settings = {
        gopls = {
            gofumpt = true,
            staticcheck = true,
            completeUnimported = true,
        }
    }
})

vim.lsp.enable("gopls")

vim.lsp.config("ts_ls", {
    cmd = { "typescript-language-server", "--stdio" },
    filetypes = { "typescript", "typescriptreact", "javascript", "javascriptreact" },
    root_markers = { "tsconfig.json", "jsconfig.json", "package.json", ".git" },
    settings = {
        typescript = {
            inlayHints = {
                includeInlayParameterNameHints = "all",
                includeInlayReturnTypeHints = true,
                includeInlayVariableTypeHints = true,
            },
        },
        javascript = {
            inlayHints = {
                includeInlayParameterNameHints = "all",
                includeInlayReturnTypeHints = true,
            },
        },
    },
})

vim.lsp.enable("ts_ls")

vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup("UserLspConfig", {}),
    callback = function()
        print("LSP Attached")
    end
})

vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = "*",
    callback = function(args)
        vim.lsp.buf.format({ bufnr = args.buf, async = false })
        require("fidget").notify("Formatting file.")
    end,
})
