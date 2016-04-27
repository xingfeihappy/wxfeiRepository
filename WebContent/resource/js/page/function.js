//上传文件
document.getElementById("uploadBtn").onchange = function () {
	alert(this.value)
    document.getElementById("uploadFile").value = this.value;
};
//上传文件