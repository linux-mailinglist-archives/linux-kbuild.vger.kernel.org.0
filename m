Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 12506220104
	for <lists+linux-kbuild@lfdr.de>; Wed, 15 Jul 2020 01:24:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726974AbgGNXYS (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 14 Jul 2020 19:24:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53198 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725977AbgGNXYR (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 14 Jul 2020 19:24:17 -0400
Received: from mail-il1-x14a.google.com (mail-il1-x14a.google.com [IPv6:2607:f8b0:4864:20::14a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8C181C061755
        for <linux-kbuild@vger.kernel.org>; Tue, 14 Jul 2020 16:24:17 -0700 (PDT)
Received: by mail-il1-x14a.google.com with SMTP id d3so138786ilq.9
        for <linux-kbuild@vger.kernel.org>; Tue, 14 Jul 2020 16:24:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=2MgCYW3UINne2osnWjKqpbw5LUhaGCf3Xmk9thEs7q4=;
        b=dOfVLO3jlim0zb9WHzhTGm0jo6RhQKLeVileQs4onfYV8C0NDaTm8dCDLEcrtZYcKO
         zCez3YySkFunloZdbla++ue8szahSBXOepUxMJG+MNvW0BIaZAfzHFxtWnAegNuCE6er
         AZDMOzaUy/l9JdBX4MZIzbmSE20yp6rlakGW00sDCto2c9Rb5sOU67ZoH+WD/PGE8X0h
         E7aLCEB6UZd5AOeeUXcwMFhhqdc62OqNRDSEt7ASNsseVOe0l59s9qaoumTrZwxUqF7h
         2D794wbhML3bHixXtG6cIMfrp6mCFxtM7j/a3PPJMnYp44Is97Q7yGGMveu5rkOGgRwD
         K7Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=2MgCYW3UINne2osnWjKqpbw5LUhaGCf3Xmk9thEs7q4=;
        b=uH0jKQRbbOzEG7dv7PVTEwjWMDiHVP7G5O4T/h8TPlsbyToPZtTAGdwFi+qsMK2GyW
         bzVp/hnzEuuPkM0ylL7fkXRsz9WjP+VtA5p9V6pKp1SJ9XRof5IQzoYbRke4OFyJ9a0G
         6d0mokmrnHUyWu9OWZaN8woc51Wm4LuGIFKbvfeHkXsdGe4rpmJfqHTjVzG4qJUMFJrg
         i/eDnMrw1kVnbsiw+gTYDftJh4j19NYANe8xylt605pUIBzGa0/HQMRqgQv43cWACUxF
         /emRXmm3I7+6WbojReeDZrxUb1BmXrSSxJTBVW9CZGMKWMKZt+mPOTlU0GOfG8fXigiR
         ciUQ==
X-Gm-Message-State: AOAM531zJ5XhhWBbIJnUeKtX35EO1+UsUCxwzi2cT/6SuvZG/nROeUbp
        pONIMJ6mtOWsrsGSNtCupB3skZ39Qw==
X-Google-Smtp-Source: ABdhPJzA0rVDrfWNGsOJlpomXWRnd2FOUAwGD6tuO1OeT4r/rHHZbSfoauDyZdczZ04JNApzrb8tDzY1Xw==
X-Received: by 2002:a05:6638:3aa:: with SMTP id z10mr8679368jap.54.1594769056604;
 Tue, 14 Jul 2020 16:24:16 -0700 (PDT)
Date:   Tue, 14 Jul 2020 23:23:49 +0000
In-Reply-To: <20200713225103.GA1095851@google.com>
Message-Id: <20200714232349.2198114-1-nhuck@google.com>
Mime-Version: 1.0
References: <20200713225103.GA1095851@google.com>
X-Mailer: git-send-email 2.27.0.389.gc38d7665816-goog
Subject: [PATCH v3] Makefile: Add clang-tidy and static analyzer support to makefile
From:   Nathan Huckleberry <nhuck@google.com>
To:     masahiroy@kernel.org, michal.lkml@markovi.net
Cc:     linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
        clang-built-linux@googlegroups.com,
        Nathan Huckleberry <nhuck@google.com>
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
Changes v2 -> v3
* Redirect clang-tidy output to stderr
* Style fixes
* Add directory to MAINTAINERS
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
index 000000000000..7ad3308c1937
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
+	$(PYTHON3) scripts/clang-tools/run-clang-tools.py static-analyzer compile_commands.json
+else
+	$(error clang-analyzer requires CC=clang)
+endif
diff --git a/scripts/gen_compile_commands.py b/scripts/clang-tools/gen_compile_commands.py
similarity index 100%
rename from scripts/gen_compile_commands.py
rename to scripts/clang-tools/gen_compile_commands.py
diff --git a/scripts/clang-tools/run-clang-tools.py b/scripts/clang-tools/run-clang-tools.py
new file mode 100755
index 000000000000..00b8532c1729
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
+  parser.add_argument("type", choices=["clang-tidy", "static-analyzer"],
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
+  checks = "-checks=-*,linuxkernel-*" if (analysis_type == "clang-tidy") else "-checks=-*,clang-analyzer-*"
+  p = subprocess.run(["clang-tidy", "-p", os.getcwd(),
+                    checks, filename],
+                    stdout=subprocess.PIPE, stderr=subprocess.STDOUT)
+  lock.acquire()
+  print(filename, file=sys.stderr)
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
2.27.0.389.gc38d7665816-goog

