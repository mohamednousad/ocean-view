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

  function openModal(mode, no = '', name = '', contact = '', room = '', inDate = '', outDate = '', address = '') {
      var form = document.getElementById("reservationForm");
      var title = document.getElementById("modalTitle");
      var btn = document.getElementById("modalSubmitBtn");
      var actionInput = document.getElementById("modalAction");

      if (mode === 'add') {
          form.action = "AddReservationServlet";
          title.innerText = "Add New Reservation";
          btn.innerHTML = '<i class="fa-solid fa-floppy-disk"></i> Save Changes';
          
          document.getElementById("modalReservationNo").value = "";
          document.getElementById("modalGuestName").value = "";
          document.getElementById("modalContact").value = "";
          document.getElementById("modalRoomType").value = "";
          document.getElementById("modalCheckIn").value = "";
          document.getElementById("modalCheckOut").value = "";
          document.getElementById("modalAddress").value = "";
          
          actionInput.disabled = true;

      } else {
          form.action = "ViewReservationServlet";
          title.innerText = "Update Reservation";
          btn.innerHTML = '<i class="fa-solid fa-floppy-disk"></i> Save Changes';
          
          document.getElementById("modalReservationNo").value = no;
          document.getElementById("modalGuestName").value = name;
          document.getElementById("modalContact").value = contact;
          document.getElementById("modalRoomType").value = room;
          document.getElementById("modalCheckIn").value = inDate;
          document.getElementById("modalCheckOut").value = outDate;
          document.getElementById("modalAddress").value = address;

          actionInput.disabled = false;
          actionInput.value = "update";
      }

      document.getElementById("reservationModal").style.display = "flex";
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