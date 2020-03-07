-- ChargeAllocationDao.getServiceName = SELECT S.SERVICE_ID AS valueInteger, S.SERVICE_NAME AS text FROM t_service_master S WHERE S.IS_ACTIVE ='Y'
--
-- ChargeAllocationDao.getDocumentList = SELECT D.DOCUMENT_ID AS valueInteger,D.DOCUMENT_NAME AS text FROM t_document_master D WHERE D.IS_ACTIVE = 'Y'
--
-- ChargeAllocationDao.getChargeList = SELECT S.SERVICE_CHARGE_ID AS serviceChargeId \
--                                     ,S.SERVICE_SL_NO AS serviceId \
--                                     ,M.SERVICE_NAME AS serviceName \
--                                     ,S.DOCUMENT_ID AS documentId \
--                                     ,D.DOCUMENT_NAME AS documentName \
--                                     ,S.CHARGE_AMOUNT AS chargeAmount \
--                                     ,S.IS_ACTIVE AS statusTag \
--                                     ,IF(S.IS_ACTIVE = 'Y','Active','Inactive') AS statusTagName \
--                                     FROM t_service_charge S INNER JOIN t_service_master M \
--                                     ON S.SERVICE_SL_NO = M.SERVICE_SL_NO \
--                                     LEFT JOIN t_document_master D ON D.DOCUMENT_ID = S.DOCUMENT_ID ORDER BY S.SERVICE_SL_NO
--
-- ChargeAllocationDao.isExistSave = SELECT SERVICE_CHARGE_ID FROM t_service_charge S \
--                                   WHERE S.SERVICE_SL_NO =:serviceId AND (:documentId IS NULL OR S.DOCUMENT_ID =:documentId) LIMIT 1
--
-- ChargeAllocationDao.getLastServiceChargeId = SELECT S.SERVICE_CHARGE_ID FROM t_service_charge S ORDER BY S.SERVICE_CHARGE_ID DESC LIMIT 1
--
-- ChargeAllocationDao.getChargeDetail = SELECT S.SERVICE_SL_NO AS serviceId \
--                                 ,S.DOCUMENT_ID AS documentId \
--                                 ,S.CHARGE_AMOUNT AS chargeAmount \
--                                 ,S.IS_ACTIVE AS statusTag \
--                                 FROM t_service_charge S WHERE S.SERVICE_CHARGE_ID =:serviceChargeId
--
-- ChargeAllocationDao.getDocumentName = SELECT D.DOCUMENT_NAME FROM t_document_master D WHERE D.DOCUMENT_ID =:documentId
--
-- ChargeAllocationDao.getServiceNameByServiceId = SELECT S.SERVICE_NAME FROM t_service_master S WHERE S.SERVICE_ID =:serviceId

ChargeAllocationDao.checkDuplicateCid = SELECT E.CidNo FROM employee E WHERE CidNo=:cidNo

ChargeAllocationDao.getApplicant = SELECT L.ApplicantName AS applicantName,\
                                    L.Reason AS reason, \
                                    L.FromDate AS fromDate, \
                                    L.ToDate AS toDate \
                                    FROM leaverecord L WHERE ApplicantName =:aName LIMIT 1
ChargeAllocationDao.checkDuplicateCidDelivery = SELECT d.cidNumber FROM delivery d WHERE d.cidNumber=:cidNo

ChargeAllocationDao.getSenderInfo = SELECT d.cidNumber AS cidNumber, \
                                    d.senderName AS senderName, \
                                    d.receiverName AS receiverName \
                                   FROM delivery d WHERE d.cidNumber=:cidNumber Limit 1

ChargeAllocationDao.getAutoSerial =  SELECT CONVERT(RIGHT(R.tpn,4),UNSIGNED INTEGER) FROM tpnregistration R \
                           WHERE SUBSTRING(R.tpn,3,1) =:taxPayerType ORDER BY RIGHT(R.tpn,4) DESC LIMIT 1

ChargeAllocationDao.getAutoSerialSecondary = SELECT CONVERT(RIGHT(t.tpnSecondary,4),UNSIGNED INTEGER) FROM tpnregistration t \
                                              WHERE SUBSTRING(t.tpnSecondary,1,2)=:yearNumber AND \
                                              SUBSTRING(t.tpnSecondary,3,2)=:monthNumber \
                                              AND SUBSTRING(t.tpnSecondary,5,2)=:dayNumber \
                                              ORDER BY RIGHT(t.tpnSecondary,4) DESC LIMIT 1

ChargeAllocationDao.getStudentDetail = SELECT indexNo, school,studentName,sex,cid ,stream,mediaStudies , \
                                        evs ,agriculture ,businessMathematics , \
                                        biology ,computerStudies ,physics ,chemistry , \
                                        dzongkha ,english ,maths ,economics ,geography , \
                                        history ,accounts ,commerce \
                                        FROM student_detail  WHERE cid =:cid

ChargeAllocationDao.getStudentList = SELECT S.indexNo,S.studentName, S.english, S.dzongkha \
                                     FROM student_detail S \
                                     WHERE S.english >= (SELECT english FROM cutoff) \
                                     AND S.dzongkha >= (SELECT dzongkha FROM cutoff)

ChargeAllocationDao.getTopThreeStudentList = SELECT S.indexNo,S.studentName, S.english FROM student_detail S \
                          WHERE S.english >= (SELECT english FROM cutoff) ORDER BY english DESC LIMIT 3

ChargeAllocationDao.getAvgMarksRatioList = CALL USP_BCSEA_GET_RATIO_MARKS

