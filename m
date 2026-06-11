Return-Path: <linux-kbuild+bounces-13703-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id n0ZwLj9PKmqjmwMAu9opvQ
	(envelope-from <linux-kbuild+bounces-13703-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Thu, 11 Jun 2026 08:01:35 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BF6866EDDC
	for <lists+linux-kbuild@lfdr.de>; Thu, 11 Jun 2026 08:01:35 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	dmarc=none;
	spf=pass (mail.lfdr.de: domain of "linux-kbuild+bounces-13703-lists+linux-kbuild=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-kbuild+bounces-13703-lists+linux-kbuild=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5A9C43047765
	for <lists+linux-kbuild@lfdr.de>; Thu, 11 Jun 2026 06:00:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 48418355F46;
	Thu, 11 Jun 2026 06:00:12 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from cstnet.cn (smtp21.cstnet.cn [159.226.251.21])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4411334EEEE;
	Thu, 11 Jun 2026 06:00:08 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781157612; cv=none; b=aNmMnC/HhldWr/FyWTeK36LxgAlKcHjjV1tAXakXTl6Odtc3t3lXe7VDxgpuxoXlgaFIo7GLEAamv6bs77daP/Joq7RZZdnoUhi+AmjUeg78kg1Buu/EYjcZL3pFRvEO6j6cRR8EIYJFwyJ1JjmjQ8cRKI+dn12LZKRv9rwSeL8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781157612; c=relaxed/simple;
	bh=dYJQGbMTBOzCcpM0eOtwPLkai5WCxf5YM54gMHXRaBg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XAtILqhMlaZcEk1zm7ccyPkmtuXVpoShLfV6kxaQX7IV2DIv0PqSn3meUzB7asfiWuS8TNwHYWB6MU7b3IynS1P8VnT2r0uFvFmG9Vi29yD59AF06Hv+FqZiMCiQIgMVTCDnLGMTW7ZdNz9W/cik3++R7Qil4pZ4HqcTc2TkgVw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.21
Received: from localhost.localdomain (unknown [111.196.245.140])
	by APP-01 (Coremail) with SMTP id qwCowABnCdLiTipqti1FAQ--.55092S2;
	Thu, 11 Jun 2026 14:00:02 +0800 (CST)
From: Pengpeng Hou <pengpeng@iscas.ac.cn>
To: Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas.schier@linux.dev>
Cc: Jonathan Corbet <corbet@lwn.net>,
	linux-kbuild@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Pengpeng Hou <pengpeng@iscas.ac.cn>
Subject: [PATCH v3] kconfig: add optional warnings for changed input values
Date: Thu, 11 Jun 2026 14:00:00 +0800
Message-ID: <20260611060000.23858-1-pengpeng@iscas.ac.cn>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qwCowABnCdLiTipqti1FAQ--.55092S2
X-Coremail-Antispam: 1UD129KBjvAXoW3CrWDtrWrtF13KF17Kw1DGFg_yoW8JFWfGo
	Z3WFn8Xw4xKr129wn7JwnIk3y7Wa1jkrWrXr47Jw4DXF1aq3WrC3W0yw4DZ3W5ZFWFy3W3
	XF13W3yfW3W7JFn7n29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7v73VFW2AGmfu7bjvjm3
	AaLaJ3UjIYCTnIWjp_UUUYF7AC8VAFwI0_Gr0_Xr1l1xkIjI8I6I8E6xAIw20EY4v20xva
	j40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2
	x7M28EF7xvwVC0I7IYx2IY67AKxVW5JVW7JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVWx
	JVW8Jr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I8E87Iv6xkF7I0E14v26r
	xl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj
	6xIIjxv20xvE14v26r106r15McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr
	0_Gr1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7MxkF7I0En4kS14v2
	6r126r1DMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrV
	AFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCI
	c40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267
	AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_
	Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7VU18sqt
	UUUUU==
X-CM-SenderInfo: pshqw1xhqjqxpvfd2hldfou0/
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.04 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-13703-lists,linux-kbuild=lfdr.de];
	DMARC_NA(0.00)[iscas.ac.cn];
	FORGED_RECIPIENTS(0.00)[m:masahiroy@kernel.org,m:nathan@kernel.org,m:nicolas.schier@linux.dev,m:corbet@lwn.net,m:linux-kbuild@vger.kernel.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:pengpeng@iscas.ac.cn,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[pengpeng@iscas.ac.cn,linux-kbuild@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[pengpeng@iscas.ac.cn,linux-kbuild@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	R_DKIM_NA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	RCPT_COUNT_SEVEN(0.00)[8];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp,iscas.ac.cn:email,iscas.ac.cn:mid,iscas.ac.cn:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3BF6866EDDC

When reading .config input, Kconfig stores user-provided values first
and then resolves the final value after applying dependencies, ranges,
and other constraints.

If the final value differs from the user input, Kconfig already tracks
that state internally, but it does not provide a focused diagnostic to
show which explicit inputs were adjusted. This is particularly confusing
for requested values that get forced down by unmet dependencies or
clamped by ranges.

Add an opt-in diagnostic controlled by KCONFIG_WARN_CHANGED_INPUT. Emit
the warnings from conf_write() and conf_write_defconfig() after value
resolution. Print the diagnostic to stderr directly, not through the
normal message callback, so it remains visible when conf is run with -s,
such as from make -s.

Keep the diagnostic out of the conf_message() formatting buffer so long
warning lists are not truncated, and mark processed symbols as written
before the SYMBOL_WRITE check so duplicate menu nodes cannot emit
duplicate warnings.

Document the new environment variable and add tests for olddefconfig,
savedefconfig, and the silent-conf path.

Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
---
Changes since v2:
https://lore.kernel.org/all/20260521022824.38591-1-pengpeng@iscas.ac.cn/
- print the changed-input diagnostic to stderr directly so it remains
  visible when conf is run with -s, as reported by Nathan
- move the selftest expectation from stdout to stderr
- add explicit silent-conf coverage for the KCONFIG_WARN_CHANGED_INPUT
  warning path
- keep Nicolas's v2 Reviewed-by/Tested-by out of this revision because
  the warning output path changed

 Documentation/kbuild/kconfig.rst              |   5 +
 scripts/kconfig/confdata.c                    | 106 +++++++++++++++++-
 scripts/kconfig/tests/conftest.py             |   8 +-
 .../kconfig/tests/warn_changed_input/Kconfig  |  40 +++++++
 .../tests/warn_changed_input/__init__.py      |  33 ++++++
 .../kconfig/tests/warn_changed_input/config   |   3 +
 .../tests/warn_changed_input/expected_config  |   6 +
 .../warn_changed_input/expected_defconfig     |   1 +
 .../tests/warn_changed_input/expected_stderr  |   4 +
 9 files changed, 200 insertions(+), 6 deletions(-)
 create mode 100644 scripts/kconfig/tests/warn_changed_input/Kconfig
 create mode 100644 scripts/kconfig/tests/warn_changed_input/__init__.py
 create mode 100644 scripts/kconfig/tests/warn_changed_input/config
 create mode 100644 scripts/kconfig/tests/warn_changed_input/expected_config
 create mode 100644 scripts/kconfig/tests/warn_changed_input/expected_defconfig
 create mode 100644 scripts/kconfig/tests/warn_changed_input/expected_stderr

diff --git a/Documentation/kbuild/kconfig.rst b/Documentation/kbuild/kconfig.rst
index fc4e845bc249..9b2625c768f0 100644
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
index ac95661a1c9d..34be06d4b563 100644
--- a/scripts/kconfig/confdata.c
+++ b/scripts/kconfig/confdata.c
@@ -206,6 +206,78 @@ static void conf_message(const char *fmt, ...)
 	va_end(ap);
 }
 
+static void conf_changed_input_warning(const char *s)
+{
+	fputs(s, stderr);
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
@@ -759,11 +831,15 @@ int conf_write_defconfig(const char *filename)
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
 
@@ -772,10 +848,14 @@ int conf_write_defconfig(const char *filename)
 
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
@@ -798,6 +878,13 @@ int conf_write_defconfig(const char *filename)
 		print_symbol_for_dotconfig(out, sym);
 	}
 	fclose(out);
+
+	conf_clear_written_flags();
+
+	if (changed_input_found)
+		conf_changed_input_warning(str_get(&gs));
+
+	str_free(&gs);
 	return 0;
 }
 
@@ -809,7 +896,10 @@ int conf_write(const char *name)
 	const char *str;
 	char tmpname[PATH_MAX + 1], oldname[PATH_MAX + 1];
 	char *env;
+	struct gstr gs;
 	bool need_newline = false;
+	bool warn_changed_input = conf_warn_changed_input_enabled();
+	bool changed_input_found = false;
 
 	if (!name)
 		name = conf_get_configname();
@@ -838,6 +928,7 @@ int conf_write(const char *name)
 	}
 	if (!out)
 		return 1;
+	gs = str_new();
 
 	conf_write_heading(out, &comment_style_pound);
 
@@ -859,13 +950,16 @@ int conf_write(const char *name)
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
 
@@ -892,8 +986,12 @@ int conf_write(const char *name)
 	}
 	fclose(out);
 
-	for_all_symbols(sym)
-		sym->flags &= ~SYMBOL_WRITTEN;
+	conf_clear_written_flags();
+
+	if (changed_input_found)
+		conf_changed_input_warning(str_get(&gs));
+
+	str_free(&gs);
 
 	if (*tmpname) {
 		if (is_same(name, tmpname)) {
diff --git a/scripts/kconfig/tests/conftest.py b/scripts/kconfig/tests/conftest.py
index 2a2a7e2da060..87860b1bfd9f 100644
--- a/scripts/kconfig/tests/conftest.py
+++ b/scripts/kconfig/tests/conftest.py
@@ -37,7 +37,8 @@ class Conf:
 
     # runners
     def _run_conf(self, mode, dot_config=None, out_file='.config',
-                  interactive=False, in_keys=None, extra_env={}):
+                  interactive=False, in_keys=None, extra_env={},
+                  silent=False):
         """Run text-based Kconfig executable and save the result.
 
         mode: input mode option (--oldaskconfig, --defconfig=<file> etc.)
@@ -48,7 +49,10 @@ class Conf:
         extra_env: additional environments
         returncode: exit status of the Kconfig executable
         """
-        command = [CONF_PATH, mode, 'Kconfig']
+        command = [CONF_PATH]
+        if silent:
+            command.append('-s')
+        command += [mode, 'Kconfig']
 
         # Override 'srctree' environment to make the test as the top directory
         extra_env['srctree'] = self._test_dir
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
index 000000000000..4c3bca6af846
--- /dev/null
+++ b/scripts/kconfig/tests/warn_changed_input/__init__.py
@@ -0,0 +1,33 @@
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
+    assert 'user-provided values changed by Kconfig' not in conf.stderr
+
+    assert conf._run_conf('--olddefconfig', dot_config='config',
+                          extra_env={
+                              'KCONFIG_WARN_CHANGED_INPUT': '1',
+                          }) == 0
+    assert conf.stderr_contains('expected_stderr')
+    assert conf.config_matches('expected_config')
+
+    assert conf._run_conf('--olddefconfig', dot_config='config',
+                          extra_env={
+                              'KCONFIG_WARN_CHANGED_INPUT': '1',
+                          }, silent=True) == 0
+    assert conf.stderr_contains('expected_stderr')
+
+    assert conf._run_conf('--savedefconfig=defconfig', dot_config='config',
+                          out_file='defconfig',
+                          extra_env={
+                              'KCONFIG_WARN_CHANGED_INPUT': '1',
+                          }) == 0
+    assert conf.stderr_contains('expected_stderr')
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
diff --git a/scripts/kconfig/tests/warn_changed_input/expected_stderr b/scripts/kconfig/tests/warn_changed_input/expected_stderr
new file mode 100644
index 000000000000..9ec8446b4ac2
--- /dev/null
+++ b/scripts/kconfig/tests/warn_changed_input/expected_stderr
@@ -0,0 +1,4 @@
+warning: user-provided values changed by Kconfig:
+  CONFIG_A: y -> n
+  CONFIG_NUM: 30 -> 20
+  CONFIG_DUP: y -> n
-- 
2.50.1 (Apple Git-155)


