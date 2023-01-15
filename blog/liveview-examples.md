# Phoenix LiveView Examples
#meta datetime 2019-05-29
#meta tags[] elixir liveview empex

## Summary

[LiveView](https://github.com/phoenixframework/phoenix_live_view)
for [Phoenix](https://github.com/phoenixframework/phoenix) on [Elixir](https://github.com/elixir-lang/elixir) is definitely scratching an itch
in the world of rich client apps, without having to go full-on
client-side framework.  Here's a list of open
source projects, some with online demos and other where you can
(easily) run the code locally.

| Screenshot | Description | References |
| -- | ---| -- |
| ![Empex Display](liveview-examples/empexdisplay.jpg) | Manipulating a SVG graphic for the 2019 [Empex NY conference](https://empex.co/nyc.html) | [Empex SVG Demo](/demo/empex) <br> [Empex SVG Source](https://github.com/empex2019liveview/empexlogo) |

## Article

[LiveView](https://github.com/phoenixframework/phoenix_live_view)
for [Phoenix](https://github.com/phoenixframework/phoenix) on [Elixir](https://github.com/elixir-lang/elixir) is definitely scratching an itch
in the world of rich client apps, without having to go full-on
client-side framework.  Here's a list of open
source projects, some with online demos and other where you can
(easily) run the code locally.

Sometimes it's best to learn by examples, here goes.

| Screenshot | Description | References |
| -- | ---| -- |
| ![Ant Farm](liveview-examples/ant_farm.jpg) | A virtual ant farm where every ant was a GenServer process, simulating a basic AI behavior. Originally straightforward, it got much bigger and eventually forgotten. Finally gave the ant farm another go, this time using Elixir only. So I rolled up my sleeves, and surprisingly, four or five hours later I had the ant farm working, and this is how it was done... | [Concurrent ant farm with Elixir and Phoenix LiveView](http://codeloveandboards.com/blog/2019/03/28/concurrent-ant-farm-with-elixir-and-phoenix-liveview/), [Ant Farm Demo](https://phoenix-liveview-ant-farm.herokuapp.com/), [Ant Farm Source](https://github.com/bigardone/phoenix-liveview-ant-farm) |
| ![Erlang Observer](liveview-examples/observer.jpg) | A port of [observer_cli](https://github.com/zhongwencool/observer_cli) using [LiveView](https://github.com/phoenixframework/phoenix_live_view). The docs are clear, accurate and provide a very smooth introduction to the capabilities of this interactive server-side rendering way of doing things. | [Observer Live](https://zorbash.com/post/observer-live/), [Erlang Observer Demo](https://liveview.zorbash.com/), [Erlang Observer Source](https://github.com/zorbash/observer_live) |
| ![Markdown Editor](liveview-examples/markdown.jpg) | When a client connects to the server they are initially served some HTML content. In our case, what is initially rendered is a textarea prepopulated with some Markdown and the HTML view of that Markdown. However, this is where things get interesting. A websocket connection is opened between the client and the server. The server listens for changes in the textbox, re-renders the HTML, and sends the smallest possible change back to the client which then updates the DOM. | [Markdown Editor Demo](http://markdown.dichev.io/), [Markdown Editor Source](https://github.com/nickdichev/markdown-live) |
| ![Flappy Bird](liveview-examples/flappy_bird.jpg) | Flappy Bird Clone written in LiveView.  Some interesting files: [Live "view"](https://github.com/moomerman/flappy-phoenix/blob/master/lib/flappy_phoenix_web/live/game_live.ex), [game logic](https://github.com/moomerman/flappy-phoenix/blob/master/lib/flappy_phoenix/game.ex), [UI (leex)](https://github.com/moomerman/flappy-phoenix/blob/master/lib/flappy_phoenix_web/templates/game/index.html.leex) | [Flappy Bird Demo](https://flappy-phoenix.herokuapp.com/), [Flappy Bird Source](https://github.com/moomerman/flappy-phoenix) |
| ![Breakout](liveview-examples/breakout.jpg) | A Breakout clone written in pure Elixir, using Phoenix LiveView. | [Breakout Demo](https://breakoutex.tommasopifferi.com/), [Breakout Source](https://github.com/neslinesli93/breakoutex) |
| ![Black Jack](liveview-examples/blackjack.jpg) | A Black Jack game | [Black Jack Source](https://github.com/dorilla/live_view_black_jack) |
| ![Hippo](liveview-examples/hippo.jpg) | Hippopotamuses have been the subjects of various African folktales. According to a San story; when the Creator assigned each animal its place in nature, the hippos wanted to live in the water, but were refused out of fear that they might eat all the fish. After begging and pleading, the hippos were finally allowed to live in the water on the conditions that they would eat grass instead of fish and would fling their dung so that it can be inspected for fish bones. | [Hippo Demo](https://elegant-monstrous-planthopper.gigalixirapp.com/), [Hippo Source](https://github.com/miladamilli/hippo_game_live/) |
| ![Bear Game](liveview-examples/bear.jpg) | A little toy repo to show off a very unnecessarily fast-rendering clock, done with Phoenix LiveView. There's also a keyboard demo in here, just haven't had a chance to write it up yet, but it does have a super cute bear 🐻. | [Bear Game Demo](http://palegoldenrod-grown-ibis.gigalixirapp.com/bear_game), [Bear Game Source](https://github.com/aleph-naught2tog/live_tinkering) |
| ![Bear Necessities](liveview-examples/bear_necessities.jpg) | Another game involving a bear. | [Bear Necessities Demo](https://unbearable.nl/), [Bear Necessities Source](https://github.com/DefactoSoftware/BearNecessities) |
| ![Milwaukee Property Search](liveview-examples/property_search.jpg) | A website that allows filtering by some attributes from Milwaukee's [Master Property Record](http://city.milwaukee.gov/DownloadTabularData3496.htm?docid=3496) | [Milwaukee Property Search Demo](https://mprop.mitchellhenke.com/), [Milwaukee Property Search Source](https://github.com/mitchellhenke/mprop) |
| ![Falling Tiles](liveview-examples/falling_tiles.jpg) | Simple shares, rotate the fast-dropping puzzle pieces and create solid lines — which then disappear. Rince and Repeat. | [Falling Tiles Demo](https://falling-tiles.angelika.me/), [Falling Tiles Source](https://github.com/angelikatyborska/falling_blocks) |
| ![Wikipedia LiveView](liveview-examples/wikipedia.jpg) | Wikipedia LiveView, a little demo to test out some phoenix_live_view features using the SSE provided from the [wikimedia Kafka clusters](https://wikitech.wikimedia.org/wiki/Event_Platform/EventStreams). | [Wikipedia LiveView Source](https://github.com/fklement/wikipedia_live_view) |
| ![Undo](liveview-examples/undo.jpg) | A simple pattern for support an undo feature. | [Undo Source](https://github.com/joerichsen/phoenix_live_view_example/blob/undo_example/lib/demo_web/live/undo_live.ex) |
| ![Logic Simulator](liveview-examples/logic_simulator.jpg) | Simulating Logic Gates Switches and Lightbulbs. | [Logic Simulator Source](https://github.com/TheFirstAvenger/logic_sim_liveview) |
| ![Doom's Fire](liveview-examples/dooms_fire.jpg) | DOOM fire animated from server side. Made with [Phoenix LiveView](https://github.com/phoenixframework/phoenix_live_view). Based on [Doom fire algorithm](https://github.com/filipedeschamps/doom-fire-algorithm) | [Doom's Fire Demo](https://elixir-doom-fire.herokuapp.com/), [Doom's Fire Source](https://github.com/allmonty/elixir-live-doom-fire) |
| ![SVG Editor](liveview-examples/svgeditor.jpg) | SVG Editor | [SVG Editor Demo](https://showoff.riesd.com/), [SVG Editor Source](https://github.com/mmmries/showoff) |
| ![Calculator](liveview-examples/calculator.jpg) | A simple calculator written in LiveView. | [Calculator Source](https://github.com/smeade/phoenix_live_view_example/blob/master/lib/demo_web/live/calc_live/index.ex) |
| ![Pixels with Frenemies](liveview-examples/pixels_with_frenemies.jpg) | Simple app to see how easy it would be to expand the demo apps to real-time collaboration. Spoiler: it was easy, in 1 day. Now just select a color and paint the canvas! | [Pixels with Frenemies Demo](https://stormy-earth-96381.herokuapp.com/collaborative_canvas), [Pixels with Frenemies Source](https://github.com/JohnB/phoenix_live_view_example) |
| ![Load Generator](liveview-examples/load_generator.jpg) | Synthetic load generator + ad-hoc scheduler observer powered by LiveView | [Load Generator Source](https://github.com/sasa1977/demo_system/tree/replace-js-with-live-view) |
| ![Sea Battle](liveview-examples/sea_battle.jpg) | Sea Battle game (require "registration") | [Sea Battle Demo](https://radiant-plateau-73240.herokuapp.com/), [Sea Battle Source](https://github.com/Sanchos01/Phoenix-Sea-Battle) |
| ![Bluetooth Low Energy Heart Rate Sensor](liveview-examples/bluetooth_low_energy_heart_rate_senor.jpg) | Bluetooth Low Energy Heart Rate Sensor that gets [Bluetooth Low Energy's](https://www.w3.org/community/web-bluetooth/) heart rate sensor data, and presents the results using LiveView. | [Bluetooth Low Energy Heart Rate Sensor Source](https://github.com/khamada611/ble_live_sample) |
| ![Bike Comapare](liveview-examples/bike_compare.jpg) | Bike Comparison tool written in LiveView | [Bike Source](https://gist.github.com/andrielfn/6bbf0bf7fa644bfad304752bfae081f9) |
| ![Adventure Capitalist](liveview-examples/adventure_capitalist.jpg) | A very simple implementation of [Adventure Capitalist](https://en.wikipedia.org/wiki/AdVenture_Capitalist) | [Adventure Capitalist Source](https://github.com/eteubert/open_adventure_capitalist) |
| ![Phoenix Live Examples](liveview-examples/examples.jpg) | A collection of examples including: thermostat, snake, autocomplete search, image editor, clock, pacman, rainbow, counter, "top", CRUD (users), presence | [Phoenix Live Examples Source](https://github.com/chrismccord/phoenix_live_view_example) |
| ![Table Sort](liveview-examples/tablesort.jpg) | Table Sort in LiveView | [Phoenix Table Sort Source](https://github.com/joerichsen/phoenix_live_view_example/blob/table_example/lib/demo_web/live/table_live.ex) |
| ![Table Filter](liveview-examples/table_filter.jpg) | Table Filter in LiveView | [Table Filter Article](https://medium.com/@imartinat/table-filter-with-phoenix-liveview-cb30508e9fc0), [Table Filter Source](https://github.com/imartinat/phoenix_live_view_tablefilter) |
| ![Table Editing](liveview-examples/table_editing.jpg) | Table Editing in LiveView | [Table Editing Source](https://github.com/hurty/phoenix_live_view_example/blob/master/lib/demo_web/live/tables_live.ex) |
| ![Elixir Match](liveview-examples/match.jpg) | Elixir Match is an online version of the memory card game. | [Elixir Match Source](https://github.com/toranb/elixir-match), [Elixir Match LiveView Commit](https://github.com/toranb/elixir-match/commit/bac39b8da84f3e672021e9d168589204a3a7682d) |
| ![Empex Display](liveview-examples/empexdisplay.jpg) | Manipulating a SVG graphic for the 2019 [Empex NY conference](https://empex.co/nyc.html) | [Empex SVG Demo](/demo/empex), [Empex SVG Source](https://github.com/empex2019liveview/empexlogo) |
| ![Hangman](liveview-examples/hangman.jpg) | Impleneting a LiveView UI for Dave Thomas' DIET implementation of hangman [Empex NY conference](https://empex.co/nyc.html) | [Hangman Demo](/demo/hangman), [Hangman Source](https://github.com/empex2019liveview/hangman) |
| ![Towers of Hanoi](liveview-examples/hanoi.jpg) | Impleneting a LiveView UI for the Towers of Hanoi game | [Towers of Hanoi Demo](/demo/hanoi), [Towers of Hanoi Source](https://github.com/empex2019liveview/hanoi) |
| ![LiveView Chat](liveview-examples/chat.jpg) | Tracking Users in a Chat App with LiveView, PubSub Presence | [Chat App Article](https://elixirschool.com/blog/live-view-with-presence/), [Chat App (Elixir School) Source](https://github.com/elixirschool/live-view-chat), [PHAT Chat Source](https://github.com/SophieDeBenedetto/phat) |
| ![Another LiveView Chat](liveview-examples/real_time_chat.jpg) | Another LiveView Chat | [Real-Time Chat Demo (Video)](https://www.dropbox.com/s/nvr1f2tkmyo41kr/live_chat.mp4), [Real-Time Chat Source](https://github.com/CassiusPacheco/live_chat), [Based On Source](https://github.com/dwyl/phoenix-chat-example) |
| ![Search Debounce](liveview-examples/debounce.jpg) | Phoenix Live View Debounce | [Phoenix Live View Debounce Article](https://dev.to/tizpuppi/phoenix-live-view-debounce-4icf) |
| ![Blast](liveview-examples/blast.jpg) | Blast Game | [Blast Demo](https://blast.alembic.com.au/), [Blast Source](https://github.com/team-alembic/lambdajam-blast) |
| ![Kanban Board](liveview-examples/kanban_board.jpg) | Kanban Board | [Kanban Board Demo](https://phoenix-live-view-kanban-board.herokuapp.com/), [Kanban Board Source](https://github.com/amberbit/board) |
| ![Boggle Game (Soup)](liveview-examples/soup.jpg) | Boggle Game called Soup | [Soup Boggle Demo](https://lettersoup.herokuapp.com/), [Soup Boggle Source](https://github.com/martinstannard/soup) |
| ![Tech Trivia Game](liveview-examples/trivia.jpg) | Tech Trivia | [Trivia Demo](https://phx-trivia.gigalixirapp.com/), [Trivia Source](https://github.com/ramortegui/phoenix_trivia) |
| ![Timer Compared To Node](liveview-examples/compare_node.jpg) | Timer Comparison Node to LiveView | [Node Timer Demo](http://nodeservertime.herokuapp.com/), [LiveView Timer Demo](https://phoenixliveviewtime.herokuapp.com/) |
| ![Rubular Regex Parser](liveview-examples/rubular.jpg) | Rubular Regex Parser | [Rubular Source](https://github.com/ckampfe/rere/blob/master/lib/rere_web/live/rere_live.ex) |
| ![Displays IMU data using Phoenix LiveView](liveview-examples/moving_imu.jpg) | Displays IMU data using Phoenix LiveView | [IMU Data Demo (Video)](https://twitter.com/joshnuss/status/1114761613985353728), [IMU Data Source](https://github.com/joshnuss/live_imu) |
| ![Calendar](liveview-examples/calendar.jpg) | Calendar | [Calendar Source](https://github.com/nicolasblanco/booking_calendar/blob/master/lib/booking_calendar_web/live/calendar_live.ex) |
| ![Kubernetes Dashboard](liveview-examples/kubernetes.jpg) | Kubernetes Dashboard | [Kubernetes Dashboard Demo (Video)](https://www.youtube.com/watch?v=vOaZ_AspfKc) |
| ![UX Keypad](liveview-examples/ux_keypad.jpg) | UX Keypad | [UX Keypad Source](https://gist.github.com/ponyesteves/372cf186665ab464413096fd3855f0ca) |
| ![Visualizing Functional Data Structures with LiveView](liveview-examples/functional_data_structures.jpg) | Visualizing Functional Data Structures with LiveView | [Functional Data Structures Source](https://github.com/zkayser/pfds_visualizations) |
| ![TODO App in LiveView](liveview-examples/todo.jpg) | TODO App | [TODO App Source](https://github.com/smeade/phoenix_live_view_example_todos) |
| ![Conways Game of Life](liveview-examples/conway_game_of_life.jpg) | Conways Game of Life | [Conways Game of Life Demo](https://github.com/horneber/phoenix-lifeview-conway) [Conways Game of Life Source](https://github.com/horneber/phoenix-lifeview-conway) |


### Articles

Below are a variety of articles on LiveView from mange perspectives.

* [Walk-Through of Phoenix LiveView](https://elixirschool.com/blog/phoenix-live-view/)
* [Swapping React for Phoenix LiveView](https://medium.com/qixxit-development/swapping-react-for-phoenix-liveview-db6581f27a14)
* [A Story of Phoenix LiveView: Writing a CRUD Application](https://itnext.io/a-story-of-phoenix-liveview-writing-a-crud-application-d938e52894d4)
* [Elixir Phoenix LiveView with a real world example](http://jypepin.com/elixir-phoenix-liveview-with-a-real-world-example)
* [Real World Phoenix |> A LiveView Dashboard](https://www.theguild.nl/real-world-phoenix-of-groter-dan-a-liveview-dashboard/)
* [Phoenix LiveView Impressions](https://haughtcodeworks.com/blog/software-development/elixir-phoenix-liveview/)
* [Phoenix LiveView: Interactive, Real-Time Apps. No Need to Write JavaScript](https://dockyard.com/blog/2018/12/12/phoenix-liveview-interactive-real-time-apps-no-need-to-write-javascript)
* [Talking to the LiveView](https://medium.com/@iacobson/talking-to-the-liveview-7a19f7e45522)
* [Reactor, a LiveView library for Django](https://github.com/edelvalle/reactor)

### Videos

#### Chris McCord Keynote: ElixirConf 2018 (LiveView Sneak Peak)

[![Chris McCord Keynote: ElixirConf 2018 (LiveView Sneak Peak)](liveview-examples/video_elixirconf_2018_chrismccord.jpg)](https://www.youtube.com/watch?feature=player_embedded&v=Z2DU0qLfPIY)

#### Chris McCord Keynote: ElixirConf EU 2019 (LiveView Released)

[![Chris McCord Keynote: Code Sync 2019 (LiveView Released)](liveview-examples/video_elixirconfeu_2019_chrismccord.jpg)](https://www.youtube.com/watch?feature=player_embedded&v=8xJzHq8ru0M)

#### How to Create a Counter with Phoenix LiveView

[![How to Create a Counter with Phoenix LiveView](https://img.youtube.com/vi/2bipVjOcvdI/0.jpg)](https://dennisbeatty.com/2019/03/19/how-to-create-a-counter-with-phoenix-live-view.html)

#### How to Create a Todo List with Phoenix LiveView

[![How to Create a Todo List with Phoenix LiveView](https://img.youtube.com/vi/qpaFivCmJOY/0.jpg)](https://dennisbeatty.com/2019/04/24/how-to-create-a-todo-list-with-phoenix-liveview.html)

#### Integrating Phoenix LiveView

[![Integrating Phoenix LiveView](https://img.youtube.com/vi/FfpRBh2kWCI/0.jpg)](https://blog.smartlogic.io/integrating-phoenix-liveview/)

#### Live Coding LiveView w/ Bruce Tate

[![Live Coding LiveView w/ Bruce Tate](https://img.youtube.com/vi/-wzabRyc-0M/0.jpg)](https://www.youtube.com/watch?feature=player_embedded&v=-wzabRyc-0M)

#### Getting Started With Phoenix LiveView 3 Parts (Elixircasts)

[![Getting Started With Phoenix LiveView Part 1 (Free)](liveview-examples/video_elixircasts_part1.jpg)](https://elixircasts.io/phoenix-liveview-part-1)

[![Getting Started With Phoenix LiveView Part 2 (Subscription)](liveview-examples/video_elixircasts_part2.jpg)](https://elixircasts.io/phoenix-liveview-part-2)

[![Getting Started With Phoenix LiveView Part 3 (Subscription)](liveview-examples/video_elixircasts_part3.jpg)](https://elixircasts.io/phoenix-liveview-part-3)


#### Setup Phoenix Live View

[![Setup Phoenix Live View](https://img.youtube.com/vi/5PWUTABsCmQ/0.jpg)](https://www.youtube.com/watch?feature=player_embedded&v=5PWUTABsCmQ)

#### Phoenix Live View in action

[![Phoenix Live View in action](https://img.youtube.com/vi/vHKSY5dLK5Y/0.jpg)](https://www.youtube.com/watch?feature=player_embedded&v=vHKSY5dLK5Y)


### Audios

* [Elixir Talk - Episode 141 - More LiveView Stuff and Desmond Wants to Work With You](https://soundcloud.com/elixirtalk/episode-141-more-liveview-stuff-and-desmond-wants-to-work-with-you)

### Other Curated Lists

List of Lists is fun.  Here are a few other places where LiveView lists are being maintained.

| Name | URL |
| --- | --- |
| [Tefter](https://tefter.io) | [Phoenix LiveView Examples](https://tefter.io/zorbash/lists/phoenix-liveview-examples) |
| [Leandro Cesquini Pereira](https://medium.com/@leandrocesquini) | [Phoenix Liveview Collection](https://medium.com/@leandrocesquini/phoenix-liveview-collection-8259f35ff2b0) |
| [Darin Wilson](https://shift.infinite.red/@darinw) | [Phoenix LiveView Round-Up: The Story So Far](https://shift.infinite.red/phoenix-liveview-round-up-the-story-so-far-3cbb1648e940) |

