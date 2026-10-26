const controlAddIn = document.getElementById('controlAddIn');

controlAddIn.innerHTML = '<div id="f1-readiness-dashboard"></div>';

Microsoft.Dynamics.NAV.InvokeExtensibilityMethod('DashboardReady', []);
