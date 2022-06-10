import flatpickr from "flatpickr";
import rangePlugin from "flatpickr/dist/plugins/rangePlugin";


const initFlatpickr = () => {
  // console.log("hello");
  flatpickr("#range_start", {
    altInput: true,
    plugins: [new rangePlugin({ input: "#range_end"})],
    disableMobile: "true"
  });
}
export { initFlatpickr };

const initFlatpickr2 = () => {
  // console.log("hello2");
  flatpickr(".datepicker", {
    // enableTime: true,
    dateFormat: "Y-m-d",
    disableMobile: "true"
  });
}

export { initFlatpickr2 };

const initFlatpickr3 = () => {
  flatpickr("#range_start_2", {
    altInput: true,
    plugins: [new rangePlugin({ input: "#range_end_2"})],
    disableMobile: "true",
    enableTime: true,
  });
  console.log("hello")
}
export { initFlatpickr3 };

const initFlatpickr4 = () => {
  flatpickr("#range_start_3", {
    altInput: true,
    plugins: [new rangePlugin({ input: "#range_end_3"})],
    disableMobile: "true",
    enableTime: true,
  });
  console.log("hello")
}
export { initFlatpickr4 };
