window.onload = function() {
    fetch('http://localhost:3000/students')
        .then(response => response.json())
        .then(data => {
            let teamInfo = document.getElementById('team-info');
            data.forEach(student => {
                let p = document.createElement('p');
                p.textContent = `ID: ${student.id}, Name: ${student.firstName} ${student.lastName}, Enrolled: ${student.enrollmentDate}, Email: ${student.email}, CGPA: ${student.cgpa}, Age: ${student.age}`;
                teamInfo.appendChild(p);
            });
        })
        .catch(error => {
            console.error('Error loading the student data:', error);
            teamInfo.textContent = 'Failed to load student data.';
        });
};
