//Lanzar antes de pintar el TabPanel
var sConsultarPreciario_Load = function () {
    App.direct.CargarPreciario('PRC0001', {
        success: function (result) {
            var categoria;
            console.log(App.sConsultarPreciario.getAt(0), 'Load');
            //console.log(App.sConsultarPreciario.getAt(0).get('RPreciarioCategorias'));
            //console.log(App.sConsultarPreciario.getAt(0));

//            App.sConsultarPreciario.getAt(0).get('RPreciarioCategorias').each(function (registro, indice, total) {
//                if (categoria == registro.get('ID')) {
//                }
//                else {
//                    categoria = registro.get('ID');

//                    //Crear Store para el GridPanel
//                    Ext.create('Ext.data.Store', {
//                        storeId: 's' + categoria,
//                        fields: ['name', 'email', 'phone'],
//                        data: { 'items': [
//                                    { 'name': 'Lisa', "email": "lisa@simpsons.com", "phone": "555-111-1224" },
//                                    { 'name': 'Bart', "email": "bart@simpsons.com", "phone": "555-222-1234" },
//                                    { 'name': 'Homer', "email": "homer@simpsons.com", "phone": "555-222-1244" },
//                                    { 'name': 'Marge', "email": "marge@simpsons.com", "phone": "555-222-1254" }
//                                ]
//                        },
//                        proxy: {
//                            type: 'memory',
//                            reader: {
//                                type: 'json',
//                                root: 'items'
//                            }
//                        }
//                    });

//                    //Crear el GridPanel
//                    var gridPanel = Ext.create('Ext.grid.Panel', {
//                        id: 'gp' + categoria,
//                        title: 'Simpsons',
//                        store: Ext.data.StoreManager.lookup('s' + categoria),
//                        columns: [
//                                    { text: 'Name', dataIndex: 'name' },
//                                    { text: 'Email', dataIndex: 'email', flex: 1 },
//                                    { text: 'Phone', dataIndex: 'phone' }
//                                ],
//                        height: 200,
//                        width: 400
//                    });

//                    //Asignar el GridPanel al TabPanel
//                    App.tpConsultarPreciario.add(gridPanel);
//                }
//            });
//            App.tpDefualt.setActiveTab(0);
        }
    });
};