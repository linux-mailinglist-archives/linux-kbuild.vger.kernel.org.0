Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9707B6668EA
	for <lists+linux-kbuild@lfdr.de>; Thu, 12 Jan 2023 03:30:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233592AbjALCaR (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 11 Jan 2023 21:30:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43534 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232849AbjALCaQ (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 11 Jan 2023 21:30:16 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B8375BC93;
        Wed, 11 Jan 2023 18:30:15 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 42A4D61F26;
        Thu, 12 Jan 2023 02:30:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E681FC433D2;
        Thu, 12 Jan 2023 02:30:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1673490614;
        bh=+mXHR/+rGW0aCgJwKXrXqkMMXhnGOb1bifJkJNWqx5c=;
        h=From:To:Cc:Subject:Date:From;
        b=dxygjh/vD0wnwbL8avrJWBV66sRuZ3j2IUIoJ9d7woImIR7P+EzZG7hgdN197ns7D
         1jJ5Vx3Pi/FvFNWAVrb82MYT80AdnociIKU9LTYFjnJVu8/cYRxRFlGJkUEvfYyAi5
         /H1RbOdfzNo1FK0gmjCOUmpAnOWe+dBv60btqS0UzrWobbz3aMYvj0zfMZRGmYsCPk
         fedawfi0kWZ9ztlPbBcOrUmIqEiS53fGtuPODyf4xzcfVB2sJqsp4zztGlwtoI1kGZ
         Y6kvzSjdZ0lt1+STKN/qOxbMfpOqcDxnxTmTdBlHrhv74FUdH5DJqJTBPvoHjCL/lx
         D1IeNxBp/6U1w==
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org,
        Masahiro Yamada <masahiroy@kernel.org>,
        Kees Cook <keescook@chromium.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Tom Rix <trix@redhat.com>, llvm@lists.linux.dev
Subject: [PATCH] scripts: handle BrokenPipeError for python scripts
Date:   Thu, 12 Jan 2023 11:30:06 +0900
Message-Id: <20230112023006.1873859-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

In the follow-up of commit fb3041d61f68 ("kbuild: fix SIGPIPE error
message for AR=gcc-ar and AR=llvm-ar"), Kees Cook pointed out that
tools should _not_ catch their own SIGPIPEs [1] [2].

Based on his feedback, LLVM was fixed [3].

However, Python's default behavior is to show noisy bracktrace when
SIGPIPE is sent. So, scripts written in Python are basically in the
same situation as the buggy llvm tools.

Example:

  $ make -s allnoconfig
  $ make -s allmodconfig
  $ scripts/diffconfig .config.old .config | head -n1
  -ALIX n
  Traceback (most recent call last):
    File "/home/masahiro/linux/scripts/diffconfig", line 132, in <module>
      main()
    File "/home/masahiro/linux/scripts/diffconfig", line 130, in main
      print_config("+", config, None, b[config])
    File "/home/masahiro/linux/scripts/diffconfig", line 64, in print_config
      print("+%s %s" % (config, new_value))
  BrokenPipeError: [Errno 32] Broken pipe

Python documentatin [4] notes how to make scripts die immediately and
silently:

  """
  Piping output of your program to tools like head(1) will cause a
  SIGPIPE signal to be sent to your process when the receiver of its
  standard output closes early. This results in an exception like
  BrokenPipeError: [Errno 32] Broken pipe. To handle this case,
  wrap your entry point to catch this exception as follows:

    import os
    import sys

    def main():
        try:
            # simulate large output (your code replaces this loop)
            for x in range(10000):
                print("y")
            # flush output here to force SIGPIPE to be triggered
            # while inside this try block.
            sys.stdout.flush()
        except BrokenPipeError:
            # Python flushes standard streams on exit; redirect remaining output
            # to devnull to avoid another BrokenPipeError at shutdown
            devnull = os.open(os.devnull, os.O_WRONLY)
            os.dup2(devnull, sys.stdout.fileno())
            sys.exit(1)  # Python exits with error code 1 on EPIPE

    if __name__ == '__main__':
        main()

  Do not set SIGPIPE’s disposition to SIG_DFL in order to avoid
  BrokenPipeError. Doing that would cause your program to exit
  unexpectedly whenever any socket connection is interrupted while
  your program is still writing to it.
  """

Currently, tools/perf/scripts/python/intel-pt-events.py seems the
only script that fixes the issue that way.

tools/perf/scripts/python/compaction-times.py uses another approach
signal.signal(signal.SIGPIPE, signal.SIG_DFL) but the Python
documentation clearly says "Don't do it".

I cannot fix all Python scripts since there are so many.
I fixed some in the scripts/ directory.

[1]: https://lore.kernel.org/all/202211161056.1B9611A@keescook/
[2]: https://github.com/llvm/llvm-project/issues/59037
[3]: https://github.com/llvm/llvm-project/commit/4787efa38066adb51e2c049499d25b3610c0877b
[4]: https://docs.python.org/3/library/signal.html#note-on-sigpipe

Cc: Kees Cook <keescook@chromium.org>
Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/checkkconfigsymbols.py         | 13 ++++++++++++-
 scripts/clang-tools/run-clang-tools.py | 21 ++++++++++++++-------
 scripts/diffconfig                     | 16 ++++++++++++++--
 3 files changed, 40 insertions(+), 10 deletions(-)

diff --git a/scripts/checkkconfigsymbols.py b/scripts/checkkconfigsymbols.py
index 217d21abc86e..36c920e71313 100755
--- a/scripts/checkkconfigsymbols.py
+++ b/scripts/checkkconfigsymbols.py
@@ -115,7 +115,7 @@ def parse_options():
     return args
 
 
-def main():
+def print_undefined_symbols():
     """Main function of this module."""
     args = parse_options()
 
@@ -467,5 +467,16 @@ def parse_kconfig_file(kfile):
     return defined, references
 
 
+def main():
+    try:
+        print_undefined_symbols()
+    except BrokenPipeError:
+        # Python flushes standard streams on exit; redirect remaining output
+        # to devnull to avoid another BrokenPipeError at shutdown
+        devnull = os.open(os.devnull, os.O_WRONLY)
+        os.dup2(devnull, sys.stdout.fileno())
+        sys.exit(1)  # Python exits with error code 1 on EPIPE
+
+
 if __name__ == "__main__":
     main()
diff --git a/scripts/clang-tools/run-clang-tools.py b/scripts/clang-tools/run-clang-tools.py
index 56f2ec8f0f40..3266708a8658 100755
--- a/scripts/clang-tools/run-clang-tools.py
+++ b/scripts/clang-tools/run-clang-tools.py
@@ -61,14 +61,21 @@ def run_analysis(entry):
 
 
 def main():
-    args = parse_arguments()
+    try:
+        args = parse_arguments()
 
-    lock = multiprocessing.Lock()
-    pool = multiprocessing.Pool(initializer=init, initargs=(lock, args))
-    # Read JSON data into the datastore variable
-    with open(args.path, "r") as f:
-        datastore = json.load(f)
-        pool.map(run_analysis, datastore)
+        lock = multiprocessing.Lock()
+        pool = multiprocessing.Pool(initializer=init, initargs=(lock, args))
+        # Read JSON data into the datastore variable
+        with open(args.path, "r") as f:
+            datastore = json.load(f)
+            pool.map(run_analysis, datastore)
+    except BrokenPipeError:
+        # Python flushes standard streams on exit; redirect remaining output
+        # to devnull to avoid another BrokenPipeError at shutdown
+        devnull = os.open(os.devnull, os.O_WRONLY)
+        os.dup2(devnull, sys.stdout.fileno())
+        sys.exit(1)  # Python exits with error code 1 on EPIPE
 
 
 if __name__ == "__main__":
diff --git a/scripts/diffconfig b/scripts/diffconfig
index d5da5fa05d1d..43f0f3d273ae 100755
--- a/scripts/diffconfig
+++ b/scripts/diffconfig
@@ -65,7 +65,7 @@ def print_config(op, config, value, new_value):
         else:
             print(" %s %s -> %s" % (config, value, new_value))
 
-def main():
+def show_diff():
     global merge_style
 
     # parse command line args
@@ -129,4 +129,16 @@ def main():
     for config in new:
         print_config("+", config, None, b[config])
 
-main()
+def main():
+    try:
+        show_diff()
+    except BrokenPipeError:
+        # Python flushes standard streams on exit; redirect remaining output
+        # to devnull to avoid another BrokenPipeError at shutdown
+        devnull = os.open(os.devnull, os.O_WRONLY)
+        os.dup2(devnull, sys.stdout.fileno())
+        sys.exit(1)  # Python exits with error code 1 on EPIPE
+
+
+if __name__ == '__main__':
+    main()
-- 
2.34.1

