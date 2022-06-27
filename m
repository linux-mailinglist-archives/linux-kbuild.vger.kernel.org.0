Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CB5C955DDB2
	for <lists+linux-kbuild@lfdr.de>; Tue, 28 Jun 2022 15:27:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234135AbiF0MvO (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 27 Jun 2022 08:51:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52722 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231282AbiF0MvO (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 27 Jun 2022 08:51:14 -0400
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A3764B09;
        Mon, 27 Jun 2022 05:51:13 -0700 (PDT)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25RCgNrJ004305;
        Mon, 27 Jun 2022 12:51:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=date : from : to : cc :
 subject : message-id : references : mime-version : content-type :
 in-reply-to; s=pp1; bh=IWn2HPl4vf/oniSp9rs3E+2lGJd/LS0WK14slnmffr0=;
 b=fIIfOXq812OJSN/x0eeB5THb/XqxtrLJWdz7VYLsClN3CJEyrenB1d+h2KGZMDFESnVh
 C4nhnv/yhOKP7qx3NtX+Rx1ppssQSp3HqL/5BvxG1KqfQFdtO2ZqnhH2aiyRTTkHPY7o
 Xg/PRRdQcCg1YkBofAFozuom6I6C4vVq3i9hPKc8EQBry3Yfj4fELJJTla6DDiV+KwKa
 2ZKc5iWxWlScPA1L+nsNS707eb5pgROhkkudXCnI5ZSwS4UMAZCbcJ2J0auFmTBqi7oe
 xAeO+ZUCIiMHGI+ls0pYsSZAWHfoAEhDvnshXm5a9V8sBaJPHWJx/iOnW43Pdoqm2Wqc Aw== 
Received: from pps.reinject (localhost [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3gycsj86vp-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 27 Jun 2022 12:51:02 +0000
Received: from m0187473.ppops.net (m0187473.ppops.net [127.0.0.1])
        by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 25RCgjgw004783;
        Mon, 27 Jun 2022 12:51:01 GMT
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com [169.51.49.99])
        by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3gycsj86up-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 27 Jun 2022 12:51:01 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
        by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 25RCoeUP004139;
        Mon, 27 Jun 2022 12:50:58 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
        by ppma04ams.nl.ibm.com with ESMTP id 3gwt08txh2-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 27 Jun 2022 12:50:58 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com [9.149.105.61])
        by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 25RCotuB23068960
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 27 Jun 2022 12:50:55 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id B06EB11C04C;
        Mon, 27 Jun 2022 12:50:55 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 49EF011C04A;
        Mon, 27 Jun 2022 12:50:55 +0000 (GMT)
Received: from localhost (unknown [9.171.41.134])
        by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
        Mon, 27 Jun 2022 12:50:55 +0000 (GMT)
Date:   Mon, 27 Jun 2022 14:50:53 +0200
From:   Vasily Gorbik <gor@linux.ibm.com>
To:     Joe Lawrence <joe.lawrence@redhat.com>
Cc:     Michael Ellerman <mpe@ellerman.id.au>,
        Sumanth Korikkar <sumanthk@linux.ibm.com>,
        Heiko Carstens <hca@linux.ibm.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
        linux-s390 <linux-s390@vger.kernel.org>,
        linux-kbuild@vger.kernel.org
Subject: [PATCH 1/2] s390/nospec: build expoline.o for modules_prepare target
Message-ID: <patch-1.thread-d13b6c.git-a2387a74dc49.your-ad-here.call-01656331067-ext-4899@work.hours>
References: <8569429d-57f8-a0cf-8b17-1291f6973d32@redhat.com>
 <cover.thread-d13b6c.your-ad-here.call-01656331067-ext-4899@work.hours>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <cover.thread-d13b6c.your-ad-here.call-01656331067-ext-4899@work.hours>
X-Patchwork-Bot: notify
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 9KFuSd2MBpTTkKexJO8Ans3HwmkofNaE
X-Proofpoint-GUID: XKA2f3XiAcnLQq8Z3Nu5dxzV925d7tPQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-06-27_06,2022-06-24_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 malwarescore=0
 priorityscore=1501 mlxscore=0 mlxlogscore=941 clxscore=1015
 lowpriorityscore=0 phishscore=0 adultscore=0 impostorscore=0 bulkscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2204290000 definitions=main-2206270055
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

When CONFIG_EXPOLINE_EXTERN is used expoline thunks are generated
from arch/s390/lib/expoline.S and postlinked into every module.
This is also true for external modules. Add expoline.o build to
the modules_prepare target.

Fixes: 1d2ad084800e ("s390/nospec: add an option to use thunk-extern")
Reported-by: Joe Lawrence <joe.lawrence@redhat.com>
Tested-by: Sumanth Korikkar <sumanthk@linux.ibm.com>
Acked-by: Sumanth Korikkar <sumanthk@linux.ibm.com>
Signed-off-by: Vasily Gorbik <gor@linux.ibm.com>
---
 arch/s390/Makefile                      | 8 +++++++-
 arch/s390/lib/Makefile                  | 3 ++-
 arch/s390/lib/expoline/Makefile         | 3 +++
 arch/s390/lib/{ => expoline}/expoline.S | 0
 4 files changed, 12 insertions(+), 2 deletions(-)
 create mode 100644 arch/s390/lib/expoline/Makefile
 rename arch/s390/lib/{ => expoline}/expoline.S (100%)

diff --git a/arch/s390/Makefile b/arch/s390/Makefile
index 495c68a4df1e..fc72a35a1f07 100644
--- a/arch/s390/Makefile
+++ b/arch/s390/Makefile
@@ -82,7 +82,7 @@ endif
 
 ifdef CONFIG_EXPOLINE
   ifdef CONFIG_EXPOLINE_EXTERN
-    KBUILD_LDFLAGS_MODULE += arch/s390/lib/expoline.o
+    KBUILD_LDFLAGS_MODULE += arch/s390/lib/expoline/expoline.o
     CC_FLAGS_EXPOLINE := -mindirect-branch=thunk-extern
     CC_FLAGS_EXPOLINE += -mfunction-return=thunk-extern
   else
@@ -163,6 +163,12 @@ vdso_prepare: prepare0
 	$(Q)$(MAKE) $(build)=arch/s390/kernel/vdso64 include/generated/vdso64-offsets.h
 	$(if $(CONFIG_COMPAT),$(Q)$(MAKE) \
 		$(build)=arch/s390/kernel/vdso32 include/generated/vdso32-offsets.h)
+
+ifdef CONFIG_EXPOLINE_EXTERN
+modules_prepare: expoline_prepare
+expoline_prepare: prepare0
+	$(Q)$(MAKE) $(build)=arch/s390/lib/expoline arch/s390/lib/expoline/expoline.o
+endif
 endif
 
 # Don't use tabs in echo arguments
diff --git a/arch/s390/lib/Makefile b/arch/s390/lib/Makefile
index 5d415b3db6d1..580d2e3265cb 100644
--- a/arch/s390/lib/Makefile
+++ b/arch/s390/lib/Makefile
@@ -7,7 +7,6 @@ lib-y += delay.o string.o uaccess.o find.o spinlock.o
 obj-y += mem.o xor.o
 lib-$(CONFIG_KPROBES) += probes.o
 lib-$(CONFIG_UPROBES) += probes.o
-obj-$(CONFIG_EXPOLINE_EXTERN) += expoline.o
 obj-$(CONFIG_S390_KPROBES_SANITY_TEST) += test_kprobes_s390.o
 test_kprobes_s390-objs += test_kprobes_asm.o test_kprobes.o
 
@@ -22,3 +21,5 @@ obj-$(CONFIG_S390_MODULES_SANITY_TEST) += test_modules.o
 obj-$(CONFIG_S390_MODULES_SANITY_TEST_HELPERS) += test_modules_helpers.o
 
 lib-$(CONFIG_FUNCTION_ERROR_INJECTION) += error-inject.o
+
+obj-$(CONFIG_EXPOLINE_EXTERN) += expoline/
diff --git a/arch/s390/lib/expoline/Makefile b/arch/s390/lib/expoline/Makefile
new file mode 100644
index 000000000000..854631d9cb03
--- /dev/null
+++ b/arch/s390/lib/expoline/Makefile
@@ -0,0 +1,3 @@
+# SPDX-License-Identifier: GPL-2.0
+
+obj-y += expoline.o
diff --git a/arch/s390/lib/expoline.S b/arch/s390/lib/expoline/expoline.S
similarity index 100%
rename from arch/s390/lib/expoline.S
rename to arch/s390/lib/expoline/expoline.S
-- 
2.35.1

