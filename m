Return-Path: <linux-kbuild+bounces-12389-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ANNuDuzby2lHMAYAu9opvQ
	(envelope-from <linux-kbuild+bounces-12389-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Tue, 31 Mar 2026 16:36:28 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C6F236B0D1
	for <lists+linux-kbuild@lfdr.de>; Tue, 31 Mar 2026 16:36:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 6114430581F9
	for <lists+linux-kbuild@lfdr.de>; Tue, 31 Mar 2026 14:29:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E78873FADE1;
	Tue, 31 Mar 2026 14:29:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GtmjcEh3"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4BF33FA5EF;
	Tue, 31 Mar 2026 14:29:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774967340; cv=none; b=O1Ayd0vegpKoWvN7EQzagDn1Hbpk8vQrdBz0frGNd3T48iicoeu7+TXlLs+xTaBJpQ42LuhAfvufe7mp0hd0d8MUTfLTN471TkZMc03n/mu0OHAQ9pS37Ip/+q2cmTH+rvKv4NxPyx7PGSvtVY7+PNnIsCH1KVEL9jdaagbXVnY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774967340; c=relaxed/simple;
	bh=2yQOb7vXgd3AaOLg1sYumziLqEVfCbZt3yh4VVFSmHI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=ZJ+l5Y/vVl2wXYUhUrlPZWSuCcLwAwygs5kDQVgx4x1wZtoZ+3JobXjgzxiEtQoSxJmH2vzU805N2GMwrMRmA1h5u2z02Wm2ng8Q1RecFst2QFaEnRS7LiD29S8y1UZnmjZkKRK9racYTMFXBVLIdjJwoEifB4NZdUx4VUZy17A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GtmjcEh3; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3605C19424;
	Tue, 31 Mar 2026 14:28:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774967340;
	bh=2yQOb7vXgd3AaOLg1sYumziLqEVfCbZt3yh4VVFSmHI=;
	h=From:To:Cc:Subject:Date:From;
	b=GtmjcEh3ImxrSNW/veNQFQZyunMSJNtwpKa+dp5ZPqZE7/N2ClO+xaj4oj4BPESm8
	 LY5yLnd3JU/oXzXtydrdje5wyiTckw5leOKMt014ojp6og3sBY8y4Za7UxgTtfdq56
	 WJfMlKrJFpKtKw9hDeByoX6G9fivuNsxE4AcrsJSBVzuWVSzUKHOoCNhyhj7DXQDcz
	 i5J54WPpfDZ9MTN3kC6H3yUM9q81oqxCOq++5uDuKfJGdef7Ixz3vSQoaSHKtFGq4J
	 qQ+uzEqe27IF2oZAQAt5kTfrLtm/klpAfTJjcOk2/CDeFRaWSTSluwy/ipYAFDqAwI
	 K44IL9NwRSIQQ==
From: Arnd Bergmann <arnd@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nsc@kernel.org>,
	linux-kbuild@vger.kernel.org,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Kees Cook <kees@kernel.org>,
	Marco Elver <elver@google.com>,
	Petr Mladek <pmladek@suse.com>,
	"Peter Zijlstra (Intel)" <peterz@infradead.org>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH] init.h: discard exitcall symbols early
Date: Tue, 31 Mar 2026 16:28:38 +0200
Message-Id: <20260331142846.3187706-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,vger.kernel.org,linux.intel.com,gmail.com,arndb.de,google.com,suse.com,infradead.org];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[13];
	TAGGED_FROM(0.00)[bounces-12389-lists,linux-kbuild=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[arnd@kernel.org,linux-kbuild@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-0.994];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[arndb.de:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 3C6F236B0D1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Arnd Bergmann <arnd@arndb.de>

Any __exitcall() and built-in module_exit() handler is marked as __used,
which leads to the code being included in the object file and later
discarded at link time.

As far as I can tell, this was originally added at the same time
as initcalls were marked the same way, to prevent them from getting
dropped with gcc-3.4, but it was never actaully necessary to keep exit
functions around.

Mark them as __maybe_unused instead, which lets the compiler treat
the exitcalls as entirely unused, and make better decisions about
dropping specializing static functions called from these.

Link: https://lore.kernel.org/all/acruxMNdnUlyRHiy@google.com/
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 include/linux/init.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/init.h b/include/linux/init.h
index 5db55c660124..ad5c19763034 100644
--- a/include/linux/init.h
+++ b/include/linux/init.h
@@ -47,7 +47,7 @@
 #define __initdata	__section(".init.data")
 #define __initconst	__section(".init.rodata")
 #define __exitdata	__section(".exit.data")
-#define __exit_call	__used __section(".exitcall.exit")
+#define __exit_call	__maybe_unused __section(".exitcall.exit")
 
 /*
  * modpost check for section mismatches during the kernel build.
-- 
2.39.5


