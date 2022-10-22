xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns2="http://www.socofar.cl/inventario/resp";
(:: import schema at "../xsd/inventario_resp.xsd" ::)

declare namespace ns1="http://xmlns.oracle.com/pcbpel/adapter/db/sp/db_Inventario";
(:: import schema at "../../../Integracion/Inventario/xsd/db_Inventario_sp.xsd" ::)

declare variable $cod as xs:string external;
declare variable $descripcion as xs:string external;

declare function local:func($cod,$descripcion) as element() (:: schema-element(ns2:Inventario_Response) ::) {
    <ns2:Inventario_Response>
        <ns2:codRetorno>{fn:data($cod )}</ns2:codRetorno>
        <ns2:descRetorno>{fn:data($descripcion)}</ns2:descRetorno>
    </ns2:Inventario_Response>
};

local:func($cod,$descripcion)
