#!/bin/bash

#mengosongkan database
mongo  <<EOF
use genieacs;

db.config.deleteMany({});
db.provisions.deleteMany({});
db.virtualParameters.deleteMany({});
EOF

#info data telah di hapus
echo "Data telah berhasil di kosongkan"

# Delay selama 5 detik
sleep 5

# Simpan data JSON ke dalam file temporary
cat <<EOF > config.json
[{
  "_id": "ui.device.1.type",
  "value": "'parameter-list'"
},
{
  "_id": "ui.device.2.type",
  "value": "'tags'"
},
{
  "_id": "ui.filters.0.label",
  "value": "'Tag'"
},
{
  "_id": "ui.device.0.type",
  "value": "'ping'"
},
{
  "_id": "ui.filters.1.parameter",
  "value": "DeviceID.SerialNumber"
},
{
  "_id": "ui.filters.2.type",
  "value": "\"string\""
},
{
  "_id": "ui.filters.2.label",
  "value": "\"IDPEL\""
},
{
  "_id": "ui.filters.1.type",
  "value": "'string'"
},
{
  "_id": "ui.filters.1.label",
  "value": "'SN'"
},
{
  "_id": "ui.filters.0.type",
  "value": "'tag'"
},
{
  "_id": "ui.device.3.type",
  "value": "'a'"
},
{
  "_id": "ui.device.4.type",
  "value": "'container'"
},
{
  "_id": "ui.device.4.components.0.type",
  "value": "'parameter-list'"
},
{
  "_id": "ui.device.4.components.1.type",
  "value": "'parameter-table'"
},
{
  "_id": "ui.device.5.type",
  "value": "'container'"
},
{
  "_id": "ui.device.5.components.0.type",
  "value": "'parameter-list'"
},
{
  "_id": "ui.device.5.components.1.type",
  "value": "'parameter-table'"
},
{
  "_id": "ui.device.6.type",
  "value": "'container'"
},
{
  "_id": "ui.index.0.type",
  "value": "'summon-button'"
},
{
  "_id": "ui.index.1.label",
  "value": "'Status'"
},
{
  "_id": "ui.index.2.label",
  "value": "'Uptime'"
},
{
  "_id": "ui.index.2.parameter",
  "value": "VirtualParameters.getdeviceuptime"
},
{
  "_id": "ui.index.3.label",
  "value": "'Serial number'"
},
{
  "_id": "ui.index.3.parameter",
  "value": "DeviceID.SerialNumber"
},
{
  "_id": "ui.index.4.label",
  "value": "'PON'"
},
{
  "_id": "ui.index.4.parameter",
  "value": "VirtualParameters.getponmode"
},
{
  "_id": "ui.index.5.type",
  "value": "'device-link'"
},
{
  "_id": "ui.index.5.label",
  "value": "'IDPEL'"
},
{
  "_id": "ui.index.5.parameter",
  "value": "VirtualParameters.pppUsername"
},
{
  "_id": "ui.index.5.components.0.type",
  "value": "'parameter'"
},
{
  "_id": "ui.index.6.label",
  "value": "'Rx Power'"
},
{
  "_id": "ui.index.6.parameter",
  "value": "VirtualParameters.getponrx"
},
{
  "_id": "ui.overview.charts.online.label",
  "value": "'ONT status'"
},
{
  "_id": "ui.overview.charts.online.slices.1_onlineNow.color",
  "value": "'#90EE90'"
},
{
  "_id": "ui.overview.charts.online.slices.1_onlineNow.filter",
  "value": "Events.Inform > NOW() - 5 * 60 * 1000"
},
{
  "_id": "ui.overview.charts.online.slices.1_onlineNow.label",
  "value": "'Online'"
},
{
  "_id": "ui.overview.charts.online.slices.2_past24.color",
  "value": "'#095ae6'"
},
{
  "_id": "ui.overview.charts.online.slices.2_past24.filter",
  "value": "Events.Inform > (NOW() - 5 * 60 * 1000) - (24 * 60 * 60 * 1000) AND Events.Inform < (NOW() - 5 * 60 * 1000)"
},
{
  "_id": "ui.overview.charts.online.slices.2_past24.label",
  "value": "'Offline'"
},
{
  "_id": "ui.overview.charts.online.slices.3_others.color",
  "value": "'#e60909'"
},
{
  "_id": "ui.overview.charts.online.slices.3_others.filter",
  "value": "Events.Inform < (NOW() - 5 * 60 * 1000) - (24 * 60 * 60 * 1000)"
},
{
  "_id": "ui.overview.charts.online.slices.3_others.label",
  "value": "'ACS-LOS'"
},
{
  "_id": "ui.overview.groups.online.label",
  "value": "''"
},
{
  "_id": "ui.overview.groups.online.charts.0",
  "value": "'online'"
},
{
  "_id": "ui.pageSize",
  "value": "100"
},
{
  "_id": "ui.overview.groups.online.charts.1",
  "value": "'PON'"
},
{
  "_id": "ui.overview.groups.online.charts.3",
  "value": "'ont-type'"
},
{
  "_id": "ui.overview.groups.online.charts.2",
  "value": "\"PON Power\""
},
{
  "_id": "ui.overview.charts.PON.label",
  "value": "'PON Type'"
},
{
  "_id": "ui.overview.charts.PON.slices.1_GPON.color",
  "value": "'#00FFFF'"
},
{
  "_id": "ui.overview.charts.PON.slices.1_GPON.label",
  "value": "'GPON'"
},
{
  "_id": "ui.overview.charts.PON.slices.2_EPON.color",
  "value": "'#FFBF00'"
},
{
  "_id": "ui.overview.charts.PON.slices.2_EPON.filter",
  "value": "VirtualParameters.getponmode = \"EPON\""
},
{
  "_id": "ui.overview.charts.PON Power.label",
  "value": "\"PON RX\""
},
{
  "_id": "ui.overview.charts.PON Power.slices.1_Normal.color",
  "value": "'#00bd7c'"
},
{
  "_id": "ui.overview.charts.PON Power.slices.1_Normal.filter",
  "value": "VirtualParameters.getponrx <= \"-21\""
},
{
  "_id": "ui.overview.charts.PON Power.slices.1_Normal.label",
  "value": "'Good'"
},
{
  "_id": "ui.overview.charts.PON Power.slices.2_Warning.color",
  "value": "\"#c8d422\""
},
{
  "_id": "ui.overview.charts.PON Power.slices.2_Warning.filter",
  "value": "VirtualParameters.getponrx > \"-21\" AND VirtualParameters.getponrx < \"-26\""
},
{
  "_id": "ui.overview.charts.PON Power.slices.2_Warning.label",
  "value": "'Warning'"
},
{
  "_id": "ui.overview.charts.PON Power.slices.3_Critical.color",
  "value": "\"#e60909\""
},
{
  "_id": "ui.overview.charts.PON Power.slices.3_Critical.filter",
  "value": "VirtualParameters.getponrx >= \"-26\""
},
{
  "_id": "ui.overview.charts.PON Power.slices.3_Critical.label",
  "value": "'Critical'"
},
{
  "_id": "ui.overview.charts.PON.slices.1_GPON.filter",
  "value": "VirtualParameters.getponmode = \"GPON\""
},
{
  "_id": "ui.overview.charts.PON.slices.2_EPON.label",
  "value": "'EPON'"
},
{
  "_id": "ui.overview.charts.ont-type.slices.10_GM220-S.color",
  "value": "'#11BBFF'"
},
{
  "_id": "ui.overview.charts.ont-type.label",
  "value": "'Type ONT'"
},
{
  "_id": "ui.overview.charts.ont-type.slices.10_GM220-S.filter",
  "value": "DeviceID.ProductClass = \"GM220-S\""
},
{
  "_id": "ui.overview.charts.ont-type.slices.10_GM220-S.label",
  "value": "'GM220-S'"
},
{
  "_id": "ui.overview.charts.ont-type.slices.1_546M.filter",
  "value": "DeviceID.ProductClass = \"HG8546M\""
},
{
  "_id": "ui.overview.charts.ont-type.slices.1_546M.color",
  "value": "'#AFE1AF'"
},
{
  "_id": "ui.overview.charts.ont-type.slices.1_546M.label",
  "value": "'HG8546M'"
},
{
  "_id": "ui.overview.charts.ont-type.slices.2_F460.color",
  "value": "'#00CC22'"
},
{
  "_id": "ui.overview.charts.ont-type.slices.2_F460.filter",
  "value": "DeviceID.ProductClass = \"F460\""
},
{
  "_id": "ui.overview.charts.ont-type.slices.2_F460.label",
  "value": "'F460'"
},
{
  "_id": "ui.overview.charts.ont-type.slices.3_XPON.color",
  "value": "'#555555'"
},
{
  "_id": "ui.overview.charts.ont-type.slices.4_41A5.color",
  "value": "'#AFBBAF'"
},
{
  "_id": "ui.overview.charts.ont-type.slices.3_XPON.filter",
  "value": "DeviceID.ProductClass = \"F663NV3A\""
},
{
  "_id": "ui.overview.charts.ont-type.slices.3_XPON.label",
  "value": "'F663NV3A'"
},
{
  "_id": "ui.overview.charts.ont-type.slices.4_41A5.filter",
  "value": "DeviceID.ProductClass = \"EG8141A5\""
},
{
  "_id": "ui.overview.charts.ont-type.slices.4_41A5.label",
  "value": "'EG8141A5'"
},
{
  "_id": "ui.overview.charts.ont-type.slices.5_46C5.color",
  "value": "'#FC6604'"
},
{
  "_id": "ui.overview.charts.ont-type.slices.5_46C5.filter",
  "value": "DeviceID.ProductClass = \"HS8145C5\""
},
{
  "_id": "ui.overview.charts.ont-type.slices.5_46C5.label",
  "value": "'HS8145C5'"
},
{
  "_id": "ui.overview.charts.ont-type.slices.6_342R.color",
  "value": "'#00BBAF'"
},
{
  "_id": "ui.overview.charts.ont-type.slices.6_342R.filter",
  "value": "DeviceID.ProductClass = \"HG8342R\""
},
{
  "_id": "ui.overview.charts.ont-type.slices.7_XPON.color",
  "value": "'#008080'"
},
{
  "_id": "ui.overview.charts.ont-type.slices.6_342R.label",
  "value": "'HG8342R'"
},
{
  "_id": "ui.overview.charts.ont-type.slices.7_XPON.filter",
  "value": "DeviceID.ProductClass = \"F663NV3a\""
},
{
  "_id": "ui.overview.charts.ont-type.slices.7_XPON.label",
  "value": "'F663NV3a'"
},
{
  "_id": "ui.overview.charts.ont-type.slices.8_245H.color",
  "value": "'#A99BAF'"
},
{
  "_id": "ui.overview.charts.ont-type.slices.8_245H.filter",
  "value": "DeviceID.ProductClass = \"HG8245H\""
},
{
  "_id": "ui.overview.charts.ont-type.slices.8_245H.label",
  "value": "'HG8245H'"
},
{
  "_id": "ui.overview.charts.ont-type.slices.9_346M.color",
  "value": "'#1199FF'"
},
{
  "_id": "ui.overview.charts.ont-type.slices.9_346M.label",
  "value": "'HG8346M'"
},
{
  "_id": "ui.overview.charts.ont-type.slices.9_346M.filter",
  "value": "DeviceID.ProductClass = \"HG8346M\""
},
{
  "_id": "ui.filters.2.parameter",
  "value": "InternetGatewayDevice.WANDevice.1.WANConnectionDevice.1.WANPPPConnection.1.Username"
},
{
  "_id": "ui.filters.3.label",
  "value": "'TYPE'"
},
{
  "_id": "ui.filters.3.parameter",
  "value": "DeviceID.ProductClass"
},
{
  "_id": "ui.filters.3.type",
  "value": "'string'"
},
{
  "_id": "ui.filters.4.label",
  "value": "'PON'"
},
{
  "_id": "ui.filters.4.parameter",
  "value": "InternetGatewayDevice.WANDevice.1.WANCommonInterfaceConfig.WANAccessType"
},
{
  "_id": "ui.filters.4.type",
  "value": "'string'"
},
{
  "_id": "ui.index.0.parameters.1",
  "value": "InternetGatewayDevice.WANDevice.*.WANConnectionDevice.*.WANPPPConnection"
},
{
  "_id": "ui.index.0.parameters.2",
  "value": "InternetGatewayDevice.WANDevice.*.WANConnectionDevice.*.WANIPConnection.*.ExternalIPAddress"
},
{
  "_id": "ui.index.0.parameters.4",
  "value": "InternetGatewayDevice.DeviceInfo.X_HW_UpPortMode"
},
{
  "_id": "ui.index.1.type",
  "value": "'container'"
},
{
  "_id": "ui.index.1.components.0.type",
  "value": "'parameter'"
},
{
  "_id": "ui.index.1.components.1.chart",
  "value": "'online'"
},
{
  "_id": "ui.index.1.components.1.type",
  "value": "'overview-dot'"
},
{
  "_id": "ui.index.0.parameters.0",
  "value": "Events.Inform"
},
{
  "_id": "ui.index.5.writable",
  "value": "false"
},
{
  "_id": "ui.index.0.parameters.3",
  "value": "VirtualParameters.pppUsername"
},
{
  "_id": "ui.index.7.label",
  "value": "'IP WAN'"
},
{
  "_id": "ui.index.7.parameter",
  "value": "VirtualParameters.wanip"
},
{
  "_id": "ui.index.1.element",
  "value": "'span.inform'"
},
{
  "_id": "ui.index.8.label",
  "value": "'TYPE'"
},
{
  "_id": "ui.index.8.parameter",
  "value": "DeviceID.ProductClass"
},
{
  "_id": "ui.index.9.label",
  "value": "'MAC'"
},
{
  "_id": "ui.index.9.parameter",
  "value": "VirtualParameters.getmac"
},
{
  "_id": "ui.index.10.label",
  "value": "'Software version'"
},
{
  "_id": "ui.index.10.parameter",
  "value": "InternetGatewayDevice.DeviceInfo.SoftwareVersion"
},
{
  "_id": "ui.index.11.label",
  "value": "'Reg Time'"
},
{
  "_id": "ui.index.11.parameter",
  "value": "Events.Registered"
},
{
  "_id": "ui.index.12.type",
  "value": "'tags'"
},
{
  "_id": "ui.device.1.parameters.0.label",
  "value": "'Last inform'"
},
{
  "_id": "ui.device.1.parameters.0.type",
  "value": "'container'"
},
{
  "_id": "ui.device.1.parameters.0.components.0.type",
  "value": "'parameter'"
},
{
  "_id": "ui.device.1.parameters.0.element",
  "value": "'span.inform'"
},
{
  "_id": "ui.device.1.parameters.0.parameter",
  "value": "DATE_STRING(Events.Inform)"
},
{
  "_id": "ui.device.1.parameters.0.components.1.chart",
  "value": "'online'"
},
{
  "_id": "ui.device.1.parameters.0.components.1.type",
  "value": "'overview-dot'"
},
{
  "_id": "ui.device.1.parameters.0.components.2.type",
  "value": "'summon-button'"
},
{
  "_id": "ui.device.1.parameters.0.components.2.parameters.0",
  "value": "InternetGatewayDevice.DeviceInfo.HardwareVersion"
},
{
  "_id": "ui.device.1.parameters.0.components.2.parameters.1",
  "value": "InternetGatewayDevice.DeviceInfo.SoftwareVersion"
},
{
  "_id": "ui.device.1.parameters.0.components.2.parameters.2",
  "value": "InternetGatewayDevice.WANDevice.*.WANConnectionDevice.*.WANPPPConnection"
},
{
  "_id": "ui.device.1.parameters.0.components.2.parameters.3",
  "value": "InternetGatewayDevice.WANDevice.*.WANConnectionDevice.*.WANIPConnection"
},
{
  "_id": "ui.device.1.parameters.0.components.2.parameters.4",
  "value": "InternetGatewayDevice.LANDevice.*.WLANConfiguration"
},
{
  "_id": "ui.device.1.parameters.0.components.2.parameters.5",
  "value": "InternetGatewayDevice.LANDevice.*.Hosts.Host"
},
{
  "_id": "ui.device.1.parameters.0.components.2.parameters.6",
  "value": "InternetGatewayDevice.LANDevice.1.LANHostConfigManagement.IPRouters"
},
{
  "_id": "ui.device.1.parameters.0.components.2.parameters.7",
  "value": "InternetGatewayDevice.LANDevice.1.LANHostConfigManagement.MinAddress"
},
{
  "_id": "ui.device.1.parameters.0.components.2.parameters.8",
  "value": "InternetGatewayDevice.LANDevice.1.LANHostConfigManagement.MaxAddress"
},
{
  "_id": "ui.device.1.parameters.0.components.2.parameters.9",
  "value": "InternetGatewayDevice.X_HW_Security.X_HW_FirewallLevel"
},
{
  "_id": "ui.device.1.parameters.0.components.2.parameters.10",
  "value": "VirtualParameters.getmac"
},
{
  "_id": "ui.device.1.parameters.0.components.2.parameters.11",
  "value": "VirtualParameters.getponrx"
},
{
  "_id": "ui.device.1.parameters.1.label",
  "value": "'SN ONT'"
},
{
  "_id": "ui.device.1.parameters.1.parameter",
  "value": "DeviceID.SerialNumber"
},
{
  "_id": "ui.device.1.parameters.2.label",
  "value": "'TYPE'"
},
{
  "_id": "ui.device.1.parameters.2.parameter",
  "value": "DeviceID.ProductClass"
},
{
  "_id": "ui.device.1.parameters.3.label",
  "value": "'OUI'"
},
{
  "_id": "ui.device.1.parameters.3.parameter",
  "value": "DeviceID.OUI"
},
{
  "_id": "ui.device.1.parameters.4.label",
  "value": "'Manufacturer'"
},
{
  "_id": "ui.device.1.parameters.4.parameter",
  "value": "DeviceID.Manufacturer"
},
{
  "_id": "ui.device.1.parameters.5.label",
  "value": "'Hardware version'"
},
{
  "_id": "ui.device.1.parameters.5.parameter",
  "value": "InternetGatewayDevice.DeviceInfo.HardwareVersion"
},
{
  "_id": "ui.device.1.parameters.6.parameter",
  "value": "InternetGatewayDevice.DeviceInfo.SoftwareVersion"
},
{
  "_id": "ui.device.1.parameters.7.label",
  "value": "'MAC'"
},
{
  "_id": "ui.device.1.parameters.7.parameter",
  "value": "VirtualParameters.getmac"
},
{
  "_id": "ui.device.1.parameters.8.label",
  "value": "'Rx Power'"
},
{
  "_id": "ui.device.1.parameters.6.label",
  "value": "'Software version'"
},
{
  "_id": "ui.device.1.parameters.8.parameter",
  "value": "VirtualParameters.getponrx"
},
{
  "_id": "ui.device.1.parameters.9.label",
  "value": "'IP Router'"
},
{
  "_id": "ui.device.1.parameters.9.parameter",
  "value": "InternetGatewayDevice.LANDevice.1.LANHostConfigManagement.IPRouters"
},
{
  "_id": "ui.device.1.parameters.10.label",
  "value": "'Start DHCP Address'"
},
{
  "_id": "ui.device.1.parameters.10.parameter",
  "value": "InternetGatewayDevice.LANDevice.1.LANHostConfigManagement.MinAddress"
},
{
  "_id": "ui.device.1.parameters.11.label",
  "value": "'End DHCP Address'"
},
{
  "_id": "ui.device.1.parameters.11.parameter",
  "value": "InternetGatewayDevice.LANDevice.1.LANHostConfigManagement.MaxAddress"
},
{
  "_id": "ui.device.1.parameters.12.label",
  "value": "'Super Admin'"
},
{
  "_id": "ui.device.1.parameters.12.parameter",
  "value": "VirtualParameters.getsuperadmin"
},
{
  "_id": "ui.device.1.parameters.13.label",
  "value": "'Super Password'"
},
{
  "_id": "ui.device.1.parameters.13.parameter",
  "value": "VirtualParameters.getsuperpassword"
},
{
  "_id": "ui.device.1.parameters.14.label",
  "value": "'User Admin'"
},
{
  "_id": "ui.device.1.parameters.14.parameter",
  "value": "VirtualParameters.getuseradmin"
},
{
  "_id": "ui.device.1.parameters.15.label",
  "value": "'User Password'"
},
{
  "_id": "ui.device.1.parameters.15.parameter",
  "value": "VirtualParameters.getuserpassword"
},
{
  "_id": "ui.device.1.parameters.16.label",
  "value": "'Kopi'"
},
{
  "_id": "ui.device.1.parameters.16.paramaters",
  "value": "VirtualParameters.epon-convert"
},
{
  "_id": "ui.device.1.parameters.17.label",
  "value": "'Firewall'"
},
{
  "_id": "ui.device.1.parameters.17.parameter",
  "value": "InternetGatewayDevice.X_HW_Security.X_HW_FirewallLevel"
},
{
  "_id": "ui.device.3.href",
  "value": "\"https://pastebin.com/raw/uFAR3V9W\""
},
{
  "_id": "ui.device.3.innerHTML",
  "value": "'DATASHEET CONFIG WAN'"
},
{
  "_id": "ui.device.3.target",
  "value": "'_blank'"
},
{
  "_id": "ui.device.4.components.0.parameters.0.label",
  "value": "'WAN PPP'"
},
{
  "_id": "ui.device.4.filter",
  "value": "DeviceID.Manufacturer = \"Huawei Technologies Co., Ltd\""
},
{
  "_id": "ui.device.4.components.0.parameters.0.type",
  "value": "'container'"
},
{
  "_id": "ui.device.4.components.0.parameters.0.components.0.type",
  "value": "'summon-button'"
},
{
  "_id": "ui.device.4.components.0.parameters.0.components.0.parameters.0",
  "value": "InternetGatewayDevice.WANDevice.*.WANConnectionDevice.*.WANPPPConnection"
},
{
  "_id": "ui.device.4.components.1.parameter",
  "value": "InternetGatewayDevice.WANDevice.1.WANConnectionDevice.2.WANPPPConnection"
},
{
  "_id": "ui.device.4.components.1.childParameters.0.label",
  "value": "'Enable'"
},
{
  "_id": "ui.device.4.components.1.childParameters.0.parameter",
  "value": "Enable"
},
{
  "_id": "ui.device.4.components.1.childParameters.1.label",
  "value": "'Conn Name'"
},
{
  "_id": "ui.device.4.components.1.childParameters.1.parameter",
  "value": "Name"
},
{
  "_id": "ui.device.4.components.1.childParameters.2.label",
  "value": "'Conn Mode'"
},
{
  "_id": "ui.device.4.components.1.childParameters.2.parameter",
  "value": "ConnectionType"
},
{
  "_id": "ui.device.4.components.1.childParameters.3.label",
  "value": "'Service List'"
},
{
  "_id": "ui.device.4.components.1.childParameters.3.parameter",
  "value": "X_HW_SERVICELIST"
},
{
  "_id": "ui.device.4.components.1.childParameters.4.label",
  "value": "'NAT'"
},
{
  "_id": "ui.device.4.components.1.childParameters.4.parameter",
  "value": "NATEnabled"
},
{
  "_id": "ui.device.4.components.1.childParameters.5.label",
  "value": "'IP'"
},
{
  "_id": "ui.device.4.components.1.childParameters.5.parameter",
  "value": "ExternalIPAddress"
},
{
  "_id": "ui.device.4.components.1.childParameters.6.label",
  "value": "'Username'"
},
{
  "_id": "ui.device.4.components.1.childParameters.6.parameter",
  "value": "Username"
},
{
  "_id": "ui.device.4.components.1.childParameters.7.label",
  "value": "'Password'"
},
{
  "_id": "ui.device.4.components.1.childParameters.8.label",
  "value": "'VLAN'"
},
{
  "_id": "ui.device.4.components.1.childParameters.8.parameter",
  "value": "X_HW_VLAN"
},
{
  "_id": "ui.device.4.components.1.childParameters.7.parameter",
  "value": "Password"
},
{
  "_id": "ui.device.4.components.1.childParameters.9.label",
  "value": "'LAN1'"
},
{
  "_id": "ui.device.4.components.1.childParameters.9.parameter",
  "value": "X_HW_LANBIND.Lan1Enable"
},
{
  "_id": "ui.device.4.components.1.childParameters.10.label",
  "value": "'LAN2'"
},
{
  "_id": "ui.device.4.components.1.childParameters.11.label",
  "value": "'LAN3'"
},
{
  "_id": "ui.device.4.components.1.childParameters.11.parameter",
  "value": "X_HW_LANBIND.Lan3Enable"
},
{
  "_id": "ui.device.4.components.1.childParameters.12.label",
  "value": "'LAN4'"
},
{
  "_id": "ui.device.4.components.1.childParameters.10.parameter",
  "value": "X_HW_LANBIND.Lan2Enable"
},
{
  "_id": "ui.device.4.components.1.childParameters.12.parameter",
  "value": "X_HW_LANBIND.Lan4Enable"
},
{
  "_id": "ui.device.4.components.1.childParameters.14.label",
  "value": "'SSID2'"
},
{
  "_id": "ui.device.4.components.1.childParameters.13.label",
  "value": "'SSID1'"
},
{
  "_id": "ui.device.4.components.1.childParameters.14.parameter",
  "value": "X_HW_LANBIND.SSID2Enable"
},
{
  "_id": "ui.device.4.components.1.childParameters.13.parameter",
  "value": "X_HW_LANBIND.SSID1Enable"
},
{
  "_id": "ui.device.4.components.1.childParameters.15.label",
  "value": "'SSID3'"
},
{
  "_id": "ui.device.4.components.1.childParameters.15.parameter",
  "value": "X_HW_LANBIND.SSID3Enable"
},
{
  "_id": "ui.device.4.components.1.childParameters.16.label",
  "value": "'SSID4'"
},
{
  "_id": "ui.device.4.components.1.childParameters.16.parameter",
  "value": "X_HW_LANBIND.SSID4Enable"
},
{
  "_id": "ui.device.4.components.2.parameters.0.element",
  "value": "'span.inform'"
},
{
  "_id": "ui.device.4.components.2.parameters.0.label",
  "value": "'WAN IP'"
},
{
  "_id": "ui.device.4.components.2.type",
  "value": "'parameter-list'"
},
{
  "_id": "ui.device.4.components.2.parameters.0.type",
  "value": "'container'"
},
{
  "_id": "ui.device.4.components.3.parameter",
  "value": "InternetGatewayDevice.WANDevice.1.WANConnectionDevice.1.WANIPConnection"
},
{
  "_id": "ui.device.4.components.2.parameters.0.components.0.type",
  "value": "'summon-button'"
},
{
  "_id": "ui.device.4.components.2.parameters.0.components.0.parameters.0",
  "value": "InternetGatewayDevice.WANDevice.*.WANConnectionDevice.*.WANIPConnection"
},
{
  "_id": "ui.device.4.components.3.childParameters.0.parameter",
  "value": "Enable"
},
{
  "_id": "ui.device.4.components.3.type",
  "value": "'parameter-table'"
},
{
  "_id": "ui.device.4.components.3.childParameters.0.label",
  "value": "'Enable'"
},
{
  "_id": "ui.device.4.components.3.childParameters.1.parameter",
  "value": "Name"
},
{
  "_id": "ui.device.4.components.3.childParameters.2.label",
  "value": "'WAN Type'"
},
{
  "_id": "ui.device.4.components.3.childParameters.1.label",
  "value": "'Conn Name'"
},
{
  "_id": "ui.device.4.components.3.childParameters.2.parameter",
  "value": "AddressingType"
},
{
  "_id": "ui.device.4.components.3.childParameters.3.label",
  "value": "'Conn Mode'"
},
{
  "_id": "ui.device.4.components.3.childParameters.4.label",
  "value": "'Service List'"
},
{
  "_id": "ui.device.4.components.3.childParameters.4.parameter",
  "value": "X_HW_SERVICELIST"
},
{
  "_id": "ui.device.4.components.3.childParameters.3.parameter",
  "value": "ConnectionType"
},
{
  "_id": "ui.device.4.components.3.childParameters.5.label",
  "value": "'NAT'"
},
{
  "_id": "ui.device.4.components.3.childParameters.5.parameter",
  "value": "NATEnabled"
},
{
  "_id": "ui.device.4.components.3.childParameters.6.label",
  "value": "'IP'"
},
{
  "_id": "ui.device.4.components.3.childParameters.6.parameter",
  "value": "ExternalIPAddress"
},
{
  "_id": "ui.device.4.components.3.childParameters.7.label",
  "value": "'VLAN'"
},
{
  "_id": "ui.device.4.components.3.childParameters.7.parameter",
  "value": "X_HW_VLAN"
},
{
  "_id": "ui.device.4.components.3.childParameters.8.label",
  "value": "'LAN1'"
},
{
  "_id": "ui.device.4.components.3.childParameters.9.label",
  "value": "'LAN2'"
},
{
  "_id": "ui.device.4.components.3.childParameters.8.parameter",
  "value": "X_HW_LANBIND.Lan1Enable"
},
{
  "_id": "ui.device.4.components.3.childParameters.9.parameter",
  "value": "X_HW_LANBIND.Lan2Enable"
},
{
  "_id": "ui.device.4.components.3.childParameters.10.label",
  "value": "'LAN3'"
},
{
  "_id": "ui.device.4.components.3.childParameters.10.parameter",
  "value": "X_HW_LANBIND.Lan3Enable"
},
{
  "_id": "ui.device.4.components.3.childParameters.11.label",
  "value": "'LAN4'"
},
{
  "_id": "ui.device.4.components.3.childParameters.11.parameter",
  "value": "X_HW_LANBIND.Lan4Enable"
},
{
  "_id": "ui.device.4.components.3.childParameters.12.label",
  "value": "'SSID1'"
},
{
  "_id": "ui.device.4.components.3.childParameters.12.parameter",
  "value": "X_HW_LANBIND.SSID1Enable"
},
{
  "_id": "ui.device.4.components.3.childParameters.13.label",
  "value": "'SSID2'"
},
{
  "_id": "ui.device.4.components.3.childParameters.13.parameter",
  "value": "X_HW_LANBIND.SSID2Enable"
},
{
  "_id": "ui.device.4.components.3.childParameters.14.parameter",
  "value": "X_HW_LANBIND.SSID3Enable"
},
{
  "_id": "ui.device.4.components.3.childParameters.15.label",
  "value": "'SSID4'"
},
{
  "_id": "ui.device.4.components.3.childParameters.14.label",
  "value": "'SSID3'"
},
{
  "_id": "ui.device.4.components.3.childParameters.15.parameter",
  "value": "X_HW_LANBIND.SSID4Enable"
},
{
  "_id": "ui.device.4.components.4.type",
  "value": "'parameter-list'"
},
{
  "_id": "ui.device.4.components.4.parameters.0.element",
  "value": "'span.inform'"
},
{
  "_id": "ui.device.4.components.4.parameters.0.type",
  "value": "'container'"
},
{
  "_id": "ui.device.4.components.4.parameters.0.label",
  "value": "'SSID-LIST'"
},
{
  "_id": "ui.device.4.components.4.parameters.0.components.0.type",
  "value": "'summon-button'"
},
{
  "_id": "ui.device.4.components.4.parameters.0.components.0.parameters.0",
  "value": "InternetGatewayDevice.LANDevice.*.WLANConfiguration"
},
{
  "_id": "ui.device.4.components.5.type",
  "value": "'parameter-table'"
},
{
  "_id": "ui.device.4.components.5.parameter",
  "value": "InternetGatewayDevice.LANDevice.1.WLANConfiguration"
},
{
  "_id": "ui.device.4.components.5.childParameters.0.label",
  "value": "'SSID'"
},
{
  "_id": "ui.device.4.components.5.childParameters.1.label",
  "value": "'Security'"
},
{
  "_id": "ui.device.4.components.5.childParameters.0.parameter",
  "value": "SSID"
},
{
  "_id": "ui.device.4.components.5.childParameters.1.parameter",
  "value": "BeaconType"
},
{
  "_id": "ui.device.4.components.5.childParameters.2.parameter",
  "value": "PreSharedKey.1.KeyPassphrase"
},
{
  "_id": "ui.device.4.components.5.childParameters.3.label",
  "value": "'Status'"
},
{
  "_id": "ui.device.4.components.5.childParameters.2.label",
  "value": "'Password'"
},
{
  "_id": "ui.device.4.components.5.childParameters.4.label",
  "value": "'Device Limit'"
},
{
  "_id": "ui.device.4.components.5.childParameters.4.parameter",
  "value": "X_HW_AssociateNum"
},
{
  "_id": "ui.device.5.filter",
  "value": "DeviceID.Manufacturer = \"Huawei Technologies Co., Ltd.\""
},
{
  "_id": "ui.device.4.components.5.childParameters.3.parameter",
  "value": "Enable"
},
{
  "_id": "ui.device.5.components.0.parameters.0.label",
  "value": "'WAN PPP'"
},
{
  "_id": "ui.device.5.components.0.parameters.0.type",
  "value": "'container'"
},
{
  "_id": "ui.device.5.components.0.parameters.0.components.0.type",
  "value": "'summon-button'"
},
{
  "_id": "ui.device.5.components.0.parameters.0.components.0.parameters.0",
  "value": "InternetGatewayDevice.WANDevice.*.WANConnectionDevice.*.WANPPPConnection"
},
{
  "_id": "ui.device.5.components.1.parameter",
  "value": "InternetGatewayDevice.WANDevice.1.WANConnectionDevice.1.WANPPPConnection"
},
{
  "_id": "ui.device.5.components.1.childParameters.0.label",
  "value": "'Enable'"
},
{
  "_id": "ui.device.5.components.1.childParameters.0.parameter",
  "value": "Enable"
},
{
  "_id": "ui.device.5.components.1.childParameters.1.label",
  "value": "'Conn Name'"
},
{
  "_id": "ui.device.5.components.1.childParameters.1.parameter",
  "value": "Name"
},
{
  "_id": "ui.device.5.components.1.childParameters.2.label",
  "value": "'Conn Mode'"
},
{
  "_id": "ui.device.5.components.1.childParameters.2.parameter",
  "value": "ConnectionType"
},
{
  "_id": "ui.device.5.components.1.childParameters.3.label",
  "value": "'Service List'"
},
{
  "_id": "ui.device.5.components.1.childParameters.3.parameter",
  "value": "X_HW_SERVICELIST"
},
{
  "_id": "ui.device.5.components.1.childParameters.4.label",
  "value": "'NAT'"
},
{
  "_id": "ui.device.5.components.1.childParameters.4.parameter",
  "value": "NATEnabled"
},
{
  "_id": "ui.device.5.components.1.childParameters.5.label",
  "value": "'IP'"
},
{
  "_id": "ui.device.5.components.1.childParameters.5.parameter",
  "value": "ExternalIPAddress"
},
{
  "_id": "ui.device.5.components.1.childParameters.6.parameter",
  "value": "Username"
},
{
  "_id": "ui.device.5.components.1.childParameters.6.label",
  "value": "'Username'"
},
{
  "_id": "ui.device.5.components.1.childParameters.7.label",
  "value": "'Password'"
},
{
  "_id": "ui.device.5.components.1.childParameters.8.label",
  "value": "'VLAN'"
},
{
  "_id": "ui.device.5.components.1.childParameters.7.parameter",
  "value": "Password"
},
{
  "_id": "ui.device.5.components.1.childParameters.8.parameter",
  "value": "X_HW_VLAN"
},
{
  "_id": "ui.device.5.components.1.childParameters.9.label",
  "value": "'LAN1'"
},
{
  "_id": "ui.device.5.components.1.childParameters.9.parameter",
  "value": "X_HW_LANBIND.Lan1Enable"
},
{
  "_id": "ui.device.5.components.1.childParameters.10.label",
  "value": "'LAN2'"
},
{
  "_id": "ui.device.5.components.1.childParameters.11.parameter",
  "value": "X_HW_LANBIND.Lan3Enable"
},
{
  "_id": "ui.device.5.components.1.childParameters.12.label",
  "value": "'LAN4'"
},
{
  "_id": "ui.device.5.components.1.childParameters.10.parameter",
  "value": "X_HW_LANBIND.Lan2Enable"
},
{
  "_id": "ui.device.5.components.1.childParameters.11.label",
  "value": "'LAN3'"
},
{
  "_id": "ui.device.5.components.1.childParameters.12.parameter",
  "value": "X_HW_LANBIND.Lan4Enable"
},
{
  "_id": "ui.device.5.components.1.childParameters.13.label",
  "value": "'SSID1'"
},
{
  "_id": "ui.device.5.components.1.childParameters.13.parameter",
  "value": "X_HW_LANBIND.SSID1Enable"
},
{
  "_id": "ui.device.5.components.1.childParameters.14.label",
  "value": "'SSID2'"
},
{
  "_id": "ui.device.5.components.1.childParameters.14.parameter",
  "value": "X_HW_LANBIND.SSID2Enable"
},
{
  "_id": "ui.device.5.components.1.childParameters.15.label",
  "value": "'SSID3'"
},
{
  "_id": "ui.device.5.components.1.childParameters.15.parameter",
  "value": "X_HW_LANBIND.SSID3Enable"
},
{
  "_id": "ui.device.5.components.1.childParameters.16.label",
  "value": "'SSID4'"
},
{
  "_id": "ui.device.5.components.1.childParameters.16.parameter",
  "value": "X_HW_LANBIND.SSID4Enable"
},
{
  "_id": "ui.device.5.components.2.type",
  "value": "'parameter-list'"
},
{
  "_id": "ui.device.5.components.2.parameters.0.element",
  "value": "'span.inform'"
},
{
  "_id": "ui.device.5.components.2.parameters.0.label",
  "value": "'WAN IP'"
},
{
  "_id": "ui.device.5.components.2.parameters.0.components.0.type",
  "value": "'summon-button'"
},
{
  "_id": "ui.device.5.components.2.parameters.0.type",
  "value": "'container'"
},
{
  "_id": "ui.device.5.components.2.parameters.0.components.0.parameters.0",
  "value": "InternetGatewayDevice.WANDevice.*.WANConnectionDevice.*.WANIPConnection"
},
{
  "_id": "ui.device.5.components.3.parameter",
  "value": "InternetGatewayDevice.WANDevice.1.WANConnectionDevice.2.WANIPConnection"
},
{
  "_id": "ui.device.5.components.3.childParameters.0.label",
  "value": "'Enable'"
},
{
  "_id": "ui.device.5.components.3.type",
  "value": "'parameter-table'"
},
{
  "_id": "ui.device.5.components.3.childParameters.0.parameter",
  "value": "Enable"
},
{
  "_id": "ui.device.5.components.3.childParameters.1.label",
  "value": "'Conn Name'"
},
{
  "_id": "ui.device.5.components.3.childParameters.2.label",
  "value": "'WAN Type'"
},
{
  "_id": "ui.device.5.components.3.childParameters.1.parameter",
  "value": "Name"
},
{
  "_id": "ui.device.5.components.3.childParameters.2.parameter",
  "value": "AddressingType"
},
{
  "_id": "ui.device.5.components.3.childParameters.3.label",
  "value": "'Conn Mode'"
},
{
  "_id": "ui.device.5.components.3.childParameters.3.parameter",
  "value": "ConnectionType"
},
{
  "_id": "ui.device.5.components.3.childParameters.4.label",
  "value": "'Service List'"
},
{
  "_id": "ui.device.5.components.3.childParameters.5.label",
  "value": "'NAT'"
},
{
  "_id": "ui.device.5.components.3.childParameters.4.parameter",
  "value": "X_HW_SERVICELIST"
},
{
  "_id": "ui.device.5.components.3.childParameters.5.parameter",
  "value": "NATEnabled"
},
{
  "_id": "ui.device.5.components.3.childParameters.6.label",
  "value": "'IP'"
},
{
  "_id": "ui.device.5.components.3.childParameters.6.parameter",
  "value": "ExternalIPAddress"
},
{
  "_id": "ui.device.5.components.3.childParameters.7.label",
  "value": "'VLAN'"
},
{
  "_id": "ui.device.5.components.3.childParameters.7.parameter",
  "value": "X_HW_VLAN"
},
{
  "_id": "ui.device.5.components.3.childParameters.8.parameter",
  "value": "X_HW_LANBIND.Lan1Enable"
},
{
  "_id": "ui.device.5.components.3.childParameters.8.label",
  "value": "'LAN1'"
},
{
  "_id": "ui.device.5.components.3.childParameters.9.label",
  "value": "'LAN2'"
},
{
  "_id": "ui.device.5.components.3.childParameters.9.parameter",
  "value": "X_HW_LANBIND.Lan2Enable"
},
{
  "_id": "ui.device.5.components.3.childParameters.10.label",
  "value": "'LAN3'"
},
{
  "_id": "ui.device.5.components.3.childParameters.10.parameter",
  "value": "X_HW_LANBIND.Lan3Enable"
},
{
  "_id": "ui.device.5.components.3.childParameters.11.parameter",
  "value": "X_HW_LANBIND.Lan4Enable"
},
{
  "_id": "ui.device.5.components.3.childParameters.11.label",
  "value": "'LAN4'"
},
{
  "_id": "ui.device.5.components.3.childParameters.13.label",
  "value": "'SSID2'"
},
{
  "_id": "ui.device.5.components.3.childParameters.12.label",
  "value": "'SSID1'"
},
{
  "_id": "ui.device.5.components.3.childParameters.13.parameter",
  "value": "X_HW_LANBIND.SSID2Enable"
},
{
  "_id": "ui.device.5.components.3.childParameters.12.parameter",
  "value": "X_HW_LANBIND.SSID1Enable"
},
{
  "_id": "ui.device.5.components.3.childParameters.14.label",
  "value": "'SSID3'"
},
{
  "_id": "ui.device.5.components.3.childParameters.14.parameter",
  "value": "X_HW_LANBIND.SSID3Enable"
},
{
  "_id": "ui.device.5.components.3.childParameters.15.parameter",
  "value": "X_HW_LANBIND.SSID4Enable"
},
{
  "_id": "ui.device.5.components.3.childParameters.15.label",
  "value": "'SSID4'"
},
{
  "_id": "ui.device.5.components.4.type",
  "value": "'parameter-list'"
},
{
  "_id": "ui.device.5.components.4.parameters.0.element",
  "value": "'span.inform'"
},
{
  "_id": "ui.device.5.components.4.parameters.0.type",
  "value": "'container'"
},
{
  "_id": "ui.device.5.components.4.parameters.0.label",
  "value": "'SSID-LIST'"
},
{
  "_id": "ui.device.5.components.4.parameters.0.components.0.parameters.0",
  "value": "InternetGatewayDevice.LANDevice.*.WLANConfiguration"
},
{
  "_id": "ui.device.5.components.5.parameter",
  "value": "InternetGatewayDevice.LANDevice.1.WLANConfiguration"
},
{
  "_id": "ui.device.5.components.4.parameters.0.components.0.type",
  "value": "'summon-button'"
},
{
  "_id": "ui.device.5.components.5.type",
  "value": "'parameter-table'"
},
{
  "_id": "ui.device.5.components.5.childParameters.0.label",
  "value": "'SSID'"
},
{
  "_id": "ui.device.5.components.5.childParameters.0.parameter",
  "value": "SSID"
},
{
  "_id": "ui.device.5.components.5.childParameters.1.label",
  "value": "'Security'"
},
{
  "_id": "ui.device.5.components.5.childParameters.2.label",
  "value": "'Password'"
},
{
  "_id": "ui.device.5.components.5.childParameters.1.parameter",
  "value": "BeaconType"
},
{
  "_id": "ui.device.5.components.5.childParameters.2.parameter",
  "value": "PreSharedKey.1.KeyPassphrase"
},
{
  "_id": "ui.device.5.components.5.childParameters.3.label",
  "value": "'Status'"
},
{
  "_id": "ui.device.5.components.5.childParameters.3.parameter",
  "value": "Enable"
},
{
  "_id": "ui.device.5.components.5.childParameters.4.parameter",
  "value": "X_HW_AssociateNum"
},
{
  "_id": "ui.device.5.components.5.childParameters.4.label",
  "value": "'Device Limit'"
},
{
  "_id": "ui.device.6.filter",
  "value": "DeviceID.Manufacturer = \"Technologies Co., Ltd\""
},
{
  "_id": "ui.device.6.components.0.type",
  "value": "'parameter-list'"
},
{
  "_id": "ui.device.6.components.0.parameters.0.label",
  "value": "'WAN PPP'"
},
{
  "_id": "ui.device.6.components.0.parameters.0.type",
  "value": "'container'"
},
{
  "_id": "ui.device.6.components.0.parameters.0.components.0.type",
  "value": "'summon-button'"
},
{
  "_id": "ui.device.6.components.0.parameters.0.components.0.parameters.0",
  "value": "InternetGatewayDevice.WANDevice.*.WANConnectionDevice.*.WANPPPConnection"
},
{
  "_id": "ui.device.6.components.1.childParameters.0.label",
  "value": "'Enable'"
},
{
  "_id": "ui.device.6.components.1.parameter",
  "value": "InternetGatewayDevice.WANDevice.1.WANConnectionDevice.1.WANPPPConnection"
},
{
  "_id": "ui.device.6.components.1.childParameters.0.parameter",
  "value": "Enable"
},
{
  "_id": "ui.device.6.components.1.type",
  "value": "'parameter-table'"
},
{
  "_id": "ui.device.6.components.1.childParameters.1.label",
  "value": "'Conn Name'"
},
{
  "_id": "ui.device.6.components.1.childParameters.1.parameter",
  "value": "Name"
},
{
  "_id": "ui.device.6.components.1.childParameters.3.label",
  "value": "'Service List'"
},
{
  "_id": "ui.device.6.components.1.childParameters.2.label",
  "value": "'Conn Mode'"
},
{
  "_id": "ui.device.6.components.1.childParameters.2.parameter",
  "value": "ConnectionType"
},
{
  "_id": "ui.device.6.components.1.childParameters.3.parameter",
  "value": "X_HW_SERVICELIST"
},
{
  "_id": "ui.device.6.components.1.childParameters.4.label",
  "value": "'NAT'"
},
{
  "_id": "ui.device.6.components.1.childParameters.4.parameter",
  "value": "NATEnabled"
},
{
  "_id": "ui.device.6.components.1.childParameters.5.label",
  "value": "'IP'"
},
{
  "_id": "ui.device.6.components.1.childParameters.5.parameter",
  "value": "ExternalIPAddress"
},
{
  "_id": "ui.device.6.components.1.childParameters.6.label",
  "value": "'Username'"
},
{
  "_id": "ui.device.6.components.1.childParameters.7.parameter",
  "value": "Password"
},
{
  "_id": "ui.device.6.components.1.childParameters.6.parameter",
  "value": "Username"
},
{
  "_id": "ui.device.6.components.1.childParameters.8.label",
  "value": "'VLAN'"
},
{
  "_id": "ui.device.6.components.1.childParameters.7.label",
  "value": "'Password'"
},
{
  "_id": "ui.device.6.components.1.childParameters.8.parameter",
  "value": "X_HW_VLAN"
},
{
  "_id": "ui.device.6.components.1.childParameters.9.label",
  "value": "'LAN1'"
},
{
  "_id": "ui.device.6.components.1.childParameters.9.parameter",
  "value": "X_HW_LANBIND.Lan1Enable"
},
{
  "_id": "ui.device.6.components.1.childParameters.10.label",
  "value": "'LAN2'"
},
{
  "_id": "ui.device.6.components.1.childParameters.11.label",
  "value": "'LAN3'"
},
{
  "_id": "ui.device.6.components.1.childParameters.11.parameter",
  "value": "X_HW_LANBIND.Lan3Enable"
},
{
  "_id": "ui.device.6.components.1.childParameters.10.parameter",
  "value": "X_HW_LANBIND.Lan2Enable"
},
{
  "_id": "ui.device.6.components.1.childParameters.12.label",
  "value": "'LAN4'"
},
{
  "_id": "ui.device.6.components.1.childParameters.12.parameter",
  "value": "X_HW_LANBIND.Lan4Enable"
},
{
  "_id": "ui.device.6.components.1.childParameters.13.label",
  "value": "'SSID1'"
},
{
  "_id": "ui.device.6.components.1.childParameters.13.parameter",
  "value": "X_HW_LANBIND.SSID1Enable"
},
{
  "_id": "ui.device.6.components.1.childParameters.14.label",
  "value": "'SSID2'"
},
{
  "_id": "ui.device.6.components.1.childParameters.14.parameter",
  "value": "X_HW_LANBIND.SSID2Enable"
},
{
  "_id": "ui.device.6.components.1.childParameters.15.label",
  "value": "'SSID3'"
},
{
  "_id": "ui.device.6.components.1.childParameters.15.parameter",
  "value": "X_HW_LANBIND.SSID3Enable"
},
{
  "_id": "ui.device.6.components.1.childParameters.16.label",
  "value": "'SSID4'"
},
{
  "_id": "ui.device.6.components.1.childParameters.16.parameter",
  "value": "X_HW_LANBIND.SSID4Enable"
},
{
  "_id": "ui.device.6.components.2.type",
  "value": "'parameter-list'"
},
{
  "_id": "ui.device.6.components.2.parameters.0.element",
  "value": "'span.inform'"
},
{
  "_id": "ui.device.6.components.2.parameters.0.label",
  "value": "'WAN IP'"
},
{
  "_id": "ui.device.6.components.2.parameters.0.components.0.type",
  "value": "'summon-button'"
},
{
  "_id": "ui.device.6.components.2.parameters.0.type",
  "value": "'container'"
},
{
  "_id": "ui.device.6.components.2.parameters.0.components.0.parameters.0",
  "value": "InternetGatewayDevice.WANDevice.*.WANConnectionDevice.*.WANIPConnection"
},
{
  "_id": "ui.device.6.components.3.parameter",
  "value": "InternetGatewayDevice.WANDevice.1.WANConnectionDevice.2.WANIPConnection"
},
{
  "_id": "ui.device.6.components.3.type",
  "value": "'parameter-table'"
},
{
  "_id": "ui.device.6.components.3.childParameters.0.label",
  "value": "'Enable'"
},
{
  "_id": "ui.device.6.components.3.childParameters.0.parameter",
  "value": "Enable"
},
{
  "_id": "ui.device.6.components.3.childParameters.1.label",
  "value": "'Conn Name'"
},
{
  "_id": "ui.device.6.components.3.childParameters.1.parameter",
  "value": "Name"
},
{
  "_id": "ui.device.6.components.3.childParameters.2.label",
  "value": "'WAN Type'"
},
{
  "_id": "ui.device.6.components.3.childParameters.2.parameter",
  "value": "AddressingType"
},
{
  "_id": "ui.device.6.components.3.childParameters.3.label",
  "value": "'Conn Mode'"
},
{
  "_id": "ui.device.6.components.3.childParameters.3.parameter",
  "value": "ConnectionType"
},
{
  "_id": "ui.device.6.components.3.childParameters.4.label",
  "value": "'Service List'"
},
{
  "_id": "ui.device.6.components.3.childParameters.4.parameter",
  "value": "X_HW_SERVICELIST"
},
{
  "_id": "ui.device.6.components.3.childParameters.5.parameter",
  "value": "NATEnabled"
},
{
  "_id": "ui.device.6.components.3.childParameters.6.label",
  "value": "'IP'"
},
{
  "_id": "ui.device.6.components.3.childParameters.5.label",
  "value": "'NAT'"
},
{
  "_id": "ui.device.6.components.3.childParameters.6.parameter",
  "value": "ExternalIPAddress"
},
{
  "_id": "ui.device.6.components.3.childParameters.7.label",
  "value": "'VLAN'"
},
{
  "_id": "ui.device.6.components.3.childParameters.7.parameter",
  "value": "X_HW_VLAN"
},
{
  "_id": "ui.device.6.components.3.childParameters.8.label",
  "value": "'LAN1'"
},
{
  "_id": "ui.device.6.components.3.childParameters.8.parameter",
  "value": "X_HW_LANBIND.Lan1Enable"
},
{
  "_id": "ui.device.6.components.3.childParameters.9.label",
  "value": "'LAN2'"
},
{
  "_id": "ui.device.6.components.3.childParameters.9.parameter",
  "value": "X_HW_LANBIND.Lan2Enable"
},
{
  "_id": "ui.device.6.components.3.childParameters.10.label",
  "value": "'LAN3'"
},
{
  "_id": "ui.device.6.components.3.childParameters.10.parameter",
  "value": "X_HW_LANBIND.Lan3Enable"
},
{
  "_id": "ui.device.6.components.3.childParameters.11.label",
  "value": "'LAN4'"
},
{
  "_id": "ui.device.6.components.3.childParameters.11.parameter",
  "value": "X_HW_LANBIND.Lan4Enable"
},
{
  "_id": "ui.device.6.components.3.childParameters.12.label",
  "value": "'SSID1'"
},
{
  "_id": "ui.device.6.components.3.childParameters.12.parameter",
  "value": "X_HW_LANBIND.SSID1Enable"
},
{
  "_id": "ui.device.6.components.3.childParameters.13.label",
  "value": "'SSID2'"
},
{
  "_id": "ui.device.6.components.3.childParameters.13.parameter",
  "value": "X_HW_LANBIND.SSID2Enable"
},
{
  "_id": "ui.device.6.components.3.childParameters.14.label",
  "value": "'SSID3'"
},
{
  "_id": "ui.device.6.components.3.childParameters.14.parameter",
  "value": "X_HW_LANBIND.SSID3Enable"
},
{
  "_id": "ui.device.6.components.3.childParameters.15.label",
  "value": "'SSID4'"
},
{
  "_id": "ui.device.6.components.3.childParameters.15.parameter",
  "value": "X_HW_LANBIND.SSID4Enable"
},
{
  "_id": "ui.device.6.components.4.type",
  "value": "'parameter-list'"
},
{
  "_id": "ui.device.6.components.4.parameters.0.label",
  "value": "'SSID-LIST'"
},
{
  "_id": "ui.device.6.components.4.parameters.0.components.0.parameters.0",
  "value": "InternetGatewayDevice.LANDevice.*.WLANConfiguration"
},
{
  "_id": "ui.device.6.components.5.parameter",
  "value": "InternetGatewayDevice.LANDevice.1.WLANConfiguration"
},
{
  "_id": "ui.device.6.components.4.parameters.0.element",
  "value": "'span.inform'"
},
{
  "_id": "ui.device.6.components.4.parameters.0.type",
  "value": "'container'"
},
{
  "_id": "ui.device.6.components.4.parameters.0.components.0.type",
  "value": "'summon-button'"
},
{
  "_id": "ui.device.6.components.5.type",
  "value": "'parameter-table'"
},
{
  "_id": "ui.device.6.components.5.childParameters.0.label",
  "value": "'SSID'"
},
{
  "_id": "ui.device.6.components.5.childParameters.1.label",
  "value": "'Security'"
},
{
  "_id": "ui.device.6.components.5.childParameters.0.parameter",
  "value": "SSID"
},
{
  "_id": "ui.device.6.components.5.childParameters.1.parameter",
  "value": "BeaconType"
},
{
  "_id": "ui.device.6.components.5.childParameters.2.label",
  "value": "'Password'"
},
{
  "_id": "ui.device.6.components.5.childParameters.2.parameter",
  "value": "PreSharedKey.1.KeyPassphrase"
},
{
  "_id": "ui.device.6.components.5.childParameters.3.label",
  "value": "'Status'"
},
{
  "_id": "ui.device.6.components.5.childParameters.3.parameter",
  "value": "Enable"
},
{
  "_id": "ui.device.7.filter",
  "value": "DeviceID.Manufacturer = \"ZTE\" AND DeviceID.ProductClass = \"F663NV3a\""
},
{
  "_id": "ui.device.6.components.5.childParameters.4.label",
  "value": "'Device Limit'"
},
{
  "_id": "ui.device.6.components.5.childParameters.4.parameter",
  "value": "X_HW_AssociateNum"
},
{
  "_id": "ui.device.7.components.0.type",
  "value": "'parameter-list'"
},
{
  "_id": "ui.device.7.type",
  "value": "'container'"
},
{
  "_id": "ui.device.7.components.0.parameters.0.label",
  "value": "'WAN PPP'"
},
{
  "_id": "ui.device.7.components.0.parameters.0.type",
  "value": "'container'"
},
{
  "_id": "ui.device.7.components.0.parameters.0.components.0.parameters.0",
  "value": "InternetGatewayDevice.WANDevice.*.WANConnectionDevice.*.WANPPPConnection"
},
{
  "_id": "ui.device.7.components.0.parameters.0.components.0.type",
  "value": "'summon-button'"
},
{
  "_id": "ui.device.7.components.1.parameter",
  "value": "InternetGatewayDevice.WANDevice.1.WANConnectionDevice.1.WANPPPConnection"
},
{
  "_id": "ui.device.7.components.1.type",
  "value": "'parameter-table'"
},
{
  "_id": "ui.device.7.components.1.childParameters.0.label",
  "value": "'Enable'"
},
{
  "_id": "ui.device.7.components.1.childParameters.0.parameter",
  "value": "Enable"
},
{
  "_id": "ui.device.7.components.1.childParameters.1.label",
  "value": "'Conn Name'"
},
{
  "_id": "ui.device.7.components.1.childParameters.1.parameter",
  "value": "Name"
},
{
  "_id": "ui.device.7.components.1.childParameters.2.label",
  "value": "'Conn Type'"
},
{
  "_id": "ui.device.7.components.1.childParameters.2.parameter",
  "value": "ConnectionType"
},
{
  "_id": "ui.device.7.components.1.childParameters.3.label",
  "value": "'Service List'"
},
{
  "_id": "ui.device.7.components.1.childParameters.3.parameter",
  "value": "X_CMCC_ServiceList"
},
{
  "_id": "ui.device.7.components.1.childParameters.4.label",
  "value": "'NAT'"
},
{
  "_id": "ui.device.7.components.1.childParameters.4.parameter",
  "value": "NATEnabled"
},
{
  "_id": "ui.device.7.components.1.childParameters.5.label",
  "value": "'IP'"
},
{
  "_id": "ui.device.7.components.1.childParameters.5.parameter",
  "value": "ExternalIPAddress"
},
{
  "_id": "ui.device.7.components.1.childParameters.6.label",
  "value": "'Username'"
},
{
  "_id": "ui.device.7.components.1.childParameters.6.parameter",
  "value": "Username"
},
{
  "_id": "ui.device.7.components.1.childParameters.7.label",
  "value": "'Password'"
},
{
  "_id": "ui.device.7.components.1.childParameters.7.parameter",
  "value": "Password"
},
{
  "_id": "ui.device.7.components.1.childParameters.8.label",
  "value": "'VLAN'"
},
{
  "_id": "ui.device.7.components.1.childParameters.8.parameter",
  "value": "X_CMCC_VLANIDMark"
},
{
  "_id": "ui.device.7.components.1.childParameters.9.label",
  "value": "'Bind'"
},
{
  "_id": "ui.device.7.components.2.type",
  "value": "'parameter-list'"
},
{
  "_id": "ui.device.7.components.1.childParameters.9.parameter",
  "value": "X_CMCC_LanInterface"
},
{
  "_id": "ui.device.7.components.2.parameters.0.element",
  "value": "'span.inform'"
},
{
  "_id": "ui.device.7.components.2.parameters.0.label",
  "value": "'WAN IP'"
},
{
  "_id": "ui.device.7.components.2.parameters.0.type",
  "value": "'container'"
},
{
  "_id": "ui.device.7.components.2.parameters.0.components.0.parameters.0",
  "value": "InternetGatewayDevice.WANDevice.*.WANConnectionDevice.*.WANIPConnection"
},
{
  "_id": "ui.device.7.components.2.parameters.0.components.0.type",
  "value": "'summon-button'"
},
{
  "_id": "ui.device.7.components.3.parameter",
  "value": "InternetGatewayDevice.WANDevice.1.WANConnectionDevice.1.WANIPConnection"
},
{
  "_id": "ui.device.7.components.3.childParameters.0.label",
  "value": "'Enable'"
},
{
  "_id": "ui.device.7.components.3.type",
  "value": "'parameter-table'"
},
{
  "_id": "ui.device.7.components.3.childParameters.0.parameter",
  "value": "Enable"
},
{
  "_id": "ui.device.7.components.3.childParameters.1.label",
  "value": "'Conn Name'"
},
{
  "_id": "ui.device.7.components.3.childParameters.1.parameter",
  "value": "Name"
},
{
  "_id": "ui.device.7.components.3.childParameters.2.label",
  "value": "'IP Type'"
},
{
  "_id": "ui.device.7.components.3.childParameters.2.parameter",
  "value": "AddressingType"
},
{
  "_id": "ui.device.7.components.3.childParameters.3.label",
  "value": "'Conn Type'"
},
{
  "_id": "ui.device.7.components.3.childParameters.3.parameter",
  "value": "ConnectionType"
},
{
  "_id": "ui.device.7.components.3.childParameters.4.label",
  "value": "'Service List'"
},
{
  "_id": "ui.device.7.components.3.childParameters.5.label",
  "value": "'NAT'"
},
{
  "_id": "ui.device.7.components.3.childParameters.4.parameter",
  "value": "X_CMCC_ServiceList"
},
{
  "_id": "ui.device.7.components.3.childParameters.5.parameter",
  "value": "NATEnabled"
},
{
  "_id": "ui.device.7.components.3.childParameters.6.parameter",
  "value": "ExternalIPAddress"
},
{
  "_id": "ui.device.7.components.3.childParameters.6.label",
  "value": "'IP'"
},
{
  "_id": "ui.device.7.components.3.childParameters.7.label",
  "value": "'VLAN'"
},
{
  "_id": "ui.device.7.components.3.childParameters.7.parameter",
  "value": "X_CMCC_VLANIDMark"
},
{
  "_id": "ui.device.7.components.3.childParameters.8.parameter",
  "value": "X_CMCC_LanInterface"
},
{
  "_id": "ui.device.7.components.3.childParameters.8.label",
  "value": "'Bind'"
},
{
  "_id": "ui.device.7.components.4.type",
  "value": "'parameter-list'"
},
{
  "_id": "ui.device.7.components.4.parameters.0.element",
  "value": "'span.inform'"
},
{
  "_id": "ui.device.7.components.4.parameters.0.components.0.type",
  "value": "'summon-button'"
},
{
  "_id": "ui.device.7.components.4.parameters.0.label",
  "value": "'SSID-LIST'"
},
{
  "_id": "ui.device.7.components.4.parameters.0.components.0.parameters.0",
  "value": "InternetGatewayDevice.LANDevice.*.WLANConfiguration"
},
{
  "_id": "ui.device.7.components.4.parameters.0.type",
  "value": "'container'"
},
{
  "_id": "ui.device.7.components.5.parameter",
  "value": "InternetGatewayDevice.LANDevice.1.WLANConfiguration"
},
{
  "_id": "ui.device.7.components.5.type",
  "value": "'parameter-table'"
},
{
  "_id": "ui.device.7.components.5.childParameters.0.label",
  "value": "'SSID'"
},
{
  "_id": "ui.device.7.components.5.childParameters.0.parameter",
  "value": "SSID"
},
{
  "_id": "ui.device.7.components.5.childParameters.1.label",
  "value": "'Security'"
},
{
  "_id": "ui.device.7.components.5.childParameters.2.label",
  "value": "'Password'"
},
{
  "_id": "ui.device.7.components.5.childParameters.2.parameter",
  "value": "PreSharedKey.1.KeyPassphrase"
},
{
  "_id": "ui.device.7.components.5.childParameters.1.parameter",
  "value": "BeaconType"
},
{
  "_id": "ui.device.7.components.5.childParameters.3.parameter",
  "value": "Enable"
},
{
  "_id": "ui.device.7.components.5.childParameters.3.label",
  "value": "'Status'"
},
{
  "_id": "ui.device.8.filter",
  "value": "DeviceID.Manufacturer = \"ZTE\" AND DeviceID.ProductClass = \"F663NV3A\""
},
{
  "_id": "ui.device.8.components.0.parameters.0.label",
  "value": "'WAN PPP'"
},
{
  "_id": "ui.device.8.components.0.parameters.0.type",
  "value": "'container'"
},
{
  "_id": "ui.device.8.components.0.parameters.0.components.0.type",
  "value": "'summon-button'"
},
{
  "_id": "ui.device.8.components.0.parameters.0.components.0.parameters.0",
  "value": "InternetGatewayDevice.WANDevice.*.WANConnectionDevice.*.WANPPPConnection"
},
{
  "_id": "ui.device.8.components.0.type",
  "value": "'parameter-list'"
},
{
  "_id": "ui.device.8.type",
  "value": "'container'"
},
{
  "_id": "ui.device.8.components.1.parameter",
  "value": "InternetGatewayDevice.WANDevice.1.WANConnectionDevice.1.WANPPPConnection"
},
{
  "_id": "ui.device.8.components.1.childParameters.0.label",
  "value": "'Enable'"
},
{
  "_id": "ui.device.8.components.1.childParameters.1.label",
  "value": "'Conn Name'"
},
{
  "_id": "ui.device.8.components.1.type",
  "value": "'parameter-table'"
},
{
  "_id": "ui.device.8.components.1.childParameters.1.parameter",
  "value": "Name"
},
{
  "_id": "ui.device.8.components.1.childParameters.2.label",
  "value": "'Conn Type'"
},
{
  "_id": "ui.device.8.components.1.childParameters.0.parameter",
  "value": "Enable"
},
{
  "_id": "ui.device.8.components.1.childParameters.2.parameter",
  "value": "ConnectionType"
},
{
  "_id": "ui.device.8.components.1.childParameters.3.label",
  "value": "'Service List'"
},
{
  "_id": "ui.device.8.components.1.childParameters.4.label",
  "value": "'NAT'"
},
{
  "_id": "ui.device.8.components.1.childParameters.4.parameter",
  "value": "NATEnabled"
},
{
  "_id": "ui.device.8.components.1.childParameters.3.parameter",
  "value": "X_CMCC_ServiceList"
},
{
  "_id": "ui.device.8.components.1.childParameters.5.label",
  "value": "'IP'"
},
{
  "_id": "ui.device.8.components.1.childParameters.6.label",
  "value": "'Username'"
},
{
  "_id": "ui.device.8.components.1.childParameters.5.parameter",
  "value": "ExternalIPAddress"
},
{
  "_id": "ui.device.8.components.1.childParameters.6.parameter",
  "value": "Username"
},
{
  "_id": "ui.device.8.components.1.childParameters.7.parameter",
  "value": "Password"
},
{
  "_id": "ui.device.8.components.1.childParameters.7.label",
  "value": "'Password'"
},
{
  "_id": "ui.device.8.components.1.childParameters.8.parameter",
  "value": "X_CMCC_VLANIDMark"
},
{
  "_id": "ui.device.8.components.1.childParameters.8.label",
  "value": "'VLAN'"
},
{
  "_id": "ui.device.8.components.1.childParameters.9.label",
  "value": "'Bind'"
},
{
  "_id": "ui.device.8.components.1.childParameters.9.parameter",
  "value": "X_CMCC_LanInterface"
},
{
  "_id": "ui.device.8.components.2.type",
  "value": "'parameter-list'"
},
{
  "_id": "ui.device.8.components.2.parameters.0.element",
  "value": "'span.inform'"
},
{
  "_id": "ui.device.8.components.2.parameters.0.label",
  "value": "'WAN IP'"
},
{
  "_id": "ui.device.8.components.2.parameters.0.type",
  "value": "'container'"
},
{
  "_id": "ui.device.8.components.2.parameters.0.components.0.type",
  "value": "'summon-button'"
},
{
  "_id": "ui.device.8.components.2.parameters.0.components.0.parameters.0",
  "value": "InternetGatewayDevice.WANDevice.*.WANConnectionDevice.*.WANIPConnection"
},
{
  "_id": "ui.device.8.components.3.parameter",
  "value": "InternetGatewayDevice.WANDevice.1.WANConnectionDevice.1.WANIPConnection"
},
{
  "_id": "ui.device.8.components.3.type",
  "value": "'parameter-table'"
},
{
  "_id": "ui.device.8.components.3.childParameters.0.label",
  "value": "'Enable'"
},
{
  "_id": "ui.device.8.components.3.childParameters.0.parameter",
  "value": "Enable"
},
{
  "_id": "ui.device.8.components.3.childParameters.1.label",
  "value": "'Conn Name'"
},
{
  "_id": "ui.device.8.components.3.childParameters.1.parameter",
  "value": "Name"
},
{
  "_id": "ui.device.8.components.3.childParameters.2.label",
  "value": "'Conn Type'"
},
{
  "_id": "ui.device.8.components.3.childParameters.2.parameter",
  "value": "ConnectionType"
},
{
  "_id": "ui.device.8.components.3.childParameters.3.label",
  "value": "'Service List'"
},
{
  "_id": "ui.device.8.components.3.childParameters.3.parameter",
  "value": "X_CMCC_ServiceList"
},
{
  "_id": "ui.device.8.components.3.childParameters.4.label",
  "value": "'NAT'"
},
{
  "_id": "ui.device.8.components.3.childParameters.4.parameter",
  "value": "NATEnabled"
},
{
  "_id": "ui.device.8.components.3.childParameters.5.label",
  "value": "'IP'"
},
{
  "_id": "ui.device.8.components.3.childParameters.5.parameter",
  "value": "ExternalIPAddress"
},
{
  "_id": "ui.device.8.components.3.childParameters.6.parameter",
  "value": "X_CMCC_VLANIDMark"
},
{
  "_id": "ui.device.8.components.3.childParameters.6.label",
  "value": "'VLAN'"
},
{
  "_id": "ui.device.8.components.3.childParameters.7.label",
  "value": "'Bind'"
},
{
  "_id": "ui.device.8.components.4.type",
  "value": "'parameter-list'"
},
{
  "_id": "ui.device.8.components.4.parameters.0.element",
  "value": "'span.inform'"
},
{
  "_id": "ui.device.8.components.4.parameters.0.label",
  "value": "'SSID-LIST'"
},
{
  "_id": "ui.device.8.components.3.childParameters.7.parameter",
  "value": "X_CMCC_LanInterface"
},
{
  "_id": "ui.device.8.components.4.parameters.0.type",
  "value": "'container'"
},
{
  "_id": "ui.device.8.components.4.parameters.0.components.0.parameters.0",
  "value": "InternetGatewayDevice.LANDevice.*.WLANConfiguration"
},
{
  "_id": "ui.device.8.components.4.parameters.0.components.0.type",
  "value": "'summon-button'"
},
{
  "_id": "ui.device.8.components.5.parameter",
  "value": "InternetGatewayDevice.LANDevice.1.WLANConfiguration"
},
{
  "_id": "ui.device.8.components.5.type",
  "value": "'parameter-table'"
},
{
  "_id": "ui.device.8.components.5.childParameters.0.label",
  "value": "'SSID'"
},
{
  "_id": "ui.device.8.components.5.childParameters.0.parameter",
  "value": "SSID"
},
{
  "_id": "ui.device.8.components.5.childParameters.1.label",
  "value": "'Security'"
},
{
  "_id": "ui.device.8.components.5.childParameters.1.parameter",
  "value": "BeaconType"
},
{
  "_id": "ui.device.8.components.5.childParameters.2.parameter",
  "value": "PreSharedKey.1.KeyPassphrase"
},
{
  "_id": "ui.device.8.components.5.childParameters.2.label",
  "value": "'Password'"
},
{
  "_id": "ui.device.8.components.5.childParameters.3.label",
  "value": "'Status'"
},
{
  "_id": "ui.device.8.components.5.childParameters.3.parameter",
  "value": "Enable"
},
{
  "_id": "ui.device.9.type",
  "value": "'container'"
},
{
  "_id": "ui.device.9.filter",
  "value": "DeviceID.Manufacturer = \"ZTE\" AND DeviceID.ProductClass = \"F460\""
},
{
  "_id": "ui.device.9.components.0.type",
  "value": "'parameter-list'"
},
{
  "_id": "ui.device.9.components.0.parameters.0.label",
  "value": "'WAN PPP'"
},
{
  "_id": "ui.device.9.components.0.parameters.0.components.0.type",
  "value": "'summon-button'"
},
{
  "_id": "ui.device.9.components.0.parameters.0.type",
  "value": "'container'"
},
{
  "_id": "ui.device.9.components.0.parameters.0.components.0.parameters.0",
  "value": "InternetGatewayDevice.WANDevice.*.WANConnectionDevice.*.WANPPPConnection"
},
{
  "_id": "ui.device.9.components.1.parameter",
  "value": "InternetGatewayDevice.WANDevice.1.WANConnectionDevice.1.WANPPPConnection"
},
{
  "_id": "ui.device.9.components.1.type",
  "value": "'parameter-table'"
},
{
  "_id": "ui.device.9.components.1.childParameters.0.parameter",
  "value": "Enable"
},
{
  "_id": "ui.device.9.components.1.childParameters.0.label",
  "value": "'Enable'"
},
{
  "_id": "ui.device.9.components.1.childParameters.1.label",
  "value": "'Conn Name'"
},
{
  "_id": "ui.device.9.components.1.childParameters.1.parameter",
  "value": "Name"
},
{
  "_id": "ui.device.9.components.1.childParameters.2.label",
  "value": "'Conn Type'"
},
{
  "_id": "ui.device.9.components.1.childParameters.2.parameter",
  "value": "ConnectionType"
},
{
  "_id": "ui.device.9.components.1.childParameters.3.label",
  "value": "'NAT'"
},
{
  "_id": "ui.device.9.components.1.childParameters.3.parameter",
  "value": "NATEnabled"
},
{
  "_id": "ui.device.9.components.1.childParameters.4.label",
  "value": "'IP'"
},
{
  "_id": "ui.device.9.components.1.childParameters.4.parameter",
  "value": "ExternalIPAddress"
},
{
  "_id": "ui.device.9.components.1.childParameters.5.label",
  "value": "'Username'"
},
{
  "_id": "ui.device.9.components.1.childParameters.5.parameter",
  "value": "Username"
},
{
  "_id": "ui.device.9.components.1.childParameters.6.label",
  "value": "'Password'"
},
{
  "_id": "ui.device.9.components.1.childParameters.6.parameter",
  "value": "Password"
},
{
  "_id": "ui.device.9.components.2.type",
  "value": "'parameter-list'"
},
{
  "_id": "ui.device.9.components.2.parameters.0.label",
  "value": "'WAN IP'"
},
{
  "_id": "ui.device.9.components.2.parameters.0.components.0.parameters.0",
  "value": "InternetGatewayDevice.WANDevice.*.WANConnectionDevice.*.WANIPConnection"
},
{
  "_id": "ui.device.9.components.2.parameters.0.element",
  "value": "'span.inform'"
},
{
  "_id": "ui.device.9.components.3.parameter",
  "value": "InternetGatewayDevice.WANDevice.1.WANConnectionDevice.1.WANIPConnection"
},
{
  "_id": "ui.device.9.components.2.parameters.0.type",
  "value": "'container'"
},
{
  "_id": "ui.device.9.components.2.parameters.0.components.0.type",
  "value": "'summon-button'"
},
{
  "_id": "ui.device.9.components.3.type",
  "value": "'parameter-table'"
},
{
  "_id": "ui.device.9.components.3.childParameters.0.label",
  "value": "'Enable'"
},
{
  "_id": "ui.device.9.components.3.childParameters.0.parameter",
  "value": "Enable"
},
{
  "_id": "ui.device.9.components.3.childParameters.1.label",
  "value": "'Conn Name'"
},
{
  "_id": "ui.device.9.components.3.childParameters.1.parameter",
  "value": "Name"
},
{
  "_id": "ui.device.9.components.3.childParameters.2.label",
  "value": "'IP Type'"
},
{
  "_id": "ui.device.9.components.3.childParameters.3.parameter",
  "value": "ConnectionType"
},
{
  "_id": "ui.device.9.components.3.childParameters.2.parameter",
  "value": "AddressingType"
},
{
  "_id": "ui.device.9.components.3.childParameters.4.parameter",
  "value": "NATEnabled"
},
{
  "_id": "ui.device.9.components.3.childParameters.3.label",
  "value": "'Conn Type'"
},
{
  "_id": "ui.device.9.components.3.childParameters.4.label",
  "value": "'NAT'"
},
{
  "_id": "ui.device.9.components.3.childParameters.5.label",
  "value": "'IP'"
},
{
  "_id": "ui.device.9.components.3.childParameters.5.parameter",
  "value": "ExternalIPAddress"
},
{
  "_id": "ui.device.9.components.4.type",
  "value": "'parameter-list'"
},
{
  "_id": "ui.device.9.components.4.parameters.0.element",
  "value": "'span.inform'"
},
{
  "_id": "ui.device.9.components.4.parameters.0.label",
  "value": "'SSID-LIST'"
},
{
  "_id": "ui.device.9.components.4.parameters.0.type",
  "value": "'container'"
},
{
  "_id": "ui.device.9.components.4.parameters.0.components.0.parameters.0",
  "value": "InternetGatewayDevice.LANDevice.*.WLANConfiguration"
},
{
  "_id": "ui.device.9.components.4.parameters.0.components.0.type",
  "value": "'summon-button'"
},
{
  "_id": "ui.device.9.components.5.parameter",
  "value": "InternetGatewayDevice.LANDevice.1.WLANConfiguration"
},
{
  "_id": "ui.device.9.components.5.type",
  "value": "'parameter-table'"
},
{
  "_id": "ui.device.9.components.5.childParameters.0.label",
  "value": "'SSID'"
},
{
  "_id": "ui.device.9.components.5.childParameters.0.parameter",
  "value": "SSID"
},
{
  "_id": "ui.device.9.components.5.childParameters.1.label",
  "value": "'Security'"
},
{
  "_id": "ui.device.9.components.5.childParameters.1.parameter",
  "value": "BeaconType"
},
{
  "_id": "ui.device.9.components.5.childParameters.2.label",
  "value": "'Password'"
},
{
  "_id": "ui.device.9.components.5.childParameters.2.parameter",
  "value": "PreSharedKey.1.KeyPassphrase"
},
{
  "_id": "ui.device.9.components.5.childParameters.3.label",
  "value": "'Status'"
},
{
  "_id": "ui.device.10.filter",
  "value": "DeviceID.Manufacturer = \"CIOT\""
},
{
  "_id": "ui.device.9.components.5.childParameters.3.parameter",
  "value": "Enable"
},
{
  "_id": "ui.device.10.type",
  "value": "'container'"
},
{
  "_id": "ui.device.10.components.0.type",
  "value": "'parameter-list'"
},
{
  "_id": "ui.device.10.components.0.parameters.0.type",
  "value": "'container'"
},
{
  "_id": "ui.device.10.components.0.parameters.0.label",
  "value": "'WAN PPP'"
},
{
  "_id": "ui.device.10.components.0.parameters.0.components.0.type",
  "value": "'summon-button'"
},
{
  "_id": "ui.device.10.components.0.parameters.0.components.0.parameters.0",
  "value": "InternetGatewayDevice.WANDevice.*.WANConnectionDevice.*.WANPPPConnection"
},
{
  "_id": "ui.device.10.components.1.parameter",
  "value": "InternetGatewayDevice.WANDevice.1.WANConnectionDevice.1.WANPPPConnection"
},
{
  "_id": "ui.device.10.components.1.type",
  "value": "'parameter-table'"
},
{
  "_id": "ui.device.10.components.1.childParameters.0.label",
  "value": "'Enable'"
},
{
  "_id": "ui.device.10.components.1.childParameters.0.parameter",
  "value": "Enable"
},
{
  "_id": "ui.device.10.components.1.childParameters.1.label",
  "value": "'Conn Name'"
},
{
  "_id": "ui.device.10.components.1.childParameters.2.parameter",
  "value": "ConnectionType"
},
{
  "_id": "ui.device.10.components.1.childParameters.1.parameter",
  "value": "Name"
},
{
  "_id": "ui.device.10.components.1.childParameters.3.label",
  "value": "'NAT'"
},
{
  "_id": "ui.device.10.components.1.childParameters.2.label",
  "value": "'Conn Type'"
},
{
  "_id": "ui.device.10.components.1.childParameters.3.parameter",
  "value": "NATEnabled"
},
{
  "_id": "ui.device.10.components.1.childParameters.4.label",
  "value": "'Service List'"
},
{
  "_id": "ui.device.10.components.1.childParameters.4.parameter",
  "value": "X_CT-COM_ServiceList"
},
{
  "_id": "ui.device.10.components.1.childParameters.5.label",
  "value": "'IP'"
},
{
  "_id": "ui.device.10.components.1.childParameters.6.label",
  "value": "'Username'"
},
{
  "_id": "ui.device.10.components.1.childParameters.5.parameter",
  "value": "ExternalIPAddress"
},
{
  "_id": "ui.device.10.components.1.childParameters.6.parameter",
  "value": "Username"
},
{
  "_id": "ui.device.10.components.1.childParameters.7.label",
  "value": "'Password'"
},
{
  "_id": "ui.device.10.components.1.childParameters.7.parameter",
  "value": "Password"
},
{
  "_id": "ui.device.10.components.1.childParameters.8.label",
  "value": "'Vlan ID'"
},
{
  "_id": "ui.device.10.components.1.childParameters.8.parameter",
  "value": "X_CT-COM_WANEponLinkConfig.VLANIDMark"
},
{
  "_id": "ui.device.10.components.2.type",
  "value": "'parameter-list'"
},
{
  "_id": "ui.device.10.components.2.parameters.0.label",
  "value": "'WAN IP'"
},
{
  "_id": "ui.device.10.components.2.parameters.0.element",
  "value": "'span.inform'"
},
{
  "_id": "ui.device.10.components.2.parameters.0.type",
  "value": "'container'"
},
{
  "_id": "ui.device.10.components.2.parameters.0.components.0.parameters.0",
  "value": "InternetGatewayDevice.WANDevice.*.WANConnectionDevice.*.WANIPConnection"
},
{
  "_id": "ui.device.10.components.2.parameters.0.components.0.type",
  "value": "'summon-button'"
},
{
  "_id": "ui.device.10.components.3.parameter",
  "value": "InternetGatewayDevice.WANDevice.1.WANConnectionDevice.1.WANIPConnection"
},
{
  "_id": "ui.device.10.components.3.type",
  "value": "'parameter-table'"
},
{
  "_id": "ui.device.10.components.3.childParameters.0.label",
  "value": "'Enable'"
},
{
  "_id": "ui.device.10.components.3.childParameters.0.parameter",
  "value": "Enable"
},
{
  "_id": "ui.device.10.components.3.childParameters.1.label",
  "value": "'Conn Name'"
},
{
  "_id": "ui.device.10.components.3.childParameters.1.parameter",
  "value": "Name"
},
{
  "_id": "ui.device.10.components.3.childParameters.2.label",
  "value": "'IP Type'"
},
{
  "_id": "ui.device.10.components.3.childParameters.3.label",
  "value": "'Conn Type'"
},
{
  "_id": "ui.device.10.components.3.childParameters.3.parameter",
  "value": "ConnectionType"
},
{
  "_id": "ui.device.10.components.3.childParameters.2.parameter",
  "value": "AddressingType"
},
{
  "_id": "ui.device.10.components.3.childParameters.4.label",
  "value": "'NAT'"
},
{
  "_id": "ui.device.10.components.3.childParameters.4.parameter",
  "value": "NATEnabled"
},
{
  "_id": "ui.device.10.components.3.childParameters.5.label",
  "value": "'Service List'"
},
{
  "_id": "ui.device.10.components.3.childParameters.6.label",
  "value": "'IP'"
},
{
  "_id": "ui.device.10.components.3.childParameters.6.parameter",
  "value": "ExternalIPAddress"
},
{
  "_id": "ui.device.10.components.3.childParameters.5.parameter",
  "value": "X_CT-COM_ServiceList"
},
{
  "_id": "ui.device.10.components.3.childParameters.7.parameter",
  "value": "X_CT-COM_WANEponLinkConfig.VLANIDMark"
},
{
  "_id": "ui.device.10.components.3.childParameters.7.label",
  "value": "'Vlan ID'"
},
{
  "_id": "ui.device.10.components.4.type",
  "value": "'parameter-list'"
},
{
  "_id": "ui.device.10.components.4.parameters.0.element",
  "value": "'span.inform'"
},
{
  "_id": "ui.device.10.components.4.parameters.0.label",
  "value": "'SSID-LIST'"
},
{
  "_id": "ui.device.10.components.4.parameters.0.type",
  "value": "'container'"
},
{
  "_id": "ui.device.10.components.4.parameters.0.components.0.type",
  "value": "'summon-button'"
},
{
  "_id": "ui.device.10.components.5.parameter",
  "value": "InternetGatewayDevice.LANDevice.1.WLANConfiguration"
},
{
  "_id": "ui.device.10.components.5.type",
  "value": "'parameter-table'"
},
{
  "_id": "ui.device.10.components.4.parameters.0.components.0.parameters.0",
  "value": "InternetGatewayDevice.LANDevice.*.WLANConfiguration"
},
{
  "_id": "ui.device.10.components.5.childParameters.0.parameter",
  "value": "SSID"
},
{
  "_id": "ui.device.10.components.5.childParameters.0.label",
  "value": "'SSID'"
},
{
  "_id": "ui.device.10.components.5.childParameters.1.label",
  "value": "'Security'"
},
{
  "_id": "ui.device.10.components.5.childParameters.1.parameter",
  "value": "BeaconType"
},
{
  "_id": "ui.device.10.components.5.childParameters.2.label",
  "value": "'Password'"
},
{
  "_id": "ui.device.10.components.5.childParameters.3.label",
  "value": "'Status'"
},
{
  "_id": "ui.device.10.components.5.childParameters.2.parameter",
  "value": "PreSharedKey.1.KeyPassphrase"
},
{
  "_id": "ui.device.10.components.5.childParameters.3.parameter",
  "value": "Enable"
},
{
  "_id": "ui.device.11.label",
  "value": "'LAN hosts'"
},
{
  "_id": "ui.device.11.parameter",
  "value": "InternetGatewayDevice.LANDevice.1.Hosts.Host"
},
{
  "_id": "ui.device.11.type",
  "value": "'parameter-table'"
},
{
  "_id": "ui.device.11.childParameters.0.parameter",
  "value": "HostName"
},
{
  "_id": "ui.device.11.childParameters.0.label",
  "value": "'Host name'"
},
{
  "_id": "ui.device.11.childParameters.1.label",
  "value": "'IP address'"
},
{
  "_id": "ui.device.11.childParameters.1.parameter",
  "value": "IPAddress"
},
{
  "_id": "ui.device.11.childParameters.2.parameter",
  "value": "MACAddress"
},
{
  "_id": "ui.device.11.childParameters.2.label",
  "value": "'MAC address'"
},
{
  "_id": "ui.device.12.element",
  "value": "'div'"
},
{
  "_id": "ui.device.12.components.0.element",
  "value": "'h3'"
},
{
  "_id": "ui.device.13.element",
  "value": "'div.container-full-width'"
},
{
  "_id": "ui.device.12.components.0.components.0",
  "value": "'Faults'"
},
{
  "_id": "ui.device.13.type",
  "value": "'container'"
},
{
  "_id": "ui.device.12.type",
  "value": "'container'"
},
{
  "_id": "ui.device.12.components.0.type",
  "value": "'container'"
},
{
  "_id": "ui.device.12.components.1.type",
  "value": "'device-faults'"
},
{
  "_id": "ui.device.13.components.0.element",
  "value": "'h3'"
},
{
  "_id": "ui.device.13.components.0.components.0",
  "value": "'All parameters'"
},
{
  "_id": "ui.device.13.components.0.type",
  "value": "'container'"
},
{
  "_id": "ui.device.14.type",
  "value": "'device-actions'"
},
{
  "_id": "ui.device.13.components.1.type",
  "value": "'all-parameters'"
},
{
  "_id": "ui.overview.charts.ont-type.slices.11_hAP lite.color",
  "value": "'#1100FF'"
},
{
  "_id": "ui.overview.charts.ont-type.slices.11_hAP lite.label",
  "value": "'hAP lite'"
},
{
  "_id": "ui.overview.charts.ont-type.slices.11_hAP lite.filter",
  "value": "DeviceID.ProductClass = \"hAP lite\""
},
{
  "_id": "ui.overview.charts.PON.slices.3_Mikrotik.color",
  "value": "'#FFCC00'"
},
{
  "_id": "ui.overview.charts.PON.slices.3_Mikrotik.filter",
  "value": "DeviceID.Manufacturer = \"MikroTik\""
},
{
  "_id": "ui.overview.charts.PON.slices.3_Mikrotik.label",
  "value": "'MikroTik'"
}]
EOF

# Mengimport data JSON ke MongoDB GenieACS
mongoimport --host localhost --port 27017 --db genieacs --collection config --file config.json --jsonArray

# Menghapus file temporary
rm config.json


# Simpan data JSON ke dalam file temporary
cat <<EOF > provisions.json
[{
  "_id": "default",
  "script": "const now = Date.now();\nconst fiveminute = Date.now(300000);\nconst hourly = Date.now(3600000);\nconst dayly = Date.now(86400000);\nconst twodays = Date.now(172800000);\nconst weekly = Date.now(604800000);\n\n\n//REFRESH DEVICE PAGE\ndeclare(\"Events.Inform\", {value: dayly});\ndeclare(\"InternetGatewayDevice.WANDevice.*.WANConnectionDevice.*.WANPPPConnection.*\", {value: dayly});\ndeclare(\"InternetGatewayDevice.WANDevice.*.WANConnectionDevice.*.WANIPConnection.*\", {value: dayly});\ndeclare(\"InternetGatewayDevice.LANDevice.*.WLANConfiguration.*\", {value: dayly});\ndeclare(\"InternetGatewayDevice.LANDevice.*.LANHostConfigManagement.MaxAddress\", {value: 1});\ndeclare(\"InternetGatewayDevice.DeviceInfo.X_HW_UpPortMode\", {value: now});\ndeclare(\"InternetGatewayDevice.X_HW_Security.X_HW_FirewallLevel\", {value: now});\n//ZTE REFRESH\ndeclare(\"InternetGatewayDevice.UserInterface.X_ZTE-COM_WebUserInfo\", {value: dayly});\ndeclare(\"InternetGatewayDevice.X_ZTE-COM_Security.AclServices.*.Enable\", {value: 1});\ndeclare(\"InternetGatewayDevice.X_ZTE-COM_Security\", {value: 1});\ndeclare(\"InternetGatewayDevice.Firewall.X_ZTE-COM_ServiceControl.IPV4ServiceControl.1.Enable\", {value: 1});\n//declare(\"InternetGatewayDevice.WANDevice.*.X_*Config.RXPower\", {value: hourly});\n//declare(\"InternetGatewayDevice.WANDevice.*.X_ZTE-COM_WANPONInterfaceConfig.RXPower\", {value: hourly});\n// Refresh basic parameters hourly\n//declare(\"InternetGatewayDevice.DeviceInfo.HardwareVersion\", {value: 1});\n//declare(\"InternetGatewayDevice.DeviceInfo.SoftwareVersion\", {value: 1});\ndeclare(\"InternetGatewayDevice.WANDevice.*.WANConnectionDevice.*.WANIPConnection.*.MACAddress\", {value: 1});\n//declare(\"InternetGatewayDevice.WANDevice.*.WANConnectionDevice.*.WANIPConnection.*.ExternalIPAddress\", {path: dayly, value: dayly});\n//declare(\"InternetGatewayDevice.LANDevice.*.WLANConfiguration.*.SSID\", {path: dayly, value: dayly});\n// Don't refresh password field periodically because CPEs always report blank passowrds for security reasons\n//declare(\"InternetGatewayDevice.LANDevice.*.WLANConfiguration.*.KeyPassphrase\", {path: dayly, value: 1});\ndeclare(\"InternetGatewayDevice.LANDevice.*.WLANConfiguration.*\", {path: dayly, value: 1});\ndeclare(\"InternetGatewayDevice.LANDevice.*.Hosts.Host.*.HostName\", {path: hourly, value: hourly});\ndeclare(\"InternetGatewayDevice.LANDevice.*.Hosts.Host.*.IPAddress\", {path: hourly, value: hourly});\ndeclare(\"InternetGatewayDevice.LANDevice.*.Hosts.Host.*.MACAddress\", {path: hourly, value: hourly});\n\n//Refresh VPARAMS\ndeclare(\"VirtualParameters.getdeviceuptime\", {value: hourly});\ndeclare(\"VirtualParameters.getmac\", {value: twodays});\ndeclare(\"VirtualParameters.getponmode\", {value: 1});\ndeclare(\"VirtualParameters.getponrx\", {value: fiveminute});\ndeclare(\"VirtualParameters.getsuperadmin\", {value: dayly});\ndeclare(\"VirtualParameters.getsuperpassword\", {value: dayly});\ndeclare(\"VirtualParameters.getuseradmin\", {value: dayly});\ndeclare(\"VirtualParameters.getuserpassword\", {value: dayly});\ndeclare(\"VirtualParameters.getvlanppp\", {value: 1});\ndeclare(\"VirtualParameters.getwlankey\", {value: twodays});\ndeclare(\"VirtualParameters.pppUsername\", {value: dayly});\ndeclare(\"VirtualParameters.pppUsernameedit\", {value: dayly});\ndeclare(\"VirtualParameters.ppppassword\", {value: 1});\ndeclare(\"VirtualParameters.wanip\", {value: now})"
},
{
  "_id": "inform",
  "script": "// Device ID as user name\nconst username = declare(\"DeviceID.ID\", {value: 1}).value[0]\n\n// Password will be fixed for a given device because Math.random() is seeded with device ID by default.\nconst password = Math.trunc(Math.random() * Number.MAX_SAFE_INTEGER).toString(36);\n\nconst informInterval = 300;\n\n// Refresh values daily\nconst daily = Date.now(86400000);\n\n// Unique inform offset per device for better load distribution\nconst informTime = daily % 86400000;\ndeclare(\"InternetGatewayDevice.ManagementServer.ConnectionRequestUsername\", {value: null}, {value: username});\ndeclare(\"InternetGatewayDevice.ManagementServer.ConnectionRequestPassword\", {value: null}, {value: password});\ndeclare(\"InternetGatewayDevice.ManagementServer.PeriodicInformEnable\", {value: daily}, {value: true});\ndeclare(\"InternetGatewayDevice.ManagementServer.PeriodicInformInterval\", {value: daily}, {value: informInterval});\n//declare(\"InternetGatewayDevice.ManagementServer.PeriodicInformTime\", {value: daily}, {value: informTime});\ndeclare(\"Device.ManagementServer.ConnectionRequestUsername\", {value: null}, {value: username});\ndeclare(\"Device.ManagementServer.ConnectionRequestPassword\", {value: null}, {value: password});\ndeclare(\"Device.ManagementServer.PeriodicInformEnable\", {value: daily}, {value: true});\ndeclare(\"Device.ManagementServer.PeriodicInformInterval\", {value: daily}, {value: informInterval});\ndeclare(\"Device.ManagementServer.PeriodicInformTime\", {value: daily}, {value: informTime});"
},
{
  "_id": "bootstrap",
  "script": "const now = Date.now();\n\n// Clear cached data model to force a refresh\nclear(\"Device\", now);\nclear(\"InternetGatewayDevice\", now);"
}]
EOF

# Mengimport data JSON ke MongoDB GenieACS
mongoimport --host localhost --port 27017 --db genieacs --collection provisions --file provisions.json --jsonArray

# Menghapus file temporary
rm provisions.json


# Simpan data JSON ke dalam file temporary
cat <<EOF > virtualParameters.json
[{
  "_id": "getdeviceuptime",
  "script": "let v1 = declare(\"Device.DeviceInfo.UpTime\", {value: Date.now()});\nlet v2 = declare(\"InternetGatewayDevice.DeviceInfo.UpTime\", {value: Date.now()});\nlet totalSecs = 0\nif (typeof v1.value !== \"undefined\") {\n  totalSecs = v1.value[0];\n} else {\n  totalSecs = v2.value[0];\n}\nlet days = Math.floor(totalSecs / 86400);\nlet rem  = totalSecs % 86400;\nlet hrs  = Math.floor(rem / 3600);\nif (hrs < 10) {\n\thrs = \"0\" + hrs;\n}\n\nrem  = rem % 3600;\nlet mins = Math.floor(rem / 60);\nif (mins < 10) {\n\tmins = \"0\" + mins;\n}\nlet secs = rem % 60;\nif (secs < 10) {\n\tsecs = \"0\" + secs;\n}\n\nlet uptime = days + \"d \" + hrs + \":\" + mins + \":\" + secs;\nreturn {writable: false, value: uptime};"
},
{
  "_id": "getmac",
  "script": "let m = \"N/A\";\nlet d = declare(\"Device.WANDevice.*.WANConnectionDevice.*.WANIPConnection.*.MACAddress\", {value: Date.now()});\nlet igd = declare(\"InternetGatewayDevice.WANDevice.*.WANConnectionDevice.*.WANPPPConnection.*.MACAddress\", {value: Date.now()});\nlet e = declare(\"InternetGatewayDevice.WANDevice.*.WANConnectionDevice.*.WANIPConnection.*.MACAddress\", {value: Date.now()});\nlet i = declare(\"InternetGatewayDevice.WANDevice.1.WANConnectionDevice.1.WANIPConnection.1.MACAddress\", {value: Date.now()});\n\nif (d.size) {\n  for (let p of d) {\n    if (p.value[0]) {\n      m = p.value[0];\n      break;\n    }\n  }\n}\nelse if (igd.size) {\n  for (let p of igd) {\n    if (p.value[0]) {\n      m = p.value[0];\n      break;\n    }\n  }\n}\nelse if (e.size) {\n  for (let p of e) {\n    if (p.value[0]) {\n      m = p.value[0];\n      break;\n    }\n  }\n}\nelse if (i.size) {\n  for (let p of i) {\n    if (p.value[0]) {\n      m = p.value[0];\n      break;\n    }\n  }\n}\n\nreturn {writable: false, value: [m, \"xsd:string\"]};"
},
{
  "_id": "getponmode",
  "script": "let m = \"\";\nif (args[1].value) {\n  m = args[1].value[0];\n  declare(\"InternetGatewayDevice.DeviceInfo.X_HW_UpPortMode\", {value: Date.now()});\n  \n}\nelse {\n  \n  let igd = declare(\"InternetGatewayDevice.WANDevice.*.WANCommonInterfaceConfig.WANAccessType\", {value: Date.now()});\n\n  if (igd.size) {\n    m = igd.value[0];\n  }\n}\n\nreturn {writable: false, value: [m, \"xsd:string\"]};"
},
{
  "_id": "getponrx",
  "script": "let m = \"N/A\";\nlet zte = declare(\"InternetGatewayDevice.WANDevice.*.X_ZTE-COM_WANPONInterfaceConfig.RXPower\", {value: Date.now()});\nlet huawei = declare(\"InternetGatewayDevice.WANDevice.*.X_GponInterafceConfig.RXPower\", {value: Date.now()});\nlet fiberhome = declare(\"InternetGatewayDevice.WANDevice.*.X_FH_GponInterfaceConfig.RXPower\", {value: Date.now()});\nlet ztecmcc = declare(\"InternetGatewayDevice.WANDevice.*.X_CMCC_EponInterfaceConfig.RXPower\" , {value: Date.now()});\nlet ztecmcg = declare(\"InternetGatewayDevice.WANDevice.*.X_CMCC_GponInterfaceConfig.RXPower\" , {value: Date.now()});\nlet gm220s = declare(\"InternetGatewayDevice.WANDevice.*.X_CT-COM_GponInterfaceConfig.RXPower\" , {value: Date.now()});\nlet gm220ss = declare(\"InternetGatewayDevice.WANDevice.*.X_CT-COM_EponInterfaceConfig.RXPower\" , {value: Date.now()});\nlet f477v2 = declare(\"InternetGatewayDevice.WANDevice.*.X_CU_WANEPONInterfaceConfig.OpticalTransceiver.RXPower\", {value: Date.now()});\nif (zte.size) {\n   let zteval = zte.value[0]\n   if (zteval < 0) {\n      m = zteval;\n      \n    }\n    else if (zteval > 0) {\n      m = Math.ceil(30 + (Math.log10((zteval * (Math.pow(10,-7))))*10));\n    }\n}\nelse if (ztecmcc.size) {\n   let zteval = ztecmcc.value[0]\n   if (zteval < 0) {\n      m = zteval;\n      \n    }\n    else if (zteval > 0) {\n      m = Math.ceil(30 + (Math.log10((zteval * (Math.pow(10,-7))))*10));\n    }\n}\nelse if (ztecmcg.size) {\n   let zteval = ztecmcg.value[0]\n   if (zteval < 0) {\n      m = zteval;\n      \n    }\n    else if (zteval > 0) {\n      m = Math.ceil(30 + (Math.log10((zteval * (Math.pow(10,-7))))*10));\n    }\n}\nelse if (gm220s.size) {\n   let zteval = gm220s.value[0]\n   if (zteval < 0) {\n      m = zteval;\n      \n    }\n    else if (zteval > 0) {\n      m = Math.ceil(30 + (Math.log10((zteval * (Math.pow(10,-7))))*10));\n    }\n}\nelse if (gm220ss.size) {\n   let zteval = gm220ss.value[0]\n   if (zteval < 0) {\n      m = zteval;\n      \n    }\n    else if (zteval > 0) {\n      m = Math.ceil(30 + (Math.log10((zteval * (Math.pow(10,-7))))*10));\n    }\n}\nelse if (f477v2.size) {\n   let zteval = f477v2.value[0]\n   if (zteval < 0) {\n      m = zteval;\n      \n    }\n    else if (zteval > 0) {\n      m = Math.ceil(30 + (Math.log10((zteval * (Math.pow(10,-7))))*10));\n    }\n}\nelse if (huawei.size) {\n  for (let p of huawei) {\n    if (p.value[0]) {\n      m = p.value[0];\n      break;\n    }\n  }\n}\nelse if (fiberhome.size) {\n  for (let p of fiberhome) {\n    if (p.value[0]) {\n      m = p.value[0];\n      break;\n    }\n  }\n}\nreturn {writable: false, value: [m, \"xsd:string\"]};"
},
{
  "_id": "getsuperadmin",
  "script": "let m = \"\";\nif (args[1].value) {\n   m = args[1].value[0];\n   declare(\"InternetGatewayDevice.UserInterface.X_ZTE-COM_WebUserInfo.AdminName\", null, {value: m});\n   declare(\"InternetGatewayDevice.User.1.Username\", null, {value: m});\n   declare(\"InternetGatewayDevice.X_ZTE-COM_UserInterface.X_ZTE-COM_WebUserInfo.AdminName\", null, {value: m});\n   declare(\"InternetGatewayDevice.DeviceInfo.X_CMCC_TeleComAccount.Username\", null, {value: m});\n   declare(\"InternetGatewayDevice.UserInterface.X_HW_WebUserInfo.2.UserName\", null, {value: m});\n}\nelse {\n   \n   let zte = declare(\"InternetGatewayDevice.UserInterface.X_ZTE-COM_WebUserInfo.AdminName\", {value: Date.now()});\n   let zte2 = declare(\"InternetGatewayDevice.User.1.Username\", {value: Date.now()});\n   let zte3 = declare(\"InternetGatewayDevice.X_ZTE-COM_UserInterface.X_ZTE-COM_WebUserInfo.AdminName\", {value: Date.now()});\n   let zte4 = declare(\"InternetGatewayDevice.DeviceInfo.X_CMCC_TeleComAccount.Username\", {value: Date.now()});\n   let huawei = declare(\"InternetGatewayDevice.UserInterface.X_HW_WebUserInfo.2.UserName\", {value: Date.now()});\n\n   if (zte.size) {\n     m = zte.value[0];\n   }\n   else if (zte2.size) {\n     m = zte2.value[0];  \n   }\n   else if (zte3.size) {\n     m = zte3.value[0];  \n   }\n   else if (zte4.size) {\n     m = zte4.value[0];  \n   }\n   else if (huawei.size) {\n     m = huawei.value[0];  \n   }\n}  \n\nreturn {writable: true, value: [m, \"xsd:string\"]};"
},
{
  "_id": "getsuperpassword",
  "script": "let m = \"\";\nif (args[1].value) {\n   m = args[1].value[0];\n   declare(\"InternetGatewayDevice.UserInterface.X_ZTE-COM_WebUserInfo.AdminPassword\", null, {value: m});\n   declare(\"InternetGatewayDevice.User.1.Password\", null, {value: m});\n   declare(\"InternetGatewayDevice.X_ZTE-COM_UserInterface.X_ZTE-COM_WebUserInfo.AdminPassword\", null, {value: m});\n   declare(\"InternetGatewayDevice.DeviceInfo.X_CMCC_TeleComAccount.Password\", null, {value: m});\n   declare(\"InternetGatewayDevice.UserInterface.X_HW_WebUserInfo.2.Password\", null, {value: m});\n}\nelse {\n   \n   let zte = declare(\"InternetGatewayDevice.UserInterface.X_ZTE-COM_WebUserInfo.AdminPassword\", {value: Date.now()});\n   let zte2 = declare(\"InternetGatewayDevice.User.1.Password\", {value: Date.now()});\n   let zte3 = declare(\"InternetGatewayDevice.X_ZTE-COM_UserInterface.X_ZTE-COM_WebUserInfo.AdminPassword\", {value: Date.now()});\n   let zte4 = declare(\"InternetGatewayDevice.DeviceInfo.X_CMCC_TeleComAccount.Password\", {value: Date.now()});\n   let huawei = declare(\"InternetGatewayDevice.UserInterface.X_HW_WebUserInfo.2.Password\", {value: Date.now()});\n\n   if (zte.size) {\n     m = zte.value[0];\n   }\n   else if (zte2.size) {\n     m = zte2.value[0];  \n   }\n   else if (zte3.size) {\n     m = zte3.value[0];  \n   }\n   else if (zte4.size) {\n     m = zte4.value[0];  \n   }\n   else if (huawei.size) {\n     m = huawei.value[0];  \n   }\n}  \n\nreturn {writable: true, value: [m, \"xsd:string\"]};"
},
{
  "_id": "getuseradmin",
  "script": "let m = \"\";\nif (args[1].value) {\n   m = args[1].value[0];\n   declare(\"InternetGatewayDevice.UserInterface.X_ZTE-COM_WebUserInfo.UserName\", null, {value: m});\n   declare(\"InternetGatewayDevice.User.2.Username\", null, {value: m});\n   declare(\"InternetGatewayDevice.X_ZTE-COM_UserInterface.X_ZTE-COM_WebUserInfo.UserName\", null, {value: m});\n   declare(\"InternetGatewayDevice.UserInterface.X_HW_WebUserInfo.1.UserName\", null, {value: m});\n}\nelse {\n   \n   let zte = declare(\"InternetGatewayDevice.UserInterface.X_ZTE-COM_WebUserInfo.UserName\", {value: Date.now()});\n   let zte2 = declare(\"InternetGatewayDevice.User.2.Username\", {value: Date.now()});\n   let zte3 = declare(\"InternetGatewayDevice.X_ZTE-COM_UserInterface.X_ZTE-COM_WebUserInfo.UserName\", {value: Date.now()});\n   let huawei = declare(\"InternetGatewayDevice.UserInterface.X_HW_WebUserInfo.1.UserName\", {value: Date.now()});\n\n   if (zte.size) {\n     m = zte.value[0];\n   }\n   else if (zte2.size) {\n     m = zte2.value[0];  \n   }\n   else if (zte3.size) {\n     m = zte3.value[0];  \n   }\n   else if (huawei.size) {\n     m = huawei.value[0];  \n   }\n}  \n\nreturn {writable: true, value: [m, \"xsd:string\"]};"
},
{
  "_id": "getuserpassword",
  "script": "let m = \"\";\nif (args[1].value) {\n   m = args[1].value[0];\n   declare(\"InternetGatewayDevice.UserInterface.X_ZTE-COM_WebUserInfo.Password\", null, {value: m});\n   declare(\"InternetGatewayDevice.User.2.Password\", null, {value: m});\n   declare(\"InternetGatewayDevice.X_ZTE-COM_UserInterface.X_ZTE-COM_WebUserInfo.AdminPassword\", null, {value: m});\n   declare(\"InternetGatewayDevice.UserInterface.X_HW_WebUserInfo.1.Password\", null, {value: m});\n}\nelse {\n   \n   let zte = declare(\"InternetGatewayDevice.UserInterface.X_ZTE-COM_WebUserInfo.AdminPassword\", {value: Date.now()});\n   let zte2 = declare(\"InternetGatewayDevice.User.2.Password\", {value: Date.now()});\n   let zte3 = declare(\"InternetGatewayDevice.X_ZTE-COM_UserInterface.X_ZTE-COM_WebUserInfo.AdminPassword\", {value: Date.now()});\n   let huawei = declare(\"InternetGatewayDevice.UserInterface.X_HW_WebUserInfo.1.Password\", {value: Date.now()});\n\n   if (zte.size) {\n     m = zte.value[0];\n   }\n   else if (zte2.size) {\n     m = zte2.value[0];  \n   }\n   else if (zte3.size) {\n     m = zte3.value[0];  \n   }\n   else if (huawei.size) {\n     m = huawei.value[0];  \n   }\n}  \n\nreturn {writable: true, value: [m, \"xsd:string\"]};"
},
{
  "_id": "getvlanppp",
  "script": "let m = \"\";\nlet huawei = declare(\"InternetGatewayDevice.WANDevice.*.WANConnectionDevice.*.WANPPPConnection.*.X_HW_VLAN\", {value: Date.now()});\nlet zte = declare(\"InternetGatewayDevice.WANDevice.*.WANConnectionDevice.*.WANPPPConnection.*.X_ZTE-COM_VLANID\", {value: Date.now()});\n\n                   \n\t\t\t\t   \nif (huawei.size) {\n  for (let p of huawei) {\n    if (p.value[0]) {\n      m = p.value[0];\n      \n    }\n  }\n}\nelse if (zte.size) {\n  for (let p of zte) {\n    if (p.value[0]) {\n      m = p.value[0];\n      \n    }\n  }\n}\nreturn {writable: true, value: [m, \"xsd:string\"]};"
},
{
  "_id": "getwlankey",
  "script": "let m = \"\";\nif (args[1].value) {\n  m = args[1].value[0];\n  declare(\"InternetGatewayDevice.LANDevice.*.WLANConfiguration.*.PreSharedKey.*.KeyPassphrase\", null, {value: m});\n  \n}\nelse {\n  \n  let igd = declare(\"InternetGatewayDevice.LANDevice.*.WLANConfiguration.*.KeyPassphrase\", {value: Date.now()});\n\n  if (igd.size) {\n    m = igd.value[0];\n  }\n}\n\nreturn {writable: true, value: [m, \"xsd:string\"]};"
},
{
  "_id": "pppUsername",
  "script": "let result = '';\n\nif (declare(\"Tags.Bridged\", {value: 1}).value !== undefined) {\n    log('CPE is bridged, setting PPPoE username to null');\n} else if (\"value\" in args[1]) {\n    result = args[1].value[0];\n} else {\n    let keys = [\n        'InternetGatewayDevice.WANDevice.*.WANConnectionDevice.*.WANPPPConnection.*.Username',\n        'Device.PPP.Interface.*.Username'\n    ];\n\n    result = getParameterValue(keys);\n}\n\nreturn {writable: false, value: [result, \"xsd:string\"]};\n\nfunction getParameterValue(keys) {\n    for (let key of keys) {\n        let d = declare(key, {path: Date.now() - (120 * 1000), value: Date.now()});\n\n        for (let item of d) {\n            if (item.value && item.value[0]) {\n                return item.value[0];\n            }\n        }\n    }\n\n    return '';\n}"
},
{
  "_id": "pppUsernameedit",
  "script": "let result = '';\n\nif (declare(\"Tags.Bridged\", {value: 1}).value !== undefined) {\n    log('CPE is bridged, setting PPPoE username to null');\n} else if (\"value\" in args[1]) {\n    result = args[1].value[0];\n} else {\n    let keys = [\n        'InternetGatewayDevice.WANDevice.*.WANConnectionDevice.*.WANPPPConnection.*.Username',\n        'Device.PPP.Interface.*.Username'\n    ];\n\n    result = getParameterValue(keys);\n}\n\nreturn {writable: true, value: [result, \"xsd:string\"]};\n\nfunction getParameterValue(keys) {\n    for (let key of keys) {\n        let d = declare(key, {path: Date.now() - (120 * 1000), value: Date.now()});\n\n        for (let item of d) {\n            if (item.value && item.value[0]) {\n                return item.value[0];\n            }\n        }\n    }\n\n    return '';\n}"
},
{
  "_id": "ppppassword",
  "script": "let m = \"\";\nlet d = declare(\"InternetGatewayDevice.WANDevice.*.WANConnectionDevice.*.WANPPPConnection.*.Password\", {value: Date.now()});\n                   \nif (d.size) {\n  for (let p of d) {\n    if (p.value[0]) {\n      m = p.value[0];\n      break;\n    }\n  }\n\n}\n\nreturn {writable: true, value: [m, \"xsd:string\"]};"
},
{
  "_id": "wanip",
  "script": "let m = \"\";\nif (args[1].value) {\n  m = args[1].value[0];\n  declare(\"InternetGatewayDevice.DeviceInfo.X_HW_UpPortMode\", {value: Date.now()});\n  \n}\nelse {\n  \n  let igd = declare(\"InternetGatewayDevice.WANDevice.*.WANConnectionDevice.*.WANPPPConnection.*.ExternalIPAddress\", {value: Date.now()});\n\n  if (igd.size) {\n    m = igd.value[0];\n  }\n}\n\nreturn {writable: false, value: [m, \"xsd:string\"]};"
}]
EOF

# Mengimport data JSON ke MongoDB GenieACS
mongoimport --host localhost --port 27017 --db genieacs --collection virtualParameters --file virtualParameters.json --jsonArray

# Menghapus file temporary
rm virtualParameters.json

# info
echo "success"