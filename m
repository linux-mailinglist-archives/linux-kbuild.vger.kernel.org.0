Return-Path: <linux-kbuild+bounces-11087-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GA9XLDmgiWlU/wQAu9opvQ
	(envelope-from <linux-kbuild+bounces-11087-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Mon, 09 Feb 2026 09:52:09 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3639210D390
	for <lists+linux-kbuild@lfdr.de>; Mon, 09 Feb 2026 09:52:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 26B993008789
	for <lists+linux-kbuild@lfdr.de>; Mon,  9 Feb 2026 08:49:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A79962DC77E;
	Mon,  9 Feb 2026 08:49:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="pvpQuTRR"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 608F8242D91;
	Mon,  9 Feb 2026 08:49:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770626977; cv=none; b=WBYtpLJ1afZAXYSlBoJ0w7kMMAkjJTcyYXuslp+yddGFTAHTYoI3x3sDKHNzwUYEb09aiudWBYTJ7ToF95WlSCTVHXP5OK9bNavh1nAfGVEp5u4j6FV2tEkDnkxq5iBHzt7D6a0FFIbKqyL5sQ7jJFP42jsUzgvuIWxrqBlrdZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770626977; c=relaxed/simple;
	bh=Hv5jUJFaXmzYU18r7OqWPPwpKPgM5W+QF3X41Rv2DR4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mdEGor+uTvpS7AaoexLS+4pScn32KSBK6ysB6ZHC/reqg5WURNxuKU1aDdHMz1vUR4yLWyXqeUZs7KBslk9/DmH2PXiln8VNKACnm6MqSiAydf+f8YixXOPbNWAqMcMtgi2euPMZyadCGE0/dccrYOpwvBynOFSbLI7Sd91l4hs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=pvpQuTRR; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 618M1PSE273774;
	Mon, 9 Feb 2026 08:49:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=38Cy3VPgoePz1oJWZ
	c6WvA3VIYIivfKiwwD0CxG02Xk=; b=pvpQuTRRd+LmPPhJPLWnBp6t1UBTnMG+g
	Osay2LNhfPYMfXSwS2aTSR5Ts1EgpnEB1Ee7wTkyHMa0IRDjRADRcqfdrzhs3Fmu
	KB71jch5cWVkktewuwh2QIZshAJdzvD99Zu/0G+jc9djnuJXdLNb7OYvzM35r8+K
	NL8naMwINT/JmbrYNh+ESnSihZdKXsa7qmDk1RV3q7yq/o9Z4KfWDny7fHJZX0dR
	d9PJcfd8X6CO8bkvk5Jh0HbTa59w/ohzTENdX0SDMg52imScHIqk/84h0BFaQh4l
	nL11cA+ZEqkYW2PN0jZEzbYvw50B2w47DYHZLakTW6Rq93pagRMNQ==
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4c696wn11q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 09 Feb 2026 08:49:13 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 6197iBNQ008400;
	Mon, 9 Feb 2026 08:49:13 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4c6g3y4huc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 09 Feb 2026 08:49:12 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 6198n9NO54985006
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 9 Feb 2026 08:49:09 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1F12620040;
	Mon,  9 Feb 2026 08:49:09 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 41CB52004F;
	Mon,  9 Feb 2026 08:49:05 +0000 (GMT)
Received: from li-2fa77bcc-2701-11b2-a85c-cd621c23b6bd.in.ibm.com (unknown [9.79.195.233])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon,  9 Feb 2026 08:49:04 +0000 (GMT)
From: Sathvika Vasireddy <sv@linux.ibm.com>
To: linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org
Cc: nathan@kernel.org, masahiroy@kernel.org, kees@kernel.org,
        naveen@kernel.org, jpoimboe@kernel.org, peterz@infradead.org,
        npiggin@gmail.com, maddy@linux.ibm.com, segher@kernel.crashing.org,
        christophe.leroy@csgroup.eu, mingo@kernel.org, mpe@ellerman.id.au,
        sv@linux.ibm.com, nsc@kernel.org
Subject: [RFC PATCH v3 5/6] kbuild: Add objtool integration for PowerPC feature fixups
Date: Mon,  9 Feb 2026 14:18:19 +0530
Message-ID: <20260209084820.57298-6-sv@linux.ibm.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260209084820.57298-1-sv@linux.ibm.com>
References: <20260209084820.57298-1-sv@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Authority-Analysis: v=2.4 cv=WZYBqkhX c=1 sm=1 tr=0 ts=69899f8a cx=c_pps
 a=5BHTudwdYE3Te8bg5FgnPg==:117 a=5BHTudwdYE3Te8bg5FgnPg==:17
 a=HzLeVaNsDn8A:10 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22
 a=GgsMoib0sEa3-_RKJdDe:22 a=VwQbUJbxAAAA:8 a=VnNF1IyMAAAA:8
 a=k1iL6ZPSiERSBASioQUA:9
X-Proofpoint-GUID: uVcMjmtKjsaSvQs3MGuI7QjMy73l8yht
X-Proofpoint-ORIG-GUID: DEEqSo1YnZxzP6Yi2-XP2hSe4Iz0uifA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA5MDA3MiBTYWx0ZWRfXwmpnDxhhXaBt
 HMyiiVnLS48ueiaU3FJWjNPMZRban1SPWQyY6ozE7mRhpCH/ITbMb/QW6qxDbuJMUqtbKU794OV
 KkA62PuC+/4L6Cvkf0Mtv2Aan1S4rTG1ylr9blDKTSRUHhAocZfkWMZq0s9ByVubj8i6d7tiYXF
 Lb36xyowO8x/xIWLIGNVEIfJ30xc6ujMYxOj52SRTIhz8qeKrGtWkTOqoD/2NSdU9KgLOT5Tosq
 q8jMVPHC7VGIQAopnFzK2/iR/gMLaBapCN6xzihouTmLbSIQUDV4zUhMtlB2o7brfRCJgCUE2Tf
 Nr7ClsN9DLiVR6CUWdwXNpczBaCdjDIgw81zXsbvPUMgi7b/dZz3S/WrJFNy2iwDts/2dpSO45/
 hxiTSWd+VoB8nn7XaTBl6ISP9B3fnMYkaPgjdqF6E13jddxl8F2L+560NLnfBWEblfnevq4q0hz
 icBCyKJ9htDxTyDA3eg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-08_05,2026-02-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 phishscore=0 bulkscore=0 adultscore=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 impostorscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602090072
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[ibm.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[ibm.com:s=pp1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-11087-lists,linux-kbuild=lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,infradead.org,gmail.com,linux.ibm.com,kernel.crashing.org,csgroup.eu,ellerman.id.au];
	DKIM_TRACE(0.00)[ibm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCPT_COUNT_TWELVE(0.00)[17];
	FROM_NEQ_ENVFROM(0.00)[sv@linux.ibm.com,linux-kbuild@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	RCVD_COUNT_SEVEN(0.00)[11]
X-Rspamd-Queue-Id: 3639210D390
X-Rspamd-Action: no action

Add build system support for PowerPC feature fixup processing:

- Add HAVE_OBJTOOL_FTR_FIXUP config option for architectures that support
  build-time feature fixup processing
- Integrate objtool feature fixup processing into vmlinux build

Suggested-by: Masahiro Yamada <masahiroy@kernel.org>
Signed-off-by: Sathvika Vasireddy <sv@linux.ibm.com>
---
 Makefile                 | 7 +++++++
 scripts/Makefile.lib     | 4 ++--
 scripts/Makefile.vmlinux | 3 ++-
 3 files changed, 11 insertions(+), 3 deletions(-)

diff --git a/Makefile b/Makefile
index 665b79aa21b8..383e35b39a15 100644
--- a/Makefile
+++ b/Makefile
@@ -1451,6 +1451,13 @@ ifdef CONFIG_OBJTOOL
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
diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
index 28a1c08e3b22..dc090b11bdf2 100644
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
diff --git a/scripts/Makefile.vmlinux b/scripts/Makefile.vmlinux
index cd788cac9d91..e3dd7fc62f20 100644
--- a/scripts/Makefile.vmlinux
+++ b/scripts/Makefile.vmlinux
@@ -65,7 +65,8 @@ ARCH_POSTLINK := $(wildcard $(srctree)/arch/$(SRCARCH)/Makefile.postlink)
 # Final link of vmlinux with optional arch pass after final link
 cmd_link_vmlinux =							\
 	$< "$(LD)" "$(KBUILD_LDFLAGS)" "$(LDFLAGS_vmlinux)" "$@";	\
-	$(if $(ARCH_POSTLINK), $(MAKE) -f $(ARCH_POSTLINK) $@, true)
+	$(if $(ARCH_POSTLINK), $(MAKE) -f $(ARCH_POSTLINK) $@, true);	\
+	$(if $(CONFIG_HAVE_OBJTOOL_FTR_FIXUP), $(objtool) --ftr-fixup --link $@, true)
 
 targets += vmlinux.unstripped .vmlinux.export.o
 vmlinux.unstripped: scripts/link-vmlinux.sh vmlinux.o .vmlinux.export.o $(KBUILD_LDS) FORCE
-- 
2.43.0


