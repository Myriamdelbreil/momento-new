import flatpickr from "flatpickr";

const initFlatpickr = () => {
  // console.log("hello");
  flatpickr(".datepicker", {
    enableTime: true,
    dateFormat: "Y-m-d H:i"
  });
}

export { initFlatpickr };
