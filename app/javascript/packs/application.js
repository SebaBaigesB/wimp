import "bootstrap";
import 'mapbox-gl/dist/mapbox-gl.css'; // <-- you need to uncomment the stylesheet_pack_tag in the layout!
import '@mapbox/mapbox-gl-geocoder/dist/mapbox-gl-geocoder.css';
import { initMapbox } from '../plugins/init_mapbox';
import { initMapbox2 } from '../plugins/init_mapbox2';
import { initUpdateNavbarOnScroll } from '../components/navbar';

initUpdateNavbarOnScroll();
initMapbox();
initMapbox2();


const map = document.getElementById('map');
const mapButton = document.getElementById('map-button');

mapButton.addEventListener('click', (e) => {
  if (map.style.display === 'none') {
    map.style.display = 'block';
  } else map.style.display = 'none';
})




// map.addControl(new mapboxgl.GeolocateControl({
//     postionOptions: {
//       enablehighAccuracy: true
//     },
//     trackUserLocation: true
//   }));
