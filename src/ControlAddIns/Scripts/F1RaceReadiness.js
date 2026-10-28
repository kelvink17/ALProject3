function ShowTeamReadiness(raceName, raceDate, daysRemaining, coveredRoles, teamCoverage) {
    const dashboard = document.getElementById('f1-readiness-dashboard');
    const safeCoverage = Math.max(0, Math.min(100, teamCoverage));
    const scheduleText = getScheduleText(raceDate, daysRemaining);

    dashboard.innerHTML = `
        <section class="readiness-card">
            <div class="readiness-header">
                <div>
                    <div class="readiness-label-row">
                        <p class="readiness-label">NEXT UPCOMING RACE</p>
                        <button id="readiness-refresh" class="readiness-refresh" type="button">Refresh</button>
                    </div>
                    <h2 id="readiness-race-name"></h2>
                    <p id="readiness-schedule" class="readiness-schedule"></p>
                </div>
                <div class="readiness-score">
                    <strong id="readiness-percentage"></strong>
                    <span>TEAM READINESS</span>
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
    document.getElementById('readiness-schedule').textContent = scheduleText;
    document.getElementById('readiness-percentage').textContent = `${safeCoverage}%`;
    document.getElementById('readiness-roles').textContent = `${coveredRoles} of 6 roles covered`;
    document.getElementById('readiness-refresh').addEventListener('click', requestReadinessRefresh);
}

function getScheduleText(raceDate, daysRemaining) {
    if (daysRemaining < 0)
        return 'No race scheduled from the current work date';

    if (daysRemaining === 0)
        return `${raceDate} • Race day is today`;

    if (daysRemaining === 1)
        return `${raceDate} • 1 day away`;

    return `${raceDate} • ${daysRemaining} days away`;
}

function requestReadinessRefresh() {
    const refreshButton = document.getElementById('readiness-refresh');

    refreshButton.disabled = true;
    refreshButton.textContent = 'Refreshing...';

    Microsoft.Dynamics.NAV.InvokeExtensibilityMethod(
        'RefreshRequested',
        [],
        false,
        function () { },
        function () {
            const currentButton = document.getElementById('readiness-refresh');
            if (currentButton) {
                currentButton.disabled = false;
                currentButton.textContent = 'Refresh';
            }
        });
}
