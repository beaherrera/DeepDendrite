/* mostly generated from
cat temp | /usr/bin/tr -cs "[:alpha:]" "[\n*]" | sort | uniq | grep '^sp' > sp_redef.h
where temp is the last part of spmatrix.h
*/
#define spClear cmplx_spClear
#define spCondition cmplx_spCondition
#define spCreate cmplx_spCreate
#define spDeleteRowAndCol cmplx_spDeleteRowAndCol
#define spDestroy cmplx_spDestroy
#define spDeterminant cmplx_spDeterminant
#define spElementCount cmplx_spElementCount
#define spError cmplx_spError
#define spFactor cmplx_spFactor
#define spFileMatrix cmplx_spFileMatrix
#define spFileStats cmplx_spFileStats
#define spFileVector cmplx_spFileVector
#define spFillinCount cmplx_spFillinCount
#define spGetAdmittance cmplx_spGetAdmittance
#define spGetElement cmplx_spGetElement
#define spGetInitInfo cmplx_spGetInitInfo
#define spGetOnes cmplx_spGetOnes
#define spGetQuad cmplx_spGetQuad
#define spGetSize cmplx_spGetSize
#define spInitialize cmplx_spInitialize
#define spInstallInitInfo cmplx_spInstallInitInfo
#define spLargestElement cmplx_spLargestElement
#define spMNA_Preorder cmplx_spMNA_Preorder
#define spMultTransposed cmplx_spMultTransposed
#define spMultiply cmplx_spMultiply
#define spNorm cmplx_spNorm
#define spOrderAndFactor cmplx_spOrderAndFactor
#define spPartition cmplx_spPartition
#define spPrint cmplx_spPrint
#define spPseudoCondition cmplx_spPseudoCondition
#define spRoundoff cmplx_spRoundoff
#define spScale cmplx_spScale
#define spSetComplex cmplx_spSetComplex
#define spSetReal cmplx_spSetReal
#define spSolve cmplx_spSolve
#define spSolveTransposed cmplx_spSolveTransposed
#define spStripFills cmplx_spStripFills
#define spWhereSingular cmplx_spWhereSingular
#define spcGetFillin cmplx_spcGetFillin
#define spcGetElement cmplx_spcGetElement
#define spcLinkRows cmplx_spcLinkRows
#define spcFindElementInCol cmplx_spcFindElementInCol
#define spcCreateElement cmplx_spcCreateElement
#define spcRowExchange cmplx_spcRowExchange
#define spcColExchange cmplx_spcColExchange

