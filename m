Return-Path: <linux-kbuild+bounces-314-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CD30580B996
	for <lists+linux-kbuild@lfdr.de>; Sun, 10 Dec 2023 08:06:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 864FB280E98
	for <lists+linux-kbuild@lfdr.de>; Sun, 10 Dec 2023 07:06:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE77446AA;
	Sun, 10 Dec 2023 07:06:48 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from bg4.exmail.qq.com (bg4.exmail.qq.com [43.155.65.254])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 216A9107;
	Sat,  9 Dec 2023 23:06:44 -0800 (PST)
X-QQ-mid: bizesmtpipv601t1702191989teml
Received: from localhost.localdomain ( [255.141.82.1])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Sun, 10 Dec 2023 15:05:55 +0800 (CST)
X-QQ-SSF: 01200000000000B0J000000A0000000
X-QQ-FEAT: XDJ14wmgNKL+JotWPJlcmW4AloQlqtxbmipQt2oqafFm/U2XoSoYwGfl6VDI1
	lT2/S6PukQdYO5Sm10cf8rMsgUFFjhEqbMg+p/jWhQ6n7ciRTBgbkC6xWILQP9u3hS37Qrl
	cldhL6V0TOFNUjDLQMi0IfqaTI8NBt6jeROPzKhPdIpjYtBPClO8PY+4qnK80z99vHjlDe0
	MU9htik+OVMwTE27GhKy17dQsqbGmJBI9NNfRRFm/T+TVwmNapErwbffaFdD4Jk2YxbYZXL
	eoKcUrZ90LbVJ9QT2bZLe475dTI0TtiLiItEbon0z3hld0l0d9JraN51FRrF04Pyp4DqsdF
	ExPGg8Q2YuT3j8h8Jfcw8BwXp5WynrpRfmmOB9by0VXsQWWp0Si/cB4dlSDmw==
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 3158962225522791323
From: Jialu Xu <xujialu@vimux.org>
To: masahiroy@kernel.org
Cc: justinstitt@google.com,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	morbo@google.com,
	nathan@kernel.org,
	ndesaulniers@google.com,
	xujialu@vimux.org
Subject: [PATCH v5] gen_compile_commands.py: fix path resolve with symlinks in it
Date: Sun, 10 Dec 2023 15:05:34 +0800
Message-Id: <20231210070533.925534-2-xujialu@vimux.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231210070533.925534-1-xujialu@vimux.org>
References: <CAK7LNAQAAZXV3i1sM0ZTFDC3eOaDWBVzOV9FmiLUM5YoX=89Wg@mail.gmail.com>
 <20231210070533.925534-1-xujialu@vimux.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtpipv:vimux.org:qybglogicsvrgz:qybglogicsvrgz5a-1
X-Spam-Level: **

When a path contains relative symbolic links, os.path.abspath() might
not follow the symlinks and instead return the absolute path with just
the relative paths resolved, resulting in an incorrect path.

1. Say "drivers/hdf/" has some symlinks:

    # ls -l drivers/hdf/
    total 364
    drwxrwxr-x 2 ...   4096 ... evdev
    lrwxrwxrwx 1 ...     44 ... framework -> ../../../../../../drivers/hdf_core/framework
    -rw-rw-r-- 1 ... 359010 ... hdf_macro_test.h
    lrwxrwxrwx 1 ...     55 ... inner_api -> ../../../../../../drivers/hdf_core/interfaces/inner_api
    lrwxrwxrwx 1 ...     53 ... khdf -> ../../../../../../drivers/hdf_core/adapter/khdf/linux
    -rw-r--r-- 1 ...     74 ... Makefile
    drwxrwxr-x 3 ...   4096 ... wifi

2. One .cmd file records that:

    # head -1 ./framework/core/manager/src/.devmgr_service.o.cmd
    cmd_drivers/hdf/khdf/manager/../../../../framework/core/manager/src/devmgr_service.o := ... \
    /path/to/src/drivers/hdf/khdf/manager/../../../../framework/core/manager/src/devmgr_service.c

3. os.path.abspath returns "/path/to/src/framework/core/manager/src/devmgr_service.c", not correct:

    # ./scripts/clang-tools/gen_compile_commands.py
    INFO: Could not add line from ./framework/core/manager/src/.devmgr_service.o.cmd: File \
        /path/to/src/framework/core/manager/src/devmgr_service.c not found

Use os.path.realpath(), which resolves the symlinks and normalizes the paths correctly.

    # cat compile_commands.json
    ...
    {
      "command": ...
      "directory": ...
      "file": "/path/to/bla/drivers/hdf_core/framework/core/manager/src/devmgr_service.c"
    },
    ...

Also fix it in parse_arguments().

Signed-off-by: Jialu Xu <xujialu@vimux.org>
---
 scripts/clang-tools/gen_compile_commands.py | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/scripts/clang-tools/gen_compile_commands.py b/scripts/clang-tools/gen_compile_commands.py
index 180952fb91c1b..5dea4479240bc 100755
--- a/scripts/clang-tools/gen_compile_commands.py
+++ b/scripts/clang-tools/gen_compile_commands.py
@@ -64,7 +64,7 @@ def parse_arguments():
     args = parser.parse_args()
 
     return (args.log_level,
-            os.path.abspath(args.directory),
+            os.path.realpath(args.directory),
             args.output,
             args.ar,
             args.paths if len(args.paths) > 0 else [args.directory])
@@ -172,8 +172,8 @@ def process_line(root_directory, command_prefix, file_path):
     # by Make, so this code replaces the escaped version with '#'.
     prefix = command_prefix.replace('\#', '#').replace('$(pound)', '#')
 
-    # Use os.path.abspath() to normalize the path resolving '.' and '..' .
-    abs_path = os.path.abspath(os.path.join(root_directory, file_path))
+    # Return the canonical path, eliminating any symbolic links encountered in the path.
+    abs_path = os.path.realpath(os.path.join(root_directory, file_path))
     if not os.path.exists(abs_path):
         raise ValueError('File %s not found' % abs_path)
     return {
-- 
2.39.2


