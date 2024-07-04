Return-Path: <linux-kbuild+bounces-2340-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D1E0F927301
	for <lists+linux-kbuild@lfdr.de>; Thu,  4 Jul 2024 11:28:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0E7221C20CAD
	for <lists+linux-kbuild@lfdr.de>; Thu,  4 Jul 2024 09:28:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A2331AAE38;
	Thu,  4 Jul 2024 09:28:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="SPd+JFMN"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFE5B1AAE28;
	Thu,  4 Jul 2024 09:28:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720085309; cv=none; b=eCwCTvEcDaE7M62n7pcugPQUrEf9nxODnVjknxNovOdpEbQpGEBmUPAPsde5CdRVCzQ5KW/aE0T08ZrWgYRuuaNb92OiZLplIkCzLIDeZxm/yisc99xsVBjO5WBc7sA7PdZvGelubnZ+Lg4Lth8OOiMxh+bK2Zqi7IliLvUvsmY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720085309; c=relaxed/simple;
	bh=T4jnlrpIV58SpNbH5mz9u6995loFsuHb/TTu5lx6sL0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=FGE8RFeQhcQG/Lr3zOgr6rqu3zywQTejiUXXiaJEqTIpQkgx3+TQW//jtZpHSFu/CThek+YMfEZDOjJglVlfepqUjXSheAQ+7eLXPDRMSvPFzwAxWUTxtMB3uo7cFOvYIi4SBR9p1hlBnfSEfkGCFFwy+CSsDyawPhuvRiGbWaA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=SPd+JFMN; arc=none smtp.client-ip=217.70.183.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id B79A120005;
	Thu,  4 Jul 2024 09:28:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1720085305;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=u0eQaqOqLAV82tuglvRM0XITDFDwOeDBKAe10fRmhmQ=;
	b=SPd+JFMNnQDuwJknADl3SfozK3SrjwhYjLXfw82f94s1qFYUahEM3Rkn6t/eIM+ShZm7qA
	CrQ4wNL9WeDPNLtVzfkZZi95pu9keO28P8HAENx/NKSBESv4uLN9F0Km9aUxbpDYNUZJld
	Wcc1IpoJOiZmTgqoPXnnY043IKaW1/vvIlEBD5KTSfq+yiQhGknFMjAwIXBgKYbuz2Vz9G
	ZhT3QsYTvP6sZpP4iPgJjnKXvE8l1xIFtvhicjKwHqUEisV8qCvbJKXlOjuARlZnAunSbc
	1yBBZ/ebqJKTrRrg9uvLZ7gRlF/cSbws4A/hIWQn6zI2h8OkibUUbMfD3TGdag==
From: =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
Date: Thu, 04 Jul 2024 11:28:21 +0200
Subject: [PATCH] scripts: run-clang-tools: add file filtering option
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240704-clang-tidy-filter-v1-1-8d4556a35b65@bootlin.com>
X-B4-Tracking: v=1; b=H4sIADRrhmYC/x2MQQqAIBAAvyJ7bsFMEPpKdEhdayEsVKII/550n
 IGZFzIlpgyjeCHRxZmP2KDvBLhtiSsh+8agpNLSSI1ubxYL+wcD74USBm3kYIyzympo3Zko8P0
 /p7nWDzAvHFVjAAAA
To: Masahiro Yamada <masahiroy@kernel.org>, 
 Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, 
 Nick Desaulniers <ndesaulniers@google.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>
Cc: llvm@lists.linux.dev, linux-kbuild@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
X-Mailer: b4 0.14.0
X-GND-Sasl: theo.lebrun@bootlin.com

Add file filtering feature. We take zero or more filters at the end as
positional arguments. If none are given, the default behavior is kept
and we run the tool on all files in the datastore. Else, files must
match one or more filter to be analysed.

The below command runs clang-tidy on drivers/clk/clk.c and all C files
inside drivers/reset/.

    ./scripts/clang-tools/run-clang-tools.py clang-tidy \
        compile_commands.json \
        'drivers/clk/clk.c' 'drivers/reset/*'

The Python fnmatch builtin module is used. Matching is case-insensitive.
See its documentation for allowed syntax:
https://docs.python.org/3/library/fnmatch.html

Signed-off-by: Théo Lebrun <theo.lebrun@bootlin.com>
---
Currently, all files in the datastore are analysed. This is not
practical for grabbing errors in a subsystem, or relative to a patch
series. Add a file filtering feature with wildcard support.

Have a nice day,
Théo
---
 scripts/clang-tools/run-clang-tools.py | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/scripts/clang-tools/run-clang-tools.py b/scripts/clang-tools/run-clang-tools.py
index f31ffd09e1ea..b0b3a9c8cdec 100755
--- a/scripts/clang-tools/run-clang-tools.py
+++ b/scripts/clang-tools/run-clang-tools.py
@@ -10,6 +10,7 @@ compile_commands.json.
 """
 
 import argparse
+import fnmatch
 import json
 import multiprocessing
 import subprocess
@@ -32,6 +33,8 @@ def parse_arguments():
                         help=type_help)
     path_help = "Path to the compilation database to parse"
     parser.add_argument("path", type=str, help=path_help)
+    file_filter_help = "Optional Unix shell-style wildcard file filters"
+    parser.add_argument("file_filter", type=str, nargs="*", help=file_filter_help)
 
     checks_help = "Checks to pass to the analysis"
     parser.add_argument("-checks", type=str, default=None, help=checks_help)
@@ -48,6 +51,22 @@ def init(l, a):
     args = a
 
 
+def filter_entries(datastore, filters):
+    for entry in datastore:
+        if filters == []:
+            yield entry
+            continue
+
+        assert entry['file'].startswith(entry['directory'])
+        # filepath is relative to the directory, to avoid matching on the absolute path
+        filepath = entry['file'][len(entry['directory']):].lstrip('/')
+
+        for pattern in filters:
+            if fnmatch.fnmatch(filepath, pattern):
+                yield entry
+                break
+
+
 def run_analysis(entry):
     # Disable all checks, then re-enable the ones we want
     global args
@@ -87,6 +106,7 @@ def main():
         # Read JSON data into the datastore variable
         with open(args.path, "r") as f:
             datastore = json.load(f)
+            datastore = filter_entries(datastore, args.file_filter)
             pool.map(run_analysis, datastore)
     except BrokenPipeError:
         # Python flushes standard streams on exit; redirect remaining output

---
base-commit: 22a40d14b572deb80c0648557f4bd502d7e83826
change-id: 20240704-clang-tidy-filter-f470377cb2b4

Best regards,
-- 
Théo Lebrun <theo.lebrun@bootlin.com>


