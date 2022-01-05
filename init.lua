---@diagnostic disable-next-line: lowercase-global

-- Aliases

o = vim.o
g = vim.g
wo = vim.wo
bo = vim.bo
fn = vim.fn

exec = vim.api.nvim_exec
cmd = vim.api.nvim_command
feedkeys = vim.api.nvim_feedkeys


-- Module managing

loaded_modules = {}

function load(modules)
    if type(modules) ~= 'table' then
        modules = {modules}
    end

    if #modules == 1 then
        module = modules[1]
        loaded_modules[module] = true
        return require(module)
    end

    for _, v in ipairs(modules) do
        loaded_modules[v] = true
        require(v)
    end
end

function unload(modules)
    if type(modules) ~= 'table' then
        modules = {modules}
    end

    for _, v in ipairs(modules) do
        loaded_modules[v] = nil
        package.loaded[v] = nil
    end
end

function reload(modules)
    if type(modules) ~= 'table' then
        modules = {modules} 
    end

    for _, v in ipairs(modules) do
        loaded_modules[v] = true
        package.loaded[v] = nil
        require(v)
    end
end


-- Configs

local function configurable(tbl)
    return setmetatable(tbl, {
        __index = function(self, key)
            if self[key] ~= nil then
                return self[key]
            end

            local member = configurable({})
            self[key] = member
            return member
        end
    })
end

cfg = configurable({})


-- Packer

local function ensure_packer_installed()
	local install_path = fn.stdpath('data')..'/site/pack/packer/opt/packer.nvim'

	if fn.empty(fn.glob(install_path)) > 0 then
		cmd('!git clone https://github.com/wbthomason/packer.nvim '..install_path)
	end
end

local function add_packer()
    cmd [[packadd packer.nvim]]
    exec([[
        augroup Packer
            autocmd!
            autocmd BufWritePost plugins.lua PackerCompile
        augroup end
    ]], false)
end

ensure_packer_installed()
add_packer()

packer = require('packer')
use = packer.use


-- Utils

function map(mode, lhs, rhs, opts)
    local options = {noremap = true}
    if opts then
        for _, v in ipairs(opts) do
            options[v] = true
        end
    end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

function table.list(tbl)
    local lst = {}
    for _, v in pairs(tbl) do
        table.insert(tbl, v)
    end

    return lst
end


-- Load

load 'main'
