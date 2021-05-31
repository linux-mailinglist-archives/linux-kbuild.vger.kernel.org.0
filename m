Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2BE243968B0
	for <lists+linux-kbuild@lfdr.de>; Mon, 31 May 2021 22:21:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231680AbhEaUWv (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 31 May 2021 16:22:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36750 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230282AbhEaUWu (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 31 May 2021 16:22:50 -0400
Received: from mail-yb1-xb4a.google.com (mail-yb1-xb4a.google.com [IPv6:2607:f8b0:4864:20::b4a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 89AA6C061574
        for <linux-kbuild@vger.kernel.org>; Mon, 31 May 2021 13:21:10 -0700 (PDT)
Received: by mail-yb1-xb4a.google.com with SMTP id j7-20020a258b870000b029052360b1e3e2so14654843ybl.8
        for <linux-kbuild@vger.kernel.org>; Mon, 31 May 2021 13:21:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:message-id:mime-version:subject:from:to:cc;
        bh=7Hb0cJIlllmxjKuiJHCfYDAwnx4kWKSPYkNG4qIRVAg=;
        b=ttaJS7nd/eWU7+0zxCrgUJaaSHkKNkp268X/ofLgXXtwRCdnfWGkPx2qeKNZzXoeeP
         NsE47Ec+ti250I3UKXInm9uOONdvA8S70anKOrVenfJMskOUGKBDtAET2wAxehEZXDCL
         uZ1XuxQI8vRY7FNzlZ/PCRlQdfswNYy8W1XmFRWOUk7DCrn3c8O3YYWBBhaiFYwPEw3T
         vkGb1zHQAQfoG+pXumnqBhfYsOpPVJwtjvJAFSJi7pi5lsuv0Bf3+GiqyNt1zAPL6u0o
         9VBoMnC+bSL/Q3x/U4n0uiCS49ViOrI4OdBaEjMOaTH3+gE11GHd5oi6vXEK1mfgITMR
         sqKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
        bh=7Hb0cJIlllmxjKuiJHCfYDAwnx4kWKSPYkNG4qIRVAg=;
        b=Zjq1X76J16vivP6erGy9tOZQKxiW/S++kZVrVjI2MOcRZI87V5YcYDuosMuGxNzUEq
         wAw00WHLlyvfPSw0uMvgjdUcS4aDtS8NzbzObi5Ob/CCv33cLfD/pjKKsVXZwFMoTK6b
         /iEwRCtjOPSnERj37wNLPEZxMQrFy8ErFttfgXNyHTztuJHyKuautBqLxUOqKuXll1lO
         7qpLlvt1fwefdXu9J2PkIW0lwBfH6dRFbo39QJpdpJWQWMr9UxUXWuBFoy++Vh+GAUkd
         6q/kF0fIGhaJj+2DLok5ZEmdQoofP9XA+DFSUeH54WmPKy7vJ9w9zt7xG8ckXSGeewj7
         K4sg==
X-Gm-Message-State: AOAM531apoJXk3kw7DNw0uHwxlOjPC6GkU7ghrqBurPAvZR8Am87P0c4
        +vc6jN8aI5k2XeWhAjwLMiJ414X9
X-Google-Smtp-Source: ABdhPJydkas8f/uJpXTFSGvNQV+E3IEDP4pu1Ayjb+fgGQIRpaEmQqIjQto7yHZudVfIp8IwyIneelIXjA==
X-Received: from fawn.svl.corp.google.com ([2620:15c:2cd:202:2d19:3d8d:1b72:3e5a])
 (user=morbo job=sendgmr) by 2002:a25:d606:: with SMTP id n6mr12532718ybg.210.1622492469764;
 Mon, 31 May 2021 13:21:09 -0700 (PDT)
Date:   Mon, 31 May 2021 13:20:44 -0700
Message-Id: <20210531202044.426578-1-morbo@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.32.0.rc0.204.g9fa02ecfa5-goog
Subject: [PATCH] pgo: rename the raw profile file to vmlinux.profraw
From:   Bill Wendling <morbo@google.com>
To:     Kees Cook <keescook@google.com>, Jonathan Corbet <corbet@lwn.net>,
        Masahiro Yamada <masahiroy@kernel.org>,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-kbuild@vger.kernel.org, clang-built-linux@googlegroups.com,
        Andrew Morton <akpm@linux-foundation.org>
Cc:     Nathan Chancellor <natechancellor@gmail.com>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Bill Wendling <morbo@google.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Future PGO features may create other files in /sys/kernel/debug/pgo. So
rename the kernel's raw profile data file to "vmlinux.profraw" to make
which part of the kernel the file is for more explicit.

Note that future files in /sys/kernel/debug/pgo should follow a similar
naming convention.

Signed-off-by: Bill Wendling <morbo@google.com>
---
 Documentation/dev-tools/pgo.rst | 6 +++---
 kernel/pgo/Kconfig              | 7 ++++---
 kernel/pgo/fs.c                 | 2 +-
 3 files changed, 8 insertions(+), 7 deletions(-)

diff --git a/Documentation/dev-tools/pgo.rst b/Documentation/dev-tools/pgo.rst
index b7f11d8405b7..0200449c4843 100644
--- a/Documentation/dev-tools/pgo.rst
+++ b/Documentation/dev-tools/pgo.rst
@@ -76,7 +76,7 @@ The PGO kernel support creates the following files in debugfs:
 ``/sys/kernel/debug/pgo/reset``
 	Global reset file: resets all coverage data to zero when written to.
 
-``/sys/kernel/debug/profraw``
+``/sys/kernel/debug/pgo/vmlinux.profraw``
 	The raw PGO data that must be processed with ``llvm_profdata``.
 
 
@@ -108,7 +108,7 @@ using the result to optimize the kernel:
 
    .. code-block:: sh
 
-      $ cp -a /sys/kernel/debug/pgo/profraw /tmp/vmlinux.profraw
+      $ cp -a /sys/kernel/debug/pgo/vmlinux.profraw /tmp/vmlinux.profraw
 
 5) (Optional) Download the raw profile data to the HOST machine.
 
@@ -120,7 +120,7 @@ using the result to optimize the kernel:
 
    Note that multiple raw profile data files can be merged during this step.
 
-7) Rebuild the kernel using the profile data (PGO disabled)
+7) Rebuild the kernel using the processed profile data (PGO disabled)
 
    .. code-block:: sh
 
diff --git a/kernel/pgo/Kconfig b/kernel/pgo/Kconfig
index 76a640b6cf6e..d2053df1111c 100644
--- a/kernel/pgo/Kconfig
+++ b/kernel/pgo/Kconfig
@@ -17,10 +17,11 @@ config PGO_CLANG
 
 	  Run a representative workload for your application on a kernel
 	  compiled with this option and download the raw profile file from
-	  /sys/kernel/debug/pgo/profraw. This file needs to be processed with
-	  llvm-profdata. It may be merged with other collected raw profiles.
+	  /sys/kernel/debug/pgo/vmlinux.profraw. This file needs to be
+	  processed with llvm-profdata. It may be merged with other collected
+	  raw profiles.
 
-	  Copy the resulting profile file into vmlinux.profdata, and enable
+	  Copy the processed profile file into vmlinux.profdata, and enable
 	  KCFLAGS=-fprofile-use=vmlinux.profdata to produce an optimized
 	  kernel.
 
diff --git a/kernel/pgo/fs.c b/kernel/pgo/fs.c
index 449f16beb2cf..ef985159dad3 100644
--- a/kernel/pgo/fs.c
+++ b/kernel/pgo/fs.c
@@ -365,7 +365,7 @@ static int __init pgo_init(void)
 	if (!directory)
 		goto err_remove;
 
-	if (!debugfs_create_file("profraw", 0600, directory, NULL,
+	if (!debugfs_create_file("vmlinux.profraw", 0600, directory, NULL,
 				 &prf_fops))
 		goto err_remove;
 
-- 
2.32.0.rc0.204.g9fa02ecfa5-goog

