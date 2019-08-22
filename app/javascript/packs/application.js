import "bootstrap";
import 'mapbox-gl/dist/mapbox-gl.css'; // <-- you need to uncomment the stylesheet_pack_tag in the layout!

import { initMapbox } from '../plugins/init_mapbox';

initMapbox();




const cards = document.querySelectorAll("cards");
const plats = document.getElementById("fa-plus");


plats.addEventListener("click", (event) => {
  event.currentTarget.classList.toggle("d-none");
});
