<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UserGraphs.aspx.cs" Inherits="Revamp_LatestSightings.UserGraphs" %>

jQuery(document).ready(function () {
    var m1 = new Morris.Line({
        element: 'line-chart',
        data: [
            <%=data%>
        ],
        xkey: 'y',
        ykeys: ['<%=ykeyA %>', '<%=ykeyB %>'],
        labels: ['<%=ykeyALabel %>', '<%=ykeyBLabel %>'],
        lineColors: ['#428BCA', '#a7cfef'],
        lineWidth: '2px',
        hideHover: 'auto',
        resize: true,
        preUnits: '$',
        xLabels: 'day'
    });

    var m2 = new Morris.Line({
        element: 'line-chart1',
        data: [
            <%=data1%>
        ],
        xkey: 'y',
        ykeys: ['<%=ykeyA %>', '<%=ykeyB %>'],
        labels: ['<%=ykeyALabel %>', '<%=ykeyBLabel %>'],
        lineColors: ['#428BCA', '#a7cfef'],
        lineWidth: '2px',
        hideHover: 'auto',
        resize: true,
        xLabels: 'day'
    });

    var m3 = new Morris.Line({
        element: 'line-chart2',
        data: [
            <%=data2%>
        ],
        xkey: 'y',
        ykeys: [<%=m3Keys %>],
        labels: [<%=m3Labels %>],
        lineColors: ['#428BCA', '#b53030', '#963c8a', '#5ba328', '#6f726d'],
        lineWidth: '2px',
        hideHover: 'auto',
        resize: true,
        preUnits: '$',
        xLabels: 'day'
    });

    var m4 = new Morris.Line({
        element: 'line-chart3',
        data: [
            <%=data3%>
        ],
        xkey: 'y',
        ykeys: [<%=m4Keys %>],
        labels: [<%=m4Labels %>],
        lineColors: ['#428BCA', '#b53030', '#963c8a', '#5ba328', '#6f726d'],
        lineWidth: '2px',
        hideHover: 'auto',
        resize: true,
        xLabels: 'day'
    });
});