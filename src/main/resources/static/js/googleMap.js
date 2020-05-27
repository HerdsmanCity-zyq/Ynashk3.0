//显示地图div 
function showMapDiv(divId, addressId) {
    //加载地图
    var address = $("#"+addressId).val();
    initialize(divId, address);
    //在地图后面加一个透明度层，点击这个层的时候移出地图
   $("<div id='filterDiv' title='返回' style='color: #C7EDCC; background-color:#ccc;position: absolute;top: 0px;left: 0px; z-index:9998;  filter:alpha(Opacity=50); -moz-opacity:0.5;opacity: 0.5;'></div>")
   .width("100%").height("100%").appendTo("body").click(function () { hideDiv(divId); }).fadeIn(200);
    //显示地图
    var bgdiv = $("#" + divId);
    bgdiv.css({ "position": "" }).animate({ left: "18%", top: "15%", opacity: "show"}, "slow");
    //  bgdiv.animate({ left: "30%", top: "30%", opacity: "show" }, "slow");
}
//点击任意位置移出地图图层
function hideDiv(divId) {
    //移出图层
    $("#filterDiv").remove();
    $("#" + divId).animate({ left: "0%", top: "0%", opacity: "hide" }, "slow");
}
//加载地图address为显示中心点地址
function initialize(divId, address) {
    //加载地图在div中显示
    var map = new GMap2(document.getElementById(divId));
    //实例化Geocoder服务  
    var geocoder = new google.maps.Geocoder();  
    //请求数据GeocoderRequest为address，值为输入的地理坐标
    //地理解析过程
    geocoder.geocode({ address: address }, function geoResults(results, status) {  
        //这里是回掉函数(即结果处理函数)  
        //状态为Ok说明有结果  
        if (status == google.maps.GeocoderStatus.OK) {  
            //一般情况下会有多个结果        
            //第一个结果为最佳匹配的结果（匹配地名最全的结果），这里只去第一个，其他的可以根据需要自己循环出来29.       
			//格式化过后的地址  
            //alert('地理解析结果：' + results[0].formatted_address);  这里为地理位置以及邮编等信息
            //geometry是一个包含bounds（界限），location（纬度/经度坐标）,location_type和viewport（视图范围）  
            //获取解析后的经纬度    正确格式为('纬度', '经度')   ex：(22.141414, 122.1454545145)
            var aaaa = results[0].geometry.location+"";
            var a = aaaa.split(", ");
            var myLatLng = new GLatLng(a[0].substr(1), a[1].substr(0,a[1].length-1));
            //设置地图中心点和缩放等级
            map.setCenter(myLatLng, 16);
            //获取地标对象
            var gMarker = new GMarker(myLatLng);
            //在地图上指定位置添加地标
            map.addOverlay( gMarker );
        	//鼠标滑轮控制地图缩放
       		map.enableScrollWheelZoom();
        }  
        else {  
            alert("沒有找到 "+address);  
        }  
    });  
}
