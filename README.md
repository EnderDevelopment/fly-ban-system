# Fly Ban System

Toggle fly mode and ban players in your FiveM server

## Features

- Toggle fly mode with a command
- Ban players with a command and reason

## Requirements

- FiveM server
- ESX Framework
- MySQL database

## Installation

1. Download the script
2. Place the script in your FiveM server's resources folder
3. Add `start FlyBanSystem` to your server.cfg
4. Run the database.sql file to create the necessary tables

## Usage

### Commands

| Command | Description | Permission |
|---------|-------------|------------|
| /fly | Toggle fly mode | admin.fly |
| /ban [playerId] [reason] | Ban a player | admin.ban |

### Permissions

- `admin.fly` - Allows the player to use the /fly command
- `admin.ban` - Allows the player to use the /ban command

## Configuration

Edit the `config.lua` file to customize the commands and permissions.

---

## Generated with EnderDevelopment

This plugin was generated in minutes with [EnderDevelopment](https://enderdevelopment.com) — the AI platform that turns your ideas into working Minecraft plugins, Discord bots and FiveM scripts.

**Want your own?** [Generate this project on EnderDevelopment](https://dash.enderdevelopment.com?utm_source=github&utm_medium=readme&utm_campaign=fly-ban-system&utm_content=bottom) — describe it in one sentence and get the full source code.