Return-Path: <linux-kbuild+bounces-3089-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C10F1956FC1
	for <lists+linux-kbuild@lfdr.de>; Mon, 19 Aug 2024 18:07:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 79C49281E47
	for <lists+linux-kbuild@lfdr.de>; Mon, 19 Aug 2024 16:07:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4683F186284;
	Mon, 19 Aug 2024 16:04:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="cB0TTf4S"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DBB5185628;
	Mon, 19 Aug 2024 16:04:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.177.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724083466; cv=none; b=mYdRkJSfGUVE0mlNo7qrAdfP2Gpu/tcSVk1XHQ76fZKFbRohK/2kbnYcezDlVsGm8GRA5iJMl5oXk5+w6MG2rIbS/QfHYyfj9pJKNRDHPT26aqNnVCZlCSc2cH4Z9XnOYSpcH4pGGQSycC/Zudmydr72gQof3/TDESJ7M+VeDGk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724083466; c=relaxed/simple;
	bh=Lgs6ZEvUoE6ahteb1LVQbmKtq1z23xEPHUUsaDynp48=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=JoCpVin5i+xBLKxPn1S99nUfWTgr9JfPoahUwJMQiBvQ2IN1Cr0SnShQ/sQQxwMGUQ35ScwejV1LaPvlgN9Fv35rqF6YfPnUPPgRyz4pVW2kYdLclrVKDYskJhTnFF1lvUD918ie+6lalUSlHuY2aeaup8/5msLkD683+VaJzWQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=cB0TTf4S; arc=none smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47JD6rPg018612;
	Mon, 19 Aug 2024 16:03:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding; s=corp-2023-11-20; bh=0
	M1SFSQi9kM3TTIxkfL6OzR8Sp7hEUnHLCXI92OTYwI=; b=cB0TTf4Sjp6SnWN9S
	///EyU9AJQsel30pBXTUrByhCxWN6NUHop3zKUEc8G1lbl6b5z+uZ61sbOgVIsNX
	GFbAlRPH7Dd/S+2dRJopOXK9lDRJjoaWLlGzRn8/p5RomElMZ0E8TAAthd2Vfw6h
	EYjco90NLhbmNHhKwV+jcIguCNsyr4HGXIvpzxQ50LTVpmzIsoAr4cXylN+TmNPt
	qu6yifia/BAynkRTEP3GVI+RlCLQ20bGNABur16MrKnJ9HoUQQu/FlvGvR5Yty91
	ZlZJQSKpyTrdQPImesC8SeIu4mUm0myTnl6ofPOpGuds99snNSE6VeVtcbi4y1lu
	PwfXg==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 412m3hjxt4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 19 Aug 2024 16:03:57 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 47JEbHZ7007829;
	Mon, 19 Aug 2024 16:03:55 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 413h3pba8q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 19 Aug 2024 16:03:55 +0000
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 47JG3Fef014254;
	Mon, 19 Aug 2024 16:03:55 GMT
Received: from localhost.localdomain (dhcp-10-175-39-147.vpn.oracle.com [10.175.39.147])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTP id 413h3pb9w5-3;
	Mon, 19 Aug 2024 16:03:55 +0000
From: Vegard Nossum <vegard.nossum@oracle.com>
To: Masahiro Yamada <masahiroy@kernel.org>, linux-kbuild@vger.kernel.org
Cc: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Morten Linderud <morten@linderud.pw>,
        Haelwenn Monnier <contact@lanodan.eu>, Jann Horn <jannh@google.com>,
        Kees Cook <kees@kernel.org>,
        James Bottomley <James.Bottomley@HansenPartnership.com>,
        Theodore Ts'o <tytso@mit.edu>, linux-hardening@vger.kernel.org,
        Vegard Nossum <vegard.nossum@oracle.com>
Subject: [RFC PATCH 02/11] kbuild: document some prerequisites
Date: Mon, 19 Aug 2024 18:02:59 +0200
Message-Id: <20240819160309.2218114-3-vegard.nossum@oracle.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240819160309.2218114-1-vegard.nossum@oracle.com>
References: <20240819160309.2218114-1-vegard.nossum@oracle.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-19_13,2024-08-19_03,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 suspectscore=0
 adultscore=0 spamscore=0 mlxscore=0 mlxlogscore=999 malwarescore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2407110000 definitions=main-2408190107
X-Proofpoint-ORIG-GUID: Nmweai6S9-YZQz6e0TxbmoGzR2GXXV_y
X-Proofpoint-GUID: Nmweai6S9-YZQz6e0TxbmoGzR2GXXV_y

When running 'make --dry-run', make will invoke itself recursively for
recipes using $(MAKE), but otherwise not execute the other commands in
a recipe.

However, if a prerequisite is missing and 'make' does not how to create it
(which will be the case when running 'make -n'), it will complain with an
error message like this:

  $ make -n
  ...
  make -f ./scripts/Makefile.modpost
  make[1]: *** No rule to make target 'modules.order', needed by 'modules-only.symvers'.  Stop.
  make: *** [Makefile:1868: modpost] Error 2

In this case, the top-level makefile has reached a recipe that ran 'make'
recursively on scripts/Makefile.modpost, which itself has a rule with
modules.order as a prerequisite. Since the file doesn't exist, and make
doesn't know how to create it, it errors out.

We can document such prerequisites (which are expected to be created by
the parent Makefile) by adding them to the PHONY list of each respective
Makefile.

Signed-off-by: Vegard Nossum <vegard.nossum@oracle.com>
---
 arch/x86/boot/compressed/Makefile | 6 ++++++
 scripts/Makefile.modfinal         | 5 +++++
 scripts/Makefile.modpost          | 4 ++++
 scripts/Makefile.vmlinux          | 7 +++++++
 scripts/Makefile.vmlinux_o        | 3 +++
 5 files changed, 25 insertions(+)

diff --git a/arch/x86/boot/compressed/Makefile b/arch/x86/boot/compressed/Makefile
index f2051644de943..ccef6f0e04bc7 100644
--- a/arch/x86/boot/compressed/Makefile
+++ b/arch/x86/boot/compressed/Makefile
@@ -80,6 +80,9 @@ quiet_cmd_voffset = VOFFSET $@
 
 targets += ../voffset.h
 
+# We don't know how to build this
+PHONY += vmlinux
+
 $(obj)/../voffset.h: vmlinux FORCE
 	$(call if_changed,voffset)
 
@@ -107,6 +110,9 @@ vmlinux-objs-$(CONFIG_EFI) += $(obj)/efi.o
 vmlinux-objs-$(CONFIG_EFI_MIXED) += $(obj)/efi_mixed.o
 vmlinux-libs-$(CONFIG_EFI_STUB) += $(objtree)/drivers/firmware/efi/libstub/lib.a
 
+# We don't know how to build this
+PHONY += $(objtree)/drivers/firmware/efi/libstub/lib.a
+
 $(obj)/vmlinux: $(vmlinux-objs-y) $(vmlinux-libs-y) FORCE
 	$(call if_changed,ld)
 
diff --git a/scripts/Makefile.modfinal b/scripts/Makefile.modfinal
index 1fa98b5e952b4..696888f0a0bde 100644
--- a/scripts/Makefile.modfinal
+++ b/scripts/Makefile.modfinal
@@ -15,6 +15,11 @@ include $(srctree)/scripts/Makefile.lib
 # find all modules listed in modules.order
 modules := $(call read-file, $(MODORDER))
 
+# We don't know how to build these
+PHONY += $(modules)
+PHONY += $(modules:%.o=%.mod.c)
+PHONY += scripts/module.lds
+
 __modfinal: $(modules:%.o=%.ko)
 	@:
 
diff --git a/scripts/Makefile.modpost b/scripts/Makefile.modpost
index 44936ebad161e..65f2bdc702369 100644
--- a/scripts/Makefile.modpost
+++ b/scripts/Makefile.modpost
@@ -140,6 +140,10 @@ quiet_cmd_modpost = MODPOST $@
 		echo >&2 "         if you want to proceed at your own risk.";) \
 	$(MODPOST) $(modpost-args)
 
+# We don't know how to build these
+PHONY += vmlinux.o
+PHONY += $(MODORDER)
+
 targets += $(output-symdump)
 $(output-symdump): $(modpost-deps) FORCE
 	$(call if_changed,modpost)
diff --git a/scripts/Makefile.vmlinux b/scripts/Makefile.vmlinux
index 49946cb968440..10d80e07f945c 100644
--- a/scripts/Makefile.vmlinux
+++ b/scripts/Makefile.vmlinux
@@ -18,6 +18,9 @@ quiet_cmd_cc_o_c = CC      $@
 	$(call if_changed_dep,cc_o_c)
 
 ifdef CONFIG_MODULES
+# We don't know how to build this
+PHONY += .vmlinux.export.c
+
 targets += .vmlinux.export.o
 vmlinux: .vmlinux.export.o
 endif
@@ -29,6 +32,10 @@ cmd_link_vmlinux =							\
 	$< "$(LD)" "$(KBUILD_LDFLAGS)" "$(LDFLAGS_vmlinux)";		\
 	$(if $(ARCH_POSTLINK), $(MAKE) -f $(ARCH_POSTLINK) $@, true)
 
+# We don't know how to build these
+PHONY += vmlinux.o
+PHONY += $(KBUILD_LDS)
+
 targets += vmlinux
 vmlinux: scripts/link-vmlinux.sh vmlinux.o $(KBUILD_LDS) FORCE
 	+$(call if_changed_dep,link_vmlinux)
diff --git a/scripts/Makefile.vmlinux_o b/scripts/Makefile.vmlinux_o
index 6de297916ce68..7af841eb1ce5b 100644
--- a/scripts/Makefile.vmlinux_o
+++ b/scripts/Makefile.vmlinux_o
@@ -58,6 +58,9 @@ define rule_ld_vmlinux.o
 	$(call cmd,gen_objtooldep)
 endef
 
+# We don't know how to build this
+PHONY += vmlinux.a
+
 vmlinux.o: $(initcalls-lds) vmlinux.a $(KBUILD_VMLINUX_LIBS) FORCE
 	$(call if_changed_rule,ld_vmlinux.o)
 
-- 
2.34.1


