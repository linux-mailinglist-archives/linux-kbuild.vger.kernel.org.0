Return-Path: <linux-kbuild+bounces-11462-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IFs2CKm6oGnClwQAu9opvQ
	(envelope-from <linux-kbuild+bounces-11462-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Thu, 26 Feb 2026 22:27:05 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B54881AFC2B
	for <lists+linux-kbuild@lfdr.de>; Thu, 26 Feb 2026 22:27:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B341230E82F4
	for <lists+linux-kbuild@lfdr.de>; Thu, 26 Feb 2026 21:24:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D1FF244B674;
	Thu, 26 Feb 2026 21:24:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="SQkf26NJ"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 157AA3290A1;
	Thu, 26 Feb 2026 21:24:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772141044; cv=none; b=YveBi8C3+UdmJpKvYB4IjaQTPIGfpNK7Ef9oyNI9vuLFIy0+V4SnQqqI2/Whw53V4mL4xtK+m9EabOu4pQ8nB52oYpyDpjgKoXYIOwxmSx0yTgu5YDsYAR3R4Uos5vHT7vTN6Yt6k7TaetTquXpuqGFSYkX/U0tEPOCATJuprP4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772141044; c=relaxed/simple;
	bh=vXRWyMjfvuCBEmCRCnhDQR2KjBREKZYWfj9LtgzccSw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=X4t+2uadujyiuXnsaVMCY+Rvks2Rv41gYYWtk7G7wxgdbUdqpcn7O8NJMdWlsuJOjK1mKRtnRRALrrr8XoTUCR2Hu86a4DMy+4/9lHUs5hkV0Llv/A3zecUmLTNzLAvWq6m6CyldftQtFkqv79xgX+jqPTyZfCrF6Z4gFo1CCRs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=SQkf26NJ; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1772141040;
	bh=vXRWyMjfvuCBEmCRCnhDQR2KjBREKZYWfj9LtgzccSw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=SQkf26NJ+ci5tIsvsj9LPeQSuYevPXTFJmpB6DYHEbvD06wKg7+d5HQctzvV8hNt/
	 33OJkbhSj3LdMYxXzWZXJpSdSjlIWuUgH7rNVt1bX4DrD45nJibIPoK1WULxpz+1ql
	 USCVdnu1t2agjZcXbKC3zf3BBGIcmHE5Rati5Nzc=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Thu, 26 Feb 2026 22:23:58 +0100
Subject: [PATCH 2/2] tools/build: Reject unexpected values for LLVM=
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260226-kbuild-llvm-followup-v1-2-201cc2a492d9@weissschuh.net>
References: <20260226-kbuild-llvm-followup-v1-0-201cc2a492d9@weissschuh.net>
In-Reply-To: <20260226-kbuild-llvm-followup-v1-0-201cc2a492d9@weissschuh.net>
To: Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 Nicolas Schier <nsc@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>
Cc: llvm@lists.linux.dev, linux-kbuild@vger.kernel.org, 
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772141039; l=961;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=vXRWyMjfvuCBEmCRCnhDQR2KjBREKZYWfj9LtgzccSw=;
 b=vzsG5xq8NjKAAg6geMrfKqn6oY9fqGdmAbKP/BKcdE04gtR/A3Tg6WvAVwRxV/9Nb9pPi09xI
 n6oBTyXzW/yAF4xNZSuapTZ3MNX8CvRGOB6E+M3pTIFVKhvDObyNYX1
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[weissschuh.net,quarantine];
	R_DKIM_ALLOW(-0.20)[weissschuh.net:s=mail];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-11462-lists,linux-kbuild=lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,google.com,lwn.net,linuxfoundation.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux@weissschuh.net,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[weissschuh.net:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-kbuild,lkml];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: B54881AFC2B
X-Rspamd-Action: no action

Since commit 502678b88cb3 ("kbuild: Reject unexpected values for LLVM=")
the regular kbuild rejects unexpected values of LLVM=1 instead of
silently treating them as LLVM=1.

Align the tools build to kbuild.

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>

---
There is no formal maintainer for this file.
IMO this change should go through kbuild.
---
 tools/scripts/Makefile.include | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tools/scripts/Makefile.include b/tools/scripts/Makefile.include
index b5ecf137febc..41971a68972d 100644
--- a/tools/scripts/Makefile.include
+++ b/tools/scripts/Makefile.include
@@ -56,6 +56,8 @@ ifneq ($(filter %/,$(LLVM)),)
 LLVM_PREFIX := $(LLVM)
 else ifneq ($(filter -%,$(LLVM)),)
 LLVM_SUFFIX := $(LLVM)
+else ifneq ($(LLVM),1)
+$(error Invalid value for LLVM, see Documentation/kbuild/llvm.rst)
 endif
 
 $(call allow-override,CC,$(LLVM_PREFIX)clang$(LLVM_SUFFIX))

-- 
2.53.0


