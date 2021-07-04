require.context('../images', true)
require.context('../img', true)
import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import '../js/bootstrap_js_files.js'
import '../packs/edit.js'
import "javascript/channels"

Rails.start()
Turbolinks.start()
ActiveStorage.start()

import '../stylesheets/application.scss'
