Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AD436325D88
	for <lists+linux-kbuild@lfdr.de>; Fri, 26 Feb 2021 07:29:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229590AbhBZG1g (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 26 Feb 2021 01:27:36 -0500
Received: from conuserg-11.nifty.com ([210.131.2.78]:62273 "EHLO
        conuserg-11.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229800AbhBZG1d (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 26 Feb 2021 01:27:33 -0500
Received: from oscar.flets-west.jp (softbank126026090165.bbtec.net [126.26.90.165]) (authenticated)
        by conuserg-11.nifty.com with ESMTP id 11Q6PpRG013655;
        Fri, 26 Feb 2021 15:25:51 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-11.nifty.com 11Q6PpRG013655
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1614320752;
        bh=LyrVsIEuYAv9pPkWzpKnN5i3nqD4903BbQ4luSd4oVA=;
        h=From:To:Cc:Subject:Date:From;
        b=qFK5HKo+KVKJB9eUGeGlXiG/Tcu9hegTLgr8FfLR/Aje4OmFpwwd0Of1PUgFGhNQL
         BQ/zZW1TAr96krw28C0Osve41s9fOqnLezUd557BT1ACrvjdENVLQoHPvYgrN3598c
         TLNcjNsgEFtjXilDiCZ4WbtjOnNMgBtEwbGgwwmWAaoakLY1l2Rl4tt0Gk8zO3/UK5
         Ibbaorz8C57m/GztlUPZFPLOwOtRy8zr/bx6+h3mQPP7OxZHidGWVvjB7E8c0mYtAW
         MjhDNmRsrCUkn2RiH8bApD9bqbERBDSvt5nRiXO4h9kI6lLwUZjr3y2kvsGDRGysjj
         w45XBYuGihfTg==
X-Nifty-SrcIP: [126.26.90.165]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     Sami Tolvanen <samitolvanen@google.com>,
        linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Kees Cook <keescook@chromium.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        clang-built-linux@googlegroups.com
Subject: [PATCH v2] kbuild: fix UNUSED_KSYMS_WHITELIST for Clang LTO
Date:   Fri, 26 Feb 2021 15:25:48 +0900
Message-Id: <20210226062548.3334081-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Commit fbe078d397b4 ("kbuild: lto: add a default list of used symbols")
does not work as expected if the .config file has already specified
CONFIG_UNUSED_KSYMS_WHITELIST="my/own/white/list" before enabling
CONFIG_LTO_CLANG.

So, the user-supplied whitelist and LTO-specific white list must be
independent of each other.

I refactored the shell script so CONFIG_MODVERSIONS and CONFIG_CLANG_LTO
handle whitelists in the same way.

Fixes: fbe078d397b4 ("kbuild: lto: add a default list of used symbols")
Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

Changes in v2:
  - Rebase on top of Arnd's patch:
    https://lore.kernel.org/lkml/20210225143456.3829513-1-arnd@kernel.org/

 init/Kconfig                    |  1 -
 scripts/gen_autoksyms.sh        | 35 ++++++++++++++++++++++++---------
 scripts/lto-used-symbollist.txt |  6 ------
 3 files changed, 26 insertions(+), 16 deletions(-)
 delete mode 100644 scripts/lto-used-symbollist.txt

diff --git a/init/Kconfig b/init/Kconfig
index 719871f8727c..64c32300d1b4 100644
--- a/init/Kconfig
+++ b/init/Kconfig
@@ -2283,7 +2283,6 @@ config TRIM_UNUSED_KSYMS
 config UNUSED_KSYMS_WHITELIST
 	string "Whitelist of symbols to keep in ksymtab"
 	depends on TRIM_UNUSED_KSYMS
-	default "scripts/lto-used-symbollist.txt" if LTO_CLANG
 	help
 	  By default, all unused exported symbols will be un-exported from the
 	  build when TRIM_UNUSED_KSYMS is selected.
diff --git a/scripts/gen_autoksyms.sh b/scripts/gen_autoksyms.sh
index d54dfba15bf2..da320151e7c3 100755
--- a/scripts/gen_autoksyms.sh
+++ b/scripts/gen_autoksyms.sh
@@ -19,7 +19,26 @@ esac
 # We need access to CONFIG_ symbols
 . include/config/auto.conf
 
-ksym_wl=/dev/null
+needed_symbols=
+
+# Special case for modversions (see modpost.c)
+if [ -n "$CONFIG_MODVERSIONS" ]; then
+	needed_symbols="$needed_symbols module_layout"
+fi
+
+# With CONFIG_LTO_CLANG, LLVM bitcode has not yet been compiled into a binary
+# when the .mod files are generated, which means they don't yet contain
+# references to certain symbols that will be present in the final binaries.
+if [ -n "$CONFIG_LTO_CLANG" ]; then
+	# intrinsic functions
+	needed_symbols="$needed_symbols memcpy memmove memset"
+	# ftrace
+	needed_symbols="$needed_symbols _mcount"
+	# stack protector symbols
+	needed_symbols="$needed_symbols __stack_chk_fail __stack_chk_guard"
+fi
+
+ksym_wl=
 if [ -n "$CONFIG_UNUSED_KSYMS_WHITELIST" ]; then
 	# Use 'eval' to expand the whitelist path and check if it is relative
 	eval ksym_wl="$CONFIG_UNUSED_KSYMS_WHITELIST"
@@ -40,16 +59,14 @@ cat > "$output_file" << EOT
 EOT
 
 [ -f modules.order ] && modlist=modules.order || modlist=/dev/null
-sed 's/ko$/mod/' $modlist |
-xargs -n1 sed -n -e '2{s/ /\n/g;/^$/!p;}' -- |
-cat - "$ksym_wl" |
+
+{
+	sed 's/ko$/mod/' $modlist | xargs -n1 sed -n -e '2p'
+	echo "$needed_symbols"
+	[ -n "$ksym_wl" ] && cat "$ksym_wl"
+} | sed -e 's/ /\n/g' | sed -n -e '/^$/!p' |
 # Remove the dot prefix for ppc64; symbol names with a dot (.) hold entry
 # point addresses.
 sed -e 's/^\.//' |
 sort -u |
 sed -e 's/\(.*\)/#define __KSYM_\1 1/' >> "$output_file"
-
-# Special case for modversions (see modpost.c)
-if [ -n "$CONFIG_MODVERSIONS" ]; then
-	echo "#define __KSYM_module_layout 1" >> "$output_file"
-fi
diff --git a/scripts/lto-used-symbollist.txt b/scripts/lto-used-symbollist.txt
deleted file mode 100644
index 406ada65e926..000000000000
--- a/scripts/lto-used-symbollist.txt
+++ /dev/null
@@ -1,6 +0,0 @@
-memcpy
-memmove
-memset
-_mcount
-__stack_chk_fail
-__stack_chk_guard
-- 
2.27.0

