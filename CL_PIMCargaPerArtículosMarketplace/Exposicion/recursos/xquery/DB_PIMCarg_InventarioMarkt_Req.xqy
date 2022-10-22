xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)
declare namespace ns1="http://www.demandware.com/xml/impex/order/2006-10-31";
(:: import schema at "../xsd/inventario_req.xsd" ::)

declare namespace ns2="http://xmlns.oracle.com/pcbpel/adapter/db/sp/db_Inventario";
(:: import schema at "../../../Integracion/Inventario/xsd/db_Inventario_sp.xsd" ::)

declare variable $Inv as element() external;

declare function local:func($Inv) as element() (:: schema-element(ns2:InputParameters) ::) {
   <ns2:InputParameters>
        <ns2:P_ESTADO_ARTICULO>{fn:data($Inv/ns1:Inventario_Request/ns1:Estado_Articulo)}</ns2:P_ESTADO_ARTICULO>
        <ns2:P_CODIGO_MKP>{fn:data($Inv/ns1:Inventario_Request/ns1:Codigo_MKP)}</ns2:P_CODIGO_MKP>
        <ns2:P_CODIGO_PIM>{fn:data($Inv/ns1:Inventario_Request/ns1:Codigo_PIM)}</ns2:P_CODIGO_PIM>
        <ns2:P_ORGANIZACION>{fn:data($Inv/ns1:Inventario_Request/ns1:Organizacion)}</ns2:P_ORGANIZACION>
        <ns2:P_CATEGORIA>{fn:data($Inv/ns1:Inventario_Request/ns1:Categoria)}</ns2:P_CATEGORIA>
        <ns2:P_PLANTILLA>{fn:data($Inv/ns1:Inventario_Request/ns1:Plantilla)}</ns2:P_PLANTILLA>
        <ns2:P_UDM>{fn:data($Inv/ns1:Inventario_Request/ns1:UDM)}</ns2:P_UDM>
        <ns2:P_TIPO>{fn:data($Inv/ns1:Inventario_Request/ns1:Tipo)}</ns2:P_TIPO>
        <ns2:P_DESCRIPCION_INV>{fn:data($Inv/ns1:Inventario_Request/ns1:Descripcion_Inv)}</ns2:P_DESCRIPCION_INV>
        <ns2:P_DESCRIPCION_LARGA_INV>{fn:data($Inv/ns1:Inventario_Request/ns1:Descripcion_Larga_Inv)}</ns2:P_DESCRIPCION_LARGA_INV>
        <ns2:P_ESTADO_PROCESO>{fn:data($Inv/ns1:Inventario_Request/ns1:Estado_Proceso)}</ns2:P_ESTADO_PROCESO>
        <ns2:P_ESTADO>{fn:data($Inv/ns1:Inventario_Request/ns1:Estado)}</ns2:P_ESTADO>
        {
        if($Inv/ns1:Inventario_Request/ns1:Fecha_Creacion and $Inv/ns1:Inventario_Request/ns1:Fecha_Creacion != 'null')
        then <ns2:P_FECHA_CREACION>{fn:data($Inv/ns1:Inventario_Request/ns1:Fecha_Creacion)}</ns2:P_FECHA_CREACION>
        else <ns2:P_FECHA_CREACION></ns2:P_FECHA_CREACION>
        }
        
        {
        if($Inv/ns1:Inventario_Request/ns1:Fecha_Actualizacion and $Inv/ns1:Inventario_Request/ns1:Fecha_Actualizacion != 'null')
        then <ns2:P_FECHA_ACTUALIZACION>{fn:data($Inv/ns1:Inventario_Request/ns1:Fecha_Actualizacion)}</ns2:P_FECHA_ACTUALIZACION>
        else <ns2:P_FECHA_ACTUALIZACION></ns2:P_FECHA_ACTUALIZACION>
        }
        
        <ns2:P_COMENTARIO1_ESTADO>{fn:data($Inv/ns1:Inventario_Request/ns1:Comentario1_Estado)}</ns2:P_COMENTARIO1_ESTADO>
        <ns2:P_COMENTARIO2_ESTADO>{fn:data($Inv/ns1:Inventario_Request/ns1:Comentario2_Estado)}</ns2:P_COMENTARIO2_ESTADO>
   </ns2:InputParameters>
};

local:func($Inv)