Return-Path: <linux-kbuild+bounces-13295-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WP+dHvFtDmqN+gUAu9opvQ
	(envelope-from <linux-kbuild+bounces-13295-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Thu, 21 May 2026 04:29:05 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CC3C59E14D
	for <lists+linux-kbuild@lfdr.de>; Thu, 21 May 2026 04:29:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4F74B302D523
	for <lists+linux-kbuild@lfdr.de>; Thu, 21 May 2026 02:28:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ACB9736AB56;
	Thu, 21 May 2026 02:28:48 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from cstnet.cn (smtp81.cstnet.cn [159.226.251.81])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 700AE32B128;
	Thu, 21 May 2026 02:28:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779330526; cv=none; b=boxQMpqVegMP/22VvYqhFOKLMACEQ2iIMitTDScla/AlwyzxXcHuXJvaLGIvye55FBKT+wesQvXKbp2Tcbypy+BGNFAMlcAIvMlPSu/tnAlhWycBgCl4NRCPxtoQOikDvSB4CULY/g9s+64iLIcNzWbKnyYkizRKBIrs97S7EaA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779330526; c=relaxed/simple;
	bh=2Zf7B87TeFVRsACMrgdCHe3KYO/jbVY+kxl1WDKWFW8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gOlUZVbcaTCaXtgPkdl97A7zeIzumTYD4cCr1bordAmlw5eBZSWcxXT4UPM9ewZI5P2Tj8ozKybKYwZBw1bIZTIud4cpDBB+doeDl+fydW0RiOTrgOgyXp6zgeJFWMjSj0PUWI/FFn3d/WhGIDmUjuIkmsQ+b5j32raHsOBo0jA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from localhost.localdomain (unknown [111.196.245.140])
	by APP-03 (Coremail) with SMTP id rQCowACHa+LKbQ5qmbHAEQ--.571S2;
	Thu, 21 May 2026 10:28:26 +0800 (CST)
From: Pengpeng Hou <pengpeng@iscas.ac.cn>
To: Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nsc@kernel.org>,
	Masahiro Yamada <masahiroy@kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	linux-kbuild@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Pengpeng Hou <pengpeng@iscas.ac.cn>
Subject: [PATCH v2] kconfig: add optional warnings for changed input values
Date: Thu, 21 May 2026 10:28:24 +0800
Message-ID: <20260521022824.38591-1-pengpeng@iscas.ac.cn>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:rQCowACHa+LKbQ5qmbHAEQ--.571S2
X-Coremail-Antispam: 1UD129KBjvJXoW3CryDWF18Kw43Wr4fZF15XFb_yoWktFW3pa
	yrA345KF4kJFn3ta1Utas7WF1rurn7WrW5GF1jqw1UAF90yrWIyrsrKw1Yyry3u39FyFW5
	AFyFgF4FyF1UAaUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUkC14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AKxVWxJr
	0_GcWle2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
	2Ix0cI8IcVAFwI0_JrI_JrylYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJV
	W8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lc7CjxVAaw2AFwI0_
	Jw0_GFyl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67
	AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIY
	rxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14
	v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8
	JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjfUFg4SDU
	UUU
X-CM-SenderInfo: pshqw1xhqjqxpvfd2hldfou0/
X-Spamd-Result: default: False [0.04 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-13295-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[iscas.ac.cn];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FROM_NEQ_ENVFROM(0.00)[pengpeng@iscas.ac.cn,linux-kbuild@vger.kernel.org];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 1CC3C59E14D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

When reading .config input, Kconfig stores user-provided values first and
then resolves the final value after applying dependencies, ranges, and
other constraints.

If the final value differs from the user's input, Kconfig already tracks
that state internally, but it does not provide any focused diagnostic to
show which explicit inputs were adjusted. This is particularly confusing
for requested values that get forced down by unmet dependencies or
clamped by ranges.

Add an opt-in diagnostic controlled by KCONFIG_WARN_CHANGED_INPUT. Emit
the warnings from conf_write() and conf_write_defconfig() after value
resolution and through the existing message callback path so the default
behavior stays unchanged and interactive frontends remain usable.

Avoid the conf_message() formatting buffer for this diagnostic so long
warning lists are not truncated before reaching the callback, and mark
processed symbols as written before the SYMBOL_WRITE check so duplicate
menu nodes cannot emit duplicate warnings.

Document the new environment variable and add tests for both olddefconfig
and savedefconfig.

Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
---
Changes since v1: https://lore.kernel.org/all/20260406233001.1-kconfig-warn-changed-input-pengpeng@iscas.ac.cn/
- rename "found" to "changed_input_found" as suggested by Nicolas
- avoid the conf_message() 4096-byte formatting buffer so long warning
  lists are not truncated before the callback sees them
- mark each processed symbol as SYMBOL_WRITTEN before checking
  SYMBOL_WRITE to avoid duplicate warnings for duplicate menu nodes
- add duplicate-definition selftest coverage
- do not carry the Reviewed-by/Tested-by tags because v2 changes warning
  emission and duplicate suppression

 Documentation/kbuild/kconfig.rst              |   5 +
 scripts/kconfig/confdata.c                    | 107 +++++++++++++++++-
 .../kconfig/tests/warn_changed_input/Kconfig  |  40 +++++++
 .../tests/warn_changed_input/__init__.py      |  27 +++++
 .../kconfig/tests/warn_changed_input/config   |   3 +
 .../tests/warn_changed_input/expected_config  |   6 +
 .../warn_changed_input/expected_defconfig     |   1 +
 .../tests/warn_changed_input/expected_stdout  |   4 +
 8 files changed, 189 insertions(+), 4 deletions(-)
 create mode 100644 scripts/kconfig/tests/warn_changed_input/Kconfig
 create mode 100644 scripts/kconfig/tests/warn_changed_input/__init__.py
 create mode 100644 scripts/kconfig/tests/warn_changed_input/config
 create mode 100644 scripts/kconfig/tests/warn_changed_input/expected_config
 create mode 100644 scripts/kconfig/tests/warn_changed_input/expected_defconfig
 create mode 100644 scripts/kconfig/tests/warn_changed_input/expected_stdout

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
index 9599a0408862..1fe6d3644e79 100644
--- a/scripts/kconfig/confdata.c
+++ b/scripts/kconfig/confdata.c
@@ -206,6 +206,79 @@ static void conf_message(const char *fmt, ...)
 	va_end(ap);
 }
 
+static void conf_message_raw(const char *s)
+{
+	if (conf_message_callback)
+		conf_message_callback(s);
+}
+
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
+					      struct symbol *sym,
+					      bool *changed_input_found)
+{
+	if (!sym_user_value_changed(sym))
+		return;
+
+	if (!*changed_input_found) {
+		str_printf(gs,
+			   "warning: user-provided values changed by Kconfig:\n");
+		*changed_input_found = true;
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
@@ -759,11 +832,15 @@ int conf_write_defconfig(const char *filename)
 {
 	struct symbol *sym;
 	struct menu *menu;
+	struct gstr gs;
 	FILE *out;
+	bool warn_changed_input = conf_warn_changed_input_enabled();
+	bool changed_input_found = false;
 
 	out = fopen(filename, "w");
 	if (!out)
 		return 1;
+	gs = str_new();
 
 	sym_clear_all_valid();
 
@@ -772,10 +849,14 @@ int conf_write_defconfig(const char *filename)
 
 		sym = menu->sym;
 
-		if (!sym || sym_is_choice(sym))
+		if (!sym || sym_is_choice(sym) || sym->flags & SYMBOL_WRITTEN)
 			continue;
 
 		sym_calc_value(sym);
+		if (warn_changed_input)
+			conf_append_changed_input_warning(&gs, sym,
+							  &changed_input_found);
+		sym->flags |= SYMBOL_WRITTEN;
 		if (!(sym->flags & SYMBOL_WRITE))
 			continue;
 		sym->flags &= ~SYMBOL_WRITE;
@@ -798,6 +879,13 @@ int conf_write_defconfig(const char *filename)
 		print_symbol_for_dotconfig(out, sym);
 	}
 	fclose(out);
+
+	conf_clear_written_flags();
+
+	if (changed_input_found)
+		conf_message_raw(str_get(&gs));
+
+	str_free(&gs);
 	return 0;
 }
 
@@ -809,7 +897,10 @@ int conf_write(const char *name)
 	const char *str;
 	char tmpname[PATH_MAX + 1], oldname[PATH_MAX + 1];
 	char *env;
+	struct gstr gs;
 	bool need_newline = false;
+	bool warn_changed_input = conf_warn_changed_input_enabled();
+	bool changed_input_found = false;
 
 	if (!name)
 		name = conf_get_configname();
@@ -838,6 +929,7 @@ int conf_write(const char *name)
 	}
 	if (!out)
 		return 1;
+	gs = str_new();
 
 	conf_write_heading(out, &comment_style_pound);
 
@@ -859,13 +951,16 @@ int conf_write(const char *name)
 		} else if (!sym_is_choice(sym) &&
 			   !(sym->flags & SYMBOL_WRITTEN)) {
 			sym_calc_value(sym);
+			if (warn_changed_input)
+				conf_append_changed_input_warning(&gs, sym,
+								  &changed_input_found);
+			sym->flags |= SYMBOL_WRITTEN;
 			if (!(sym->flags & SYMBOL_WRITE))
 				goto next;
 			if (need_newline) {
 				fprintf(out, "\n");
 				need_newline = false;
 			}
-			sym->flags |= SYMBOL_WRITTEN;
 			print_symbol_for_dotconfig(out, sym);
 		}
 
@@ -892,8 +987,12 @@ int conf_write(const char *name)
 	}
 	fclose(out);
 
-	for_all_symbols(sym)
-		sym->flags &= ~SYMBOL_WRITTEN;
+	conf_clear_written_flags();
+
+	if (changed_input_found)
+		conf_message_raw(str_get(&gs));
+
+	str_free(&gs);
 
 	if (*tmpname) {
 		if (is_same(name, tmpname)) {
diff --git a/scripts/kconfig/tests/warn_changed_input/Kconfig b/scripts/kconfig/tests/warn_changed_input/Kconfig
new file mode 100644
index 000000000000..69845e2f3fb3
--- /dev/null
+++ b/scripts/kconfig/tests/warn_changed_input/Kconfig
@@ -0,0 +1,40 @@
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
+
+config DUP
+	bool "DUP"
+	depends on DEP
+	help
+	  Test duplicate-definition handling for changed-input diagnostics.
+	  The input fragment requests this symbol as built-in.
+	  The duplicate definition below must not produce a duplicate warning.
+	  This keeps the warning output stable for repeated menu entries.
+
+config DUP
+	bool
+	depends on DEP
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
index 000000000000..dbe93ff26408
--- /dev/null
+++ b/scripts/kconfig/tests/warn_changed_input/config
@@ -0,0 +1,3 @@
+CONFIG_A=y
+CONFIG_NUM=30
+CONFIG_DUP=y
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
index 000000000000..9ec8446b4ac2
--- /dev/null
+++ b/scripts/kconfig/tests/warn_changed_input/expected_stdout
@@ -0,0 +1,4 @@
+warning: user-provided values changed by Kconfig:
+  CONFIG_A: y -> n
+  CONFIG_NUM: 30 -> 20
+  CONFIG_DUP: y -> n
-- 
2.50.1 (Apple Git-155)


