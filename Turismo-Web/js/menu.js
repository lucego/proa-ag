const hamburguerIcon = document.querySelector('.nav__hamburguer');
const navOverlay = document.querySelector('.nav__overlay');
let currentDropdown = navOverlay;

hamburguerIcon.addEventListener('click', ()=>{
    hamburguerIcon.classList.toggle('nav__hamburguer---open');
    navOverlay.classList.toggle('nav__overlay---show');
});
console.log(navOverlay); 
navOverlay.addEventListener('click', (e) => {
    e.preventDefault();
    const currentElement = e.target;
    // console.log(e.target.classList.value);

    if( estaActivo(currentElement, 'nav__parent') ){
            const subMenu = currentElement.parentElement.children[1];
            console.log(subMenu);

        
        if(window.innerWidth < 768){

            let height = (subMenu.clientHeight == 0 ) 
                        ? subMenu.scrollHeight : 0;

            //console.log(subMenu.clientHeight);

            subMenu.style.height = `${height}px`;



            
        }else{
            if (  !estaActivo(subMenu, 'nav__inner--show') ){
                closeDropdown(currentDropdown);


            }
            subMenu.classList.toggle('nav__inner--show');

            currentDropdown = subMenu;
        }
    }
}); 

function estaActivo(element, string){
    return element.classList.value.includes(string);


};

function closeDropdown(currentDropdown){
    if (estaActivo(currentDropdown,  'nav__inner--show')){
        currentDropdown.classList.remove('nav__inner--show');
    }
}

window.addEventListener('resize', ()=> {
    closeDropdown(currentDropdown)
    if(window.innerWidth > 768){
        const navInners = document.querySelectorAll('.nav__inner');
        
        navInners.forEach(navInner =>{
            navInner.style.height = '';
        });
    }




});


const loginButton = document.querySelector('.nav__login');
const registerButton = document.querySelector('.nav__login.nav__login--border');



loginButton.addEventListener('click', () => {
    window.location.href = "iniciarsesion.html";
});


registerButton.addEventListener('click', () => {
    window.location.href = "registro.html";
});

const linkToScroll = document.querySelector('a[href="#scroll-target"]');

linkToScroll.addEventListener('click', (e) => {
    e.preventDefault(); 

   
    const targetElement = document.querySelector('#scroll-target');

    
    targetElement.scrollIntoView({
        behavior: 'smooth', // 
        block: 'start', // 
        inline: 'nearest' // 
    });
});

