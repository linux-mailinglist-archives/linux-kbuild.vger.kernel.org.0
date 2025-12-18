Return-Path: <linux-kbuild+bounces-10154-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E63DACCBD69
	for <lists+linux-kbuild@lfdr.de>; Thu, 18 Dec 2025 13:50:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 23BEB30213D1
	for <lists+linux-kbuild@lfdr.de>; Thu, 18 Dec 2025 12:50:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 49F38334681;
	Thu, 18 Dec 2025 12:50:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gtucker.io header.i=@gtucker.io header.b="QPLTg87i"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mslow3.mail.gandi.net (mslow3.mail.gandi.net [217.70.178.249])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A13CB333446;
	Thu, 18 Dec 2025 12:50:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.178.249
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766062221; cv=none; b=P9W2RheDQWvJt12KGA5p8qu+Zzuy8Ai/AmwZs0FG9Kbtc6pJgZN7efmR0R5bHtnVrVyOeRxrYAe/LWFeTDY4Pk07lnwMI57xq33Z89Vw7BxelHOHJyD6fGpyWEABdWgvc6LRKVsVLnAW2JMzhLtyEZDqUCVe6w8Vt5sOn/j4+4g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766062221; c=relaxed/simple;
	bh=3ZGjq7izSi8TdD53HqrPyBX9wTkMq/qYEyjGMBX4Gvg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=R0Mhpes0AWtbQPLcCRKeXFrIlBaGtYICxrzTBQQjbns8b3SFLy1nFmQLUOU9Yrk9SfP3V4zGSJUoBINNPFkzQNELqDgkLvB5rJqWkCHaX6bbBVsSxq+vOlCo2D19YDYl9rvegGNSmerVcKmutnrTZG+BAYfEXVM5jf+D/R1DzHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gtucker.io; spf=pass smtp.mailfrom=gtucker.io; dkim=pass (2048-bit key) header.d=gtucker.io header.i=@gtucker.io header.b=QPLTg87i; arc=none smtp.client-ip=217.70.178.249
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gtucker.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gtucker.io
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
	by mslow3.mail.gandi.net (Postfix) with ESMTP id DD9C45813A6;
	Thu, 18 Dec 2025 12:50:16 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 53CC3443C9;
	Thu, 18 Dec 2025 12:50:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gtucker.io; s=gm1;
	t=1766062208;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0eh6FrWYE/omJJYRQ5m1L6v7R/FZOmO9HIkQ9NsmlNE=;
	b=QPLTg87iRsw4gOD5Rtj8DTAYVOQ6I8pmO9UAxmLmznQ2pkDkWu5FY5eg/B4XR4gtnUq+Ra
	BvEuh3ZLUSZNKJ3nocNOOu1PJoEOkqEifICM6B35HKYHvILV6MVEg/rhdOG6f9o2lcoJwl
	SKdcvM4TmNjUPmz4Kc38biXYMJQQlI61X86eFD5etIv6Cg/BL3syGe5PebUjlNwv8ZKtYC
	jaqEzTN34/xlPDoHe5E5XxsHFtUL7elaZc8TGH1vFQ5cJhvp4vu7GgHjNzSLAHr3ferXIG
	Hl5irLvGsjgkdxcjwIwgzASdQtpfzsbMmDen3JnH7r7KgQ4kPQflimqordXiCQ==
From: Guillaume Tucker <gtucker@gtucker.io>
To: Nathan Chancellor <nathan@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	David Gow <davidgow@google.com>,
	=?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>
Cc: Guillaume Tucker <gtucker@gtucker.io>,
	Arnd Bergmann <arnd@arndb.de>,
	linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	linux-kbuild@vger.kernel.org,
	automated-testing@lists.yoctoproject.org,
	workflows@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH v2 1/2] scripts: add tool to run containerized builds
Date: Thu, 18 Dec 2025 13:49:52 +0100
Message-ID: <35b951506304b141047812f516fa946a4f1549a1.1766061692.git.gtucker@gtucker.io>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1766061692.git.gtucker@gtucker.io>
References: <cover.1766061692.git.gtucker@gtucker.io>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-GND-Sasl: gtucker@gtucker.io
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdegheegjecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpefiuhhilhhlrghumhgvucfvuhgtkhgvrhcuoehgthhutghkvghrsehgthhutghkvghrrdhioheqnecuggftrfgrthhtvghrnhepiedutedthfekheevheefgeeuleegleetueettedttdegieduiedujeefvdelgeetnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucfkphepvddttddumeekiedumeegrgegtdemkeeivddtmeehgeeivgemkeeffegrmeeffehfugemvgeikeefnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvddttddumeekiedumeegrgegtdemkeeivddtmeehgeeivgemkeeffegrmeeffehfugemvgeikeefpdhhvghloheprhhinhhgohdrlhgrnhdpmhgrihhlfhhrohhmpehgthhutghkvghrsehgthhutghkvghrrdhiohdpqhhiugepheefveevfeeggeefveelpdhmohguvgepshhmthhpohhuthdpnhgspghrtghpthhtohepuddvpdhrtghpthhtohepnhgrthhhrghnsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehojhgvuggrsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegurghvihgughhof
 iesghhoohhglhgvrdgtohhmpdhrtghpthhtohepfihorhhksehonhhurhhoiihkrghnrdguvghvpdhrtghpthhtohepghhtuhgtkhgvrhesghhtuhgtkhgvrhdrihhopdhrtghpthhtoheprghrnhgusegrrhhnuggsrdguvg

Add a 'scripts/container' tool written in Python to run any command in
the source tree from within a container.  This can typically be used
to call 'make' with a compiler toolchain image to run reproducible
builds but any arbitrary command can be run too.  Only Docker and
Podman are supported for this initial version.

Cc: Nathan Chancellor <nathan@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>
Cc: David Gow <davidgow@google.com>
Cc: "Onur Özkan" <work@onurozkan.dev>
Link: https://lore.kernel.org/all/affb7aff-dc9b-4263-bbd4-a7965c19ac4e@gtucker.io/
Signed-off-by: Guillaume Tucker <gtucker@gtucker.io>
---
 scripts/container | 194 ++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 194 insertions(+)
 create mode 100755 scripts/container

diff --git a/scripts/container b/scripts/container
new file mode 100755
index 000000000000..2d0143c7d43e
--- /dev/null
+++ b/scripts/container
@@ -0,0 +1,194 @@
+#!/usr/bin/env python3
+# SPDX-License-Identifier: GPL-2.0-only
+# Copyright (C) 2025 Guillaume Tucker
+
+"""Containerized builds"""
+
+import abc
+import argparse
+import logging
+import os
+import shutil
+import subprocess
+import sys
+import uuid
+
+
+class ContainerRuntime(abc.ABC):
+    """Base class for a container runtime implementation"""
+
+    name = None  # Property defined in each implementation class
+
+    def __init__(self, args, logger):
+        self._uid = args.uid or os.getuid()
+        self._gid = args.gid or args.uid or os.getgid()
+        self._env_file = args.env_file
+        self._logger = logger
+
+    @classmethod
+    def is_present(cls):
+        """Determine whether the runtime is present on the system"""
+        return shutil.which(cls.name) is not None
+
+    @abc.abstractmethod
+    def _do_run(self, image, cmd, container_name):
+        """Runtime-specific handler to run a command in a container"""
+
+    @abc.abstractmethod
+    def _do_abort(self, container_name):
+        """Runtime-specific handler to abort a command in running container"""
+
+    def run(self, image, cmd):
+        """Run a command in a runtime container"""
+        container_name = str(uuid.uuid4())
+        self._logger.debug("container: %s", container_name)
+        try:
+            return self._do_run(image, cmd, container_name)
+        except KeyboardInterrupt:
+            self._logger.error("user aborted")
+            self._do_abort(container_name)
+            return 1
+
+
+class DockerRuntime(ContainerRuntime):
+    """Run a command in a Docker container"""
+
+    name = 'docker'
+
+    def _do_run(self, image, cmd, container_name):
+        cmdline = [
+            'docker', 'run',
+            '--name', container_name,
+            '--rm',
+            '--tty',
+            '--volume', f'{os.getcwd()}:/src',
+            '--workdir', '/src',
+            '--user', f'{self._uid}:{self._gid}'
+        ]
+        if self._env_file:
+            cmdline += ['--env-file', self._env_file]
+        cmdline.append(image)
+        cmdline += cmd
+        return subprocess.call(cmdline)
+
+    def _do_abort(self, container_name):
+        subprocess.call(['docker', 'kill', container_name])
+
+
+class PodmanRuntime(ContainerRuntime):
+    """Run a command in a Podman container"""
+
+    name = 'podman'
+
+    def _do_run(self, image, cmd, container_name):
+        cmdline = [
+            'podman', 'run',
+            '--name', container_name,
+            '--rm',
+            '--tty',
+            '--interactive',
+            '--volume', f'{os.getcwd()}:/src',
+            '--workdir', '/src',
+            '--userns', f'keep-id:uid={self._uid},gid={self._gid}',
+        ]
+        if self._env_file:
+            cmdline += ['--env-file', self._env_file]
+        cmdline.append(image)
+        cmdline += cmd
+        return subprocess.call(cmdline)
+
+    def _do_abort(self, container_name):
+        pass  # Signals are handled by Podman in interactive mode
+
+
+class Runtimes:
+    """List of all supported runtimes"""
+
+    runtimes = [DockerRuntime, PodmanRuntime]
+
+    @classmethod
+    def get_names(cls):
+        """Get a list of all the runtime names"""
+        return list(runtime.name for runtime in cls.runtimes)
+
+    @classmethod
+    def get(cls, name):
+        """Get a single runtime class matching the given name"""
+        for runtime in cls.runtimes:
+            if runtime.name == name:
+                if not runtime.is_present():
+                    raise ValueError(f"runtime not found: {name}")
+                return runtime
+        raise ValueError(f"unknown runtime: {runtime}")
+
+    @classmethod
+    def find(cls):
+        """Find the first runtime present on the system"""
+        for runtime in cls.runtimes:
+            if runtime.is_present():
+                return runtime
+        raise ValueError("no runtime found")
+
+
+def _get_logger(verbose):
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
+def main(args):
+    """Main entry point for the container tool"""
+    logger = _get_logger(args.verbose)
+    try:
+        cls = Runtimes.get(args.runtime) if args.runtime else Runtimes.find()
+    except ValueError as ex:
+        logger.error(ex)
+        return 1
+    logger.debug("runtime: %s", cls.name)
+    logger.debug("image: %s", args.image)
+    return cls(args, logger).run(args.image, args.cmd)
+
+
+if __name__ == '__main__':
+    parser = argparse.ArgumentParser(
+        'container',
+        description="Containerized builds.  See the dev-tools/container "
+        "kernel documentation section for more details."
+    )
+    parser.add_argument(
+        '-e', '--env-file',
+        help="Path to an environment file to load in the container."
+    )
+    parser.add_argument(
+        '-g', '--gid',
+        help="Group ID to use inside the container."
+    )
+    parser.add_argument(
+        '-i', '--image', required=True,
+        help="Container image name."
+    )
+    parser.add_argument(
+        '-r', '--runtime', choices=Runtimes.get_names(),
+        help="Container runtime name.  If not specified, the first one found "
+        "on the system will be used i.e. Docker if present, otherwise Podman."
+    )
+    parser.add_argument(
+        '-u', '--uid',
+        help="User ID to use inside the container.  If the -g option is not "
+        "specified, the user ID will also be set as the group ID."
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


