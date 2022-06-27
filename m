Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D24D555C4E8
	for <lists+linux-kbuild@lfdr.de>; Tue, 28 Jun 2022 14:50:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232736AbiF0MvO (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 27 Jun 2022 08:51:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52714 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234135AbiF0MvN (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 27 Jun 2022 08:51:13 -0400
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C0563B98;
        Mon, 27 Jun 2022 05:51:12 -0700 (PDT)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25RCiB0g025896;
        Mon, 27 Jun 2022 12:51:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=date : from : to : cc :
 subject : message-id : references : mime-version : content-type :
 in-reply-to; s=pp1; bh=pCyChn19XKYsoLzXEsp1N/D379jlpmk1cKp3W6BozdY=;
 b=KU/LJY894Jhe24pH+MaWV54RzmYsHFFaiLKV8H7dYOLYCmFd5VLqyWqaqg96v6H8Fdtq
 XenNMQeYzymWX4Rc13mqrKfyAUH2gq+He/tBW512I1s1lPjVX73ibzKyNbf9vN+FO1c7
 iYvIHKSpxw0s5XO/UrlIyGHSl7qxf0PipeyWteNBxFNWxJSd0OceIpfQ5yUrtiPXqwu8
 JxfoyCJyzCMLyMCJoE5QouqNKDrqnDqYL2EoMzsQr/fUAVd0BmUGowLWVwYPdkIDoLp+
 pYsE0sk3/ExZyxtB9UvZafsa6GEdmbLphFfDQxkmXtHSgHSHFk94r/odgzU1gQ7Pmh4y bQ== 
Received: from pps.reinject (localhost [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3gyctg85f8-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 27 Jun 2022 12:51:07 +0000
Received: from m0098417.ppops.net (m0098417.ppops.net [127.0.0.1])
        by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 25RCk5xe031845;
        Mon, 27 Jun 2022 12:51:06 GMT
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com [169.51.49.99])
        by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3gyctg85eg-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 27 Jun 2022 12:51:06 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
        by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 25RCoemk004136;
        Mon, 27 Jun 2022 12:51:01 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
        by ppma04ams.nl.ibm.com with ESMTP id 3gwt08txh4-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 27 Jun 2022 12:51:01 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com [9.149.105.61])
        by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 25RCowHq12517830
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 27 Jun 2022 12:50:58 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 91F5111C04C;
        Mon, 27 Jun 2022 12:50:58 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 2436611C04A;
        Mon, 27 Jun 2022 12:50:58 +0000 (GMT)
Received: from localhost (unknown [9.171.41.134])
        by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
        Mon, 27 Jun 2022 12:50:58 +0000 (GMT)
Date:   Mon, 27 Jun 2022 14:50:56 +0200
From:   Vasily Gorbik <gor@linux.ibm.com>
To:     Joe Lawrence <joe.lawrence@redhat.com>
Cc:     Michael Ellerman <mpe@ellerman.id.au>,
        Sumanth Korikkar <sumanthk@linux.ibm.com>,
        Heiko Carstens <hca@linux.ibm.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
        linux-s390 <linux-s390@vger.kernel.org>,
        linux-kbuild@vger.kernel.org
Subject: [PATCH 2/2] s390/nospec: remove unneeded header includes
Message-ID: <patch-2.thread-d13b6c.git-d13b6c96fb5f.your-ad-here.call-01656331067-ext-4899@work.hours>
References: <8569429d-57f8-a0cf-8b17-1291f6973d32@redhat.com>
 <cover.thread-d13b6c.your-ad-here.call-01656331067-ext-4899@work.hours>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <cover.thread-d13b6c.your-ad-here.call-01656331067-ext-4899@work.hours>
X-Patchwork-Bot: notify
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: P8HRJ-gcRCyQQxwQ3gUfOnKEvFwBvvBO
X-Proofpoint-GUID: Sybcm8SxS9KlLFugOFyct-ToWyLjZddR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-06-27_06,2022-06-24_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 clxscore=1015
 impostorscore=0 lowpriorityscore=0 spamscore=0 suspectscore=0
 mlxlogscore=691 malwarescore=0 adultscore=0 bulkscore=0 priorityscore=1501
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2204290000 definitions=main-2206270055
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Commit 4efd417f298b ("s390: raise minimum supported machine generation
to z10") removed the usage of alternatives and lowcore in expolines
macros. Remove unneeded header includes as well.

With that, expoline.S doesn't require asm-offsets.h and
expoline_prepare target dependency could be removed.

Signed-off-by: Vasily Gorbik <gor@linux.ibm.com>
---
 arch/s390/Makefile                  | 2 +-
 arch/s390/include/asm/nospec-insn.h | 2 --
 2 files changed, 1 insertion(+), 3 deletions(-)

diff --git a/arch/s390/Makefile b/arch/s390/Makefile
index fc72a35a1f07..4cb5d17e7ead 100644
--- a/arch/s390/Makefile
+++ b/arch/s390/Makefile
@@ -166,7 +166,7 @@ vdso_prepare: prepare0
 
 ifdef CONFIG_EXPOLINE_EXTERN
 modules_prepare: expoline_prepare
-expoline_prepare: prepare0
+expoline_prepare:
 	$(Q)$(MAKE) $(build)=arch/s390/lib/expoline arch/s390/lib/expoline/expoline.o
 endif
 endif
diff --git a/arch/s390/include/asm/nospec-insn.h b/arch/s390/include/asm/nospec-insn.h
index d910d71b5bb5..7e9e99523e95 100644
--- a/arch/s390/include/asm/nospec-insn.h
+++ b/arch/s390/include/asm/nospec-insn.h
@@ -2,8 +2,6 @@
 #ifndef _ASM_S390_NOSPEC_ASM_H
 #define _ASM_S390_NOSPEC_ASM_H
 
-#include <asm/alternative-asm.h>
-#include <asm/asm-offsets.h>
 #include <asm/dwarf.h>
 
 #ifdef __ASSEMBLY__
-- 
2.35.1
