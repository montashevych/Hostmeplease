require.context('../images', true)
import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import '../js/bootstrap_js_files.js'
// import '../js/newplace.js.erb'
import "javascript/channels"
import L from 'leaflet'
import 'leaflet/dist/leaflet.css'

Rails.start()
Turbolinks.start()
ActiveStorage.start()

import '../stylesheets/application.scss'
