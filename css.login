/* 
   FedEx-inspired Login/Signup Page Stylesheet
   Styling for authentication forms and related elements
*/

/* ===== Login/Signup Page Specific Styles ===== */

:root {
    /* FedEx Color Palette */
    --fedex-purple: #4D148C;
    --fedex-orange: #FF6600;
    --fedex-blue: #00A3E0;
    --fedex-light-purple: #B5A8C9;
    --fedex-light-orange: #FFD580;
    --fedex-gray: #999999;
    --fedex-light-gray: #F2F2F2;
    --fedex-dark-gray: #333333;
    --google-blue: #4285F4;
    --apple-black: #000000;
}

/* Login Section Styles */
.login-section {
    padding: var(--spacing-xl) 0;
    min-height: calc(100vh - 80px - 350px); /* Adjust based on header and footer height */
    display: flex;
    align-items: center;
    background-color: var(--light-color);
    background-image: linear-gradient(135deg, rgba(77, 20, 140, 0.05) 0%, rgba(255, 102, 0, 0.05) 100%);
}

.auth-container {
    max-width: 550px;
    margin: 0 auto;
    background-color: var(--white);
    border-radius: var(--border-radius-lg);
    box-shadow: var(--shadow-md);
    padding: var(--spacing-xl);
}

.auth-header {
    text-align: center;
    margin-bottom: var(--spacing-xl);
}

.auth-header h1 {
    color: var(--primary-color);
    font-size: 2rem;
    margin-bottom: var(--spacing-sm);
}

.auth-header p {
    color: var(--gray-medium);
    font-size: 1rem;
    max-width: 400px;
    margin: 0 auto;
}

/* Form Styles */
.auth-form {
    margin-bottom: var(--spacing-lg);
}

.form-group {
    margin-bottom: var(--spacing-lg);
}

.form-row {
    display: flex;
    gap: var(--spacing-md);
}

.form-row .form-group {
    flex: 1;
}

label {
    display: block;
    margin-bottom: var(--spacing-xs);
    font-weight: 500;
    color: var(--dark-color);
}

.input-group {
    position: relative;
    display: flex;
    align-items: center;
}

.input-icon {
    position: absolute;
    left: 12px;
    color: var(--gray-medium);
}

.auth-form input[type="text"],
.auth-form input[type="email"],
.auth-form input[type="password"],
.auth-form input[type="tel"] {
    width: 100%;
    padding: 12px 12px 12px 40px;
    border: 1px solid var(--gray-light);
    border-radius: var(--border-radius-md);
    font-size: 1rem;
    transition: var(--transition-fast);
}

.auth-form input:focus {
    border-color: var(--primary-color);
    box-shadow: 0 0 0 2px rgba(77, 20, 140, 0.2);
    outline: none;
}

.password-toggle {
    position: absolute;
    right: 12px;
    color: var(--gray-medium);
    cursor: pointer;
}

.password-toggle:hover {
    color: var(--primary-color);
}

.password-requirements {
    margin-top: var(--spacing-sm);
    font-size: 0.85rem;
    color: var(--gray-medium);
}

.password-requirements ul {
    padding-left: 20px;
    margin-top: 5px;
}

.password-requirements li {
    margin-bottom: 3px;
}

.password-requirements li.valid {
    color: var(--success-color);
}

.form-options {
    display: flex;
    justify-content: space-between;
    align-items: center;
    margin-bottom: var(--spacing-md);
}

.remember-me {
    display: flex;
    align-items: center;
}

.remember-me input[type="checkbox"] {
    margin-right: 8px;
}

.forgot-password {
    color: var(--primary-color);
    text-decoration: none;
    font-size: 0.9rem;
}

.forgot-password:hover {
    text-decoration: underline;
}

.checkbox-group {
    display: flex;
    align-items: flex-start;
}

.checkbox-group input[type="checkbox"] {
    margin-right: 10px;
    margin-top: 3px;
}

.checkbox-group label {
    font-size: 0.9rem;
    font-weight: normal;
    color: var(--gray-dark);
}

.checkbox-group a {
    color: var(--primary-color);
    text-decoration: none;
}

.checkbox-group a:hover {
    text-decoration: underline;
}

/* Button Styles */
.btn-block {
    width: 100%;
    padding: 14px;
    font-size: 1rem;
    font-weight: 500;
    margin-top: var(--spacing-md);
}

.auth-divider {
    text-align: center;
    position: relative;
    margin: var(--spacing-lg) 0;
}

.auth-divider::before {
    content: '';
    position: absolute;
    top: 50%;
    left: 0;
    right: 0;
    height: 1px;
    background-color: var(--gray-light);
}

.auth-divider span {
    position: relative;
    background-color: var(--white);
    padding: 0 var(--spacing-md);
    color: var(--gray-medium);
}

/* Social Login Buttons */
.social-login {
    display: flex;
    flex-direction: column;
    gap: var(--spacing-md);
}

.btn-social {
    display: flex;
    align-items: center;
    justify-content: center;
    padding: 12px;
    border-radius: var(--border-radius-md);
    font-weight: 500;
    color: var(--white);
    border: none;
    cursor: pointer;
    transition: var(--transition-fast);
}

.btn-social i {
    margin-right: 10px;
    font-size: 1.1rem;
}

.btn-google {
    background-color: var(--white);
    color: var(--dark-color);
    border: 1px solid var(--gray-light);
}

.btn-google:hover {
    background-color: #f8f8f8;
}

.btn-apple {
    background-color: var(--apple-black);
    color: var(--white);
}

.btn-apple:hover {
    background-color: #333;
}

/* Auth Footer */
.auth-footer {
    text-align: center;
    color: var(--gray-dark);
    font-size: 0.95rem;
}

.auth-footer a {
    color: var(--primary-color);
    text-decoration: none;
    font-weight: 500;
}

.auth-footer a:hover {
    text-decoration: underline;
}

/* Responsive Styles */
@media (max-width: 768px) {
    .auth-container {
        padding: var(--spacing-lg);
        margin: 0 var(--spacing-md);
    }
    
    .form-row {
        flex-direction: column;
        gap: var(--spacing-md);
    }
    
    .auth-header h1 {
        font-size: 1.75rem;
    }
}

@media (max-width: 480px) {
    .auth-container {
        padding: var(--spacing-md);
    }
    
    .form-options {
        flex-direction: column;
        align-items: flex-start;
        gap: var(--spacing-sm);
    }
    
    .forgot-password {
        margin-top: var(--spacing-xs);
    }
}
