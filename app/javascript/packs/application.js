import "bootstrap";
import 'mapbox-gl/dist/mapbox-gl.css'; // <-- you need to uncomment the stylesheet_pack_tag in the layout!

import { initMapbox } from '../plugins/init_mapbox';

initMapbox();

const map = document.getElementById('map');
const mapButton = document.getElementById('map-button');


mapButton.addEventListener('click', (e) => {
  if (map.style.display === 'none') {
    map.style.display = 'block';
  } else map.style.display = 'none';
})


const food = document.getElementById('food');

food.addEventListener('click', () => {
  if (map.style.display === 'none') {
    map.style.display = 'block';
  } else map.style.display = 'none';
})
