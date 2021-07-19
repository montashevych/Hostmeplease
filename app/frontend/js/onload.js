const onload = () => Promise.any([
  new Promise((ok, _) => window.onload = () => ok()),                              // regular onload
  new Promise((ok, _) => document.addEventListener("turbolinks:load", () => ok())) // turbolinks load
]);

export default onload;
