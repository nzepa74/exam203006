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

