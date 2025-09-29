Return-Path: <linux-kbuild+bounces-8976-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B528BA859B
	for <lists+linux-kbuild@lfdr.de>; Mon, 29 Sep 2025 10:05:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1088E3A9C1F
	for <lists+linux-kbuild@lfdr.de>; Mon, 29 Sep 2025 08:05:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 78FC9272E54;
	Mon, 29 Sep 2025 08:05:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="N0kUvNQV"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4ADB272813
	for <linux-kbuild@vger.kernel.org>; Mon, 29 Sep 2025 08:05:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759133142; cv=none; b=Rl8I7QFziDuIgHyv2YjdkLYQW2t/X6BbjyRqWPa9QPgJCOKJOwVLIpIxA9O5wdYlcHimCwBixH8jtUrvzpkPp5XkLmoYKEE7Xzzqgf8JUVA9l1GJx4Wrc2kPVrla6McQIg6u789hzUi6fcIDfF0CnFQEjFGliUT9miYqGuC/eLg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759133142; c=relaxed/simple;
	bh=lvKboaLmMokK5ptjurh8art44mvrr41yykWLUipWGSI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WGYDUuYibb79d1xvlMXxYdT+UFlofc0Fub/3mcu2xm/N+6t/XGYUhUsCcl4u3+CqquPjpSJRQnnGJ8hVwU/bXJA/sGiH6wYIoc4dtytLv5eiBfRu44ArTxYeFr1Ay2YS7kHCgVTmyogRRgG0ULZ41sty67iDYXEAhswJyYEgnwA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=N0kUvNQV; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58SM0GLk007681;
	Mon, 29 Sep 2025 08:05:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=ytsKgcW8gTNTXaUD8
	dpE0QuHJC4DrUIyWI8qAHMMy6w=; b=N0kUvNQVE6pmJPrcbs3O+/iPKmSyd73tq
	1rYpsGmWrMMPe08y09TgyuuOrzsS/HhBw4DlHE3rtGWTOhpi4Km/Jd/X3uYIrgau
	8oQ5cEkRhaH2yezj5bQNJi6keGq9MDzSDpnR+9PMOZmXijuEaOf6Hn4SGS5lmrgd
	or3elMnZBCaryKc75RrEJOlQ3Hpc0o6bsPwa3KhbD0ZAYWNvvDJyiOsrdEJI3t+L
	qNCkJwMc7RaXITCekNVndrl3bFtlTyzBDB19i6sV6ouP8QLSn4ggPehRma8kObVj
	UBmYyCcJtQkApieKct4iPBBMswZaV6EAL+6XbHzOEjEmnAOnLOOnw==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 49e5bqh5rt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 29 Sep 2025 08:05:18 +0000 (GMT)
Received: from m0356516.ppops.net (m0356516.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 58T7nVlg008830;
	Mon, 29 Sep 2025 08:05:18 GMT
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 49e5bqh5rp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 29 Sep 2025 08:05:17 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 58T4Z2gd026818;
	Mon, 29 Sep 2025 08:05:17 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 49eu8mn2qp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 29 Sep 2025 08:05:17 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 58T85DOl46858660
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 29 Sep 2025 08:05:13 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2731B20043;
	Mon, 29 Sep 2025 08:05:13 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A3D0720040;
	Mon, 29 Sep 2025 08:05:09 +0000 (GMT)
Received: from li-2fa77bcc-2701-11b2-a85c-cd621c23b6bd.ibm.com (unknown [9.39.16.189])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 29 Sep 2025 08:05:09 +0000 (GMT)
From: Sathvika Vasireddy <sv@linux.ibm.com>
To: linux-kbuild@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Cc: nathan@kernel.org, masahiroy@kernel.org, kees@kernel.org,
        naveen@kernel.org, jpoimboe@kernel.org, peterz@infradead.org,
        npiggin@gmail.com, maddy@linux.ibm.com, segher@kernel.crashing.org,
        christophe.leroy@csgroup.eu, mingo@kernel.org, mpe@ellerman.id.au,
        mahesh@linux.ibm.com, sv@linux.ibm.com
Subject: [RFC PATCH v2 2/3] kbuild: Add objtool integration for PowerPC feature fixups
Date: Mon, 29 Sep 2025 13:34:55 +0530
Message-ID: <20250929080456.26538-3-sv@linux.ibm.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250929080456.26538-1-sv@linux.ibm.com>
References: <20250929080456.26538-1-sv@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI2MDIxNCBTYWx0ZWRfX6Uw9Gft2/wUT
 Ksr41fQkA3uugUvXDJ11YW2ZCDWXMyxH6OdNBp2f42SP6O1gIbkXsmHBN5SpN5ETaWe5vb0Ph9p
 fIyLcWAWzvWCHWThL0KhOwmSJK7Mit6/4XbFoXOjJkbTUJm/fYebjlJPgpn6jBI/HLkxZxTNahR
 gf3b8mlgXF9n91yokCiNrtDk7FRJ1uuGp7F5FNMDTrXhW7pRyaXt3thcMQKIp9zWy0ZRKvbxzVU
 Zyy9Pfh+rcguV2CHjnQEUnDrBcwaT1k7BRdMM2uM6tf+049JkTifsLG8kh6GPbmM8/nkOwACmZp
 rrDWVTw4uaSTEzD+w5Imd3CIqU7Qi2nCsK1iZ2JoMX6yvcSJgAALf05b/gCM0Cmtnqemr3SnpKX
 GhjxiKT/dzRRry+eNf3JD0rLLG5gCA==
X-Proofpoint-GUID: Ev0GsGg3pbIFm2ijQuMuK9t3dlcrawso
X-Authority-Analysis: v=2.4 cv=LLZrgZW9 c=1 sm=1 tr=0 ts=68da3dbe cx=c_pps
 a=GFwsV6G8L6GxiO2Y/PsHdQ==:117 a=GFwsV6G8L6GxiO2Y/PsHdQ==:17
 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=VnNF1IyMAAAA:8 a=ewgAeosCCCqOxuRBruQA:9
 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-ORIG-GUID: AwAGQB5NcfUqOd2tCk0C1GOiQY3eBT8f
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-29_02,2025-09-29_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 bulkscore=0 malwarescore=0 suspectscore=0
 clxscore=1011 priorityscore=1501 phishscore=0 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509260214

Add build system support for PowerPC feature fixup processing:

- Add HAVE_OBJTOOL_FTR_FIXUP config option for architectures that support
  build-time feature fixup processing
- Integrate objtool feature fixup processing into vmlinux build

Suggested-by: Masahiro Yamada <masahiroy@kernel.org>
Signed-off-by: Sathvika Vasireddy <sv@linux.ibm.com>
---
 Makefile                 |  7 +++++++
 arch/Kconfig             |  3 +++
 scripts/Makefile.lib     |  5 +++--
 scripts/Makefile.vmlinux | 13 ++++++++++++-
 4 files changed, 25 insertions(+), 3 deletions(-)

diff --git a/Makefile b/Makefile
index cf37b9407821..aa54e4348c8c 100644
--- a/Makefile
+++ b/Makefile
@@ -1419,6 +1419,13 @@ ifdef CONFIG_OBJTOOL
 prepare: tools/objtool
 endif
 
+# CONFIG_OBJTOOL and CONFIG_HAVE_OBJTOOL_FTR_FIXUP are unrelated, separate
+# options. It was integrated in objtool in order to borrow the elf parser,
+# but this is different from how the other objtool commands are used.
+ifdef CONFIG_HAVE_OBJTOOL_FTR_FIXUP
+prepare: tools/objtool
+endif
+
 ifdef CONFIG_BPF
 ifdef CONFIG_DEBUG_INFO_BTF
 prepare: tools/bpf/resolve_btfids
diff --git a/arch/Kconfig b/arch/Kconfig
index d1b4ffd6e085..d870aab17cba 100644
--- a/arch/Kconfig
+++ b/arch/Kconfig
@@ -1334,6 +1334,9 @@ config HAVE_UACCESS_VALIDATION
 	bool
 	select OBJTOOL
 
+config HAVE_OBJTOOL_FTR_FIXUP
+	bool
+
 config HAVE_STACK_VALIDATION
 	bool
 	help
diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
index 1d581ba5df66..c77d4ceff2cc 100644
--- a/scripts/Makefile.lib
+++ b/scripts/Makefile.lib
@@ -169,10 +169,10 @@ cpp_flags      = -Wp,-MMD,$(depfile) $(NOSTDINC_FLAGS) $(LINUXINCLUDE)     \
 
 ld_flags       = $(KBUILD_LDFLAGS) $(ldflags-y) $(LDFLAGS_$(@F))
 
-ifdef CONFIG_OBJTOOL
-
 objtool := $(objtree)/tools/objtool/objtool
 
+ifdef CONFIG_OBJTOOL
+
 objtool-args-$(CONFIG_HAVE_JUMP_LABEL_HACK)		+= --hacks=jump_label
 objtool-args-$(CONFIG_HAVE_NOINSTR_HACK)		+= --hacks=noinstr
 objtool-args-$(CONFIG_MITIGATION_CALL_DEPTH_TRACKING)	+= --hacks=skylake
@@ -200,6 +200,7 @@ objtool-args = $(objtool-args-y)					\
 delay-objtool := $(or $(CONFIG_LTO_CLANG),$(CONFIG_X86_KERNEL_IBT))
 
 cmd_objtool = $(if $(objtool-enabled), ; $(objtool) $(objtool-args) $@)
+
 cmd_gen_objtooldep = $(if $(objtool-enabled), { echo ; echo '$@: $$(wildcard $(objtool))' ; } >> $(dot-target).cmd)
 
 objtool-enabled := y
diff --git a/scripts/Makefile.vmlinux b/scripts/Makefile.vmlinux
index b64862dc6f08..94cc2bba929a 100644
--- a/scripts/Makefile.vmlinux
+++ b/scripts/Makefile.vmlinux
@@ -84,7 +84,8 @@ ARCH_POSTLINK := $(wildcard $(srctree)/arch/$(SRCARCH)/Makefile.postlink)
 # Final link of vmlinux with optional arch pass after final link
 cmd_link_vmlinux =							\
 	$< "$(LD)" "$(KBUILD_LDFLAGS)" "$(LDFLAGS_vmlinux)" "$@";	\
-	$(if $(ARCH_POSTLINK), $(MAKE) -f $(ARCH_POSTLINK) $@, true)
+	$(if $(ARCH_POSTLINK), $(MAKE) -f $(ARCH_POSTLINK) $@, true)	\
+	$(cmd_objtool_vmlinux)
 
 targets += $(vmlinux-final)
 $(vmlinux-final): scripts/link-vmlinux.sh vmlinux.o $(KBUILD_LDS) FORCE
@@ -131,3 +132,13 @@ existing-targets := $(wildcard $(sort $(targets)))
 -include $(foreach f,$(existing-targets),$(dir $(f)).$(notdir $(f)).cmd)
 
 .PHONY: $(PHONY)
+
+# objtool for vmlinux
+# ----------------------------------
+#
+#  For feature fixup, objtool does not run on individual
+#  translation units. Run this on vmlinux instead.
+
+ifdef CONFIG_HAVE_OBJTOOL_FTR_FIXUP
+cmd_objtool_vmlinux = ; $(objtool) --ftr-fixup --link $@
+endif
-- 
2.43.0


