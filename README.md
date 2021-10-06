# qy-notepad
Metalı not defteri eklentisi


1. Aşama
- qb-inventory/html/js/app.js

FormatItemInfo function kısmına bunu çakıyoruz sonra bitti.
 
  } else if (itemData.info.type == "note") {
     $(".item-info-title").html('<p>'+itemData.label+'</p>')
     $(".item-info-description").html('<p>'+ itemData.description + '</p><p>'+itemData.info.info+'</p>');


Kirpilerin amına çakayım
