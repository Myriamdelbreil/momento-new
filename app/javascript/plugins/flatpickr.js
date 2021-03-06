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
    enableTime: true,
    dateFormat: "Y-m-d H:i",
    disableMobile: "true"
  });
}



export { initFlatpickr2 };
