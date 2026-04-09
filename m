Return-Path: <linux-kbuild+bounces-12726-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MOIyBrp112nTOAgAu9opvQ
	(envelope-from <linux-kbuild+bounces-12726-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Thu, 09 Apr 2026 11:47:38 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 860D63C8A96
	for <lists+linux-kbuild@lfdr.de>; Thu, 09 Apr 2026 11:47:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id CDD23301C135
	for <lists+linux-kbuild@lfdr.de>; Thu,  9 Apr 2026 09:47:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5570F3B47F5;
	Thu,  9 Apr 2026 09:47:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ORKaloTX"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08D122EA480
	for <linux-kbuild@vger.kernel.org>; Thu,  9 Apr 2026 09:47:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775728051; cv=none; b=MaQXS9MYaxK1yJi71L5pXu4W/imR2aCgqpF+fsCwlP/XRvEjFHJYB8kqY8LUsb8LivloVq7Ci8dB0CmAfTqK5FRifeJjcB/UMftjTSOFSLLDctbyMxJkSY1UkUmdpQ6KFX9aal4DULYVnAuAWKVs92H78e5PxYOwvQ5HrvNG5Lo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775728051; c=relaxed/simple;
	bh=oJxd46hTCY3wy7tQtrZRzoF0xVEC27dg11oIF0dctHc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ng70zKZf8PZfR1ZSN1f0Mpp4xfFPGDUYT6D/5wYZtGAO1KJxuWHC8VOWwKIgYQPWWJ+5/+zKDRp7hXdAXM3RdHnNbNfjrsEYD9//PebJyciCU9ybgnf9vMNvYaZylacQ0NFh/Uq1TUeSt1OZK8ozIuUCz+CawijSbxwmhKR4VCc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ORKaloTX; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1775728049;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Lok/JC2FZxQ1jb3n1L1T2vWxkZ87hSSU2pNmO7jpFM0=;
	b=ORKaloTXCQ4wRiU0w8NNQQ/xXzPCZR4S7Z/XWhNEzrQjIn6JuNDPp+QbQ3WO9WL1ZfodLZ
	zJdDebTwpoUDjv4/GhTxixJAum8Snq96QZzMEHzUb9WZdTzYeETKwu3AXar3gTPxR0hZmc
	3luPNBB2+cnDLTW2lpf3RdX/fc2hWbw=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-15-fv1kh8WZNZ6rhvhzyg_YNw-1; Thu,
 09 Apr 2026 05:47:25 -0400
X-MC-Unique: fv1kh8WZNZ6rhvhzyg_YNw-1
X-Mimecast-MFC-AGG-ID: fv1kh8WZNZ6rhvhzyg_YNw_1775728044
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 48E8418002C0;
	Thu,  9 Apr 2026 09:47:24 +0000 (UTC)
Received: from thuth-p1g4.redhat.com (unknown [10.44.48.155])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 08FCE30001BE;
	Thu,  9 Apr 2026 09:47:20 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: linux-arch@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kbuild@vger.kernel.org,
	Thomas Huth <thuth@redhat.com>,
	Russell King <linux@armlinux.org.uk>
Subject: [PATCH v5 1/8] arm: Replace __ASSEMBLY__ with __ASSEMBLER__ in uapi headers
Date: Thu,  9 Apr 2026 11:47:01 +0200
Message-ID: <20260409094708.1687376-2-thuth@redhat.com>
In-Reply-To: <20260409094708.1687376-1-thuth@redhat.com>
References: <20260409094708.1687376-1-thuth@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[redhat.com,quarantine];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-12726-lists,linux-kbuild=lfdr.de];
	DKIM_TRACE(0.00)[redhat.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[thuth@redhat.com,linux-kbuild@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-kbuild];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_FIVE(0.00)[6];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,armlinux.org.uk:email]
X-Rspamd-Queue-Id: 860D63C8A96
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Thomas Huth <thuth@redhat.com>

__ASSEMBLY__ is only defined by the Makefile of the kernel, so
this is not really useful for uapi headers (unless the userspace
Makefile defines it, too). Let's switch to __ASSEMBLER__ which
gets set automatically by the compiler when compiling assembly
code.

Cc: Russell King <linux@armlinux.org.uk>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 arch/arm/include/uapi/asm/ptrace.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/include/uapi/asm/ptrace.h b/arch/arm/include/uapi/asm/ptrace.h
index 2ef917957005c..15e6bff56b609 100644
--- a/arch/arm/include/uapi/asm/ptrace.h
+++ b/arch/arm/include/uapi/asm/ptrace.h
@@ -110,7 +110,7 @@
 #define PT_DATA_ADDR		0x10004
 #define PT_TEXT_END_ADDR	0x10008
 
-#ifndef __ASSEMBLY__
+#ifndef __ASSEMBLER__
 
 /*
  * This struct defines the way the registers are stored on the
@@ -149,6 +149,6 @@ struct pt_regs {
 #define ARM_VFPREGS_SIZE ( 32 * 8 /*fpregs*/ + 4 /*fpscr*/ )
 
 
-#endif /* __ASSEMBLY__ */
+#endif /* __ASSEMBLER__ */
 
 #endif /* _UAPI__ASM_ARM_PTRACE_H */
-- 
2.53.0


