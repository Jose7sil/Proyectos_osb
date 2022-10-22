xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns2="http://www.socofar.cl/inventario/resp";
(:: import schema at "../xsd/inventario_resp.xsd" ::)

declare namespace ns1="http://xmlns.oracle.com/pcbpel/adapter/db/sp/db_Inventario";
(:: import schema at "../../../Integracion/Inventario/xsd/db_Inventario_sp.xsd" ::)

declare variable $Inv_Response as element() (:: schema-element(ns1:OutputParameters) ::) external;

declare function local:func($Inv_Response as element() (:: schema-element(ns1:OutputParameters) ::)) as element() (:: schema-element(ns2:Inventario_Response) ::) {
    <ns2:Inventario_Response>
        <ns2:codRetorno>{fn:data($Inv_Response/ns1:O_CODIGO)}</ns2:codRetorno>
        <ns2:descRetorno>{fn:data($Inv_Response/ns1:O_DESCRIPCION)}</ns2:descRetorno>
    </ns2:Inventario_Response>
};

local:func($Inv_Response)
