import flatpickr from "flatpickr";
import rangePlugin from "flatpickr/dist/plugins/rangePlugin";


const initFlatpickr = () => {
  // console.log("hello");
  flatpickr("#range_start", {
    altInput: true,
    plugins: [new rangePlugin({ input: "#range_end"})]
  });
}

const initFlatpickr2 = () => {
  // console.log("hello");
  flatpickr(".datepicker", {
    enableTime: true,
    dateFormat: "Y-m-d H:i"
  });
}


export { initFlatpickr };

export { initFlatpickr2 };
