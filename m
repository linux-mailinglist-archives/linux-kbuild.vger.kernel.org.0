Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E23EF296E0C
	for <lists+linux-kbuild@lfdr.de>; Fri, 23 Oct 2020 13:57:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S463263AbgJWL5z (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 23 Oct 2020 07:57:55 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:8264 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S463256AbgJWL5y (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 23 Oct 2020 07:57:54 -0400
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 09NBWSuX034691;
        Fri, 23 Oct 2020 07:57:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=date : from : to : cc :
 subject : message-id : references : mime-version : content-type :
 in-reply-to; s=pp1; bh=LT5KTnR4j/7fTzgAt99b8mdtsV7TOV6pwj0UzaIUczQ=;
 b=WRMWXkLAYB3c38/4P/SjyYOWcaThHfsfWnDWTgad6jB+PFsue/aEh1BtHVgbWO2X1n1S
 EbeG4hP8LFViuutpIN0qdlCedls82PSf/NYIXnOy0iBwfEClK/wxZytkpxcyy7+ph8Md
 bUDJ+bJtLIWRBvRghu1Ea48bEdLy+go3Aee2r/j/fqJ4zsroGx5KEh0UlzkvBjmm/wwU
 gSOrgcLqv5XnMvcqdCLc6lEEI6fPoh0vzvMPh9jDPGPL9P7EWL4zABwabZBgK0Z/pIeJ
 erIhZ+6gq0VxC0QJmBQAagrrnMUmekPlBffmIOk6azF1wcaDX//Y0vY8kIaIw8xeBB0v eg== 
Received: from ppma04fra.de.ibm.com (6a.4a.5195.ip4.static.sl-reverse.com [149.81.74.106])
        by mx0a-001b2d01.pphosted.com with ESMTP id 34bseq94h9-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 23 Oct 2020 07:57:44 -0400
Received: from pps.filterd (ppma04fra.de.ibm.com [127.0.0.1])
        by ppma04fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 09NBltUG019861;
        Fri, 23 Oct 2020 11:57:42 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
        by ppma04fra.de.ibm.com with ESMTP id 347r88bcd7-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 23 Oct 2020 11:57:42 +0000
Received: from d06av24.portsmouth.uk.ibm.com (mk.ibm.com [9.149.105.60])
        by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 09NBveTt34603326
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 23 Oct 2020 11:57:40 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 4FF2F42041;
        Fri, 23 Oct 2020 11:57:40 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id E444642042;
        Fri, 23 Oct 2020 11:57:39 +0000 (GMT)
Received: from localhost (unknown [9.145.183.202])
        by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
        Fri, 23 Oct 2020 11:57:39 +0000 (GMT)
Date:   Fri, 23 Oct 2020 13:57:38 +0200
From:   Vasily Gorbik <gor@linux.ibm.com>
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Michal Marek <michal.lkml@markovi.net>,
        linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org
Subject: [PATCH 1/2] kbuild: add config option to save link map file(s)
Message-ID: <patch-1.thread-ba6b03.git-dec2f0b867da.your-ad-here.call-01603453670-ext-0242@work.hours>
References: <cover.thread-ba6b03.your-ad-here.call-01603453670-ext-0242@work.hours>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <cover.thread-ba6b03.your-ad-here.call-01603453670-ext-0242@work.hours>
X-Patchwork-Bot: notify
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235,18.0.737
 definitions=2020-10-23_04:2020-10-23,2020-10-23 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 impostorscore=0
 mlxscore=0 mlxlogscore=999 malwarescore=0 spamscore=0 priorityscore=1501
 suspectscore=1 bulkscore=0 phishscore=0 lowpriorityscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2010230078
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Add CONFIG_SAVE_LINK_MAP config option, which would make linker to save
link map to vmlinux.map file. Link map is quite useful during making
kernel changes related to how the kernel is composed and debugging
linker scripts. It also provides information about discarded sections
and symbols.

Architectures supporting compressed kernel images might respect
CONFIG_SAVE_LINK_MAP option and produce arch/*/boot/compressed/vmlinux.map
for the decompressor code as well.

Signed-off-by: Vasily Gorbik <gor@linux.ibm.com>
---
 .gitignore        |  1 +
 Makefile          |  6 +++++-
 lib/Kconfig.debug | 13 +++++++++++++
 3 files changed, 19 insertions(+), 1 deletion(-)

diff --git a/.gitignore b/.gitignore
index d01cda8e1177..81ba7416a0b6 100644
--- a/.gitignore
+++ b/.gitignore
@@ -48,6 +48,7 @@
 Module.symvers
 modules.builtin
 modules.order
+vmlinux.map
 
 #
 # Top-level generic files
diff --git a/Makefile b/Makefile
index e71979882e4f..d35a59f98e83 100644
--- a/Makefile
+++ b/Makefile
@@ -984,6 +984,10 @@ ifeq ($(CONFIG_RELR),y)
 LDFLAGS_vmlinux	+= --pack-dyn-relocs=relr
 endif
 
+ifeq ($(CONFIG_SAVE_LINK_MAP),y)
+LDFLAGS_vmlinux	+= -Map=vmlinux.map
+endif
+
 # Align the bit size of userspace programs with the kernel
 KBUILD_USERCFLAGS  += $(filter -m32 -m64 --target=%, $(KBUILD_CFLAGS))
 KBUILD_USERLDFLAGS += $(filter -m32 -m64 --target=%, $(KBUILD_CFLAGS))
@@ -1461,7 +1465,7 @@ endif # CONFIG_MODULES
 # make distclean Remove editor backup files, patch leftover files and the like
 
 # Directories & files removed with 'make clean'
-CLEAN_FILES += include/ksym vmlinux.symvers \
+CLEAN_FILES += include/ksym vmlinux.symvers vmlinux.map \
 	       modules.builtin modules.builtin.modinfo modules.nsdeps \
 	       compile_commands.json
 
diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
index d7a7bc3b6098..1ac4234ad879 100644
--- a/lib/Kconfig.debug
+++ b/lib/Kconfig.debug
@@ -363,6 +363,19 @@ config SECTION_MISMATCH_WARN_ONLY
 
 	  If unsure, say Y.
 
+config SAVE_LINK_MAP
+	bool "Save vmlinux link map file(s)"
+	default n
+	help
+	  If you say Y here, vmlinux link map will be saved into
+	  vmlinux.map. The link map is quite useful during making kernel
+	  changes related to how the kernel is composed and linker
+	  scripts debugging.
+
+	  In addition to that architectures supporting compressed kernel
+	  images might also produce arch/*/boot/compressed/vmlinux.map
+	  for the decompressor code as well.
+
 config DEBUG_FORCE_FUNCTION_ALIGN_32B
 	bool "Force all function address 32B aligned" if EXPERT
 	help
-- 
2.25.4

