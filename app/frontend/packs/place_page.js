import flatpickr from "flatpickr";
import normalizeUrl from "normalize-url";
import 'flatpickr/dist/flatpickr.css';

new Promise((resolve, reject) => window.onload = () => resolve()) // wait for onload
  .then(() => console.log('after onload'))
  .then(() => fetch(`${normalizeUrl('' + window.location)}/bookings.json`)) // retrieve bookings
  .then(x => x.json())
  .then(bookings => {
    // list of disabled ranges for picker
    const disabled = bookings.map(({ checkin, checkout }) => ({ from: new Date(checkin), to: new Date(checkout) }));

    const textInput = document.querySelector("#booking_dates");
    const checkin   = document.querySelector("#booking_checkin");
    const checkout  = document.querySelector("#booking_checkout");

    const picker = flatpickr(textInput, {
      mode: "range",
      disable: disabled,
      minDate: "today"
    });

    picker.config.onChange.push(([checkinDate, checkoutDate]) => {
      if (!checkoutDate) return; // when only start selected, checkoutDate == undefined

      checkin.value = flatpickr.formatDate(checkinDate, "Y-m-d");
      checkout.value = flatpickr.formatDate(checkoutDate, "Y-m-d");
    })
  })
