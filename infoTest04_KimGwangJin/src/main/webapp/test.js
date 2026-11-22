	function changeBookCode() {
		let bookName = document.getElementById("bookName");
		console.log(this);
		console.log(bookName);
		let bookCode = document.getElementById("bookCode");
		bookCode.value = bookName.value
		
			
	}
	
	
		function resetForm() {
		let form = document.rentForm;
		form.reset();
		form.rentMonth.focuse();
		
	}
	