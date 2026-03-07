//Dashboard

function setActive(element) {
    const links = document.querySelectorAll('.sidebar a:not(.logoutBtn)');
    links.forEach(link => {
        link.classList.remove('active');
    });
    element.classList.add('active');
}

//View Reservation
document.getElementById('searchInput').addEventListener('keyup', function() {
  var input, filter, table, tr, td, i, j, txtValue;
  input = document.getElementById("searchInput");
  filter = input.value.toLowerCase();
  table = document.getElementById("reservationTable");
  tr = table.getElementsByTagName("tr");

  for (i = 1; i < tr.length; i++) {
      tr[i].style.display = "none";
      td = tr[i].getElementsByTagName("td");
      for (j = 0; j < td.length; j++) {
          if (td[j]) {
              txtValue = td[j].textContent || td[j].innerText;
              if (txtValue.toLowerCase().indexOf(filter) > -1) {
                  tr[i].style.display = "";
                  break;
              }
          }
      }
  }
      });

const modalFields = {
     reservationNo: "modalReservationNo",
     guestName:     "modalGuestName",
     contact:       "modalContact",
     roomType:      "modalRoomType",
     checkIn:       "modalCheckIn",
     checkOut:      "modalCheckOut",
     address:       "modalAddress"
 };

 function openModal(mode, no = '', name = '', contact = '', room = '', inDate = '', outDate = '', address = '') {
     const values = { reservationNo: no, guestName: name, contact, roomType: room, checkIn: inDate, checkOut: outDate, address };
     const isAdd = mode === 'add';

     document.getElementById("modalTitle").innerText = isAdd ? "Add New Reservation" : "Update Reservation";
     document.getElementById("modalAction").value = isAdd ? "add" : "update";

     Object.entries(modalFields).forEach(([key, id]) => {
         document.getElementById(id).value = isAdd ? "" : (values[key] || "");
     });

     document.getElementById("reservationModal").style.display = "flex";
 }

 function openDeleteModal(id) {
     document.getElementById("deleteReservationNo").value = id;
     document.getElementById("deleteDisplayId").innerText = "#" + id;
     document.getElementById("deleteModal").style.display = "flex";
 }

 function closeModal() {
     document.getElementById("reservationModal").style.display = "none";
 }

 function closeDeleteModal() {
     document.getElementById("deleteModal").style.display = "none";
 }
  function closeModal() {
      document.getElementById("reservationModal").style.display = "none";
  }

  function openDeleteModal(resNo) {
      document.getElementById("deleteDisplayId").innerText = "#" + resNo;
      document.getElementById("deleteReservationNo").value = resNo;
      document.getElementById("deleteModal").style.display = "flex";
  }

  function closeDeleteModal() {
      document.getElementById("deleteModal").style.display = "none";
  }

  window.onclick = function(event) {
      let mainModal = document.getElementById("reservationModal");
      let deleteModal = document.getElementById("deleteModal");
      
      if (event.target === mainModal) {
          closeModal();
      }
      if (event.target === deleteModal) {
          closeDeleteModal();
      }
  }
  
  //Bill
  function filterReservations() {
  var input = document.getElementById("searchInput");
  var filter = input.value.toUpperCase();
  var select = document.getElementById("reservationSelect");
  var options = select.getElementsByTagName("option");

  for (var i = 0; i < options.length; i++) {
      var txtValue = options[i].textContent || options[i].innerText;
      if (txtValue.toUpperCase().indexOf(filter) > -1) {
          options[i].style.display = "";
      } else {
          options[i].style.display = "none";
      }
  }
  }