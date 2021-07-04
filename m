Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BC75A3BAED6
	for <lists+linux-kbuild@lfdr.de>; Sun,  4 Jul 2021 22:28:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229958AbhGDUbR (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sun, 4 Jul 2021 16:31:17 -0400
Received: from mail.kernel.org ([198.145.29.99]:36636 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229700AbhGDUbR (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 4 Jul 2021 16:31:17 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id DCC02613DD;
        Sun,  4 Jul 2021 20:28:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1625430521;
        bh=m+N+kWu9QnC8/oJLn9QlfD8aEmFoNYOKLG0X1ns5HQo=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=QVUqGzKRzRlasVwCpPmI16mEJbewqZXLZSoWs128jwmHqyvCiVmhykFswPaYakvWc
         S52pDhRJYeKFzvZhlEXkCEtAAjwMzB/KjXSGo07V9LUOwlGHgP9PKAg8A6W+xJDaXQ
         5FWw3R7nrTX12Y4cfkjRu0JVM00LBImMMJgPv2SBAvQprP8AXpUSEhCpHT7SAhLoxV
         MQv1GYpqgk3DxdfOY6VjRzz+Sg5nwjgWEVBQyp2bahtoU/JS8hf9m6mxLZcTtPME4p
         EfNCrSnSEoyTbR82uIqUmpaAPzqNlnfhF1Kbc8nQ5GSWhmKQ+VtIq2bf7SOlmyw7iW
         NHsCdxVs4v9NA==
From:   ojeda@kernel.org
To:     Linus Torvalds <torvalds@linux-foundation.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     rust-for-linux@vger.kernel.org, linux-kbuild@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Miguel Ojeda <ojeda@kernel.org>,
        Alex Gaynor <alex.gaynor@gmail.com>,
        Geoffrey Thomas <geofft@ldpreload.com>,
        Finn Behrens <me@kloenk.de>,
        Adam Bratschi-Kaye <ark.email@gmail.com>,
        Wedson Almeida Filho <wedsonaf@google.com>
Subject: [PATCH 02/17] kallsyms: increase maximum kernel symbol length to 512
Date:   Sun,  4 Jul 2021 22:27:41 +0200
Message-Id: <20210704202756.29107-3-ojeda@kernel.org>
In-Reply-To: <20210704202756.29107-1-ojeda@kernel.org>
References: <20210704202756.29107-1-ojeda@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

From: Miguel Ojeda <ojeda@kernel.org>

Rust symbols can become quite long due to namespacing introduced
by modules, types, traits, generics, etc. For instance, for:

    pub mod my_module {
        pub struct MyType;
        pub struct MyGenericType<T>(T);

        pub trait MyTrait {
            fn my_method() -> u32;
        }

        impl MyTrait for MyGenericType<MyType> {
            fn my_method() -> u32 {
                42
            }
        }
    }

generates a symbol of length 96 when using the upcoming v0 mangling scheme:

    _RNvXNtCshGpAVYOtgW1_7example9my_moduleINtB2_13MyGenericTypeNtB2_6MyTypeENtB2_7MyTrait9my_method

At the moment, Rust symbols may reach up to 300 in length.
Setting 512 as the maximum seems like a reasonable choice to
keep some headroom.

Co-developed-by: Alex Gaynor <alex.gaynor@gmail.com>
Signed-off-by: Alex Gaynor <alex.gaynor@gmail.com>
Co-developed-by: Geoffrey Thomas <geofft@ldpreload.com>
Signed-off-by: Geoffrey Thomas <geofft@ldpreload.com>
Co-developed-by: Finn Behrens <me@kloenk.de>
Signed-off-by: Finn Behrens <me@kloenk.de>
Co-developed-by: Adam Bratschi-Kaye <ark.email@gmail.com>
Signed-off-by: Adam Bratschi-Kaye <ark.email@gmail.com>
Co-developed-by: Wedson Almeida Filho <wedsonaf@google.com>
Signed-off-by: Wedson Almeida Filho <wedsonaf@google.com>
Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
---
 include/linux/kallsyms.h            | 2 +-
 kernel/livepatch/core.c             | 4 ++--
 scripts/kallsyms.c                  | 2 +-
 tools/include/linux/kallsyms.h      | 2 +-
 tools/include/linux/lockdep.h       | 2 +-
 tools/lib/perf/include/perf/event.h | 2 +-
 tools/lib/symbol/kallsyms.h         | 2 +-
 7 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/include/linux/kallsyms.h b/include/linux/kallsyms.h
index 465060acc98..5cdc6903abc 100644
--- a/include/linux/kallsyms.h
+++ b/include/linux/kallsyms.h
@@ -14,7 +14,7 @@
 
 #include <asm/sections.h>
 
-#define KSYM_NAME_LEN 128
+#define KSYM_NAME_LEN 512
 #define KSYM_SYMBOL_LEN (sizeof("%s+%#lx/%#lx [%s]") + (KSYM_NAME_LEN - 1) + \
 			 2*(BITS_PER_LONG*3/10) + (MODULE_NAME_LEN - 1) + 1)
 
diff --git a/kernel/livepatch/core.c b/kernel/livepatch/core.c
index 335d988bd81..73874e5edfd 100644
--- a/kernel/livepatch/core.c
+++ b/kernel/livepatch/core.c
@@ -213,7 +213,7 @@ static int klp_resolve_symbols(Elf64_Shdr *sechdrs, const char *strtab,
 	 * we use the smallest/strictest upper bound possible (56, based on
 	 * the current definition of MODULE_NAME_LEN) to prevent overflows.
 	 */
-	BUILD_BUG_ON(MODULE_NAME_LEN < 56 || KSYM_NAME_LEN != 128);
+	BUILD_BUG_ON(MODULE_NAME_LEN < 56 || KSYM_NAME_LEN != 512);
 
 	relas = (Elf_Rela *) relasec->sh_addr;
 	/* For each rela in this klp relocation section */
@@ -227,7 +227,7 @@ static int klp_resolve_symbols(Elf64_Shdr *sechdrs, const char *strtab,
 
 		/* Format: .klp.sym.sym_objname.sym_name,sympos */
 		cnt = sscanf(strtab + sym->st_name,
-			     ".klp.sym.%55[^.].%127[^,],%lu",
+			     ".klp.sym.%55[^.].%511[^,],%lu",
 			     sym_objname, sym_name, &sympos);
 		if (cnt != 3) {
 			pr_err("symbol %s has an incorrectly formatted name\n",
diff --git a/scripts/kallsyms.c b/scripts/kallsyms.c
index bcdabee13aa..9bab5f55ade 100644
--- a/scripts/kallsyms.c
+++ b/scripts/kallsyms.c
@@ -27,7 +27,7 @@
 
 #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof(arr[0]))
 
-#define KSYM_NAME_LEN		128
+#define KSYM_NAME_LEN		512
 
 struct sym_entry {
 	unsigned long long addr;
diff --git a/tools/include/linux/kallsyms.h b/tools/include/linux/kallsyms.h
index efb6c3f5f2a..5a37ccbec54 100644
--- a/tools/include/linux/kallsyms.h
+++ b/tools/include/linux/kallsyms.h
@@ -6,7 +6,7 @@
 #include <stdio.h>
 #include <unistd.h>
 
-#define KSYM_NAME_LEN 128
+#define KSYM_NAME_LEN 512
 
 struct module;
 
diff --git a/tools/include/linux/lockdep.h b/tools/include/linux/lockdep.h
index e56997288f2..d9c163f3ab2 100644
--- a/tools/include/linux/lockdep.h
+++ b/tools/include/linux/lockdep.h
@@ -47,7 +47,7 @@ static inline int debug_locks_off(void)
 
 #define task_pid_nr(tsk) ((tsk)->pid)
 
-#define KSYM_NAME_LEN 128
+#define KSYM_NAME_LEN 512
 #define printk(...) dprintf(STDOUT_FILENO, __VA_ARGS__)
 #define pr_err(format, ...) fprintf (stderr, format, ## __VA_ARGS__)
 #define pr_warn pr_err
diff --git a/tools/lib/perf/include/perf/event.h b/tools/lib/perf/include/perf/event.h
index 4d0c02ba3f7..095d60144a7 100644
--- a/tools/lib/perf/include/perf/event.h
+++ b/tools/lib/perf/include/perf/event.h
@@ -95,7 +95,7 @@ struct perf_record_throttle {
 };
 
 #ifndef KSYM_NAME_LEN
-#define KSYM_NAME_LEN 256
+#define KSYM_NAME_LEN 512
 #endif
 
 struct perf_record_ksymbol {
diff --git a/tools/lib/symbol/kallsyms.h b/tools/lib/symbol/kallsyms.h
index 72ab9870454..542f9b059c3 100644
--- a/tools/lib/symbol/kallsyms.h
+++ b/tools/lib/symbol/kallsyms.h
@@ -7,7 +7,7 @@
 #include <linux/types.h>
 
 #ifndef KSYM_NAME_LEN
-#define KSYM_NAME_LEN 256
+#define KSYM_NAME_LEN 512
 #endif
 
 static inline u8 kallsyms2elf_binding(char type)
-- 
2.32.0

