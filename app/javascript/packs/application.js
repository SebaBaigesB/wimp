import "bootstrap";
import 'mapbox-gl/dist/mapbox-gl.css'; // <-- you need to uncomment the stylesheet_pack_tag in the layout!
import '@mapbox/mapbox-gl-geocoder/dist/mapbox-gl-geocoder.css';
import { initMapbox } from '../plugins/init_mapbox';
import { initMapbox2 } from '../plugins/init_mapbox2';
import { initUpdateNavbarOnScroll } from '../components/navbar';

initUpdateNavbarOnScroll();

initMapbox2();


const map = document.getElementById('map');
const mapButton = document.getElementById('map-button');


if (mapButton) {
  mapButton.addEventListener('click', (e) => {
    map.classList.toggle("d-none");
    initMapbox();
  })
}


const uploadBtn = document.querySelector("#meal_photo");
const uploadLabel = document.querySelector("#upload-label");
document.getElementById('meal_photo').onchange = function() {
    const fileName = uploadBtn.value.split("\\")[uploadBtn.value.split("\\").length - 1];
    uploadLabel.insertAdjacentText("afterend", `${fileName}`);
};

