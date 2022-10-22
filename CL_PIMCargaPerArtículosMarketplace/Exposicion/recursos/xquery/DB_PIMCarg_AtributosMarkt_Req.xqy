xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)
declare namespace ns1="http://www.demandware.com/xml/impex/order/2006-10-31";
(:: import schema at "../xsd/inventario_req.xsd" ::)

declare namespace ns2="http://xmlns.oracle.com/pcbpel/adapter/db/sp/db_ATRIBUTOS";
(:: import schema at "../../../Integracion/Atributos/xsd/db_ATRIBUTOS_sp.xsd" ::)

declare variable $ID as xs:string external;
declare variable $Inventario as element() external;
declare variable $Atributo as element() external;

declare function local:func($Inventario, $Atributo, $ID) as element() (:: schema-element(ns2:InputParameters) ::) {
   <ns2:InputParameters>
        <ns2:P_ITEM_MKP_ID>{fn:data($ID)}</ns2:P_ITEM_MKP_ID>

        <ns2:P_CODIGO_MKP>{fn:data($Inventario/ns1:Inventario_Request/ns1:Codigo_MKP)}</ns2:P_CODIGO_MKP>
        <ns2:P_ORGANIZACION>{fn:data($Inventario/ns1:Inventario_Request/ns1:Organizacion)}</ns2:P_ORGANIZACION>
        <ns2:P_GRUPO_PIM>{fn:data($Atributo/ns1:Grupo_PIM)}</ns2:P_GRUPO_PIM>
        <ns2:P_ATRIBUTO_PIM>{fn:data($Atributo/ns1:Atributo_PIM)}</ns2:P_ATRIBUTO_PIM>
        {
         if(fn:data($Atributo/ns1:Atributo_PIM)='CanalDeVentaDistribucion')
         then <ns2:P_VALOR_ATRIBUTO_PIM>{fn:data('Solo Venta MKP')}</ns2:P_VALOR_ATRIBUTO_PIM>
         else <ns2:P_VALOR_ATRIBUTO_PIM>{fn:data($Atributo/ns1:Valor_Atributo_PIM)}</ns2:P_VALOR_ATRIBUTO_PIM>
        }
        <ns2:P_NUMERO_FILA>{fn:data($Atributo/ns1:Numero_Fila)}</ns2:P_NUMERO_FILA>
        <ns2:P_ESTADO_PROCESO>{fn:data($Atributo/ns1:Estado_Proceso)}</ns2:P_ESTADO_PROCESO>
        <ns2:P_ESTADO>{fn:data($Atributo/ns1:Estado)}</ns2:P_ESTADO>
        {
        if($Atributo/ns1:Fecha_Creacion and $Atributo/ns1:Fecha_Creacion != 'null')
        then <ns2:P_FECHA_CREACION>{fn:data($Atributo/ns1:Fecha_Creacion)}</ns2:P_FECHA_CREACION>
        else <ns2:P_FECHA_CREACION></ns2:P_FECHA_CREACION>
        }
        
        {
        if($Atributo/ns1:Fecha_Actualizacion and  $Atributo/ns1:Fecha_Actualizacion != 'null')
        then <ns2:P_FECHA_ACTUALIZACION>{fn:data($Atributo/ns1:Fecha_Actualizacion)}</ns2:P_FECHA_ACTUALIZACION>
        else <ns2:P_FECHA_ACTUALIZACION></ns2:P_FECHA_ACTUALIZACION>
        }
        
        <ns2:P_COMENTARIO1_ESTADO>{fn:data($Atributo/ns1:Comentario1_Estado)}</ns2:P_COMENTARIO1_ESTADO>
        <ns2:P_COMENTARIO2_ESTADO>{fn:data($Atributo/ns1:Comentario2_Estado)}</ns2:P_COMENTARIO2_ESTADO>
   </ns2:InputParameters>
};

local:func($Inventario, $Atributo, $ID)