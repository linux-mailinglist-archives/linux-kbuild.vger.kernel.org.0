Return-Path: <linux-kbuild+bounces-12693-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GH8EFEvN02lpmQcAu9opvQ
	(envelope-from <linux-kbuild+bounces-12693-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Mon, 06 Apr 2026 17:12:11 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A43643A49B3
	for <lists+linux-kbuild@lfdr.de>; Mon, 06 Apr 2026 17:12:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EC0D2303814F
	for <lists+linux-kbuild@lfdr.de>; Mon,  6 Apr 2026 15:10:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 747D0386C3C;
	Mon,  6 Apr 2026 15:10:13 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from cstnet.cn (smtp25.cstnet.cn [159.226.251.25])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A51CF31D72E;
	Mon,  6 Apr 2026 15:10:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775488213; cv=none; b=YEBmQeptLCJh55VHe0IzSZjZKc41mDX9rMPd7evIYqBJp+HUNogWKOX2fEv82zrK1ZTw28+DQuyXAe8nkAJxboOxxQkNxQz2N5VGujfFxx6cdRGFTxiprx2I2ZAbB4uOFAOZ9L8YKip3k/GF+gBqnT4eMDbdfPTT1qAsHEk3974=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775488213; c=relaxed/simple;
	bh=qrnUK0FyqMC+c73zjS9t0P8Jy8phnq04bV+haoZA5Jk=;
	h=From:Date:Message-ID:To:Cc:Subject; b=o8u7W9ChbLecH7IHmxujbJDPebYyMaK258qYzhn4xu1q1ix3hAgRihEmk1VfueYiRqt+Xmg6kySeEwJYDAZQmFmyp8Op0PElr95ryipX2rqD+V5vntcKKpD+jwlKPYELO7V8pd0YUp+D1CxhhG6JZp5sRiEkR8DL9G2yvf1JeHw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from 0001-kconfig-warn-changed-input.eml (unknown [111.196.245.197])
	by APP-05 (Coremail) with SMTP id zQCowAC3Sg7EzNNpJ2W2DA--.36040S2;
	Mon, 06 Apr 2026 23:09:57 +0800 (CST)
From: Pengpeng Hou <pengpeng@iscas.ac.cn>
Date: Mon, 6 Apr 2026 23:06:19 +0800
Message-ID: <20260406233001.1-kconfig-warn-changed-input-pengpeng@iscas.ac.cn>
To: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, Masahiro Yamada <masahiroy@kernel.org>, linux-kbuild@vger.kernel.org
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, Thomas Meyer <thomas@m3y3r.de>, Miguel Ojeda <ojeda@kernel.org>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, pengpeng@iscas.ac.cn
Subject: [PATCH] kconfig: add optional warnings for changed input values
X-CM-TRANSID:zQCowAC3Sg7EzNNpJ2W2DA--.36040S2
X-Coremail-Antispam: 1UD129KBjvJXoW3Wr1rKrWDJFyxJFW3KF1xKrg_yoWftFWkpa
	yrJ345KF4kJF1fta17tas7WF1rCrn7Wry5GF17Kw1UAF90y3yIyrsrKw1Yyr13ursFyFW5
	AFyFgF4FkF1UAaUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvC14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s
	0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xII
	jxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr
	1lF7xvr2IY64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7M4IIrI8v6xkF7I0E8cxan2IY
	04v7MxkF7I0En4kS14v26r1q6r43MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r
	1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CE
	b7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0x
	vE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAI
	cVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2Kf
	nxnUUI43ZEXa7VUbGQ6JUUUUU==
X-CM-SenderInfo: pshqw1xhqjqxpvfd2hldfou0/
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
X-Spamd-Result: default: False [0.04 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-12693-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_NA(0.00)[iscas.ac.cn];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[pengpeng@iscas.ac.cn,linux-kbuild@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.991];
	TAGGED_RCPT(0.00)[linux-kbuild];
	DBL_BLOCKED_OPENRESOLVER(0.00)[iscas.ac.cn:email,iscas.ac.cn:mid]
X-Rspamd-Queue-Id: A43643A49B3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

When reading .config input, Kconfig stores user-provided values first and
then resolves the final value after applying dependencies, ranges, and
other constraints.

If the final value differs from the user's input, Kconfig already tracks
that state internally, but it does not provide any focused diagnostic to
show which explicit inputs were adjusted. This is particularly confusing
for requested values that get forced down by unmet dependencies or clamped
by ranges.

Add an opt-in diagnostic controlled by KCONFIG_WARN_CHANGED_INPUT.
Emit the warnings from conf_write() and conf_write_defconfig() after
value resolution and through the existing message callback path so the
default behavior stays unchanged and interactive frontends remain usable.

Document the new environment variable and add tests for both olddefconfig
and savedefconfig.

Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
---
 Documentation/kbuild/kconfig.rst         |  5 ++
 scripts/kconfig/confdata.c               | 94 +++++++++++++++++++++++++++++++-
 .../tests/warn_changed_input/Kconfig     | 27 +++++++++
 .../tests/warn_changed_input/__init__.py | 27 +++++++++
 .../tests/warn_changed_input/config      |  2 +
 .../warn_changed_input/expected_config   |  6 ++
 .../expected_defconfig                   |  1 +
 .../warn_changed_input/expected_stdout   |  3 +
 8 files changed, 162 insertions(+), 3 deletions(-)

diff --git a/Documentation/kbuild/kconfig.rst b/Documentation/kbuild/kconfig.rst
index d213c4f599a4..e35dd1d5f9d3 100644
--- a/Documentation/kbuild/kconfig.rst
+++ b/Documentation/kbuild/kconfig.rst
@@ -59,6 +59,11 @@ Environment variables for ``*config``:
     This environment variable makes Kconfig warn about all unrecognized
     symbols in the config input.
 
+``KCONFIG_WARN_CHANGED_INPUT``
+    If set to a non-blank value, Kconfig prints optional warnings for
+    user-provided values that change after Kconfig resolves dependencies
+    or applies other constraints such as ranges.
+
 ``KCONFIG_WERROR``
     If set, Kconfig treats warnings as errors.
 
diff --git a/scripts/kconfig/confdata.c b/scripts/kconfig/confdata.c
index 9599a0408862..bcbac5a204e9 100644
--- a/scripts/kconfig/confdata.c
+++ b/scripts/kconfig/confdata.c
@@ -206,6 +206,72 @@ static void conf_message(const char *fmt, ...)
 	va_end(ap);
 }
 
+static bool conf_warn_changed_input_enabled(void)
+{
+	const char *env = getenv("KCONFIG_WARN_CHANGED_INPUT");
+
+	return env && *env;
+}
+
+static const char *sym_get_user_value_string(struct symbol *sym)
+{
+	switch (sym->type) {
+	case S_BOOLEAN:
+	case S_TRISTATE:
+		switch (sym->def[S_DEF_USER].tri) {
+		case yes:
+			return "y";
+		case mod:
+			return "m";
+		default:
+			return "n";
+		}
+	default:
+		return sym->def[S_DEF_USER].val ?: "";
+	}
+}
+
+static bool sym_user_value_changed(struct symbol *sym)
+{
+	if (!sym_has_value(sym) || sym->type == S_UNKNOWN)
+		return false;
+
+	switch (sym->type) {
+	case S_BOOLEAN:
+	case S_TRISTATE:
+		return sym->def[S_DEF_USER].tri != sym_get_tristate_value(sym);
+	default:
+		return strcmp(sym_get_user_value_string(sym),
+			      sym_get_string_value(sym));
+	}
+}
+
+static void conf_clear_written_flags(void)
+{
+	struct symbol *sym;
+
+	for_all_symbols(sym)
+		sym->flags &= ~SYMBOL_WRITTEN;
+}
+
+static void conf_append_changed_input_warning(struct gstr *gs,
+					      struct symbol *sym, bool *found)
+{
+	if (!sym_user_value_changed(sym))
+		return;
+
+	if (!*found) {
+		str_printf(gs,
+			   "warning: user-provided values changed by Kconfig:\n");
+		*found = true;
+	}
+
+	str_printf(gs, "  %s%s: %s -> %s\n",
+		   CONFIG_, sym->name,
+		   sym_get_user_value_string(sym),
+		   sym_get_string_value(sym));
+}
+
 const char *conf_get_configname(void)
 {
 	char *name = getenv("KCONFIG_CONFIG");
@@ -759,7 +825,10 @@ int conf_write_defconfig(const char *filename)
 {
 	struct symbol *sym;
 	struct menu *menu;
+	struct gstr gs = str_new();
 	FILE *out;
+	bool warn_changed_input = conf_warn_changed_input_enabled();
+	bool found = false;
 
 	out = fopen(filename, "w");
 	if (!out)
@@ -772,10 +841,13 @@ int conf_write_defconfig(const char *filename)
 
 		sym = menu->sym;
 
-		if (!sym || sym_is_choice(sym))
+		if (!sym || sym_is_choice(sym) || sym->flags & SYMBOL_WRITTEN)
 			continue;
 
 		sym_calc_value(sym);
+		if (warn_changed_input)
+			conf_append_changed_input_warning(&gs, sym, &found);
+		sym->flags |= SYMBOL_WRITTEN;
 		if (!(sym->flags & SYMBOL_WRITE))
 			continue;
 		sym->flags &= ~SYMBOL_WRITE;
@@ -798,6 +870,13 @@ int conf_write_defconfig(const char *filename)
 		print_symbol_for_dotconfig(out, sym);
 	}
 	fclose(out);
+
+	conf_clear_written_flags();
+
+	if (found)
+		conf_message("%s", str_get(&gs));
+
+	str_free(&gs);
 	return 0;
 }
 
@@ -809,7 +888,10 @@ int conf_write(const char *name)
 	const char *str;
 	char tmpname[PATH_MAX + 1], oldname[PATH_MAX + 1];
 	char *env;
+	struct gstr gs = str_new();
 	bool need_newline = false;
+	bool warn_changed_input = conf_warn_changed_input_enabled();
+	bool found = false;
 
 	if (!name)
 		name = conf_get_configname();
@@ -859,6 +941,8 @@ int conf_write(const char *name)
 		} else if (!sym_is_choice(sym) &&
 			   !(sym->flags & SYMBOL_WRITTEN)) {
 			sym_calc_value(sym);
+			if (warn_changed_input)
+				conf_append_changed_input_warning(&gs, sym, &found);
 			if (!(sym->flags & SYMBOL_WRITE))
 				goto next;
 			if (need_newline) {
@@ -892,8 +976,12 @@ int conf_write(const char *name)
 	}
 	fclose(out);
 
-	for_all_symbols(sym)
-		sym->flags &= ~SYMBOL_WRITTEN;
+	conf_clear_written_flags();
+
+	if (found)
+		conf_message("%s", str_get(&gs));
+
+	str_free(&gs);
 
 	if (*tmpname) {
 		if (is_same(name, tmpname)) {
diff --git a/scripts/kconfig/tests/warn_changed_input/Kconfig b/scripts/kconfig/tests/warn_changed_input/Kconfig
new file mode 100644
index 000000000000..4b749eccbe28
--- /dev/null
+++ b/scripts/kconfig/tests/warn_changed_input/Kconfig
@@ -0,0 +1,27 @@
+# SPDX-License-Identifier: GPL-2.0
+
+config DEP
+	bool "DEP"
+	help
+	  Test dependency symbol for Kconfig warning coverage.
+	  This is used by the warn_changed_input selftest.
+	  It intentionally stays unset in the input fragment.
+	  The test checks how dependent user input is adjusted.
+
+config A
+	bool "A"
+	depends on DEP
+	help
+	  Test bool symbol for changed-input diagnostics.
+	  The input fragment requests this symbol as built-in.
+	  The unmet dependency on DEP forces the final value to n.
+	  The warning should report that downgrade.
+
+config NUM
+	int "NUM"
+	range 10 20
+	help
+	  Test integer symbol for changed-input diagnostics.
+	  The input fragment requests a value outside the allowed range.
+	  Kconfig resolves it to the constrained in-range value.
+	  The warning should report that adjustment.
diff --git a/scripts/kconfig/tests/warn_changed_input/__init__.py b/scripts/kconfig/tests/warn_changed_input/__init__.py
new file mode 100644
index 000000000000..5a2b68fb1033
--- /dev/null
+++ b/scripts/kconfig/tests/warn_changed_input/__init__.py
@@ -0,0 +1,27 @@
+# SPDX-License-Identifier: GPL-2.0
+"""
+Test optional warnings for user-provided values changed by Kconfig.
+
+Warnings should stay disabled by default, and should only appear when
+KCONFIG_WARN_CHANGED_INPUT is enabled.
+"""
+
+
+def test(conf):
+    assert conf.olddefconfig('config') == 0
+    assert 'user-provided values changed by Kconfig' not in conf.stdout
+
+    assert conf._run_conf('--olddefconfig', dot_config='config',
+                          extra_env={
+                              'KCONFIG_WARN_CHANGED_INPUT': '1',
+                          }) == 0
+    assert conf.stdout_contains('expected_stdout')
+    assert conf.config_matches('expected_config')
+
+    assert conf._run_conf('--savedefconfig=defconfig', dot_config='config',
+                          out_file='defconfig',
+                          extra_env={
+                              'KCONFIG_WARN_CHANGED_INPUT': '1',
+                          }) == 0
+    assert conf.stdout_contains('expected_stdout')
+    assert conf.config_matches('expected_defconfig')
diff --git a/scripts/kconfig/tests/warn_changed_input/config b/scripts/kconfig/tests/warn_changed_input/config
new file mode 100644
index 000000000000..91156997e58d
--- /dev/null
+++ b/scripts/kconfig/tests/warn_changed_input/config
@@ -0,0 +1,2 @@
+CONFIG_A=y
+CONFIG_NUM=30
diff --git a/scripts/kconfig/tests/warn_changed_input/expected_config b/scripts/kconfig/tests/warn_changed_input/expected_config
new file mode 100644
index 000000000000..fe8bbec66c53
--- /dev/null
+++ b/scripts/kconfig/tests/warn_changed_input/expected_config
@@ -0,0 +1,6 @@
+#
+# Automatically generated file; DO NOT EDIT.
+# Main menu
+#
+# CONFIG_DEP is not set
+CONFIG_NUM=20
diff --git a/scripts/kconfig/tests/warn_changed_input/expected_defconfig b/scripts/kconfig/tests/warn_changed_input/expected_defconfig
new file mode 100644
index 000000000000..af9e34851d2a
--- /dev/null
+++ b/scripts/kconfig/tests/warn_changed_input/expected_defconfig
@@ -0,0 +1 @@
+CONFIG_NUM=20
diff --git a/scripts/kconfig/tests/warn_changed_input/expected_stdout b/scripts/kconfig/tests/warn_changed_input/expected_stdout
new file mode 100644
index 000000000000..83ca08b7187f
--- /dev/null
+++ b/scripts/kconfig/tests/warn_changed_input/expected_stdout
@@ -0,0 +1,3 @@
+warning: user-provided values changed by Kconfig:
+  CONFIG_A: y -> n
+  CONFIG_NUM: 30 -> 20
-- 
2.50.1 (Apple Git-155)



