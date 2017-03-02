

var eOpenMenu = null;

function OpenMenu(eSrc,eMenu) {
	eMenu.style.left = eSrc.offsetLeft + divMenuBar.offsetLeft;
	eMenu.style.top = divMenuBar.offsetHeight + divMenuBar.offsetTop;
	eMenu.style.visibility = "visible";
	eOpenMenu = eMenu;
}

function CloseMenu(eMenu) {
	eMenu.style.visibility = "hidden";
	eOpenMenu = null;
}
