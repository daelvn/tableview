# Tableview

<a href="https://discord.gg/Y75ZXrD"><img src="https://img.shields.io/static/v1?label=discord&message=chat&color=brightgreen&style=flat-square"></a> 
![GitHub stars](https://img.shields.io/github/stars/daelvn/tableview?style=flat-square)
![GitHub tag (latest SemVer pre-release)](https://img.shields.io/github/v/tag/daelvn/tableview?include_prereleases&label=release&style=flat-square)
![LuaRocks](https://img.shields.io/luarocks/v/daelvn/tableview?style=flat-square)

Tableview is a very small Lua module that lets you dump tables into HTML so you can inspect them on your web browser with syntax highlighting and collapsible tables.

![Preview](.github/preview.png)

## Install

You can install `tableview` via LuaRocks:

```sh
$ luarocks install tableview
```

## Usage

The module returns a table that contains a single function: `generate`. It takes a table and returns an HTML string.

You can also use the CLI utility that reads a Lua table from STDIN and outputs the HTML (installed as `tableview`).

## License

This project is Unlicensed.