Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F3F1A296E07
	for <lists+linux-kbuild@lfdr.de>; Fri, 23 Oct 2020 13:57:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S463246AbgJWL5p (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 23 Oct 2020 07:57:45 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:18790 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2409403AbgJWL5p (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 23 Oct 2020 07:57:45 -0400
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 09NBhvHR050587;
        Fri, 23 Oct 2020 07:57:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=date : from : to : cc :
 subject : message-id : mime-version : content-type; s=pp1;
 bh=G638WJePebchukAGz5Hbd4aBlR6kAFex/G6+r6vFTNs=;
 b=KMKukBccSh0jHgwxqQFg3Fyeo/PQofipW+lk1TbRzszn79OdrVo1SmLvQP7uuQnoyGhC
 tFEqjwixyy/FI7YZm2sbehHQtpk//9OutAhvpIVIoR3Q/gwaQhdPO4Kt3JJy6xHB3SxQ
 jEw8uLF5GpzwqSGKwM90D7XQbR8Sy99t/4UTP2sfQmSHndeuO14AmjA3ob2my1M3XihM
 MIY1/MfytHOncypjaZH+QbGnRLykOHqxhde+TVmdxk64pZ3BMYQrGuLTDC0VfD8eeZS1
 7y7EXI/pewXvsgWKF4tHxLdLfw5auGBJ0EJq8U7ao4I4Jv3/iHH7ZPtMCSCKaQFvbSdt Pg== 
Received: from pps.reinject (localhost [127.0.0.1])
        by mx0a-001b2d01.pphosted.com with ESMTP id 34bxjbrak7-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 23 Oct 2020 07:57:39 -0400
Received: from m0098409.ppops.net (m0098409.ppops.net [127.0.0.1])
        by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 09NBid7A052526;
        Fri, 23 Oct 2020 07:57:39 -0400
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com [169.51.49.98])
        by mx0a-001b2d01.pphosted.com with ESMTP id 34bxjbrajb-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 23 Oct 2020 07:57:38 -0400
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
        by ppma03ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 09NBva9p006167;
        Fri, 23 Oct 2020 11:57:36 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
        by ppma03ams.nl.ibm.com with ESMTP id 348d5qwppx-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 23 Oct 2020 11:57:36 +0000
Received: from d06av24.portsmouth.uk.ibm.com (mk.ibm.com [9.149.105.60])
        by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 09NBvYhl35979592
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 23 Oct 2020 11:57:34 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 7699842041;
        Fri, 23 Oct 2020 11:57:34 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id CF5AE42049;
        Fri, 23 Oct 2020 11:57:33 +0000 (GMT)
Received: from localhost (unknown [9.145.183.202])
        by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
        Fri, 23 Oct 2020 11:57:33 +0000 (GMT)
Date:   Fri, 23 Oct 2020 13:57:32 +0200
From:   Vasily Gorbik <gor@linux.ibm.com>
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Nathan Chancellor <natechancellor@gmail.com>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Michal Marek <michal.lkml@markovi.net>,
        Jonathan Corbet <corbet@lwn.net>, linux-kbuild@vger.kernel.org,
        clang-built-linux@googlegroups.com, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] kbuild: remove unused OBJSIZE
Message-ID: <patch.git-ef02981ce9bc.your-ad-here.call-01603453662-ext-3714@work.hours>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
X-Patchwork-Bot: notify
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235,18.0.737
 definitions=2020-10-23_04:2020-10-23,2020-10-23 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 bulkscore=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 adultscore=0
 impostorscore=0 suspectscore=1 mlxlogscore=999 mlxscore=0
 priorityscore=1501 clxscore=1011 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2009150000 definitions=main-2010230078
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

The "size" tool has been solely used by s390 to enforce .bss section usage
restrictions in early startup code. Since commit 980d5f9ab36b ("s390/boot:
enable .bss section for compressed kernel") and commit 2e83e0eb85ca
("s390: clean .bss before running uncompressed kernel") these restrictions
have been lifted for the decompressor and uncompressed kernel and the
size tool is now unused.

Signed-off-by: Vasily Gorbik <gor@linux.ibm.com>
---
 Documentation/kbuild/llvm.rst | 5 ++---
 Makefile                      | 4 +---
 2 files changed, 3 insertions(+), 6 deletions(-)

diff --git a/Documentation/kbuild/llvm.rst b/Documentation/kbuild/llvm.rst
index cf3ca236d2cc..21c847890d03 100644
--- a/Documentation/kbuild/llvm.rst
+++ b/Documentation/kbuild/llvm.rst
@@ -57,9 +57,8 @@ to enable them. ::
 They can be enabled individually. The full list of the parameters: ::
 
 	make CC=clang LD=ld.lld AR=llvm-ar NM=llvm-nm STRIP=llvm-strip \
-	  OBJCOPY=llvm-objcopy OBJDUMP=llvm-objdump OBJSIZE=llvm-size \
-	  READELF=llvm-readelf HOSTCC=clang HOSTCXX=clang++ HOSTAR=llvm-ar \
-	  HOSTLD=ld.lld
+	  OBJCOPY=llvm-objcopy OBJDUMP=llvm-objdump READELF=llvm-readelf \
+	  HOSTCC=clang HOSTCXX=clang++ HOSTAR=llvm-ar HOSTLD=ld.lld
 
 Currently, the integrated assembler is disabled by default. You can pass
 ``LLVM_IAS=1`` to enable it.
diff --git a/Makefile b/Makefile
index d35a59f98e83..d2123c2c829a 100644
--- a/Makefile
+++ b/Makefile
@@ -433,7 +433,6 @@ NM		= llvm-nm
 OBJCOPY		= llvm-objcopy
 OBJDUMP		= llvm-objdump
 READELF		= llvm-readelf
-OBJSIZE		= llvm-size
 STRIP		= llvm-strip
 else
 CC		= $(CROSS_COMPILE)gcc
@@ -443,7 +442,6 @@ NM		= $(CROSS_COMPILE)nm
 OBJCOPY		= $(CROSS_COMPILE)objcopy
 OBJDUMP		= $(CROSS_COMPILE)objdump
 READELF		= $(CROSS_COMPILE)readelf
-OBJSIZE		= $(CROSS_COMPILE)size
 STRIP		= $(CROSS_COMPILE)strip
 endif
 PAHOLE		= pahole
@@ -509,7 +507,7 @@ KBUILD_LDFLAGS :=
 CLANG_FLAGS :=
 
 export ARCH SRCARCH CONFIG_SHELL BASH HOSTCC KBUILD_HOSTCFLAGS CROSS_COMPILE LD CC
-export CPP AR NM STRIP OBJCOPY OBJDUMP OBJSIZE READELF PAHOLE RESOLVE_BTFIDS LEX YACC AWK INSTALLKERNEL
+export CPP AR NM STRIP OBJCOPY OBJDUMP READELF PAHOLE RESOLVE_BTFIDS LEX YACC AWK INSTALLKERNEL
 export PERL PYTHON PYTHON3 CHECK CHECKFLAGS MAKE UTS_MACHINE HOSTCXX
 export KGZIP KBZIP2 KLZOP LZMA LZ4 XZ ZSTD
 export KBUILD_HOSTCXXFLAGS KBUILD_HOSTLDFLAGS KBUILD_HOSTLDLIBS LDFLAGS_MODULE
-- 
2.25.4
