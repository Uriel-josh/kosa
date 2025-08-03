/**
 * FastShip - Main JavaScript
 * Handles general website functionality
 */

document.addEventListener('DOMContentLoaded', function() {
    // Mobile menu toggle
    const mobileMenuBtn = document.querySelector('.mobile-menu-btn');
    const mainNav = document.querySelector('.main-nav');
    const userActions = document.querySelector('.user-actions');
    
    if (mobileMenuBtn) {
        mobileMenuBtn.addEventListener('click', function() {
            // Toggle active class on button
            this.classList.toggle('active');
            
            // Create mobile menu if it doesn't exist
            let mobileMenu = document.querySelector('.mobile-menu');
            
            if (!mobileMenu) {
                mobileMenu = document.createElement('div');
                mobileMenu.className = 'mobile-menu';
                
                // Clone navigation items
                const navClone = mainNav.cloneNode(true);
                mobileMenu.appendChild(navClone);
                
                // Clone user action buttons
                const userActionsClone = document.createElement('div');
                userActionsClone.className = 'mobile-user-actions';
                
                const loginBtn = userActions.querySelector('a[href="login.html"]');
                const signupBtn = userActions.querySelector('a[href="signup.html"]');
                
                if (loginBtn) userActionsClone.appendChild(loginBtn.cloneNode(true));
                if (signupBtn) userActionsClone.appendChild(signupBtn.cloneNode(true));
                
                mobileMenu.appendChild(userActionsClone);
                
                // Add to DOM after header
                const header = document.querySelector('header');
                header.parentNode.insertBefore(mobileMenu, header.nextSibling);
            }
            
            // Toggle mobile menu visibility
            mobileMenu.classList.toggle('active');
            
            // Prevent scrolling when menu is open
            document.body.classList.toggle('menu-open');
            
            // Animate hamburger icon
            const spans = this.querySelectorAll('span');
            if (this.classList.contains('active')) {
                spans[0].style.transform = 'rotate(45deg) translate(5px, 5px)';
                spans[1].style.opacity = '0';
                spans[2].style.transform = 'rotate(-45deg) translate(7px, -6px)';
            } else {
                spans[0].style.transform = 'none';
                spans[1].style.opacity = '1';
                spans[2].style.transform = 'none';
            }
        });
    }
    
    // Close mobile menu when clicking outside
    document.addEventListener('click', function(event) {
        const mobileMenu = document.querySelector('.mobile-menu');
        const mobileMenuBtn = document.querySelector('.mobile-menu-btn');
        
        if (mobileMenu && mobileMenu.classList.contains('active')) {
            if (!mobileMenu.contains(event.target) && !mobileMenuBtn.contains(event.target)) {
                mobileMenu.classList.remove('active');
                mobileMenuBtn.classList.remove('active');
                document.body.classList.remove('menu-open');
                
                // Reset hamburger icon
                const spans = mobileMenuBtn.querySelectorAll('span');
                spans[0].style.transform = 'none';
                spans[1].style.opacity = '1';
                spans[2].style.transform = 'none';
            }
        }
    });
    
    // Testimonial slider
    const testimonialSlider = document.querySelector('.testimonial-slider');
    const testimonialSlides = document.querySelectorAll('.testimonial-slide');
    const dots = document.querySelectorAll('.dot');
    const prevBtn = document.querySelector('.prev-testimonial');
    const nextBtn = document.querySelector('.next-testimonial');
    
    if (testimonialSlider && testimonialSlides.length > 0) {
        let currentSlide = 0;
        
        // Initialize slider
        function initSlider() {
            testimonialSlides.forEach((slide, index) => {
                slide.style.display = index === currentSlide ? 'block' : 'none';
            });
            
            updateDots();
        }
        
        // Update dots
        function updateDots() {
            dots.forEach((dot, index) => {
                dot.classList.toggle('active', index === currentSlide);
            });
        }
        
        // Go to slide
        function goToSlide(index) {
            // Hide current slide
            testimonialSlides[currentSlide].style.display = 'none';
            
            // Update current slide index
            currentSlide = (index + testimonialSlides.length) % testimonialSlides.length;
            
            // Show new slide
            testimonialSlides[currentSlide].style.display = 'block';
            
            // Update dots
            updateDots();
        }
        
        // Event listeners for controls
        if (prevBtn) {
            prevBtn.addEventListener('click', () => {
                goToSlide(currentSlide - 1);
            });
        }
        
        if (nextBtn) {
            nextBtn.addEventListener('click', () => {
                goToSlide(currentSlide + 1);
            });
        }
        
        // Event listeners for dots
        dots.forEach((dot, index) => {
            dot.addEventListener('click', () => {
                goToSlide(index);
            });
        });
        
        // Auto slide
        let slideInterval = setInterval(() => {
            goToSlide(currentSlide + 1);
        }, 5000);
        
        // Pause auto slide on hover
        testimonialSlider.addEventListener('mouseenter', () => {
            clearInterval(slideInterval);
        });
        
        testimonialSlider.addEventListener('mouseleave', () => {
            slideInterval = setInterval(() => {
                goToSlide(currentSlide + 1);
            }, 5000);
        });
        
        // Initialize slider
        initSlider();
    }
    
    // Smooth scroll for anchor links
    document.querySelectorAll('a[href^="#"]').forEach(anchor => {
        anchor.addEventListener('click', function(e) {
            e.preventDefault();
            
            const targetId = this.getAttribute('href');
            if (targetId === '#') return;
            
            const targetElement = document.querySelector(targetId);
            if (targetElement) {
                const headerHeight = document.querySelector('header').offsetHeight;
                const targetPosition = targetElement.getBoundingClientRect().top + window.pageYOffset - headerHeight;
                
                window.scrollTo({
                    top: targetPosition,
                    behavior: 'smooth'
                });
                
                // Close mobile menu if open
                const mobileMenu = document.querySelector('.mobile-menu');
                const mobileMenuBtn = document.querySelector('.mobile-menu-btn');
                
                if (mobileMenu && mobileMenu.classList.contains('active')) {
                    mobileMenu.classList.remove('active');
                    mobileMenuBtn.classList.remove('active');
                    document.body.classList.remove('menu-open');
                    
                    // Reset hamburger icon
                    const spans = mobileMenuBtn.querySelectorAll('span');
                    spans[0].style.transform = 'none';
                    spans[1].style.opacity = '1';
                    spans[2].style.transform = 'none';
                }
            }
        });
    });
    
    // Add active class to current page in navigation
    const currentPage = window.location.pathname.split('/').pop();
    const navLinks = document.querySelectorAll('.main-nav a');
    
    navLinks.forEach(link => {
        const linkPage = link.getAttribute('href');
        if (linkPage === currentPage || (currentPage === '' && linkPage === 'index.html')) {
            link.classList.add('active');
        } else {
            link.classList.remove('active');
        }
    });
    
    // Add CSS class when scrolling
    window.addEventListener('scroll', function() {
        const header = document.querySelector('header');
        if (window.scrollY > 50) {
            header.classList.add('scrolled');
        } else {
            header.classList.remove('scrolled');
        }
    });
});
