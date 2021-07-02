Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 643463BA654
	for <lists+linux-kbuild@lfdr.de>; Sat,  3 Jul 2021 01:51:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230037AbhGBXyQ (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 2 Jul 2021 19:54:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53114 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230017AbhGBXyQ (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 2 Jul 2021 19:54:16 -0400
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 645CDC061762;
        Fri,  2 Jul 2021 16:51:43 -0700 (PDT)
Received: by mail-lf1-x12e.google.com with SMTP id k10so20923825lfv.13;
        Fri, 02 Jul 2021 16:51:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=clIxmMxm6a6CEZgz+Vza6vLv6bCnIn97w16YVzgjAlM=;
        b=FoT0dmiW5pg1cksplUr/CeGivwq5WJq3isweu43mewFVK44G9HuNkOWWWyop84QHbg
         BJ3EzPf+8rllun7eVmU+kHM2rbs3mmLni5QjTN76moOuCV551f2h+TbSnmOmI296BI2L
         O8clzex1LoUqVKu8CnQwi9mxvNyKlqo2XFQPkqlTwW+9vqAyMDkBkRfS3TPGIcLdnjuA
         +W8NLlsGX9cgZlQrb3ZaRUo4chBtoK+6/rNTZBJuvg779Na2lnXo+EHDDXMe3wQrxKjP
         r0J1S8hXMJl0hSEUqOBRsvNc19A7JqurFiIblnZZ5jazuK9gCiZFKLKGm2JWGcBe0ybS
         N5yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=clIxmMxm6a6CEZgz+Vza6vLv6bCnIn97w16YVzgjAlM=;
        b=k1Q9W+u0yHiP5pFg1D5/CkqDcUQ1aATa4tTAjX5wiDrRq7AJeCBwiIIFbkRgCSz6MX
         4za9jgsIkh6AbSUiuVWKuwrGrcwhsmJkdiyoAmZvxraq10gLg1SBHEHt7DBoxhVu0KsG
         wxGIUCzCdaUYShOzI9qLJizaZ6Z+WVYeXXSBt2W9ybSnDu6l+oI8zF0HJ2E5Oo+DVOLy
         tTx19nISQSSyfMVk7duq0BxS8aGZk78sFuUJQ4gDdsxgP/GadfOCdbYDe9LwSd90Do6e
         97jtEJzjPOMK6ANY6reXSlafwMDQWKKu8bhF2+W65dD6fKYafzzj+/mbFTvu9gVOBlNW
         i6JQ==
X-Gm-Message-State: AOAM531bZ0k0ml1qcfwO7I3+36BL0QuYaT8Icd9+iOgF4MfOsgPgI2o7
        2++DrjCgfttk0KTIbAaxUXA=
X-Google-Smtp-Source: ABdhPJydzceV3YNwBPGVPTfA75ZgpY72chgAiNPUAVyjrB5jY4i5pFIEoIbGzPL9cN3ySRZ7MsdCMw==
X-Received: by 2002:a05:6512:3761:: with SMTP id z1mr1511747lft.99.1625269901657;
        Fri, 02 Jul 2021 16:51:41 -0700 (PDT)
Received: from 192.168.1.8 ([212.59.242.58])
        by smtp.gmail.com with ESMTPSA id h5sm511370ljj.80.2021.07.02.16.51.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Jul 2021 16:51:41 -0700 (PDT)
From:   Maciej Falkowski <maciej.falkowski9@gmail.com>
To:     natechancellor@gmail.com, ndesaulniers@google.com,
        masahiroy@kernel.org, michal.lkml@markovi.net, nhuck@google.com
Cc:     clang-built-linux@googlegroups.com, linux-kbuild@vger.kernel.org,
        linux-kernel@vger.kernel.org, maciej.falkowski9@gmail.com
Subject: [PATCH] clang-tools: Print information when clang-tidy tool is missing
Date:   Sat,  3 Jul 2021 01:51:20 +0200
Message-Id: <20210702235120.7023-1-maciej.falkowski9@gmail.com>
X-Mailer: git-send-email 2.26.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

When clang-tidy tool is missing in the system, the FileNotFoundError
exception is raised in the program reporting a stack trace to the user:

$ ./scripts/clang-tools/run-clang-tools.py clang-tidy ./compile_commands.json
multiprocessing.pool.RemoteTraceback:
"""
Traceback (most recent call last):
  File "/usr/lib64/python3.8/multiprocessing/pool.py", line 125, in worker
    result = (True, func(*args, **kwds))
  File "/usr/lib64/python3.8/multiprocessing/pool.py", line 48, in mapstar
    return list(map(*args))
  File "./scripts/clang-tools/run-clang-tools.py", line 54, in run_analysis
    p = subprocess.run(["clang-tidy", "-p", args.path, checks, entry["file"]],
  File "/usr/lib64/python3.8/subprocess.py", line 489, in run
    with Popen(*popenargs, **kwargs) as process:
  File "/usr/lib64/python3.8/subprocess.py", line 854, in __init__
    self._execute_child(args, executable, preexec_fn, close_fds,
  File "/usr/lib64/python3.8/subprocess.py", line 1702, in _execute_child
    raise child_exception_type(errno_num, err_msg, err_filename)
FileNotFoundError: [Errno 2] No such file or directory: 'clang-tidy'
"""

The patch adds more user-friendly information about missing tool by
checking the presence of clang-tidy using `command -v` at the beginning
of the script:

$ ./scripts/clang-tools/run-clang-tools.py clang-tidy ./compile_commands.json
Command 'clang-tidy' is missing in the system

Signed-off-by: Maciej Falkowski <maciej.falkowski9@gmail.com>
Link: https://github.com/ClangBuiltLinux/linux/issues/1342
---
 scripts/clang-tools/run-clang-tools.py | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/scripts/clang-tools/run-clang-tools.py b/scripts/clang-tools/run-clang-tools.py
index fa7655c7cec0..d34eaf5a0ee5 100755
--- a/scripts/clang-tools/run-clang-tools.py
+++ b/scripts/clang-tools/run-clang-tools.py
@@ -60,6 +60,11 @@ def run_analysis(entry):
 
 
 def main():
+    exitcode = subprocess.getstatusoutput('command -v clang-tidy')[0]
+    if exitcode == 1:
+        print("Command 'clang-tidy' is missing in the system", file=sys.stderr)
+        sys.exit(127)
+
     args = parse_arguments()
 
     lock = multiprocessing.Lock()
-- 
2.26.3

