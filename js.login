/**
 * FedEx Login and Signup Form Functionality
 * Handles form validation, password visibility, and form submission
 */

// DOM Elements
const loginForm = document.getElementById('login-form');
const signupForm = document.getElementById('signup-form');
const passwordField = document.getElementById('password');
const confirmPasswordField = document.getElementById('confirm-password');

// Password visibility toggle
function togglePassword(fieldId) {
    const field = document.getElementById(fieldId);
    const icon = field.nextElementSibling.querySelector('i');
    
    if (field.type === 'password') {
        field.type = 'text';
        icon.classList.remove('fa-eye');
        icon.classList.add('fa-eye-slash');
    } else {
        field.type = 'password';
        icon.classList.remove('fa-eye-slash');
        icon.classList.add('fa-eye');
    }
}

// Password strength validation
function validatePassword(password) {
    const lengthRegex = /.{8,}/;
    const uppercaseRegex = /[A-Z]/;
    const lowercaseRegex = /[a-z]/;
    const numberRegex = /[0-9]/;
    const specialRegex = /[!@#$%^&*(),.?":{}|<>]/;
    
    const requirements = {
        length: lengthRegex.test(password),
        uppercase: uppercaseRegex.test(password),
        lowercase: lowercaseRegex.test(password),
        number: numberRegex.test(password),
        special: specialRegex.test(password)
    };
    
    return requirements;
}

// Update password requirement indicators
function updatePasswordRequirements(password) {
    if (!document.getElementById('length')) return;
    
    const requirements = validatePassword(password);
    
    for (const [requirement, isValid] of Object.entries(requirements)) {
        const element = document.getElementById(requirement);
        if (element) {
            if (isValid) {
                element.classList.add('valid');
                element.innerHTML = `<i class="fas fa-check"></i> ${element.textContent}`;
            } else {
                element.classList.remove('valid');
                element.innerHTML = element.textContent.replace('<i class="fas fa-check"></i> ', '');
            }
        }
    }
}

// Check if all password requirements are met
function isPasswordValid(password) {
    const requirements = validatePassword(password);
    return Object.values(requirements).every(isValid => isValid);
}

// Show form error message
function showError(input, message) {
    const formGroup = input.closest('.form-group');
    const errorElement = formGroup.querySelector('.error-message') || document.createElement('div');
    
    errorElement.className = 'error-message';
    errorElement.textContent = message;
    
    if (!formGroup.querySelector('.error-message')) {
        formGroup.appendChild(errorElement);
    }
    
    input.classList.add('error');
}

// Clear form error message
function clearError(input) {
    const formGroup = input.closest('.form-group');
    const errorElement = formGroup.querySelector('.error-message');
    
    if (errorElement) {
        formGroup.removeChild(errorElement);
    }
    
    input.classList.remove('error');
}

// Show success message
function showSuccessMessage(form, message) {
    // Clear any existing messages
    const existingMessage = document.querySelector('.form-message');
    if (existingMessage) {
        existingMessage.remove();
    }
    
    const messageElement = document.createElement('div');
    messageElement.className = 'form-message success';
    messageElement.textContent = message;
    
    form.insertAdjacentElement('beforebegin', messageElement);
    
    // Clear the message after 5 seconds
    setTimeout(() => {
        messageElement.remove();
    }, 5000);
}

// Event Listeners
document.addEventListener('DOMContentLoaded', () => {
    // Login form submission
    if (loginForm) {
        loginForm.addEventListener('submit', (e) => {
            e.preventDefault();
            
            const email = document.getElementById('email');
            const password = document.getElementById('password');
            let isValid = true;
            
            // Clear previous errors
            clearError(email);
            clearError(password);
            
            // Validate email
            if (!email.value.trim()) {
                showError(email, 'Email is required');
                isValid = false;
            } else if (!/^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(email.value.trim())) {
                showError(email, 'Please enter a valid email address');
                isValid = false;
            }
            
            // Validate password
            if (!password.value.trim()) {
                showError(password, 'Password is required');
                isValid = false;
            }
            
            if (isValid) {
                // Simulate login success (in a real app, this would be an API call)
                showSuccessMessage(loginForm, 'Login successful! Redirecting...');
                
                // Simulate redirect after login
                setTimeout(() => {
                    window.location.href = 'index.html';
                }, 2000);
            }
        });
    }
    
    // Signup form submission
    if (signupForm) {
        // Password validation on input
        if (passwordField) {
            passwordField.addEventListener('input', () => {
                updatePasswordRequirements(passwordField.value);
            });
        }
        
        signupForm.addEventListener('submit', (e) => {
            e.preventDefault();
            
            const firstName = document.getElementById('first-name');
            const lastName = document.getElementById('last-name');
            const email = document.getElementById('email');
            const phone = document.getElementById('phone');
            const password = document.getElementById('password');
            const confirmPassword = document.getElementById('confirm-password');
            const terms = document.getElementById('terms');
            
            let isValid = true;
            
            // Clear previous errors
            const inputs = [firstName, lastName, email, phone, password, confirmPassword];
            inputs.forEach(input => {
                if (input) clearError(input);
            });
            
            // Validate first name
            if (firstName && !firstName.value.trim()) {
                showError(firstName, 'First name is required');
                isValid = false;
            }
            
            // Validate last name
            if (lastName && !lastName.value.trim()) {
                showError(lastName, 'Last name is required');
                isValid = false;
            }
            
            // Validate email
            if (!email.value.trim()) {
                showError(email, 'Email is required');
                isValid = false;
            } else if (!/^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(email.value.trim())) {
                showError(email, 'Please enter a valid email address');
                isValid = false;
            }
            
            // Validate phone
            if (phone && !phone.value.trim()) {
                showError(phone, 'Phone number is required');
                isValid = false;
            } else if (phone && !/^\d{10}$/.test(phone.value.replace(/\D/g, ''))) {
                showError(phone, 'Please enter a valid 10-digit phone number');
                isValid = false;
            }
            
            // Validate password
            if (!password.value.trim()) {
                showError(password, 'Password is required');
                isValid = false;
            } else if (!isPasswordValid(password.value)) {
                showError(password, 'Password does not meet all requirements');
                isValid = false;
            }
            
            // Validate confirm password
            if (confirmPassword) {
                if (!confirmPassword.value.trim()) {
                    showError(confirmPassword, 'Please confirm your password');
                    isValid = false;
                } else if (confirmPassword.value !== password.value) {
                    showError(confirmPassword, 'Passwords do not match');
                    isValid = false;
                }
            }
            
            // Validate terms agreement
            if (terms && !terms.checked) {
                const termsGroup = terms.closest('.checkbox-group');
                const errorElement = document.createElement('div');
                errorElement.className = 'error-message';
                errorElement.textContent = 'You must agree to the Terms of Service';
                termsGroup.appendChild(errorElement);
                isValid = false;
            }
            
            if (isValid) {
                // Simulate signup success (in a real app, this would be an API call)
                showSuccessMessage(signupForm, 'Account created successfully! Redirecting...');
                
                // Simulate redirect after signup
                setTimeout(() => {
                    window.location.href = 'index.html';
                }, 2000);
            }
        });
    }
});
