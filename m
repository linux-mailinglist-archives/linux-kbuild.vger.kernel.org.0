Return-Path: <linux-kbuild+bounces-8986-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E9C3BAB6CB
	for <lists+linux-kbuild@lfdr.de>; Tue, 30 Sep 2025 06:53:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 80DBB1924154
	for <lists+linux-kbuild@lfdr.de>; Tue, 30 Sep 2025 04:53:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 573A1265629;
	Tue, 30 Sep 2025 04:53:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="B3R7D/Lm"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 262D0288DB;
	Tue, 30 Sep 2025 04:53:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759207992; cv=none; b=AX/euLxTS5QETK5gC3bNV570RquVkH5knLwPuF5X2ZcMd8mzlg2+nWWkPQWfpYbF2oSBsBUQfSm3E/aT+MOzofXqdOz8MPIL8lu2Fn9Rg8i4mRNpi1ZUlHEYc2d/cRS7fEziM/wtN778SlCxH8earXaK2aPjUECrD/l8qPZdusE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759207992; c=relaxed/simple;
	bh=rkKVTpl0XdkJBAi9EXZp5NL0P2fRQ9CldnZcIGmeH90=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=b7EABN77dzvDQp7h275Tc5sSzjX5CImUf4IKQ9H0yXHP4OvCQ+Tf7XTwFkGA42eP8XfdG8DFUkda0oLiSLI51kKz6hEZ6jhvuu4YMQjwt2M8mpfx5M7UxLOFhKbIlmV1c4IAT9abI5Uy/BZNpth91jtsQPrheOVbhYjlNMkFk00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=B3R7D/Lm; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A80BFC4CEF0;
	Tue, 30 Sep 2025 04:53:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759207991;
	bh=rkKVTpl0XdkJBAi9EXZp5NL0P2fRQ9CldnZcIGmeH90=;
	h=From:To:Cc:Subject:Date:From;
	b=B3R7D/LmIY5f4otOOqdwfFarOBfIVmamOLyxZqpuO95tSaTYEFF93k9NYRi/zpKzv
	 1rLjcV8qJkh/iB+ksmTAkpdugUH3qbbuiIqfZ/phhjxSlhqQMg4cBYoTeNZ4zHccKZ
	 RGWM1nuCIaKA5RzVIVlwdHuAh4G0ZGPZctiPelc+KvMIIFElAfuoB7GWdCw1Lof8XP
	 ewrl3vZB4+2ufB64Sk9IzxRDL/WoYiw0FFatB19byPCQ0rTnJ+3qJRlZoQAN1mmivZ
	 5BhU+J4U5ZWHAJL6Vq7cCBcDJBPdd1tfPGqLnqfTbewfJQXCt6u3lKs4ZVdfAz8B3X
	 uIOLoNG7bR1rg==
From: Kees Cook <kees@kernel.org>
To: Vegard Nossum <vegard.nossum@oracle.com>,
	Linus Torvalds <torvalds@linux-foundation.org>
Cc: Kees Cook <kees@kernel.org>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Petr Vorel <pvorel@suse.cz>,
	linux-kernel@vger.kernel.org,
	linux-kbuild@vger.kernel.org,
	linux-hardening@vger.kernel.org
Subject: [PATCH] kconfig: Avoid prompting for transitional symbols
Date: Mon, 29 Sep 2025 21:53:06 -0700
Message-Id: <20250930045300.work.375-kees@kernel.org>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=6943; i=kees@kernel.org; h=from:subject:message-id; bh=rkKVTpl0XdkJBAi9EXZp5NL0P2fRQ9CldnZcIGmeH90=; b=owGbwMvMwCVmps19z/KJym7G02pJDBm3kwzzt/S5dmnf2jmTN/S05GQ5nnsnfCJDQqyVjh8Vn 7/tHGtqRykLgxgXg6yYIkuQnXuci8fb9nD3uYowc1iZQIYwcHEKwETY1RkZTtcou9fabXnquOl2 3ImK3+V2rz5/jz24vugW+6/F1fZLtzL8r92RVtZ8y8yxi/+X39nT6cbS+46kB2ZFN/lvCr454Ys WJwA=
X-Developer-Key: i=kees@kernel.org; a=openpgp; fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
Content-Transfer-Encoding: 8bit

The "transitional" symbol keyword, while working with the "olddefconfig"
target, was prompting during "oldconfig". This occurred because these
symbols were not being marked as user-defined when they received values
from transitional symbols that had user values. The "olddefconfig" target
explicitly doesn't prompt for anything, so this deficiency wasn't noticed.

The issue manifested when a symbol's value came from a transitional
symbol's user value but the receiving symbol wasn't marked with
SYMBOL_DEF_USER. Thus the "oldconfig" logic would then prompt for these
symbols unnecessarily.

Check after value calculation whether a symbol without a user value
gets its value from a single transitional symbol that does have a user
value. In such cases, mark the receiving symbol as user-defined to
prevent prompting.

Update regression tests to verify that symbols with transitional defaults
are not prompted in "oldconfig", except when conditional defaults evaluate
to 'no' and should legitimately be prompted.

Build tested with "make testconfig".

Reported-by: Linus Torvalds <torvalds@linux-foundation.org>
Closes: https://lore.kernel.org/lkml/CAHk-=wgZjUk4Cy2XgNkTrQoO8XCmNUHrTe5D519Fij1POK+3qw@mail.gmail.com/
Fixes: 05020835c86e ("kconfig: Add transitional symbol attribute for migration support")
Cc: Vegard Nossum <vegard.nossum@oracle.com>
Signed-off-by: Kees Cook <kees@kernel.org>
---
 scripts/kconfig/tests/transitional/Kconfig    | 32 +++++++++++++++++++
 scripts/kconfig/symbol.c                      | 18 ++++++++++-
 .../kconfig/tests/transitional/__init__.py    |  7 ++++
 .../tests/transitional/expected_config        |  3 ++
 .../tests/transitional/expected_stdout        |  1 +
 .../kconfig/tests/transitional/initial_config |  4 +++
 6 files changed, 64 insertions(+), 1 deletion(-)
 create mode 100644 scripts/kconfig/tests/transitional/expected_stdout

diff --git a/scripts/kconfig/tests/transitional/Kconfig b/scripts/kconfig/tests/transitional/Kconfig
index 62c3b24665b9..faa4d396f828 100644
--- a/scripts/kconfig/tests/transitional/Kconfig
+++ b/scripts/kconfig/tests/transitional/Kconfig
@@ -96,5 +96,37 @@ config OLD_WITH_HELP
 	help
 	  This transitional symbol has a help section to validate that help is allowed.
 
+# Test that we can set something to =n via transitional symbol
+config NEW_DISABLED
+	tristate "Check for setting to disabled"
+	default OLD_DISABLED
+
+config OLD_DISABLED
+	tristate
+	transitional
+
+# Test that a potential new value disappears if it lacks a prompt
+config NEW_DISABLED_UNSAVED
+	tristate
+	default OLD_DISABLED
+
+config OLD_DISABLED_UNSAVED
+	tristate
+	transitional
+
+# Test conditional default: transitional value should not prevent prompting
+# when default visibility makes the expression evaluate to 'no'
+config DEPENDENCY_TEST
+	bool "Dependency for testing"
+	default n
+
+config NEW_CONDITIONAL_DEFAULT
+	bool "New option with conditional default"
+	default OLD_CONDITIONAL_DEFAULT if DEPENDENCY_TEST
+
+config OLD_CONDITIONAL_DEFAULT
+	bool
+	transitional
+
 config REGULAR_OPTION
 	bool "Regular option"
diff --git a/scripts/kconfig/symbol.c b/scripts/kconfig/symbol.c
index 760cac998381..9cc2fd5bc016 100644
--- a/scripts/kconfig/symbol.c
+++ b/scripts/kconfig/symbol.c
@@ -411,7 +411,7 @@ bool sym_dep_errors(void)
 void sym_calc_value(struct symbol *sym)
 {
 	struct symbol_value newval, oldval;
-	struct property *prop;
+	struct property *prop = NULL;
 	struct menu *choice_menu;
 
 	if (!sym)
@@ -520,6 +520,22 @@ void sym_calc_value(struct symbol *sym)
 		;
 	}
 
+	/*
+	 * If the symbol lacks a user value but its value comes from a
+	 * single transitional symbol with an existing user value, mark
+	 * this symbol as having a user value to avoid prompting.
+	 */
+	if (prop && !sym_has_value(sym)) {
+		struct symbol *ds = prop_get_symbol(prop);
+		if (ds && (ds->flags & SYMBOL_TRANS) && sym_has_value(ds)) {
+			if (sym->type == S_BOOLEAN || sym->type == S_TRISTATE)
+				sym->def[S_DEF_USER].tri = newval.tri;
+			else
+				sym->def[S_DEF_USER].val = newval.val;
+			sym->flags |= SYMBOL_DEF_USER;
+		}
+	}
+
 	sym->curr = newval;
 	sym_validate_range(sym);
 
diff --git a/scripts/kconfig/tests/transitional/__init__.py b/scripts/kconfig/tests/transitional/__init__.py
index 61937d10edf1..b50ba2397548 100644
--- a/scripts/kconfig/tests/transitional/__init__.py
+++ b/scripts/kconfig/tests/transitional/__init__.py
@@ -6,6 +6,7 @@ This tests that:
 - OLD_* options in existing .config cause NEW_* options to be set
 - OLD_* options are not written to the new .config file
 - NEW_* options appear in the new .config file with correct values
+- NEW_* options with defaults from transitional symbols are not prompted
 - All Kconfig types work correctly: bool, tristate, string, hex, int
 - User-set NEW values take precedence over conflicting OLD transitional values
 """
@@ -16,3 +17,9 @@ def test(conf):
 
     # Check that the configuration matches expected output
     assert conf.config_contains('expected_config')
+
+    # Test oldconfig to ensure symbols with transitional defaults are not prompted
+    assert conf.oldconfig(dot_config='initial_config', in_keys='n\n') == 0
+
+    # Except for when conditional default evaluates to 'no'
+    assert conf.stdout_contains('expected_stdout')
diff --git a/scripts/kconfig/tests/transitional/expected_config b/scripts/kconfig/tests/transitional/expected_config
index 846e9ddcab91..e01f5f070a26 100644
--- a/scripts/kconfig/tests/transitional/expected_config
+++ b/scripts/kconfig/tests/transitional/expected_config
@@ -9,4 +9,7 @@ CONFIG_NEW_STRING_PRECEDENCE="user value"
 CONFIG_NEW_TRISTATE_PRECEDENCE=y
 CONFIG_NEW_HEX_PRECEDENCE=0xABCD
 CONFIG_NEW_INT_PRECEDENCE=100
+# CONFIG_NEW_DISABLED is not set
+# CONFIG_DEPENDENCY_TEST is not set
+# CONFIG_NEW_CONDITIONAL_DEFAULT is not set
 # CONFIG_REGULAR_OPTION is not set
diff --git a/scripts/kconfig/tests/transitional/expected_stdout b/scripts/kconfig/tests/transitional/expected_stdout
new file mode 100644
index 000000000000..80eadd4e6a8d
--- /dev/null
+++ b/scripts/kconfig/tests/transitional/expected_stdout
@@ -0,0 +1 @@
+New option with conditional default (NEW_CONDITIONAL_DEFAULT) [N/y/?] (NEW)
diff --git a/scripts/kconfig/tests/transitional/initial_config b/scripts/kconfig/tests/transitional/initial_config
index e648a65e504c..68b7da672426 100644
--- a/scripts/kconfig/tests/transitional/initial_config
+++ b/scripts/kconfig/tests/transitional/initial_config
@@ -14,3 +14,7 @@ CONFIG_NEW_HEX_PRECEDENCE=0xABCD
 CONFIG_OLD_HEX_PRECEDENCE=0x5678
 CONFIG_NEW_INT_PRECEDENCE=100
 CONFIG_OLD_INT_PRECEDENCE=200
+# CONFIG_OLD_DISABLED is not set
+# CONFIG_OLD_DISABLED_UNSAVED is not set
+# CONFIG_DEPENDENCY_TEST is not set
+CONFIG_OLD_CONDITIONAL_DEFAULT=y
-- 
2.34.1


