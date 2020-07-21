# Run Custom JS on LivePage Reload
#meta sort 2019-05-20
#meta tags[] elixir liveview empex
### May 20, 2019

In your LiveView LEEX, you can add a `script` tag and append a `@tick` to the `id`.
This will force for the MorphDOM differ to always re-render (aka re-run) that code on the client.

![Create a script with tick ID](/anunknown/assets/static/images/custom_js_liveview/script_id_with_tick.png?raw=true)
