
function getParameterByName(name) {
    name = name.replace(/[\[]/, "\\[").replace(/[\]]/, "\\]");
    var regex = new RegExp("[\\?&]" + name + "=([^&#]*)"),
        results = regex.exec(location.search);
    return results === null ? "" : decodeURIComponent(results[1].replace(/\+/g, " "));
}

 /*var pricescale= getParameterByName('pricescale');
    console.log(pricescale)
*/
TradingView.onready(function () {
    var sym= getParameterByName('symbol');
    console.log(sym)
    var widget = window.tvWidget = new TradingView.widget({
        debug: true, // uncomment this line to see Library errors and warnings in the console
       fullscreen: true,

            hide_side_toolbar: true,

        symbol: getParameterByName('symbol'),
       //symbol: 'GOLD',
        interval: '30',
        container_id: "tv_chart_container",

        //	BEWARE: no trailing slash is expected in feed URL
        //datafeed: new Datafeeds.UDFCompatibleDatafeed("https://demo_feed.tradingview.com"),
        datafeed: datafeed,
        //datafeed: "./api/",
        //datafeed: index.js,
        //datafeed: new Datafeeds.UDFCompatibleDatafeed("http://173.249.35.43/webtrader/webservice.svc"),
        library_path: "charting_library/",
        locale: getParameterByName('lang') || "en",
 drawings_access: { type: 'black', tools: [{ name: "Regression Trend" }] },
disabled_features: ["use_localstorage_for_settings","left_toolbar","control_bar","symbol_info",
                    "show_logo_on_all_charts", "caption_buttons_text_if_possible", "header_settings",
                     "header_indicators", "compare_symbol", "header_screenshot", "header_widget_dom_node",
                      "header_saveload", "header_undo_redo", "header_interval_dialog_button",
                      "header_fullscreen_button", "show_interval_dialog_on_key_press",
                      "go_to_date","control_bar","create_volume_indicator_by_default","study_templates"],
       // disabled_features: ["use_localstorage_for_settings","left_toolbar","control_bar","symbol_info", "show_logo_on_all_charts", "caption_buttons_text_if_possible", "header_settings", "compare_symbol", "header_screenshot", "header_widget_dom_node", "header_saveload", "header_interval_dialog_button","header_fullscreen_button", "show_interval_dialog_on_key_press"],
        enabled_features: ["move_logo_to_main_pane"],
        charts_storage_url: 'http://saveload.tradingview.com',
        charts_storage_api_version: "1.1",
        client_id: 'tradingview.com',
        user_id: 'public_user_id',

        theme: getParameterByName('theme'),
         hide_legend : true,

        // preset: "mobile",
    });

widget.onChartReady(function () {

    widget.chart().setChartType(1);



            });

});

