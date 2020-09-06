# SensorPi

In order to build nerves system on OS X both folders `/var/folders`
and `/private/var/folders` must be shared in Docker. Since Docker UI
on OS X does not allow setting both (`/var/folders`) cannot be
selected configuration file `/Library/Group\
Containers/group.com.docker/settings.json` must be edited and following two lines

```
   “\/var\/folders”,
   “\/private\/var\/folders”
```

must be added to `filesharingDirectories`.

Further, build is done here, customized Nerves version is expected to
be in `../dht_rpi3` folder as is visible in file `mix.exs` in the
`deps` function where `nerves_system_dht_rpi3` dependency is set.

Basically steps are following

  * In the `dht_rpi3` folder fetch changes from upstream with `git
    fetch upstream` and merge them to master
  * In this project in `mix.exs` file adjust versions for
    `nerves_system_rpi3` if needed
  * Run `WIFI_SSID=<wifi_network_name> WIFI_PSK=<wifi_password>
    MIX_TARGET=dht_rpi3 mix firmware` to build firmware
  * Run `WIFI_SSID=<wifi_network_name> WIFI_PSK=<wifi_password>
    MIX_TARGET=dht_rpi3 ./upload.sh <rpi_ip_address>` to upload
    firmware

## Targets

Nerves applications produce images for hardware targets based on the
`MIX_TARGET` environment variable. If `MIX_TARGET` is unset, `mix` builds an
image that runs on the host (e.g., your laptop). This is useful for executing
logic tests, running utilities, and debugging. Other targets are represented by
a short name like `rpi3` that maps to a Nerves system image for that platform.
All of this logic is in the generated `mix.exs` and may be customized. For more
information about targets see:

https://hexdocs.pm/nerves/targets.html#content

## Getting Started

To start your Nerves app:
  * `export MIX_TARGET=my_target` or prefix every command with
    `MIX_TARGET=my_target`. For example, `MIX_TARGET=rpi3`
  * Install dependencies with `mix deps.get`
  * Create firmware with `mix firmware`
  * Burn to an SD card with `mix firmware.burn`

## Learn more

  * Official docs: https://hexdocs.pm/nerves/getting-started.html
  * Official website: https://nerves-project.org/
  * Forum: https://elixirforum.com/c/nerves-forum
  * Discussion Slack elixir-lang #nerves ([Invite](https://elixir-slackin.herokuapp.com/))
  * Source: https://github.com/nerves-project/nerves
