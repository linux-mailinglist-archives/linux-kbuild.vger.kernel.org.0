Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B4DE422FE93
	for <lists+linux-kbuild@lfdr.de>; Tue, 28 Jul 2020 02:47:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726265AbgG1Ar6 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 27 Jul 2020 20:47:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49880 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726139AbgG1Ar6 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 27 Jul 2020 20:47:58 -0400
Received: from mail-io1-xd49.google.com (mail-io1-xd49.google.com [IPv6:2607:f8b0:4864:20::d49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E4B5EC061794
        for <linux-kbuild@vger.kernel.org>; Mon, 27 Jul 2020 17:47:57 -0700 (PDT)
Received: by mail-io1-xd49.google.com with SMTP id f22so4562007iof.20
        for <linux-kbuild@vger.kernel.org>; Mon, 27 Jul 2020 17:47:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=4HetzG3g8Z9xp/xTBnXtPpl/4dszw09HZs0Q+wGPsC8=;
        b=u9vnQF4V/qyKolXLmqQ0G1vHdkSfxOPbKu7DfmSCk7kfEw++k3czDeOZhHpAOcYE2t
         0IpWnyzcbgS7SPxe5IPnw+Vu+zdP7rwwfzSWOzmmiVETsgFcdt1AnaPEek2Ze3uoMbgC
         Z8k/RyE2k2ttr6SDKXD3eX9XWa/4RQLyVd3Gwwi388g21Fgt4dCLRIokJr5UeZ+VjIuv
         nzXIE1Y1okjOeR5qUvuo5IN+gtJGcKbNF6C8dQEdxJmmyVCkNNZIzcHIFv290apJqvOl
         1o0NEA5WNLNb1kybaxyXi/ndTVhWM0ijg17B4m+ewYBedKwGwEtfk7Z1870eoLCTl1Y5
         1gew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=4HetzG3g8Z9xp/xTBnXtPpl/4dszw09HZs0Q+wGPsC8=;
        b=W2nO9RZCks8DRmV/t/2fK4ievYPFk06nLuUwyj9RQ0ttYYSHYljXuOTqrJUAAOR45s
         OOXORkVmoS9ovkftEjiz/UiJpRccsFV4pDEMFgTORUO3eAklLZYB3XAxvqEOgx2iL/x2
         pNxxNTPIZN36qFzE/IOCU5wvGByw2oLkue7NNCuPQOfNcQqz6GoGnq58q45cFeVl2K8c
         Sv+D4hSr4L6qEjTniODX6c/e/ZTM/bqSeJP67q2cqYoVhNbbmo1ASFRQ5/ns0hwnds/k
         y6tjPTjiQHryF7rERBBrBejEKKXxDshd8xGttbdwQNsVCnPTECl0gL1P+dzaghPz0m9Q
         ZT6A==
X-Gm-Message-State: AOAM532DQfkcLLUETptZChmOQMN9CD4mIIxBvKhH/cMMsrlClzosV3Q0
        v/9cRXECJHTu++X0kEdc/aKGvoMkgg==
X-Google-Smtp-Source: ABdhPJwanB11idxvpLGtga7cYGjjqhyVEsSJpSbbTR6CMetxZvYqAZhnOkdKED/rMnkSIPuU3kBpZuGHDA==
X-Received: by 2002:a05:6638:134a:: with SMTP id u10mr3164412jad.35.1595897277167;
 Mon, 27 Jul 2020 17:47:57 -0700 (PDT)
Date:   Tue, 28 Jul 2020 00:47:36 +0000
In-Reply-To: <CAKwvOdnni_G2tw+0eCLQQvvdcz97Fy1-cBjzPvLwbBNDu1-KqQ@mail.gmail.com>
Message-Id: <20200728004736.3590053-1-nhuck@google.com>
Mime-Version: 1.0
References: <CAKwvOdnni_G2tw+0eCLQQvvdcz97Fy1-cBjzPvLwbBNDu1-KqQ@mail.gmail.com>
X-Mailer: git-send-email 2.28.0.rc0.142.g3c755180ce-goog
Subject: [PATCH v7] Makefile: Add clang-tidy and static analyzer support to makefile
From:   Nathan Huckleberry <nhuck@google.com>
To:     masahiroy@kernel.org, michal.lkml@markovi.net
Cc:     linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
        clang-built-linux@googlegroups.com, pirama@google.com,
        morbo@google.com, Nathan Huckleberry <nhuck@google.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

This patch adds clang-tidy and the clang static-analyzer as make
targets. The goal of this patch is to make static analysis tools
usable and extendable by any developer or researcher who is familiar
with basic c++.

The current static analysis tools require intimate knowledge of the
internal workings of the static analysis. Clang-tidy and the clang
static analyzers expose an easy to use api and allow users unfamiliar
with clang to write new checks with relative ease.

===Clang-tidy===

Clang-tidy is an easily extendable 'linter' that runs on the AST.
Clang-tidy checks are easy to write and understand. A check consists of
two parts, a matcher and a checker. The matcher is created using a
domain specific language that acts on the AST
(https://clang.llvm.org/docs/LibASTMatchersReference.html).  When AST
nodes are found by the matcher a callback is made to the checker. The
checker can then execute additional checks and issue warnings.

Here is an example clang-tidy check to report functions that have calls
to local_irq_disable without calls to local_irq_enable and vice-versa.
Functions flagged with __attribute((annotation("ignore_irq_balancing")))
are ignored for analysis. (https://reviews.llvm.org/D65828)

===Clang static analyzer===

The clang static analyzer is a more powerful static analysis tool that
uses symbolic execution to find bugs. Currently there is a check that
looks for potential security bugs from invalid uses of kmalloc and
kfree. There are several more general purpose checks that are useful for
the kernel.

The clang static analyzer is well documented and designed to be
extensible.
(https://clang-analyzer.llvm.org/checker_dev_manual.html)
(https://github.com/haoNoQ/clang-analyzer-guide/releases/download/v0.1/clang-analyzer-guide-v0.1.pdf)

The main draw of the clang tools is how accessible they are. The clang
documentation is very nice and these tools are built specifically to be
easily extendable by any developer. They provide an accessible method of
bug-finding and research to people who are not overly familiar with the
kernel codebase.

Signed-off-by: Nathan Huckleberry <nhuck@google.com>
---
Changes v6->v7
* Fix issues with relative paths
* Additional style fixes
 MAINTAINERS                                   |  1 +
 Makefile                                      |  3 +
 scripts/clang-tools/Makefile.clang-tools      | 23 ++++++
 .../{ => clang-tools}/gen_compile_commands.py |  0
 scripts/clang-tools/run-clang-tools.py        | 74 +++++++++++++++++++
 5 files changed, 101 insertions(+)
 create mode 100644 scripts/clang-tools/Makefile.clang-tools
 rename scripts/{ => clang-tools}/gen_compile_commands.py (100%)
 create mode 100755 scripts/clang-tools/run-clang-tools.py

diff --git a/MAINTAINERS b/MAINTAINERS
index 1d4aa7f942de..a444564e5572 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -4198,6 +4198,7 @@ W:	https://clangbuiltlinux.github.io/
 B:	https://github.com/ClangBuiltLinux/linux/issues
 C:	irc://chat.freenode.net/clangbuiltlinux
 F:	Documentation/kbuild/llvm.rst
+F:	scripts/clang-tools/
 K:	\b(?i:clang|llvm)\b
 
 CLEANCACHE API
diff --git a/Makefile b/Makefile
index fe0164a654c7..3e2df010b342 100644
--- a/Makefile
+++ b/Makefile
@@ -747,6 +747,7 @@ KBUILD_CFLAGS	+= $(call cc-option,-fno-allow-store-data-races)
 
 include scripts/Makefile.kcov
 include scripts/Makefile.gcc-plugins
+include scripts/clang-tools/Makefile.clang-tools
 
 ifdef CONFIG_READABLE_ASM
 # Disable optimizations that make assembler listings hard to read.
@@ -1543,6 +1544,8 @@ help:
 	@echo  '  export_report   - List the usages of all exported symbols'
 	@echo  '  headerdep       - Detect inclusion cycles in headers'
 	@echo  '  coccicheck      - Check with Coccinelle'
+	@echo  '  clang-analyzer  - Check with clang static analyzer'
+	@echo  '  clang-tidy      - Check with clang-tidy'
 	@echo  ''
 	@echo  'Tools:'
 	@echo  '  nsdeps          - Generate missing symbol namespace dependencies'
diff --git a/scripts/clang-tools/Makefile.clang-tools b/scripts/clang-tools/Makefile.clang-tools
new file mode 100644
index 000000000000..5c9d76f77595
--- /dev/null
+++ b/scripts/clang-tools/Makefile.clang-tools
@@ -0,0 +1,23 @@
+# SPDX-License-Identifier: GPL-2.0
+#
+# Copyright (C) Google LLC, 2020
+#
+# Author: Nathan Huckleberry <nhuck@google.com>
+#
+PHONY += clang-tidy
+clang-tidy:
+ifdef CONFIG_CC_IS_CLANG
+	$(PYTHON3) scripts/clang-tools/gen_compile_commands.py
+	$(PYTHON3) scripts/clang-tools/run-clang-tools.py clang-tidy compile_commands.json
+else
+	$(error clang-tidy requires CC=clang)
+endif
+
+PHONY += clang-analyzer
+clang-analyzer:
+ifdef CONFIG_CC_IS_CLANG
+	$(PYTHON3) scripts/clang-tools/gen_compile_commands.py
+	$(PYTHON3) scripts/clang-tools/run-clang-tools.py clang-analyzer compile_commands.json
+else
+	$(error clang-analyzer requires CC=clang)
+endif
diff --git a/scripts/gen_compile_commands.py b/scripts/clang-tools/gen_compile_commands.py
similarity index 100%
rename from scripts/gen_compile_commands.py
rename to scripts/clang-tools/gen_compile_commands.py
diff --git a/scripts/clang-tools/run-clang-tools.py b/scripts/clang-tools/run-clang-tools.py
new file mode 100755
index 000000000000..fa7655c7cec0
--- /dev/null
+++ b/scripts/clang-tools/run-clang-tools.py
@@ -0,0 +1,74 @@
+#!/usr/bin/env python
+# SPDX-License-Identifier: GPL-2.0
+#
+# Copyright (C) Google LLC, 2020
+#
+# Author: Nathan Huckleberry <nhuck@google.com>
+#
+"""A helper routine run clang-tidy and the clang static-analyzer on
+compile_commands.json.
+"""
+
+import argparse
+import json
+import multiprocessing
+import os
+import subprocess
+import sys
+
+
+def parse_arguments():
+    """Set up and parses command-line arguments.
+    Returns:
+        args: Dict of parsed args
+        Has keys: [path, type]
+    """
+    usage = """Run clang-tidy or the clang static-analyzer on a
+        compilation database."""
+    parser = argparse.ArgumentParser(description=usage)
+
+    type_help = "Type of analysis to be performed"
+    parser.add_argument("type",
+                        choices=["clang-tidy", "clang-analyzer"],
+                        help=type_help)
+    path_help = "Path to the compilation database to parse"
+    parser.add_argument("path", type=str, help=path_help)
+
+    return parser.parse_args()
+
+
+def init(l, a):
+    global lock
+    global args
+    lock = l
+    args = a
+
+
+def run_analysis(entry):
+    # Disable all checks, then re-enable the ones we want
+    checks = "-checks=-*,"
+    if args.type == "clang-tidy":
+        checks += "linuxkernel-*"
+    else:
+        checks += "clang-analyzer-*"
+    p = subprocess.run(["clang-tidy", "-p", args.path, checks, entry["file"]],
+                       stdout=subprocess.PIPE,
+                       stderr=subprocess.STDOUT,
+                       cwd=entry["directory"])
+    with lock:
+        sys.stderr.buffer.write(p.stdout)
+
+
+def main():
+    args = parse_arguments()
+
+    lock = multiprocessing.Lock()
+    pool = multiprocessing.Pool(initializer=init, initargs=(lock, args))
+    # Read JSON data into the datastore variable
+    with open(args.path, "r") as f:
+        datastore = json.load(f)
+        pool.map(run_analysis, datastore)
+
+
+if __name__ == "__main__":
+    main()
-- 
2.28.0.rc0.142.g3c755180ce-goog

