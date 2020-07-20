Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E064D2272F8
	for <lists+linux-kbuild@lfdr.de>; Tue, 21 Jul 2020 01:35:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727812AbgGTXfy (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 20 Jul 2020 19:35:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55704 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726546AbgGTXfy (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 20 Jul 2020 19:35:54 -0400
Received: from mail-qk1-x749.google.com (mail-qk1-x749.google.com [IPv6:2607:f8b0:4864:20::749])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0DE3BC0619D2
        for <linux-kbuild@vger.kernel.org>; Mon, 20 Jul 2020 16:35:54 -0700 (PDT)
Received: by mail-qk1-x749.google.com with SMTP id d131so1704841qke.3
        for <linux-kbuild@vger.kernel.org>; Mon, 20 Jul 2020 16:35:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=mWZKxoXF+Te4mputAXDqqY/dB7J/WdxovoeFbRYCpJE=;
        b=BPWrYBNdCpvomKbvbfjEbSAdblRizGHuyW5dY45HKa322xgYaY/sm+HtpMmj6ecl76
         V6sKB9ShyFPOBnmNZR+e2xDwaoFEK14gADm5ZTXyF/8jAdOoNDsV6X8hBG0S5gcy0UEn
         MAykzdzJG988ri6fvw63K0xPtLXwFvu+QeCiwDoIMNTwjB1csx0kioT/e3uKf7B9hRG0
         J1MwnYMuYH61W2DDgfpsX18rhUj3jsDqNI29Thi1J5K96yeHR9gLq2JQlSxOdcRq/9Nv
         jZaPP5em0A1C7bxv8xKqzqUxaV/mdQXs45xWaAUW5Cnrbi1Y5baEebOcLbBWoMKfFuDw
         1qgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=mWZKxoXF+Te4mputAXDqqY/dB7J/WdxovoeFbRYCpJE=;
        b=Cxhd+38FZ5s9jQAEAaBqp3MMDdubJMQkIdHU7QCMUOvbs0am8QouTXbajoyyfRZMm9
         8H9b+CrEstkEMnvh/ll11msEKcpMRPMfdVXfDkMeakzs4UxU81YMgRSkuO7qUp46nQhX
         OEDPboo42bNzyWD/5T2g4HT87K508m8/U3M/Ao9ygjHn0asfSB3CdBeWim6hjj++E9JZ
         I6Qj/banVVs2PdM8VWu7jJgGEswbwReHfVBD8pEtLD3z12zMXx+rOJTRrjhBHZAv89KA
         4qk1aXbmvCEP4Oiq27NnXkpdOxXwPmtOWfdx0QBn5vELEuL99VY2/17Jb4gY5ab0/tha
         LIQQ==
X-Gm-Message-State: AOAM530o6QzvR0cu1QBDb5Ct/3x82ZcBUTC7z1dx+U1yfB6gLUjniUET
        6rvQ0xiGVWmNg5/h0TRHshpspGm4Fg==
X-Google-Smtp-Source: ABdhPJwGaO3uhph1uxr+J5X4e2l7YlefI4N3GagUCSD7uY2LFCwUoB4QTy0qpnD+OtptSPOlK3MYP+qIrQ==
X-Received: by 2002:a0c:f991:: with SMTP id t17mr24424118qvn.50.1595288153124;
 Mon, 20 Jul 2020 16:35:53 -0700 (PDT)
Date:   Mon, 20 Jul 2020 23:34:51 +0000
In-Reply-To: <CAKwvOdnsp=zuxbFVcbGRN+-ZH-F5UFVfKzNBfHM714WkwRZyCQ@mail.gmail.com>
Message-Id: <20200720233450.238022-1-nhuck@google.com>
Mime-Version: 1.0
References: <CAKwvOdnsp=zuxbFVcbGRN+-ZH-F5UFVfKzNBfHM714WkwRZyCQ@mail.gmail.com>
X-Mailer: git-send-email 2.28.0.rc0.105.gf9edc3c819-goog
Subject: [PATCH v4] Makefile: Add clang-tidy and static analyzer support to makefile
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
internal
workings of the static analysis.  Clang-tidy and the clang static
analyzers
expose an easy to use api and allow users unfamiliar with clang to
write new checks with relative ease.

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
Changes v3->v4
* Update usages of static-analyzer to clang-analyzer
* Clarify -* explicitly in comment
* Remove filename printing
 MAINTAINERS                                   |  1 +
 Makefile                                      |  3 +
 scripts/clang-tools/Makefile.clang-tools      | 23 +++++++
 .../{ => clang-tools}/gen_compile_commands.py |  0
 scripts/clang-tools/run-clang-tools.py        | 69 +++++++++++++++++++
 5 files changed, 96 insertions(+)
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
index 000000000000..44527b3663e9
--- /dev/null
+++ b/scripts/clang-tools/run-clang-tools.py
@@ -0,0 +1,69 @@
+#!/usr/bin/env python
+# SPDX-License-Identifier: GPL-2.0
+#
+# Copyright (C) Google LLC, 2020
+#
+# Author: Nathan Huckleberry <nhuck@google.com>
+#
+"""A helper routine run clang-tidy and the clang static-analyzer on
+compile_commands.json."""
+
+import argparse
+import json
+import logging
+import multiprocessing
+import os
+import subprocess
+import sys
+
+def parse_arguments():
+  """Set up and parses command-line arguments.
+  Returns:
+    args: Dict of parsed args
+      Has keys "file" and "type"
+  """
+  usage = """Run clang-tidy or the clang static-analyzer on a
+  compilation database."""
+  parser = argparse.ArgumentParser(description=usage)
+
+  type_help = ("Type of analysis to be performed")
+  parser.add_argument("type", choices=["clang-tidy", "clang-analyzer"],
+                      help=type_help)
+  file_path_help = ("Path to the compilation database to parse")
+  parser.add_argument("file",  type=str, help=file_path_help)
+
+  args = parser.parse_args()
+
+  return args
+
+def init(l,t):
+  global lock
+  global analysis_type
+  lock = l
+  analysis_type = t
+
+def run_analysis(entry):
+  filename = entry["file"]
+  #Disable all checks, then re-enable the ones we want
+  checks = "-checks=-*,linuxkernel-*" if (analysis_type == "clang-tidy") else "-checks=-*,clang-analyzer-*"
+  p = subprocess.run(["clang-tidy", "-p", os.getcwd(),
+                    checks, filename],
+                    stdout=subprocess.PIPE, stderr=subprocess.STDOUT)
+  lock.acquire()
+  sys.stderr.buffer.write(p.stdout)
+  lock.release()
+
+
+def main():
+  args = parse_arguments()
+  filename = args.file
+
+  #Read JSON data into the datastore variable
+  with open(filename, "r") as f:
+    datastore = json.load(f)
+    lock = multiprocessing.Lock()
+    pool = multiprocessing.Pool(initializer=init, initargs=(lock, args.type))
+    pool.map(run_analysis,datastore)
+
+if __name__ == "__main__":
+    main()
-- 
2.28.0.rc0.105.gf9edc3c819-goog

