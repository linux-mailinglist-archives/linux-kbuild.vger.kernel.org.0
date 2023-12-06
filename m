Return-Path: <linux-kbuild+bounces-267-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D938F80641A
	for <lists+linux-kbuild@lfdr.de>; Wed,  6 Dec 2023 02:26:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E48D01C20BDB
	for <lists+linux-kbuild@lfdr.de>; Wed,  6 Dec 2023 01:26:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 51895EC0;
	Wed,  6 Dec 2023 01:26:13 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from bg4.exmail.qq.com (bg4.exmail.qq.com [43.155.65.254])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 65A5BD45;
	Tue,  5 Dec 2023 17:26:09 -0800 (PST)
X-QQ-mid: bizesmtp71t1701825951t7a9xq2a
Received: from localhost.localdomain ( [219.147.0.78])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 06 Dec 2023 09:25:48 +0800 (CST)
X-QQ-SSF: 01200000000000B0J000000A0000000
X-QQ-FEAT: AVwGxPGvfUdqbQU/G7eEgdV1fs9Yo38Y6mwGCNuioTVl0jOcC4pMJUn4smZA/
	45jFOcuA90l4hf6qklveMLvls0JPLGxsmwUXdjwn87awODmf0E6hInIkdnZ9TZUHlbqmn5G
	U3VuDSJLWaqiDYcZOCojTqiiUm85yKElsIc8YwVw0Vdw0WSIIDowwtl3KVrBwW8qqr7dGIa
	l976ZY+A6PAIQQZ62bArDpRNIdo78J42KELQLDcJrR/63pCjVhTh3vR4gnWyQ0D+8ygXA/1
	eZz0WywWZXKfkOnRiliFL/l0Kkyb33t7bVjslwdyMULEPJ+dV7CUriKA/+a0+ImoqK973qj
	t/OJHERVuFOF+pmZERJjXENtTI84wrv3K5dGDqSHjMIK463Ly12C3Pxv9Z66w==
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 6151313308317870226
From: Jialu Xu <xujialu@vimux.org>
To: nathan@kernel.org
Cc: justinstitt@google.com,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	masahiroy@kernel.org,
	morbo@google.com,
	ndesaulniers@google.com,
	xujialu@vimux.org
Subject: [PATCH v4] gen_compile_commands.py: fix path resolve with symlinks in it
Date: Wed,  6 Dec 2023 09:24:42 +0800
Message-Id: <20231206012441.840082-1-xujialu@vimux.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231205165648.GA391810@dev-arch.thelio-3990X>
References: <20231205165648.GA391810@dev-arch.thelio-3990X>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:vimux.org:qybglogicsvrgz:qybglogicsvrgz5a-1
X-Spam-Level: *

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
    /path/to/out/drivers/hdf/khdf/manager/../../../../framework/core/manager/src/devmgr_service.c

3. os.path.abspath returns "/path/to/out/framework/core/manager/src/devmgr_service.c", not correct:

    # ./scripts/clang-tools/gen_compile_commands.py
    INFO: Could not add line from ./framework/core/manager/src/.devmgr_service.o.cmd: File \
        /path/to/out/framework/core/manager/src/devmgr_service.c not found

Use pathlib.Path.resolve(), which resolves the symlinks and normalizes
the paths correctly.

    # cat compile_commands.json
    ...
    {
      "command": ...
      "directory": ...
      "file": "/path/to/blabla/drivers/hdf_core/framework/core/manager/src/devmgr_service.c"
    },
    ...

Reviewed-by: Nathan Chancellor <nathan@kernel.org>
Signed-off-by: Jialu Xu <xujialu@vimux.org>
---
 scripts/clang-tools/gen_compile_commands.py | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/scripts/clang-tools/gen_compile_commands.py b/scripts/clang-tools/gen_compile_commands.py
index 180952fb91c1b..99e28b7152c19 100755
--- a/scripts/clang-tools/gen_compile_commands.py
+++ b/scripts/clang-tools/gen_compile_commands.py
@@ -11,6 +11,7 @@ import argparse
 import json
 import logging
 import os
+from pathlib import Path
 import re
 import subprocess
 import sys
@@ -172,8 +173,9 @@ def process_line(root_directory, command_prefix, file_path):
     # by Make, so this code replaces the escaped version with '#'.
     prefix = command_prefix.replace('\#', '#').replace('$(pound)', '#')
 
-    # Use os.path.abspath() to normalize the path resolving '.' and '..' .
-    abs_path = os.path.abspath(os.path.join(root_directory, file_path))
+    # Make the path absolute, resolving all symlinks on the way and also normalizing it.
+    # Convert Path object to a string because 'PosixPath' is not JSON serializable.
+    abs_path = str(Path(root_directory, file_path).resolve())
     if not os.path.exists(abs_path):
         raise ValueError('File %s not found' % abs_path)
     return {
-- 
2.39.2


