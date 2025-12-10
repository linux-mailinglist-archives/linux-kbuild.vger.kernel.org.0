Return-Path: <linux-kbuild+bounces-10046-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B6EACB3171
	for <lists+linux-kbuild@lfdr.de>; Wed, 10 Dec 2025 15:02:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BC4E93041CCE
	for <lists+linux-kbuild@lfdr.de>; Wed, 10 Dec 2025 13:58:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C4FCC326920;
	Wed, 10 Dec 2025 13:58:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gtucker.io header.i=@gtucker.io header.b="jWZohoP5"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62D4F325705;
	Wed, 10 Dec 2025 13:58:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765375131; cv=none; b=WsB9y1D4y6r8GNofIt3NSUmr5YF7PkoEYt03yQfiWtyWPXQbyIsSuAVXwPit2umZXtZExcjBN4PRrvW3UkL80e8N33JCw5jOamhKst79ohatA63NN2MliAw0v6XQoCAaBnNdmpvfjoGXU432Sw29yFc5aKCY/ZSNVrSUUrb/KZ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765375131; c=relaxed/simple;
	bh=0a6Ptg1kURzTDxYxmRdjuKY2Wu04CIx9/4ak33SQP3Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KXghxyRb4MP3xiQANQu4mkhRccVsU4r/VQ98l/ovcWlvWwtS757NveCP7f6PZh6NLzK/upGXxa5We25a4R+moWNL3bE/rYBvQ5H5zioKMxcS0P5d/8EKOnqHcSZomaAzziVhBocLDxtNTwBMX+1pW0nmWv+J5R9Av1E26K9g/PI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gtucker.io; spf=pass smtp.mailfrom=gtucker.io; dkim=pass (2048-bit key) header.d=gtucker.io header.i=@gtucker.io header.b=jWZohoP5; arc=none smtp.client-ip=217.70.183.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gtucker.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gtucker.io
Received: by mail.gandi.net (Postfix) with ESMTPSA id B63E544413;
	Wed, 10 Dec 2025 13:58:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gtucker.io; s=gm1;
	t=1765375122;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oQT3akhpCKQ1CDdSMpWBnnx3/WKcW/oI1Ny3o1MMouk=;
	b=jWZohoP5A0uxZK+uEA3mD2K+D+VE8HmkdgO3M5YwAppnOPiFjJFmr0CUnkcClAnh9xPDnk
	F1ANCU94zugOgLpNAf7jokDjS3Jr6J/FhtBsdC8ovy9pgMWX7gJT247eFUOxUeB5ohrT7B
	81ENYctyk3sdMJsUEKJiQzC5KPFpWQkQmkq/id2TrTfT4Fp9dqlWeBFMvQCtq7SEnicny1
	eDoGDJniRMJct3CpohhCiLnt5WZxQbiG8/McVULMtm9OiOpMyfx3B8Jr8f+oH9UCDeKZ7Q
	2R8YRSqyEpdqQnUs/bhNKD5Hm1tHM0nLg1ZTDSohqRtFBcDRtYID0tih5KlaIQ==
From: Guillaume Tucker <gtucker@gtucker.io>
To: Nathan Chancellor <nathan@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	linux-kbuild@vger.kernel.org,
	automated-testing@lists.yoctoproject.org,
	workflows@vger.kernel.org,
	llvm@lists.linux.dev,
	Arnd Bergmann <arnd@arndb.de>,
	Guillaume Tucker <gtucker@gtucker.io>
Subject: [PATCH v1 1/2] scripts: add tool to run containerized builds
Date: Wed, 10 Dec 2025 14:58:28 +0100
Message-ID: <97dec58ebe4161027f13f2215ed9da4a43bc8c47.1765374789.git.gtucker@gtucker.io>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1765374789.git.gtucker@gtucker.io>
References: <cover.1765374789.git.gtucker@gtucker.io>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: gtucker@gtucker.io
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddvvdeiudcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepifhuihhllhgruhhmvgcuvfhutghkvghruceoghhtuhgtkhgvrhesghhtuhgtkhgvrhdrihhoqeenucggtffrrghtthgvrhhnpedvhfffvddvgfeffefhhfelueegjedtkeduveffteeijeeivdfhffdtkeefkedutdenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecukfhppedvtddtudemkeeiudemgegrgedtmeekiedvtdemjeekrggsmeekfhekudemvdekledumeegsggvgeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvtddtudemkeeiudemgegrgedtmeekiedvtdemjeekrggsmeekfhekudemvdekledumeegsggvgedphhgvlhhopehsthgrrhguuhhsthdrlhgrnhdpmhgrihhlfhhrohhmpehgthhutghkvghrsehgthhutghkvghrrdhiohdpqhhiugepueeifefgheeggeegudefpdhmohguvgepshhmthhpohhuthdpnhgspghrtghpthhtohepuddtpdhrtghpthhtohepnhgrthhhrghnsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehojhgvuggrsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigq
 dhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehruhhsthdqfhhorhdqlhhinhhugiesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhksghuihhlugesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopegruhhtohhmrghtvgguqdhtvghsthhinhhgsehlihhsthhsrdihohgtthhophhrohhjvggtthdrohhrgh
X-GND-State: clean

Add a 'scripts/container' tool written in Python to run any command in
the source tree from within a container.  This can typically be used
to call 'make' with a compiler toolchain image to run reproducible
builds but any arbitrary command can be run too.  Only Docker and
Podman are supported for this initial version.

Cc: Nathan Chancellor <nathan@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>
Link: https://lore.kernel.org/all/affb7aff-dc9b-4263-bbd4-a7965c19ac4e@gtucker.io/
Signed-off-by: Guillaume Tucker <gtucker@gtucker.io>
---
 scripts/container | 112 ++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 112 insertions(+)
 create mode 100755 scripts/container

diff --git a/scripts/container b/scripts/container
new file mode 100755
index 000000000000..74644ac33685
--- /dev/null
+++ b/scripts/container
@@ -0,0 +1,112 @@
+#!/bin/env python3
+# SPDX-License-Identifier: GPL-2.0-only
+# Copyright (C) 2025 Guillaume Tucker
+
+"""Containerized builds"""
+
+import argparse
+import logging
+import os
+import subprocess
+import sys
+
+
+def get_logger(verbose):
+    """Set up a logger with the appropriate level"""
+    logger = logging.getLogger('container')
+    handler = logging.StreamHandler()
+    handler.setFormatter(logging.Formatter(
+        fmt='[container {levelname}] {message}', style='{'
+    ))
+    logger.addHandler(handler)
+    logger.setLevel(logging.DEBUG if verbose is True else logging.INFO)
+    return logger
+
+
+def run_docker(args):
+    """Run a command in a Docker container"""
+    uid = args.uid or os.getuid()
+    gid = args.gid or args.uid or os.getgid()
+    cmd = [
+        'docker', 'run',
+        '--interactive',
+        '--volume', f'{os.getcwd()}:/src',
+        '--workdir', '/src',
+        '--user', f'{uid}:{gid}'
+    ]
+    if args.env_file:
+        cmd += ['--env-file', args.env_file]
+    cmd.append(args.image)
+    cmd += args.cmd
+    return subprocess.call(cmd)
+
+
+def run_podman(args):
+    """Run a command in a Podman container"""
+    uid = args.uid or 1000
+    gid = args.gid or args.uid or 1000
+    cmd = [
+        'podman', 'run',
+        '--interactive',
+        '--volume', f'{os.getcwd()}:/src',
+        '--workdir', '/src',
+        '--userns', f'keep-id:uid={uid},gid={gid}',
+    ]
+    if args.env_file:
+        cmd += ['--env-file', args.env_file]
+    cmd.append(args.image)
+    cmd += args.cmd
+    return subprocess.call(cmd)
+
+
+def main(args):
+    """Main entry point for the container tool"""
+    logger = get_logger(args.verbose)
+    logger.debug("runtime=%s, image=%s", args.runtime, args.image)
+    runtimes = {
+        'docker': run_docker,
+        'podman': run_podman,
+    }
+    handler = runtimes.get(args.runtime)
+    if not handler:
+        logger.error("Unknown container runtime: %s", args.runtime)
+        return 1
+    try:
+        return handler(args)
+    except KeyboardInterrupt:
+        logger.error("aborted")
+        return 1
+
+
+if __name__ == '__main__':
+    parser = argparse.ArgumentParser("Containerized builds")
+    parser.add_argument(
+        '-e', '--env-file',
+        help="Path to an environment file to load in the container."
+    )
+    parser.add_argument(
+        '-g', '--gid',
+        help="Group ID to use inside the container."
+    )
+    parser.add_argument(
+        '-i', '--image', default='gcc',
+        help="Container image, default is gcc."
+    )
+    parser.add_argument(
+        '-r', '--runtime', choices=['docker', 'podman'], default='docker',
+        help="Container runtime, default is docker."
+    )
+    parser.add_argument(
+        '-u', '--uid',
+        help="User ID to use inside the container.  If the -g option is not"
+        "specified, the user ID will also be used for the group ID."
+    )
+    parser.add_argument(
+        '-v', '--verbose', action='store_true',
+        help="Enable verbose output."
+    )
+    parser.add_argument(
+        'cmd', nargs='+',
+        help="Command to run in the container"
+    )
+    sys.exit(main(parser.parse_args(sys.argv[1:])))
-- 
2.47.3


