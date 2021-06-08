require.context('../images', true)
import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import '../js/bootstrap_js_files.js'
import "javascript/channels"
//import "channels"

Rails.start()
Turbolinks.start()
ActiveStorage.start()

import '../stylesheets/application.scss'
