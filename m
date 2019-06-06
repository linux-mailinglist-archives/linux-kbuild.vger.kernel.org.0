Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0072C37ED4
	for <lists+linux-kbuild@lfdr.de>; Thu,  6 Jun 2019 22:30:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725784AbfFFUaN (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 6 Jun 2019 16:30:13 -0400
Received: from mail-it1-f195.google.com ([209.85.166.195]:51069 "EHLO
        mail-it1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727017AbfFFUaN (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 6 Jun 2019 16:30:13 -0400
Received: by mail-it1-f195.google.com with SMTP id a186so2135656itg.0
        for <linux-kbuild@vger.kernel.org>; Thu, 06 Jun 2019 13:30:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=CMffxpzzNeHPnyHxq1DkhRwOhkIOW8SKyDW+whl/MBM=;
        b=LNCjE7ZroqyYbWBkBxyLftTFqv8ooPNexUhuVqcbnGoXeZEiuGJCy2CHT+FaQUdCC0
         dguO9W4gajtKWHjb+/8VUG+FCuzfUNrp9Tui6irD9ewHiMbldRFGJ6YhQESbPw1ioV0P
         2iecLE6raDsvrflU0W8WA1tJ+W1+nokkS0N4M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=CMffxpzzNeHPnyHxq1DkhRwOhkIOW8SKyDW+whl/MBM=;
        b=fpZ6A1BqXhDUPPBbfVQwKNlwpZR7LxpL950RoH+479lO5H/zl78RpkM+++8XD0Be0p
         hLwpl16zB+K0LrN+YGdCy4icHFhl76MbOhkQF9S2KokTbn1nkpLbZfvbVqmq3YKAd8J3
         Mb/g2ncfyCPAwVmk2k8Z3X1UZOdOIzaoJFfjqXBoOn36Beh2hbho6Mxbx8GJ5PunkdTZ
         D0p0x6HLlvsyLyRunrfYF8UYDtMKhbOCOI1ntqbZPDxaqDTDqSGG2Rv5kIUTNSFYMHYk
         tOBFWCkH4BWHewqmRYXaXuCpxCMjIGx/FOVpTJRtcKMsobA4Q3rR4chyL2fTAJHjtYcR
         5k5g==
X-Gm-Message-State: APjAAAURj1QMr/MlE3b6hv+bzfoLaUxub686klF5/Hb7/TKB6GzAYWDX
        //ZWWnQHMYR9MPYb4Xzn/CsH6Q==
X-Google-Smtp-Source: APXvYqwLM54vHHQKeM7hNiAZxdj6iSn3l/ZcdXxvNkqtY7eYrBYhgAUkxItdVGznXuRPoCHUUgeEVA==
X-Received: by 2002:a24:5710:: with SMTP id u16mr1536035ita.67.1559853012190;
        Thu, 06 Jun 2019 13:30:12 -0700 (PDT)
Received: from localhost ([2620:15c:183:0:20b8:dee7:5447:d05])
        by smtp.gmail.com with ESMTPSA id j23sm1039331ioo.6.2019.06.06.13.30.10
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 06 Jun 2019 13:30:11 -0700 (PDT)
From:   Raul E Rangel <rrangel@chromium.org>
To:     yamada.masahiro@socionext.com
Cc:     mka@chromium.org, ndesaulniers@google.com, zwisler@chromium.org,
        Raul E Rangel <rrangel@chromium.org>,
        Joe Lawrence <joe.lawrence@redhat.com>,
        Kees Cook <keescook@chromium.org>,
        linux-kbuild@vger.kernel.org, Petr Mladek <pmladek@suse.com>,
        linux-kernel@vger.kernel.org,
        Michal Marek <michal.lkml@markovi.net>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Changbin Du <changbin.du@intel.com>,
        Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
        Sri Krishna chowdary <schowdary@nvidia.com>,
        Matthew Wilcox <willy@infradead.org>,
        Mikulas Patocka <mpatocka@redhat.com>,
        Andrew Morton <akpm@linux-foundation.org>
Subject: [RFC PATCH] kbuild: Add option to generate a Compilation Database
Date:   Thu,  6 Jun 2019 14:30:03 -0600
Message-Id: <20190606203003.112040-1-rrangel@chromium.org>
X-Mailer: git-send-email 2.22.0.rc1.311.g5d7573a151-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Clang tooling requires a compilation database to figure out the build
options for each file. This enables tools like clang-tidy and
clang-check.

See https://clang.llvm.org/docs/HowToSetupToolingForLLVM.html for more
information.

Normally cmake is used to generate the compilation database, but the
linux kernel uses make. Another option is using
[BEAR](https://github.com/rizsotto/Bear) which instruments
exec to find clang invocations and generate the database that way.

Clang 4.0.0 added the -MJ option to generate the json for each
compilation unit. https://reviews.llvm.org/D27140

This patch takes advantage of the -MJ option. So it only works for
Clang.

Signed-off-by: Raul E Rangel <rrangel@chromium.org>
---
I have a couple TODOs in the code that I would like some feedback on.
Specifically why extra-y doesn't seem to work in the root Makefile.
Also, is there a way to add the correct list of prerequisites to the
compile_commands.json target?

Thanks,
Raul


 Makefile               | 20 ++++++++++++++++++++
 lib/Kconfig.debug      |  7 +++++++
 scripts/Makefile.build |  9 ++++++++-
 3 files changed, 35 insertions(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index a61a95b6b38f7..06067ee18ff64 100644
--- a/Makefile
+++ b/Makefile
@@ -1663,6 +1663,26 @@ quiet_cmd_tags = GEN     $@
 tags TAGS cscope gtags: FORCE
 	$(call cmd,tags)
 
+# Compilation Database
+# ---------------------------------------------------------------------------
+# Generates a compilation database that can be used with the LLVM tools
+ifdef CONFIG_COMPILATION_DATABASE
+
+quiet_cmd_compilation_db = GEN   $@
+cmd_compilation_db = (echo '['; \
+	find "$(@D)" -mindepth 2 -iname '*.json' -print0 | xargs -0 cat; \
+	echo ']') > "$(@D)/$(@F)"
+
+# Make sure the database is built when calling `make` without a target.
+# TODO: Using extra-y doesn't seem to work.
+_all: $(obj)/compile_commands.json
+
+# TODO: Is there a variable that contains all the object files created by
+# cmd_cc_o_c? Depending on `all` is kind of a hack
+$(obj)/compile_commands.json: all FORCE
+	$(call if_changed,compilation_db)
+endif
+
 # Scripts to check various things for consistency
 # ---------------------------------------------------------------------------
 
diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
index eae43952902eb..46fceb1fff3d9 100644
--- a/lib/Kconfig.debug
+++ b/lib/Kconfig.debug
@@ -238,6 +238,13 @@ config GDB_SCRIPTS
 	  instance. See Documentation/dev-tools/gdb-kernel-debugging.rst
 	  for further details.
 
+config COMPILATION_DATABASE
+	bool "Generate a compilation database"
+	depends on CLANG_VERSION >= 40000
+	help
+	  This creates a JSON Compilation Database (compile_commands.json)
+	  that is used by the clang tooling (clang-tidy, clang-check, etc).
+
 config ENABLE_MUST_CHECK
 	bool "Enable __must_check logic"
 	default y
diff --git a/scripts/Makefile.build b/scripts/Makefile.build
index ae9cf740633e1..0017bf397292d 100644
--- a/scripts/Makefile.build
+++ b/scripts/Makefile.build
@@ -145,8 +145,15 @@ $(obj)/%.ll: $(src)/%.c FORCE
 # The C file is compiled and updated dependency information is generated.
 # (See cmd_cc_o_c + relevant part of rule_cc_o_c)
 
+ifdef CONFIG_COMPILATION_DATABASE
+# TODO: Should we store the json in a temp variable and only copy it to the
+# final name when the content is different? In theory we could avoid having to
+# generate the compilation db if the json did not change.
+compdb_flags = -MJ $(@D)/.$(@F).json
+endif
+
 quiet_cmd_cc_o_c = CC $(quiet_modtag)  $@
-      cmd_cc_o_c = $(CC) $(c_flags) -c -o $@ $<
+      cmd_cc_o_c = $(CC) $(c_flags) $(compdb_flags) -c -o $@ $<
 
 ifdef CONFIG_MODVERSIONS
 # When module versioning is enabled the following steps are executed:
-- 
2.22.0.rc1.311.g5d7573a151-goog

