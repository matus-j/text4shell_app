console.log("JavaScript is working!");

let URL = "http://localhost:8080/exploit_json?input="

const result_field = document.getElementById('interpolated');
const searchBar = document.getElementById('searchBar');

function call_endpoint(){
    console.log("Calling endpoint...");
    let url_encoded_param = encodeURIComponent(searchBar.value);
    URL = "http://localhost:8080/exploit_json?input=" + url_encoded_param;
    fetch(URL)
  .then(response => response.json())
  .then(data => {
    console.log(data);

    result_field.innerHTML = data.interpolated;
  })
  .catch(error => {
    console.error(error);
  });

}

const button = document.getElementById('searchButton');
button.addEventListener('click', call_endpoint);

