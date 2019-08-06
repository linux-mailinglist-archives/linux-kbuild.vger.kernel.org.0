Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5A7058302C
	for <lists+linux-kbuild@lfdr.de>; Tue,  6 Aug 2019 12:58:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731116AbfHFK5P (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 6 Aug 2019 06:57:15 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:2186 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1730381AbfHFK5P (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 6 Aug 2019 06:57:15 -0400
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id x76AvBS5049297
        for <linux-kbuild@vger.kernel.org>; Tue, 6 Aug 2019 06:57:14 -0400
Received: from e06smtp01.uk.ibm.com (e06smtp01.uk.ibm.com [195.75.94.97])
        by mx0a-001b2d01.pphosted.com with ESMTP id 2u7689vvn4-1
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
        for <linux-kbuild@vger.kernel.org>; Tue, 06 Aug 2019 06:57:13 -0400
Received: from localhost
        by e06smtp01.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
        for <linux-kbuild@vger.kernel.org> from <gor@linux.ibm.com>;
        Tue, 6 Aug 2019 11:56:50 +0100
Received: from b06cxnps3074.portsmouth.uk.ibm.com (9.149.109.194)
        by e06smtp01.uk.ibm.com (192.168.101.131) with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted;
        (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
        Tue, 6 Aug 2019 11:56:48 +0100
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com [9.149.105.58])
        by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id x76AulUJ58982484
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 6 Aug 2019 10:56:47 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 388214C04A;
        Tue,  6 Aug 2019 10:56:47 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 0A8944C044;
        Tue,  6 Aug 2019 10:56:47 +0000 (GMT)
Received: from localhost (unknown [9.152.212.148])
        by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
        Tue,  6 Aug 2019 10:56:46 +0000 (GMT)
Date:   Tue, 6 Aug 2019 12:56:45 +0200
From:   Vasily Gorbik <gor@linux.ibm.com>
To:     Masahiro Yamada <yamada.masahiro@socionext.com>
Cc:     linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] kbuild: add OBJSIZE variable for the size tool
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
X-Patchwork-Bot: notify
X-TM-AS-GCONF: 00
x-cbid: 19080610-4275-0000-0000-00000354F3E7
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19080610-4276-0000-0000-00003865EFE9
Message-Id: <patch-1.thread-2257a1.git-188f5a3d81d5.your-ad-here.call-01565088755-ext-5120@work.hours>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:,, definitions=2019-08-06_06:,,
 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1906280000 definitions=main-1908060113
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Define and export OBJSIZE variable for "size" tool from binutils to be
used in architecture specific Makefiles (naming the variable just "SIZE"
would be too risky). In particular this tool is useful to perform checks
that early boot code is not using bss section (which might have not been
zeroed yet or intersects with initrd or other files boot loader might
have put right after the linux kernel).

Signed-off-by: Vasily Gorbik <gor@linux.ibm.com>
---
 Makefile | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/Makefile b/Makefile
index fa0fbe7851ea..ff4cff29fe46 100644
--- a/Makefile
+++ b/Makefile
@@ -419,6 +419,7 @@ NM		= $(CROSS_COMPILE)nm
 STRIP		= $(CROSS_COMPILE)strip
 OBJCOPY		= $(CROSS_COMPILE)objcopy
 OBJDUMP		= $(CROSS_COMPILE)objdump
+OBJSIZE		= $(CROSS_COMPILE)size
 PAHOLE		= pahole
 LEX		= flex
 YACC		= bison
@@ -474,9 +475,9 @@ KBUILD_LDFLAGS :=
 GCC_PLUGINS_CFLAGS :=
 
 export ARCH SRCARCH CONFIG_SHELL HOSTCC KBUILD_HOSTCFLAGS CROSS_COMPILE AS LD CC
-export CPP AR NM STRIP OBJCOPY OBJDUMP PAHOLE KBUILD_HOSTLDFLAGS KBUILD_HOSTLDLIBS
-export MAKE LEX YACC AWK INSTALLKERNEL PERL PYTHON PYTHON2 PYTHON3 UTS_MACHINE
-export HOSTCXX KBUILD_HOSTCXXFLAGS LDFLAGS_MODULE CHECK CHECKFLAGS
+export CPP AR NM STRIP OBJCOPY OBJDUMP OBJSIZE PAHOLE LEX YACC AWK INSTALLKERNEL
+export PERL PYTHON PYTHON2 PYTHON3 CHECK CHECKFLAGS MAKE UTS_MACHINE HOSTCXX
+export KBUILD_HOSTCXXFLAGS KBUILD_HOSTLDFLAGS KBUILD_HOSTLDLIBS LDFLAGS_MODULE
 
 export KBUILD_CPPFLAGS NOSTDINC_FLAGS LINUXINCLUDE OBJCOPYFLAGS KBUILD_LDFLAGS
 export KBUILD_CFLAGS CFLAGS_KERNEL CFLAGS_MODULE
-- 
2.21.0

