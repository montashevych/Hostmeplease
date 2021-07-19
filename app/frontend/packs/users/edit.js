import intlTelInput from 'intl-tel-input';

document.addEventListener("turbolinks:load", function(event) {
  const input = document.querySelector("#phone");
  intlTelInput(input, {
      autoHideDialCode: true,
      autoPlaceholder: "off",
      dropdownContainer: document.body,
      formatOnDisplay: false,
      formatOnInit: true,
      // hiddenInput: "full_number",
      initialCountry: "auto",
      localizedCountries: { 'de': 'Deutschland' },
      nationalMode: false,
      placeholderNumberType: "MOBILE",
      geoIpLookup: (ok,fail) => { fetch("https://ipinfo.io/198.16.66.101?token=a109fee2e4e92d")
        .then(response => response.json())
        .then(({ country }) => ok(country || "us")) }
      });
});
