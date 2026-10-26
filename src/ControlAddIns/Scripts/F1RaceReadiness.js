function ShowTeamReadiness(raceName, coveredRoles, teamCoverage) {
    const dashboard = document.getElementById('f1-readiness-dashboard');
    const safeCoverage = Math.max(0, Math.min(100, teamCoverage));

    dashboard.innerHTML = `
        <section class="readiness-card">
            <div class="readiness-header">
                <div>
                    <p class="readiness-label">NEXT RACE READINESS</p>
                    <h2 id="readiness-race-name"></h2>
                </div>
                <div class="readiness-score">
                    <strong id="readiness-percentage"></strong>
                    <span>TEAM READY</span>
                </div>
            </div>

            <div class="readiness-details">
                <span>Team coverage</span>
                <strong id="readiness-roles"></strong>
            </div>

            <div class="readiness-track"
                 role="progressbar"
                 aria-label="Team coverage"
                 aria-valuemin="0"
                 aria-valuemax="100"
                 aria-valuenow="${safeCoverage}">
                <div class="readiness-fill" style="width: ${safeCoverage}%"></div>
            </div>
        </section>
    `;

    document.getElementById('readiness-race-name').textContent = raceName;
    document.getElementById('readiness-percentage').textContent = `${safeCoverage}%`;
    document.getElementById('readiness-roles').textContent = `${coveredRoles} of 6 roles covered`;
}
