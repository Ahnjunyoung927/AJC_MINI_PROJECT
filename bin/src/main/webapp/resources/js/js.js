/* assets/js/script.js */



/* 1. 사이드바 기능 */

const sidebar = document.querySelector('.sidebar');

const sidebarOverlay = document.querySelector('.sidebar-overlay');

const sidebarOpenBtn = document.querySelector('#sidebar-toggle'); 

const sidebarCloseBtn = document.querySelector('.sidebar-close'); 



function openSidebar() {

    sidebar.classList.add('active');

    sidebarOverlay.classList.add('active');

}



function closeSidebar() {

    sidebar.classList.remove('active');

    sidebarOverlay.classList.remove('active');

}



if (sidebarOpenBtn) {

    sidebarOpenBtn.addEventListener('click', openSidebar);

}

if (sidebarCloseBtn) {

    sidebarCloseBtn.addEventListener('click', closeSidebar);

}

if (sidebarOverlay) {

    sidebarOverlay.addEventListener('click', closeSidebar);

}



/* 2. 스와이퍼 초기화 */

if (document.querySelector('.swiper')) {

    const swiper = new Swiper('.swiper', {

        loop: true, 

        slidesPerView: 1, 



        pagination: {

            el: '.swiper-pagination',

            clickable: true, // 점 클릭 가능

        },



        // 네비게이션 버튼 (좌우 화살표)

        navigation: {

            nextEl: '.swiper-button-next',

            prevEl: '.swiper-button-prev',

        },

    });

}