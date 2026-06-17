Return-Path: <linux-kbuild+bounces-13810-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 6gZKJ8gjM2qP9wUAu9opvQ
	(envelope-from <linux-kbuild+bounces-13810-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Thu, 18 Jun 2026 00:46:32 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E0D069CB76
	for <lists+linux-kbuild@lfdr.de>; Thu, 18 Jun 2026 00:46:32 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=google.com header.s=20251104 header.b=Py6dgNMe;
	spf=pass (mail.lfdr.de: domain of "linux-kbuild+bounces-13810-lists+linux-kbuild=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-kbuild+bounces-13810-lists+linux-kbuild=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=google.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E931930A9FE3
	for <lists+linux-kbuild@lfdr.de>; Wed, 17 Jun 2026 22:46:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 255813128D4;
	Wed, 17 Jun 2026 22:46:29 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-dl1-f73.google.com (mail-dl1-f73.google.com [74.125.82.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A98C3AFAE0
	for <linux-kbuild@vger.kernel.org>; Wed, 17 Jun 2026 22:46:26 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781736389; cv=none; b=Gay9wQ9Wb/v9nHnYHef+cOkgOwDEAPmFgVmHfT5VOIYgt/PJDHM/um3S+sTJ78r3Y8X07r+SNesMfrKKdrZXSbdNp46xPYTw8u3OCMnXmRE0N9qJlXPcpNtky1rKdXQCuUqk3R5TAJJpcNhClWYVBp6vKeLr2OgLO6YEP9DEfpA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781736389; c=relaxed/simple;
	bh=+/QKlOIR/Jr67gkgPxhq8MLLwh/htDAN7XbEy7/DgTo=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=QQT9zTKI0bx4lNi4NpS+PJBX6oVkMpjxOo90YsaeEsJBYuMiAzRRY5onCM8O4/tYCQXH8tqrrjV/XweebtlKcQyffQPjdDRzXscpaqXUyPb+juyUmepHXJKym0lT8TImUHGEFK9iAd/kyi9armCaXLoGTc24Eq64Q7Td6VWTpw4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--xur.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Py6dgNMe; arc=none smtp.client-ip=74.125.82.73
Received: by mail-dl1-f73.google.com with SMTP id a92af1059eb24-137fe4a3640so764872c88.0
        for <linux-kbuild@vger.kernel.org>; Wed, 17 Jun 2026 15:46:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781736386; x=1782341186; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=2vpC34LH3O3p+3l3izwB2YQX2KfU7uT2tc5IZugSQEI=;
        b=Py6dgNMe8SDUf2JVi4OSkexWg9bD+K71mYO968HYHM7Z2BxTazfbbIz4xZY+r7wdaq
         52zr1vJHo0trsPSRD0Nd5fQAOwn1m6rn4ZxfDslfrjNePYSDmq/opilFzAK3DWBh4jb/
         QL1MzljFNHBqHyh71eFFJkuakAOHc3U5gM3Ou7ZdricdUBRSGedCq6y95utEWkQ9ImV/
         oy8SgLkZjNoOwZNvKYCPu3IiZ/PlmK81sTyHG26az4dsbH+peIMf4WH7HwrClzVYDR7i
         PmT1yim2NUoM/iYSp/FYlMJJ9bHWxHocIBOgYvfnJ1ptJCOwCOw64+S6C6Y0qHmFTSpi
         Jg+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781736386; x=1782341186;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2vpC34LH3O3p+3l3izwB2YQX2KfU7uT2tc5IZugSQEI=;
        b=WfwN2A0o2DOJFnMkAXnJChIzLq0j25CFEyGJwGTc4QJFccpJKZ6Wti2bNJyrLHjGEJ
         bbuxIuMw6x/6RsfNKrW+2Q4KjHP+Xc+Xm5D6W22duFQ6kX2/k1bkESzHPLvy9/+3kHHg
         OUi+H6U5JoTFeviMI/x/NIqchXMnt5wSw4u13iYrqsBPMqpzZZDm6Up+vG7BU6SIDP7s
         MwQabAz2wx42p2tgy/r2qwpH+uPE83eS3izMjqM+8eMv3CSyugtZ2wFQizYQiX90l1sT
         HciljvI7t04rkJGUpfVwhErSZ1OlxPutDHR8NjXPdZ1GHarTl3c5ZcUodvgmb+cjthxX
         Ga2g==
X-Forwarded-Encrypted: i=1; AFNElJ8Jv4DkasINPbYd8f15fFIWYvSAnuPHWc0afsGY5LG6v6TZ3/HVbAeSDgcFXEJeusoiywp60n6rCfNjlug=@vger.kernel.org
X-Gm-Message-State: AOJu0YwDOGeDOO9dfHDVz3o73vBMDh++/wwDqmGu5/6+9TW8KUTdsdri
	r/nxLVmPhnWbp/fRItw0TR6GvCTJaA9WeO1jJo7dW2THFLfB69MJl2XEMQWuViGwM6eQ1g==
X-Received: from dldyr3-n1.prod.google.com ([2002:a05:701b:4503:10b0:138:18c:c8d1])
 (user=xur job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7022:1b18:b0:136:ff02:d00b
 with SMTP id a92af1059eb24-1398f6de2c7mr2355256c88.25.1781736385698; Wed, 17
 Jun 2026 15:46:25 -0700 (PDT)
Date: Wed, 17 Jun 2026 15:46:23 -0700
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.55.0.rc0.738.g0c8ab3ebcc-goog
Message-ID: <20260617224623.1346309-1-xur@google.com>
Subject: [PATCH v2] modpost: Ignore Clang LTO suffixes in symbol matching
From: xur@google.com
To: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Sami Tolvanen <samitolvanen@google.com>, 
	Siddharth Nayyar <sidnayyar@google.com>, Petr Pavlu <petr.pavlu@suse.com>, 
	Josh Poimboeuf <jpoimboe@kernel.org>, Rong Xu <xur@google.com>, Eric Dumazet <edumazet@google.com>, 
	"=?UTF-8?q?Ren=C3=A9=20Rebe?=" <rene@exactco.de>, Alexey Gladkov <legion@kernel.org>, Johan Hovold <johan@kernel.org>, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev
Cc: kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MV_CASE(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	R_DKIM_ALLOW(-0.20)[google.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_NEQ_ENVFROM(0.00)[xur@google.com,linux-kbuild@vger.kernel.org];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:nathan@kernel.org,m:nsc@kernel.org,m:nick.desaulniers+lkml@gmail.com,m:morbo@google.com,m:justinstitt@google.com,m:samitolvanen@google.com,m:sidnayyar@google.com,m:petr.pavlu@suse.com,m:jpoimboe@kernel.org,m:xur@google.com,m:edumazet@google.com,m:rene@exactco.de,m:legion@kernel.org,m:johan@kernel.org,m:linux-kbuild@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:llvm@lists.linux.dev,m:lkp@intel.com,m:nickdesaulniers@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[xur@google.com,linux-kbuild@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,google.com,suse.com,exactco.de,vger.kernel.org,lists.linux.dev];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[google.com:+];
	TO_DN_SOME(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_FROM(0.00)[bounces-13810-lists,linux-kbuild=lfdr.de];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-kbuild,lkml];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NO_DN(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0E0D069CB76

From: Rong Xu <xur@google.com>

When building the kernel with Clang ThinLTO enabled, the compiler
can mangle static variable names by appending suffixes such as
".llvm.<hash>" to prevent naming collisions across translation units.

This name mangling breaks the section mismatch whitelisting in modpost.
modpost relies on glob patterns (e.g., "*_ops" or "*_probe") to identify
safe references between permanent data and initialization code. Because
the LTO suffix modifies the end of the symbol name, legitimately
whitelisted structures fail the match, resulting in false positive
warnings.

For example, a static pernet_operations struct triggers the following:

  WARNING: modpost: vmlinux: section mismatch in reference: \
  ping_v4_net_ops.llvm.5641696707737373282 (section: .data) -> \
  ping_v4_proc_init_net (section: .init.text)

Fix this by ignoring "*_ops.llvm.*" in "from" symbol names (the same
as "*_ops").

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202606111233.kM8oo8Df-lkp@intel.com/
Signed-off-by: Rong Xu <xur@google.com>
---
 scripts/mod/modpost.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
index d592548cbd60..a7b72a81d248 100644
--- a/scripts/mod/modpost.c
+++ b/scripts/mod/modpost.c
@@ -969,7 +969,7 @@ static int secref_whitelist(const char *fromsec, const char *fromsym,
 	/* symbols in data sections that may refer to any init/exit sections */
 	if (match(fromsec, PATTERNS(DATA_SECTIONS)) &&
 	    match(tosec, PATTERNS(ALL_INIT_SECTIONS, ALL_EXIT_SECTIONS)) &&
-	    match(fromsym, PATTERNS("*_ops", "*_console")))
+	    match(fromsym, PATTERNS("*_ops", "*_ops.llvm.*", "*_console")))
 		return 0;
 
 	/* Check for pattern 3 */

base-commit: e771677c937da5808f7b6c1f0e4a97ec1a84f8a8
-- 
2.55.0.rc0.738.g0c8ab3ebcc-goog


