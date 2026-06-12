Return-Path: <linux-kbuild+bounces-13741-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id rtTvMZsLLGoeKQQAu9opvQ
	(envelope-from <linux-kbuild+bounces-13741-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Fri, 12 Jun 2026 15:37:31 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D02C679E48
	for <lists+linux-kbuild@lfdr.de>; Fri, 12 Jun 2026 15:37:31 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.com header.s=google header.b=XenTTzJv;
	spf=pass (mail.lfdr.de: domain of "linux-kbuild+bounces-13741-lists+linux-kbuild=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-kbuild+bounces-13741-lists+linux-kbuild=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=suse.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E21F23025C41
	for <lists+linux-kbuild@lfdr.de>; Fri, 12 Jun 2026 13:31:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 94BDF3EA968;
	Fri, 12 Jun 2026 13:31:50 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 841F7376A1C
	for <linux-kbuild@vger.kernel.org>; Fri, 12 Jun 2026 13:31:47 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781271110; cv=none; b=DJ2Yx67uTFM6frzybLYKiRWb41MumcnHR5iNg29pDp4Rw9qUsz2v5ssLT1Qvzr2pGrSF6ztOSPThUvCdb0HuL91f0j5g9nxmmSSwlnycDZumxt3xU3f+G4gRSjpgK6Pa3njhMiZCoZKZTKAPeBDfjEJjSfHe0uOUP8Q9dq72z/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781271110; c=relaxed/simple;
	bh=85pGD/SUlttaKHV1Ui3Gm8EMYN7jMIzcuxHQpAxTR7E=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ope0IdOHYqSjhmGIHrsBlbhqNHvBnLxwa9Bt1E/rqjCZqYI1mdv53r1g3aaKyFCVdMJ29IVX1hC84ZEjStzUJg4BEvhXtezszmE+ocM2Xislx/Mg2oLZSXdh5G4Sy0YAHdQ9zBB/a7rWWjkcPR64STSe1RI2I8RmcMnJUHo10mY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=XenTTzJv; arc=none smtp.client-ip=209.85.128.41
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-490b9318997so7411405e9.2
        for <linux-kbuild@vger.kernel.org>; Fri, 12 Jun 2026 06:31:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1781271106; x=1781875906; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=iHq2uwDGJgB0qiB9weh1rH/HnAsP1NxbR0PVnQr+Mc8=;
        b=XenTTzJvrbv0A8NSiN3IKlIo0GHEzz2ebH+qcUzljTa9G7MUA2u8/bvhNEQ8E41/Na
         YnDN4XtxKZ445kXED7gveNXF+y66zF3vjKEwYHsX/Chx3chWqwGLgMagD3St4k9KwOpF
         juar1HuXeb4bAI/0vPHxpnsREbkI6hMnAFwYiRoyNJpuGj72e3h8ZRwlaThoMfAg7EPm
         APjDq7zZ3y/UgsG3ZZ05+WO65dIcr6E4xU4hsD2TERtcuUHwAUlyEx4zfq6H8WKaI+J+
         aEWivj6bccDvRyQdxVjuOEKdbQaMna4/PbGO7IiujIdEjL8SIb9GJJN/3+fS5qsonCeB
         094A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781271106; x=1781875906;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iHq2uwDGJgB0qiB9weh1rH/HnAsP1NxbR0PVnQr+Mc8=;
        b=mZjJ4fcWqEXF8FopJyj+BlpGjzrNPj1+mbw9rj5jtYWUI5srf+xJ3sRUKOj/AUUyls
         awjQckLA+0E12LfDM0toU5JMVjkMh3h+v5IFycphRhid0eVrQxAbMRm3husw9uLlxWK2
         Liu0nLDCSRh30WRPOG/Dba2jbi4fXHHW6u/M4FkwUEOqOMU+/FmPhEQyNJIFDoiS/0iT
         0r8JZBUOV7ulgvhRhRtRNpOfyoRaL9Q+P9rbIzJ96KyqXstC8ZWX5sskCuN4bNz2paOV
         CKcNNIxMOumASxNcm2e7q6IOfCY4aVeXDQFBvorhndsvJMwv4dR81cCTZTBWXdbsFo/5
         BbYg==
X-Forwarded-Encrypted: i=1; AFNElJ/A92Ir6/ssKdfRXUKDSARmSzly08ILXt2a7UV3rDC5RPtXKDqY0lN8oEFlrjTcXik7EAAuoUGzrI3vUO8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxJ52TNqTQ/+bFIOhqqsjDb1w+//Gsjrmzva9MYq910lL2uOObd
	yzrMma4jlVgYx3oZxk6ioSTWC+bnkIPVDvMkUoYZOh6ClVfw6ZedFzWwEDcgewpeDqo=
X-Gm-Gg: Acq92OGy/hEN2TMPxHoOMgGTXYSWuoj8wPjxrIuOVZ+dkbcbQPb6cKs5bSc1sPRkqdQ
	EWVXKwExVDcOpYFEyIQTv78ZNyBndq17n5W5XYAh21Z64Pe1Z4WTbwbVYHF2tRmU7pmUvwkOomY
	I1YYxSRjZCZhs+5gIhEJbwqXuiTC4lDqsd8jK3FRYkc7v3ozReyZcz+wIeTf6Z/WGSAzZDg8PX6
	EwjVBB1wEpsnGbhXRDBB8XOVrkDEl1mAAJ+Sn+5v7eMuTAKDBotNOyVpAHBgtlVRdLgYkJYu3vC
	rEeiYpxxBRr0YnmCO1bTYLrpk/TTwvTWwV2iXTA6njnzo0HWTL+rLkuRYwDdKFzWJOkm+t4SlcN
	2OjlTXFMtA5l/RtUbj3SvcrAjIOzIDz5vtSnwYRjrQrADEUubu3W5pFE5QXOoe5uBK/VVmTKiar
	hgsE8KpTdk+z2CrInkHwXZQlidsvxgH439
X-Received: by 2002:a05:600c:c1d7:20b0:490:6237:521d with SMTP id 5b1f17b1804b1-490ec4b186cmr28517655e9.13.1781271105722;
        Fri, 12 Jun 2026 06:31:45 -0700 (PDT)
Received: from zovi (109-81-1-107.rct.o2.cz. [109.81.1.107])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4606f26434dsm6222674f8f.1.2026.06.12.06.31.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 06:31:45 -0700 (PDT)
From: Petr Pavlu <petr.pavlu@suse.com>
To: Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nsc@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Cc: Peter Collingbourne <pcc@google.com>,
	Sami Tolvanen <samitolvanen@google.com>,
	Daniel Gomez <da.gomez@kernel.org>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Petr Pavlu <petr.pavlu@suse.com>,
	Aaron Tomlin <atomlin@atomlin.com>,
	linux-kbuild@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-modules@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] kbuild: Use --force-group-allocation when linking modules
Date: Fri, 12 Jun 2026 15:31:37 +0200
Message-ID: <20260612133139.1919042-1-petr.pavlu@suse.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-13741-lists,linux-kbuild=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_SENDER(0.00)[petr.pavlu@suse.com,linux-kbuild@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:nathan@kernel.org,m:nsc@kernel.org,m:catalin.marinas@arm.com,m:will@kernel.org,m:pcc@google.com,m:samitolvanen@google.com,m:da.gomez@kernel.org,m:mcgrof@kernel.org,m:petr.pavlu@suse.com,m:atomlin@atomlin.com,m:linux-kbuild@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-modules@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[petr.pavlu@suse.com,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[suse.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7D02C679E48

Specific code, such as outlined KASAN checks, may be placed in
COMDAT-deduplicated sections. When linking modules as relocatable files,
the linker by default preserves such groups, potentially leaving multiple
copies in the resulting modules and unnecessary group metadata.

Use --force-group-allocation to have the linker resolve the COMDAT groups
and place their members as regular sections. The option is available from
ld.bfd 2.29 and ld.lld 19.1.0.

Remove the workaround in arch/arm64/include/asm/module.lds.h that was added
for the same problem but limited to CONFIG_KASAN_SW_TAGS and .text.hot.
Note that this code currently has no effect anyway because all .text.hot
sections are placed in the .text output section by scripts/module.lds.S,
since commit 1ba9f8979426 ("vmlinux.lds: Unify TEXT_MAIN, DATA_MAIN, and
related macros").

Signed-off-by: Petr Pavlu <petr.pavlu@suse.com>
---
 Makefile                            |  6 ++++++
 arch/arm64/include/asm/module.lds.h | 13 -------------
 2 files changed, 6 insertions(+), 13 deletions(-)

diff --git a/Makefile b/Makefile
index e156e2696efe..1729af0690b3 100644
--- a/Makefile
+++ b/Makefile
@@ -1189,6 +1189,12 @@ KBUILD_RUSTFLAGS += $(KRUSTFLAGS)
 KBUILD_LDFLAGS_MODULE += --build-id=sha1
 LDFLAGS_vmlinux += --build-id=sha1
 
+# Specific code, such as outlined KASAN checks, may be placed in
+# COMDAT-deduplicated sections. Use --force-group-allocation to resolve these
+# groups when linking modules. The option is available from ld.bfd 2.29 and
+# ld.lld 19.1.0.
+KBUILD_LDFLAGS_MODULE += $(call ld-option,--force-group-allocation)
+
 KBUILD_LDFLAGS	+= -z noexecstack
 ifeq ($(CONFIG_LD_IS_BFD),y)
 KBUILD_LDFLAGS	+= $(call ld-option,--no-warn-rwx-segments)
diff --git a/arch/arm64/include/asm/module.lds.h b/arch/arm64/include/asm/module.lds.h
index fb944b46846d..792a0820757a 100644
--- a/arch/arm64/include/asm/module.lds.h
+++ b/arch/arm64/include/asm/module.lds.h
@@ -4,19 +4,6 @@ SECTIONS {
 	.text.ftrace_trampoline 0 : { BYTE(0) }
 	.init.text.ftrace_trampoline 0 : { BYTE(0) }
 
-#ifdef CONFIG_KASAN_SW_TAGS
-	/*
-	 * Outlined checks go into comdat-deduplicated sections named .text.hot.
-	 * Because they are in comdats they are not combined by the linker and
-	 * we otherwise end up with multiple sections with the same .text.hot
-	 * name in the .ko file. The kernel module loader warns if it sees
-	 * multiple sections with the same name so we use this sections
-	 * directive to force them into a single section and silence the
-	 * warning.
-	 */
-	.text.hot : { *(.text.hot) }
-#endif
-
 #ifdef CONFIG_UNWIND_TABLES
 	/*
 	 * Currently, we only use unwind info at module load time, so we can

base-commit: 4549871118cf616eecdd2d939f78e3b9e1dddc48
-- 
2.54.0


