Return-Path: <linux-kbuild+bounces-8989-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 45D1BBADF4E
	for <lists+linux-kbuild@lfdr.de>; Tue, 30 Sep 2025 17:45:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1D8003A7816
	for <lists+linux-kbuild@lfdr.de>; Tue, 30 Sep 2025 15:45:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 82B6B2D662F;
	Tue, 30 Sep 2025 15:45:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="F8NyB4+g"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5296213AA2F;
	Tue, 30 Sep 2025 15:45:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759247124; cv=none; b=Px82WsJ603gZ5y1g/IACmXpJnwKdDRJLfJpUz/y4KLHu6wU7kMi+KgJxc+kNVnCkaXvoQpsR728/AX/ve4xQrzaB0BSh7g/q027wqBvwDtDltn8Wm2ZNNYtQJaf/ANltGCSB3X8EJly/tnlrrjgJWImq6vweMKXS/ni+97oIFzg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759247124; c=relaxed/simple;
	bh=QTLjV5fBh037d021vjk5DqaNTSbSSW8IEsiuapZarIM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=fb+obJ5VXpQ653uFpkPkGiYQu1A6I+A1EAmHzBnVxnuNhGwb8Ox6YFFeJ62aaOJZby955ijtaBS1uhGJPlLSmqk4Crw7XgwhF2anQvVlwYCB3zig8hc0gGi34FVgJ1ECoQKculV4zRqUcJiJmCQohUyfnjG30wNKA8iwxEReDK4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=F8NyB4+g; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D375DC4CEF0;
	Tue, 30 Sep 2025 15:45:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759247123;
	bh=QTLjV5fBh037d021vjk5DqaNTSbSSW8IEsiuapZarIM=;
	h=From:To:Cc:Subject:Date:From;
	b=F8NyB4+gPAZWs4ilkoxIOxtUxPYtzWtfzNOjWXL3296Y131G66ZtkSOOdDDTNivTV
	 KdHywtXfR6t4STM0bPUJ2aRW9zX8uVML9BBEpgI6oQVCuwavjgY2sg/KwRSgceYHOI
	 5uptxrcmfc7cLpZKNgUV3KgVZ8Lfe6rvQU1uwziK3kKwWNsyOwQZaBMeid9/v/aZmK
	 S1m/WqVZ0lofM3rp2zQG9p1C0Z8CSp3yd7CdhQu8Is+TPTfgpPulYsOX00kBWcbP2J
	 IiaRaMM8aclR7skJyWo8mfIOqkng22fWyHb9go8HIDrBlrlSKIIbrp3afUV6equ+f/
	 GZKYO1Klx8OgA==
From: Kees Cook <kees@kernel.org>
To: Vegard Nossum <vegard.nossum@oracle.com>
Cc: Kees Cook <kees@kernel.org>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Petr Vorel <pvorel@suse.cz>,
	linux-kernel@vger.kernel.org,
	linux-kbuild@vger.kernel.org,
	linux-hardening@vger.kernel.org
Subject: [PATCH v2] kconfig: Avoid prompting for transitional symbols
Date: Tue, 30 Sep 2025 08:45:19 -0700
Message-Id: <20250930154514.it.623-kees@kernel.org>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=7051; i=kees@kernel.org; h=from:subject:message-id; bh=QTLjV5fBh037d021vjk5DqaNTSbSSW8IEsiuapZarIM=; b=owGbwMvMwCVmps19z/KJym7G02pJDBm3f/P9mFrEKrrnwgTlX9xTb9RcFa65v2XJ89oWR48bD kzrrcscOkpZGMS4GGTFFFmC7NzjXDzetoe7z1WEmcPKBDKEgYtTACYS+5/hn3VNufdWpYVLVO0X 8oozv4jtmFO7X49vsjwrx47n16R2nGBk2BJj6LB3itw2gfvRDOzB+lePsfx4IuqtLD6frXwLl0I IPwA=
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
 v2:
  - fix "no new line at end of file" git cleanup that broke expected stdout
  - set the entire struct to avoid testing type of symbol (Vegard)
 v1: https://lore.kernel.org/lkml/20250930045300.work.375-kees@kernel.org/
---
 scripts/kconfig/symbol.c                      | 15 ++++++++-
 scripts/kconfig/tests/transitional/Kconfig    | 32 +++++++++++++++++++
 .../kconfig/tests/transitional/__init__.py    |  7 ++++
 .../tests/transitional/expected_config        |  3 ++
 .../tests/transitional/expected_stdout        |  1 +
 .../kconfig/tests/transitional/initial_config |  4 +++
 6 files changed, 61 insertions(+), 1 deletion(-)
 create mode 100644 scripts/kconfig/tests/transitional/expected_stdout

diff --git a/scripts/kconfig/symbol.c b/scripts/kconfig/symbol.c
index 760cac998381..7e81b3676ee9 100644
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
@@ -520,6 +520,19 @@ void sym_calc_value(struct symbol *sym)
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
+			sym->def[S_DEF_USER] = newval;
+			sym->flags |= SYMBOL_DEF_USER;
+		}
+	}
+
 	sym->curr = newval;
 	sym_validate_range(sym);
 
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
index 000000000000..6f0b285d6469
--- /dev/null
+++ b/scripts/kconfig/tests/transitional/expected_stdout
@@ -0,0 +1 @@
+New option with conditional default (NEW_CONDITIONAL_DEFAULT) [N/y/?] (NEW) n
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


