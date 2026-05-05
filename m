Return-Path: <linux-kbuild+bounces-13004-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mLMQNZSv+Wk+/AIAu9opvQ
	(envelope-from <linux-kbuild+bounces-13004-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Tue, 05 May 2026 10:51:32 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 37CB94C8EAC
	for <lists+linux-kbuild@lfdr.de>; Tue, 05 May 2026 10:51:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A4765308E6C9
	for <lists+linux-kbuild@lfdr.de>; Tue,  5 May 2026 08:47:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D35D37700B;
	Tue,  5 May 2026 08:47:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="K7LpyZe2"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C98E8362120;
	Tue,  5 May 2026 08:47:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777970873; cv=none; b=taaCaOgYA1fHPP1NZJaG3VdRl8P0YMmDfbPdNi+uEI5p8m+H14obebaeL36kJk2jieSjKnZOxNVCqJiMqX2FSTs9mHRDORgKfJTQulIhxfbYT+mNCraCh7bOAturricRUcmP9ujAuSbGSoA/KavJI4nHbNqy4fx6q5Mk9Wt+jc4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777970873; c=relaxed/simple;
	bh=AdvkRDt5s54uVgAjz87SQAq4sT62kN7HUSUQtCj9CqM=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FvG3kIuMqDmU6/5Ue0J025DrMzWWCi0AsusSFrkA8jMBXTWs3tzapdBjlgTWQQMdgZjpQuFMWsQ+A8knrFWe24NKZtcA1Yx9BAbXYCRDv/g3ZpufvfVBFtvh4g7iZLQo7vi1MhITtYeu+VyYLRhXzQxZyRl5Je+lbNJc8JQYaEU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=K7LpyZe2; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 644NDIGT2080466;
	Tue, 5 May 2026 08:47:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=
	content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=4spkt1jg5/bU5I7bc
	LaEF/hABIhrs79MmG3fYK+3pnw=; b=K7LpyZe2BgmZvtXdFXxjGw/stPzla9VpF
	veuq7mOe8lV1rN3BS5KzEFg+5U3XHZCQef6vmeyu0AqVb2ZkZkCn9k6HekdhJMTQ
	bSCtR0mCfgd3QLIBspYwVT0vhwiwl6wWIGGBisbzJmRE1YPUq9equ1UqtXQisEX8
	QLWKOzXne5Ir0XAseCm89V1eV4b2qg39d/kgq+e8Rqv3aOo8XCgJIelC9SQhYyTL
	l7E2YPMky1InH0TOb+kEo+FSuCFf33+438uZzSmUSCwMRl0s7FLkQt6kZuNuNbeF
	o+KFpmAAhzCJf9Cds3j5RDkSluJzRzTYwHnqBpG18YuEj+NXfD4ZQ==
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4dw9xxjdg1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 05 May 2026 08:47:19 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.7/8.18.1.7) with ESMTP id 6458dPUV030500;
	Tue, 5 May 2026 08:47:18 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4dwuyw0vye-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 05 May 2026 08:47:18 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 6458lEF342533334
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 5 May 2026 08:47:14 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 39F8C2004F;
	Tue,  5 May 2026 08:47:14 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 615ED2004B;
	Tue,  5 May 2026 08:47:08 +0000 (GMT)
Received: from li-2fa77bcc-2701-11b2-a85c-cd621c23b6bd.bl1-in.ibm.com (unknown [9.123.13.4])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Tue,  5 May 2026 08:47:08 +0000 (GMT)
From: Sathvika Vasireddy <sv@linux.ibm.com>
To: nathan@kernel.org, nsc@kernel.org, maddy@linux.ibm.com, mpe@ellerman.id.au,
        npiggin@gmail.com, chleroy@kernel.org, jpoimboe@kernel.org,
        peterz@infradead.org, ojeda@kernel.org, masahiroy@kernel.org,
        lossin@kernel.org, tamird@kernel.org, thomas.weissschuh@linutronix.de,
        rostedt@goodmis.org, ihor.solodrai@linux.dev, thuth@redhat.com,
        pmladek@suse.com, aliceryhl@google.com, elver@google.com,
        kees@kernel.org, legion@kernel.org, ardb@kernel.org,
        yuxuan.zuo@outlook.com, alexghiti@rivosinc.com,
        alexandre.chartre@oracle.com, bp@alien8.de,
        linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, sv@linux.ibm.com
Subject: [PATCH v1 5/6] kbuild: Add objtool integration for PowerPC feature fixups
Date: Tue,  5 May 2026 14:16:27 +0530
Message-ID: <20260505084628.17940-6-sv@linux.ibm.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260505084628.17940-1-sv@linux.ibm.com>
References: <20260505084628.17940-1-sv@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA1MDA3OSBTYWx0ZWRfXw4clIekf2zU5
 tl2yuTx8xdFPTcA2m968eoLvCFIDNZn/yAG1ldEB79sTgJfrNCr0rOGM0cjTTQa6Os4vf1Qgx+j
 VjnaRpmCtszxqitq4HV51hPV9ejZpxJagDtaLzOSwczH8RYSNyuZ44uoO+oIJXmumJPLH6T86e2
 RZ9m8hdyZ6BmJmMd6UCtWQqSzecYQoaNZkVSYjwSyOOIxdROihI5yyyhDg+KMNXcJlZ1RkfnE5Q
 x1vetrp8BacC5REkP3HEl+Bsy34FBmkovWm7YvL68INZC+ifkK4wk1QNr4ViyBxm+uPcnVwJS5z
 aQ/pahTFkkX7JZoddAkHZ71qA9eHzfJRTQwErWajDyvQzCX3GgCcmVfl0BScMd9RITPIfYc0yij
 Jgm22zXOcobCGfINGKKxW/1GCYnN9JEfNKfdXNzEArr5zQS+v4ZUA5cHfKuG7Anyv9zmDinJv/U
 r3tGYgICEP/gpvRwM8g==
X-Proofpoint-ORIG-GUID: Z7cqhmyMOoiJMxjm3OfMv1vC4h2CzN55
X-Proofpoint-GUID: 3t84d6iLD2PUGGdH1yCve10RJv9vnqYC
X-Authority-Analysis: v=2.4 cv=ctWrVV4i c=1 sm=1 tr=0 ts=69f9ae97 cx=c_pps
 a=5BHTudwdYE3Te8bg5FgnPg==:117 a=5BHTudwdYE3Te8bg5FgnPg==:17
 a=NGcC8JguVDcA:10 a=VkNPw1HP01LnGYTKEx00:22 a=RnoormkPH1_aCDwRdu11:22
 a=V8glGbnc2Ofi9Qvn3v5h:22 a=VwQbUJbxAAAA:8 a=VnNF1IyMAAAA:8
 a=k1iL6ZPSiERSBASioQUA:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-05_02,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 clxscore=1015
 suspectscore=0 impostorscore=0 spamscore=0 malwarescore=0 phishscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2605050079
X-Rspamd-Queue-Id: 37CB94C8EAC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[ibm.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[ibm.com:s=pp1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-13004-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_NONE(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,linux.ibm.com,ellerman.id.au,gmail.com,infradead.org,linutronix.de,goodmis.org,linux.dev,redhat.com,suse.com,google.com,outlook.com,rivosinc.com,oracle.com,alien8.de,vger.kernel.org,lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_NEQ_ENVFROM(0.00)[sv@linux.ibm.com,linux-kbuild@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linux.ibm.com:mid];
	DKIM_TRACE(0.00)[ibm.com:+];
	TAGGED_RCPT(0.00)[linux-kbuild];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCPT_COUNT_TWELVE(0.00)[30];
	RCVD_COUNT_SEVEN(0.00)[11]

Add build system support for PowerPC feature fixup processing:

- Add HAVE_OBJTOOL_FTR_FIXUP config option for architectures that support
  build-time feature fixup processing
- Integrate objtool feature fixup processing into vmlinux build

Suggested-by: Masahiro Yamada <masahiroy@kernel.org>
Signed-off-by: Sathvika Vasireddy <sv@linux.ibm.com>
Acked-by: Nicolas Schier <nsc@kernel.org>  # kbuild
---
 Makefile                 | 7 +++++++
 scripts/Makefile.lib     | 4 ++--
 scripts/Makefile.vmlinux | 3 ++-
 3 files changed, 11 insertions(+), 3 deletions(-)

diff --git a/Makefile b/Makefile
index 6b1d9fb1a6b4..f9a990036f3f 100644
--- a/Makefile
+++ b/Makefile
@@ -1478,6 +1478,13 @@ ifdef CONFIG_OBJTOOL
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
index 0718e39cedda..fa72619e5bb0 100644
--- a/scripts/Makefile.lib
+++ b/scripts/Makefile.lib
@@ -179,10 +179,10 @@ cpp_flags      = -Wp,-MMD,$(depfile) $(NOSTDINC_FLAGS) $(LINUXINCLUDE)     \
 
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
index fcae1e432d9a..a1bef0638ecb 100644
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


