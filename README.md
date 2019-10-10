# Skydive Collectd plugin

This packages implements a Collectd plugin that will send Collectd metrics to Skydive Agent.
Currently the metrics will reported on the `Host` node under the sub key `Collectd`.

# Installation

In order to compile the `Skydive Collectd plugin` one need to have the [Collectd sources](https://github.com/collectd/collectd).

```
export COLLECTD_SRC=/tmp/collectd

git clone https://github.com/collectd/collectd $COLLECTD_SRC

mkdir -p $GOPATH/src/github.com/skydive-project
git clone https://github.com/skydive-project/skydive-collectd-plugin.git \
  $GOPATH/src/github.com/skydive-project/skydive-collectd-plugin
cd $GOPATH/src/github.com/skydive-project/skydive-collectd-plugin

make
```

This will generate a shared object (`skydive.so`) that can be placed in the collectd plugin folder.

# Configuration

```
LoadPlugin skydive
<Plugin skydive>
    Address "127.0.0.1:8081"
    Username ""
    Password ""
</Plugin>
```

The address has to be the Skydive Agent `listen` address.

## Get involved

* Weekly meeting
    * [General - Weekly Hangout meeting](https://hangouts.google.com/call/TVzTtJpcW6BhSRhXgQNBAEEI) - every Thursday at 10:30 - 11:30 AM CEST
    * [Minutes](https://docs.google.com/document/d/1eri4vyjmAwxiWs2Kp4HYdCUDWACF_HXZDrDL8WcPF-o/edit?ts=5d946ad5#heading=h.g8f8gdfq0un9)

* Slack
    * https://skydive-project.slack.com

## Contributing

Your contributions are more than welcome. Please check
https://github.com/skydive-project/skydive/blob/master/CONTRIBUTING.md
to know about the process.

## License

This software is licensed under the Apache License, Version 2.0 (the
"License"); you may not use this software except in compliance with the
License.
You may obtain a copy of the License at http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
