import intlTelInput from 'intl-tel-input';

window.onload = () => {
  const input = document.querySelector("#phone");
  console.log(input);
  intlTelInput(input, {
      autoHideDialCode: true,
      autoPlaceholder: "off",
      dropdownContainer: document.body,
      formatOnDisplay: false,
      // geoIpLookup: function(success, failure) {
      //   $.get("https://ipinfo.io", function() {}, "jsonp").always(function(resp) {
      //   var countryCode = (resp && resp.country) ? resp.country : "us";
      //   success(countryCode);
      // });
      // },
      // hiddenInput: "full_number",
      initialCountry: "auto",
      localizedCountries: { 'de': 'Deutschland' },
      nationalMode: false,
      placeholderNumberType: "MOBILE",

  });
}
