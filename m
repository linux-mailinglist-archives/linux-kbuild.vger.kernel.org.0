Return-Path: <linux-kbuild+bounces-13604-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id mEuBHPMnJGrV3gEAu9opvQ
	(envelope-from <linux-kbuild+bounces-13604-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Sat, 06 Jun 2026 16:00:19 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0657664DAF6
	for <lists+linux-kbuild@lfdr.de>; Sat, 06 Jun 2026 16:00:19 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=BPSJFrqF;
	spf=pass (mail.lfdr.de: domain of "linux-kbuild+bounces-13604-lists+linux-kbuild=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-kbuild+bounces-13604-lists+linux-kbuild=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 4E60E3012B1F
	for <lists+linux-kbuild@lfdr.de>; Sat,  6 Jun 2026 14:00:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC44B3AFAEC;
	Sat,  6 Jun 2026 14:00:15 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A0A5221FC6
	for <linux-kbuild@vger.kernel.org>; Sat,  6 Jun 2026 14:00:13 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780754415; cv=none; b=lFzY393ecJN3hH2p+gUnsIqc3FPfCeU9VIuIGeNyg7kJygiNcGjSyD4yWMS/fSvrRIN2D2IreIX00QQdUMQHrZwj9U0AxPHGjyT15q7rCeCGupg4u/OLuFjSuchHpNQAgbty2h9RTSdLnDgjtFcZxse3dUji/IuEfSo7IHqkKVk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780754415; c=relaxed/simple;
	bh=gKNCowxDuzxoxO9SgeSCOyuz85Ulsyzw2t/1XkzpS0k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=W1T9KHwe/nYE7b17x2/GUwZGybIPkzWGdkGsw/2VveixGTDJdlZsaAlwuyr6nrddYOoSRaZKr1T3i2hl3j4rQdG4r9nXmnfjL2y8tLzV6fZsF3Uo1NgPi9FY+624ba3sPPq6/4X8uWQtfcXG26O4wJSxOb40a1LSu7YHo40WjT8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BPSJFrqF; arc=none smtp.client-ip=209.85.128.43
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-490b4a8e28bso22721825e9.1
        for <linux-kbuild@vger.kernel.org>; Sat, 06 Jun 2026 07:00:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780754412; x=1781359212; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=Ji0FD+Mn+yCRAHOT89THI9KOaA6S9+m9/n6SqbkdKPQ=;
        b=BPSJFrqFge5VI6YfjHSPW0z6tU0Jl4bt1jC54Y1P00Er9eY0K14zHxQ7brjj8Vd2f/
         E3E0WFg8xgwR5je+CKOrDtyfjbGY2+PSYNvaQzTEc9p7vtKHPmj2YRsl5FXnxDARqbM7
         qHnvMaYRz7ReDPLQjAu/wt/4NEt8SAds0eWwM9m/ORzpXtvo6+OMSt+pUHpq+svlf6Eh
         AtJCd/drqX1zFqFFnkPIHcLBV18myJKppsObR+zz5/gM5rRYaqlTWXs3GaI46FSpIzi9
         OcT4rWW6SZ976443Gv3dHCl9auVgxQS3u9kyokAnFQ3zeyS1adMklZYTS37PqFZYEoRz
         qOKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780754412; x=1781359212;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ji0FD+Mn+yCRAHOT89THI9KOaA6S9+m9/n6SqbkdKPQ=;
        b=B860JoLoH/cDGDHywtAaQyrNshTkNFKHUxZ70nUHXKw8vIrOHn6OaNKOzeYLvE5fIr
         tfQB6//PjtAjC2F2WxNEa2rOjct9aLkRr/4d1hkrkU6KxSbj0BtH83vT5zl3+xvxZp4o
         4AjPPnQh91s6lOv9lTpzr97gU2C3Yxa+Pfxuo85FiE5lF368BtKY0AU3IY5uuPiTBhxF
         1WrOfYWX1K+OaEZUVY4nnnOUN3sLu088U7V9PvYpREjYZFoU4iOBVVhwM4Vwd8PwlrXt
         imt11tGMSDzRJ/p3V+Og6DUg9asvykx6L/RsSf3aRYFczXVM520nxVwZ8eJAru4DGEHt
         6a2w==
X-Forwarded-Encrypted: i=1; AFNElJ8ohHGAGhzl5y67gqaYoo8O1VA512CkzBI75SsIn7q1tCuz7Ds6BTTSYmIx+9rJb2KbSSgh9jngkeYFWy4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5eyn6E/VoRyQNhW34kO7gxwbxsdRyi+U6QR3rQy+FE8j68YKl
	kM7PkFeYSKiHGWx/katViYL4miDKIocVQkm7ua4pngqfthnZ/ceCDILIdznG8ezD59ZUtw==
X-Gm-Gg: Acq92OGslOOx3YBx1TS8r0yZhg+fiNYdMjeECrA7GXQTUiRt7cV4Vt9Vio9fBaKcBgc
	WNWqq1FsxAPmttg5lW6/rEthiCivifSMzyzq7GI5WUjqY+wJq52/j4RruiXy/Y9k/Hvi/KDzWzb
	RlxM2ApbSJyT/piTpFMUz7o5veyi4VxtVtbAm9GQX8i0wFuZtWXxYBHxq+D7swCItcyOLuXoHk7
	Epo7K3gpjDb+uX1o+I8v/J2/U0qO0ox71UiqSfwbFOYFFcqLlH7gmBuSDBwk826ywa8MP9gXQkg
	5+WglAgIBW+gCKerA4E/mHrYyGZ4eDdr4ueIr74gos0BkHTUqk0yRQx7n4EqjAaLn29vWxajoIF
	d3BFCr5AGo+iFWWNf4sZgb6GklulY+mi5E06b16pMgXZFu6AVgThdSiALANaS6YkLf+WA4rtyQk
	KP+ZZD9QezvryAe6e9es/2E22EEPJWhmRFaLJoBj+9iFHCtu2RkuMWt+aCqNMetavA29RWqRNPy
	b0E0YcsdY+V47j2WVCDaWQJPw==
X-Received: by 2002:a05:600c:1d12:b0:490:afc5:f95d with SMTP id 5b1f17b1804b1-490c2602bdfmr136286235e9.29.1780754412080;
        Sat, 06 Jun 2026 07:00:12 -0700 (PDT)
Received: from nixos-office (195-23-151-163.net.novis.pt. [195.23.151.163])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490bc3b5b82sm255940725e9.1.2026.06.06.07.00.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Jun 2026 07:00:11 -0700 (PDT)
Sender: Julian Braha <julian.braha@gmail.com>
From: Julian Braha <julianbraha@gmail.com>
To: nathan@kernel.org,
	nsc@kernel.org
Cc: rdunlap@infradead.org,
	masahiroy@kernel.org,
	grahamr@qti.qualcomm.com,
	nico@fluxnic.net,
	linux-kernel@vger.kernel.org,
	linux-kbuild@vger.kernel.org,
	Julian Braha <julianbraha@gmail.com>
Subject: [PATCH] kconfig: warn on dead default
Date: Sat,  6 Jun 2026 15:00:08 +0100
Message-ID: <20260606140008.271929-1-julianbraha@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[infradead.org,kernel.org,qti.qualcomm.com,fluxnic.net,vger.kernel.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-13604-lists,linux-kbuild=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:nathan@kernel.org,m:nsc@kernel.org,m:rdunlap@infradead.org,m:masahiroy@kernel.org,m:grahamr@qti.qualcomm.com,m:nico@fluxnic.net,m:linux-kernel@vger.kernel.org,m:linux-kbuild@vger.kernel.org,m:julianbraha@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[julianbraha@gmail.com,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[julianbraha@gmail.com,linux-kbuild@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0657664DAF6

The dead default check was originally introduced with kconfirm:
https://lore.kernel.org/all/6ec4df6d-1445-48ca-8f54-1d1a83c4716d@gmail.com/

While I'm still working on that tool, it's not yet ready for inclusion
into the tree. I am currently waiting for common distro packagers to
package the parsing library before submitting the next RFC iteration.

However, the dead default check is more impactful than the other checks:
all 4 dead defaults that were detected should not have been dead and could
cause misconfiguration bugs. But fortunately, these were just for kunit
tests. The 3 patches to fix them have all since been merged:
commit aef656a0e6c0 ("powerpc: fix dead default for GUEST_STATE_BUFFER_TEST")
commit 30cc5e2ad826 ("s390/Kconfig: Cleanup defaults for selftests")
commit df75430515c3 ("drm: fix dead default for DRM_TTM_KUNIT_TEST")

We can actually check for dead defaults while evaluating Kconfig, which
should be even more effective at preventing future instances than keeping
it in a static checker.

Note that this patch will only trigger a warning when the default values
are different, in other words, pure duplicate defaults won't cause a
warning, as they are simply redundant.

Signed-off-by: Julian Braha <julianbraha@gmail.com>
---
 scripts/kconfig/menu.c                        | 22 +++++++++-
 .../kconfig/tests/warn_dead_default/Kconfig   | 40 +++++++++++++++++++
 .../tests/warn_dead_default/__init__.py       |  8 ++++
 .../tests/warn_dead_default/expected_stderr   |  4 ++
 4 files changed, 73 insertions(+), 1 deletion(-)
 create mode 100644 scripts/kconfig/tests/warn_dead_default/Kconfig
 create mode 100644 scripts/kconfig/tests/warn_dead_default/__init__.py
 create mode 100644 scripts/kconfig/tests/warn_dead_default/expected_stderr

diff --git a/scripts/kconfig/menu.c b/scripts/kconfig/menu.c
index b2d8d4e11e07..8c280292f9cd 100644
--- a/scripts/kconfig/menu.c
+++ b/scripts/kconfig/menu.c
@@ -242,13 +242,33 @@ static int menu_validate_number(struct symbol *sym, struct symbol *sym2)
 
 static void sym_check_prop(struct symbol *sym)
 {
-	struct property *prop;
+	struct property *prev, *prop;
 	struct symbol *sym2;
 	char *use;
 
 	for (prop = sym->prop; prop; prop = prop->next) {
 		switch (prop->type) {
 		case P_DEFAULT:
+			for_all_defaults(sym, prev) {
+				if (prev == prop)
+					break;
+				if (expr_is_yes(prev->visible.expr)) {
+					if (!expr_eq(prev->expr, prop->expr))
+						prop_warn(prop,
+							"default for '%s' is unreachable: earlier default at %s:%d is unconditional",
+							sym->name ? sym->name : "<choice>",
+							prev->filename, prev->lineno);
+					break;
+				}
+				if (expr_eq(prev->visible.expr, prop->visible.expr)) {
+					if (!expr_eq(prev->expr, prop->expr))
+						prop_warn(prop,
+							"default for '%s' has the same condition as the earlier default at %s:%d",
+							sym->name ? sym->name : "<choice>",
+							prev->filename, prev->lineno);
+					break;
+				}
+			}
 			if ((sym->type == S_STRING || sym->type == S_INT || sym->type == S_HEX) &&
 			    prop->expr->type != E_SYMBOL)
 				prop_warn(prop,
diff --git a/scripts/kconfig/tests/warn_dead_default/Kconfig b/scripts/kconfig/tests/warn_dead_default/Kconfig
new file mode 100644
index 000000000000..adf421d73dbd
--- /dev/null
+++ b/scripts/kconfig/tests/warn_dead_default/Kconfig
@@ -0,0 +1,40 @@
+# SPDX-License-Identifier: GPL-2.0
+
+config A
+	bool
+
+config B
+	bool
+
+config UNCONDITIONAL
+	int
+	default 1
+	default 2
+
+config CONDITIONAL
+	int
+	default 1 if A
+	default 2 if A
+	default 3 if B
+
+config CONDITIONAL_COMMUTATIVE
+	int
+	default 1 if A && B
+	default 2 if B && A
+
+config CONTROL
+	int
+	default 1 if A
+	default 2 if B
+	default 3
+
+choice
+	prompt "test choice"
+	default C
+	default D
+
+	config C
+		bool "C"
+	config D
+		bool "D"
+endchoice
diff --git a/scripts/kconfig/tests/warn_dead_default/__init__.py b/scripts/kconfig/tests/warn_dead_default/__init__.py
new file mode 100644
index 000000000000..911b30ce19fe
--- /dev/null
+++ b/scripts/kconfig/tests/warn_dead_default/__init__.py
@@ -0,0 +1,8 @@
+# SPDX-License-Identifier: GPL-2.0
+"""
+Test detection of dead defaults (different defaults that can never be active).
+"""
+
+def test(conf):
+    assert conf.olddefconfig() == 0
+    assert conf.stderr_contains('expected_stderr')
diff --git a/scripts/kconfig/tests/warn_dead_default/expected_stderr b/scripts/kconfig/tests/warn_dead_default/expected_stderr
new file mode 100644
index 000000000000..baa20bf33910
--- /dev/null
+++ b/scripts/kconfig/tests/warn_dead_default/expected_stderr
@@ -0,0 +1,4 @@
+Kconfig:12:warning: default for 'UNCONDITIONAL' is unreachable: earlier default at Kconfig:11 is unconditional
+Kconfig:17:warning: default for 'CONDITIONAL' has the same condition as the earlier default at Kconfig:16
+Kconfig:23:warning: default for 'CONDITIONAL_COMMUTATIVE' has the same condition as the earlier default at Kconfig:22
+Kconfig:34:warning: default for '<choice>' is unreachable: earlier default at Kconfig:33 is unconditional
-- 
2.53.0


