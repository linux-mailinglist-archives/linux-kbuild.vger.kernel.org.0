Return-Path: <linux-kbuild+bounces-11346-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sP/VCzCumGl4KwMAu9opvQ
	(envelope-from <linux-kbuild+bounces-11346-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Fri, 20 Feb 2026 19:55:44 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 513EE16A342
	for <lists+linux-kbuild@lfdr.de>; Fri, 20 Feb 2026 19:55:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id B4A30300517E
	for <lists+linux-kbuild@lfdr.de>; Fri, 20 Feb 2026 18:55:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5654136683E;
	Fri, 20 Feb 2026 18:55:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JEZoQ23c"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32D1B2E7BB4;
	Fri, 20 Feb 2026 18:55:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771613738; cv=none; b=L5KzfH61TBforemfeWqswH3Snu8JSAtdYpt0zQMqYi18BxrvGaeRlRoO5c3lMcId8U725bTKTb+lDNDmMhljq2q/eO3ZuCPxgGYxFsMOLfOumrsojofk4C5Q8TZmNun5nNFMZQbsxNZuaYXuAFdx3CZqBBG3Q5naMfDirZNu7u8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771613738; c=relaxed/simple;
	bh=FdeBw+GkKyfMPGBzU2J2ct/CitZJF7jfK3sr8FmzTew=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=Qo2b8EuruluFl1wWGD6qBfstB8hixrP7fcMoSVLbputpy2w4BDlxwHT2C154D6piR2XMI7AaWqZem7qiGgg2i45igXuM15L5f2VH2EZNbzTlSfMRGnbsQXwwYJL5bOsQmc47ntFezC2sQ7TJwbAxapwQAV4SmSOTFd7U+F16XDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JEZoQ23c; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80F0FC116C6;
	Fri, 20 Feb 2026 18:55:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771613737;
	bh=FdeBw+GkKyfMPGBzU2J2ct/CitZJF7jfK3sr8FmzTew=;
	h=From:Date:Subject:To:Cc:From;
	b=JEZoQ23c6GclxhrQsMPxgD8R5pXv/hg0mxG4E1lHOpmdhuCm+wY/s6UJlhTT+5J92
	 bTdeEybDlSixvhW620Lc+iGMwy3qg38DolhtgHb0lEc7YcAfbrmbbbOIEmff6mUtRA
	 9FP0brV7YdUvy6OzBmKg2OmUkikjnXWqmfcK5WdTC4pR8U4J0Z/X4M0j+gW7sQKtVJ
	 xh+Guw83c9zRFcrmzptWxgEAi+ieQ36UHdIapFvcVcjeVzJwIdRjpHW82y4dxAGQh0
	 Lasd7GAOZk8Oi7a2hccI04GAa0PZHw54dRK4gTIji8M3rYp2yJtJ6K32dBF8gUEMg5
	 8EN8Sn0QYlDVg==
From: Nicolas Schier <nsc@kernel.org>
Date: Fri, 20 Feb 2026 19:55:19 +0100
Subject: [PATCH] kconfig: Error out on duplicated kconfig inclusion
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260220-kconfig-error-out-on-duplicated-inclusion-v1-1-be78aa241a53@kernel.org>
X-B4-Tracking: v=1; b=H4sIABaumGkC/x3NTQqDMBBA4avIrDugwaY/VyldaDKxQ2VGJqYI4
 t2bdvk239shkzFluDc7GH04s0qN7tRAeA0yEXKsDa51vnXdFd9BJfGEZKaGWlZUwViWmcOwUkS
 WMJefgme6+ejHC6W+h+otRom3/+vxPI4vm5s+bnsAAAA=
X-Change-ID: 20260218-kconfig-error-out-on-duplicated-inclusion-5e96d6b7ef44
To: Nathan Chancellor <nathan@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, 
 Linus Torvalds <torvalds@linux-foundation.org>, 
 Nicolas Schier <nsc@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=7131; i=nsc@kernel.org;
 s=20250924; h=from:subject:message-id;
 bh=FdeBw+GkKyfMPGBzU2J2ct/CitZJF7jfK3sr8FmzTew=;
 b=owEBbQKS/ZANAwAKAQdSCnAWJhJpAcsmYgBpmK4dQ9zKBGLSEJ0xiReonxdnL1jHrSZ/GMk9O
 yvc4nWKH3qJAjMEAAEKAB0WIQSHQTenhzckp4G+wsYHUgpwFiYSaQUCaZiuHQAKCRAHUgpwFiYS
 aeORD/9U6uDPGSXNbvzQtBEeCEppuyHFzRYKQnZ/LVgL54TzzoJ3vxfpKqoA1ftthtHwcpjKqxF
 Ih0SJ3C9yu8tLJleFCoUJFjrfC83j8k02o0o0qwIksAyval+xF8AN/VVED73o0/T5anWhNk7q+n
 iMLM0NX2WkgO1PqvuG+zyLnNObf+FUg0wDfY2Xflhg/a2vTAW7QuUykknhQ+MEOUASl9OYcPJyy
 qDvem7t8MHirxAWYu8/K/H3aqsrWDNs0B7QzKCgEuFEDcC9q6lvVV/T0wVwDxJahEsohw69I5+4
 siwCGKd6kmkXFgOAQHEUW8alWErUrzafVuTxPYW7I9SJgMCjxOVgw+OMvBfgilA0EXudaRzyYnq
 pyl1bRQCRsxjZ00B0qMUSVnwI4xIR4ncNubze9UOj85eN7E18wKHdvPwuS4viKXFwaSXOT8slpl
 tiMW0hL6muhUcyQUqBU78IRYUYTWGJypC+yPfMu8WSQ7YuUuoLxltAZaQJhb4LKQIG5/dWdxqNk
 +l7+tGIUuyzfzbSYyyldkI5Mvi6ehZY1o5EM/Jw997wszjaTEjLGOUuaguOamJ6eLfCKso5L7UI
 uFk0huuiT5Lc7DEiWFWq+h0HeEHO0SwXrtgoKdjTX6FsJxuM9GYHnmJ/8+WH5wXMXNA2H4DFMIS
 1tJ5VZ8wyd5QhpA==
X-Developer-Key: i=nsc@kernel.org; a=openpgp;
 fpr=18ED52DBE34F860EE9FBC82B7D97093255A0CE7F
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-11346-lists,linux-kbuild=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nsc@kernel.org,linux-kbuild@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-kbuild];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux-foundation.org:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 513EE16A342
X-Rspamd-Action: no action

Let kconfig exit with error on duplicated Kconfig file inclusion.

Repeated inclusion of Kbuild files are considered bad-practise with
regard to maintenance; and Kconfig language is rich enough that there
should be no need for that.

If repeated inclusion of Kconfig files is detected, error out with
messages like:

    Kconfig.inc1:4: error: Repeated inclusion of Kconfig.inc3
    Kconfig.inc2:3: note: Location of first inclusion of Kconfig.inc3

While commit f094f8a1b273 ("kconfig: allow multiple inclusion of the
same file") introduced detection of recursive inclusions of Kconfig
files, it explicitly allowed repeated inclusions, unfortunately w/o
reasoning.

Reported-by: Linus Torvalds <torvalds@linux-foundation.org>
Closes: https://lore.kernel.org/all/CAHk-=wj03hLzK2D=+OYmjgcmGM+XYymp8GyaEs=C0=rXG2nb7w@mail.gmail.com/
Signed-off-by: Nicolas Schier <nsc@kernel.org>
---
 scripts/kconfig/lexer.l                            |  4 +--
 scripts/kconfig/lkc.h                              |  3 ++-
 scripts/kconfig/tests/err_repeated_inc/Kconfig     |  3 +++
 .../kconfig/tests/err_repeated_inc/Kconfig.inc1    |  4 +++
 .../kconfig/tests/err_repeated_inc/Kconfig.inc2    |  3 +++
 .../kconfig/tests/err_repeated_inc/Kconfig.inc3    |  1 +
 scripts/kconfig/tests/err_repeated_inc/__init__.py | 10 +++++++
 .../kconfig/tests/err_repeated_inc/expected_stderr |  2 ++
 scripts/kconfig/util.c                             | 31 +++++++++++++++++++---
 9 files changed, 55 insertions(+), 6 deletions(-)

diff --git a/scripts/kconfig/lexer.l b/scripts/kconfig/lexer.l
index 6d2c92c6095dd8c247e6c2dd5dd0b56b8ea6a769..a6155422b4a688070a40a88edfedbcacb251da76 100644
--- a/scripts/kconfig/lexer.l
+++ b/scripts/kconfig/lexer.l
@@ -402,7 +402,7 @@ void zconf_initscan(const char *name)
 		exit(1);
 	}
 
-	cur_filename = file_lookup(name);
+	cur_filename = file_lookup(name, NULL, 0);
 	yylineno = 1;
 }
 
@@ -443,7 +443,7 @@ void zconf_nextfile(const char *name)
 	}
 
 	yylineno = 1;
-	cur_filename = file_lookup(name);
+	cur_filename = file_lookup(name, cur_filename, cur_lineno);
 }
 
 static void zconf_endfile(void)
diff --git a/scripts/kconfig/lkc.h b/scripts/kconfig/lkc.h
index 79898596121563350d2fa63fcf879743b756d003..7e6f6ca299cf1a74e4aed704972bc098616a94b0 100644
--- a/scripts/kconfig/lkc.h
+++ b/scripts/kconfig/lkc.h
@@ -51,7 +51,8 @@ static inline void xfwrite(const void *str, size_t len, size_t count, FILE *out)
 }
 
 /* util.c */
-const char *file_lookup(const char *name);
+const char *file_lookup(const char *name,
+			const char *parent_name, int parent_lineno);
 
 /* lexer.l */
 int yylex(void);
diff --git a/scripts/kconfig/tests/err_repeated_inc/Kconfig b/scripts/kconfig/tests/err_repeated_inc/Kconfig
new file mode 100644
index 0000000000000000000000000000000000000000..09a88fd29cb5a90f50585c9381a3f1b2f64a6087
--- /dev/null
+++ b/scripts/kconfig/tests/err_repeated_inc/Kconfig
@@ -0,0 +1,3 @@
+# SPDX-License-Identifier: GPL-2.0-only
+
+source "Kconfig.inc1"
diff --git a/scripts/kconfig/tests/err_repeated_inc/Kconfig.inc1 b/scripts/kconfig/tests/err_repeated_inc/Kconfig.inc1
new file mode 100644
index 0000000000000000000000000000000000000000..495dc38314a1ac0303f9ce23500af8b009eaad3d
--- /dev/null
+++ b/scripts/kconfig/tests/err_repeated_inc/Kconfig.inc1
@@ -0,0 +1,4 @@
+# SPDX-License-Identifier: GPL-2.0-only
+
+source "Kconfig.inc2"
+source "Kconfig.inc3"
diff --git a/scripts/kconfig/tests/err_repeated_inc/Kconfig.inc2 b/scripts/kconfig/tests/err_repeated_inc/Kconfig.inc2
new file mode 100644
index 0000000000000000000000000000000000000000..2b630eec2e99163cd04bc9d3e55393c70f8a886c
--- /dev/null
+++ b/scripts/kconfig/tests/err_repeated_inc/Kconfig.inc2
@@ -0,0 +1,3 @@
+# SPDX-License-Identifier: GPL-2.0-only
+
+source "Kconfig.inc3"
diff --git a/scripts/kconfig/tests/err_repeated_inc/Kconfig.inc3 b/scripts/kconfig/tests/err_repeated_inc/Kconfig.inc3
new file mode 100644
index 0000000000000000000000000000000000000000..a4e40e534e6a84db241abfe5076962a90f8a71bd
--- /dev/null
+++ b/scripts/kconfig/tests/err_repeated_inc/Kconfig.inc3
@@ -0,0 +1 @@
+# SPDX-License-Identifier: GPL-2.0-only
diff --git a/scripts/kconfig/tests/err_repeated_inc/__init__.py b/scripts/kconfig/tests/err_repeated_inc/__init__.py
new file mode 100644
index 0000000000000000000000000000000000000000..129d740a874b30e73acde797bd00e9f160c7a7ef
--- /dev/null
+++ b/scripts/kconfig/tests/err_repeated_inc/__init__.py
@@ -0,0 +1,10 @@
+# SPDX-License-Identifier: GPL-2.0
+"""
+Detect repeated inclusion error.
+
+If repeated inclusion is detected, it should fail with error message.
+"""
+
+def test(conf):
+    assert conf.oldaskconfig() != 0
+    assert conf.stderr_contains('expected_stderr')
diff --git a/scripts/kconfig/tests/err_repeated_inc/expected_stderr b/scripts/kconfig/tests/err_repeated_inc/expected_stderr
new file mode 100644
index 0000000000000000000000000000000000000000..95d90d6a93c52ec886a6309600c8c88205253497
--- /dev/null
+++ b/scripts/kconfig/tests/err_repeated_inc/expected_stderr
@@ -0,0 +1,2 @@
+Kconfig.inc1:4: error: Repeated inclusion of Kconfig.inc3
+Kconfig.inc2:3: note: Location of first inclusion of Kconfig.inc3
diff --git a/scripts/kconfig/util.c b/scripts/kconfig/util.c
index 5cdcee144b58126dcfab50fd709be9fc40e99423..1b69dd9e1872a0671a70e24b45a30e449dd2c75e 100644
--- a/scripts/kconfig/util.c
+++ b/scripts/kconfig/util.c
@@ -18,25 +18,50 @@ static HASHTABLE_DEFINE(file_hashtable, 1U << 11);
 
 struct file {
 	struct hlist_node node;
+	struct {
+		const char *name;
+		int lineno;
+	} parent;
 	char name[];
 };
 
+static void die_duplicated_include(struct file *file,
+				   const char *parent, int lineno)
+{
+	fprintf(stderr,
+		"%s:%d: error: Repeated inclusion of %s\n"
+		"%s:%d: note: Location of first inclusion of %s\n",
+		parent, lineno, file->name,
+		file->parent.name, file->parent.lineno, file->name);
+	exit(1);
+}
+
 /* file already present in list? If not add it */
-const char *file_lookup(const char *name)
+const char *file_lookup(const char *name,
+			const char *parent_name, int parent_lineno)
 {
+	const char *parent = NULL;
 	struct file *file;
 	size_t len;
 	int hash = hash_str(name);
 
+	if (parent_name)
+		parent = file_lookup(parent_name, NULL, 0);
+
 	hash_for_each_possible(file_hashtable, file, node, hash)
-		if (!strcmp(name, file->name))
-			return file->name;
+		if (!strcmp(name, file->name)) {
+			if (!parent_name)
+				return file->name;
+			die_duplicated_include(file, parent, parent_lineno);
+		}
 
 	len = strlen(name);
 	file = xmalloc(sizeof(*file) + len + 1);
 	memset(file, 0, sizeof(*file));
 	memcpy(file->name, name, len);
 	file->name[len] = '\0';
+	file->parent.name = parent;
+	file->parent.lineno = parent_lineno;
 
 	hash_add(file_hashtable, &file->node, hash);
 

---
base-commit: ca4ee40bf13dbd3a4be3b40a00c33a1153d487e5
change-id: 20260218-kconfig-error-out-on-duplicated-inclusion-5e96d6b7ef44

Best regards,
-- 
Nicolas


