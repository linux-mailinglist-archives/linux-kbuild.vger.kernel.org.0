Return-Path: <linux-kbuild+bounces-10806-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0Cr7LJs8cmnTfAAAu9opvQ
	(envelope-from <linux-kbuild+bounces-10806-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Thu, 22 Jan 2026 16:04:59 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 11BE968549
	for <lists+linux-kbuild@lfdr.de>; Thu, 22 Jan 2026 16:04:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id DC543929FF2
	for <lists+linux-kbuild@lfdr.de>; Thu, 22 Jan 2026 14:07:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 75E96346AF1;
	Thu, 22 Jan 2026 14:07:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gtucker.io header.i=@gtucker.io header.b="OEHVZmZ3"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 695D734402D;
	Thu, 22 Jan 2026 14:07:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769090842; cv=none; b=iY0p2+X3Unws3p07TI6cjoPunm/mXaJWkIwIEg0Iae8N2F9bACCu5abseO1P47WeE1Jf9bjWTnjn/RIC2exIVQ4zX5fmlGSJNswvXNPJT90kk3GB7aa7BDqmCdpFUuqEtL0giKbqMrlm2odkRZClrDQbXbfK8+UCp4d20IyELyY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769090842; c=relaxed/simple;
	bh=7vHTCrEOiEJkfsBFKnpnS6aRcKX8QOUns3U4parp2ro=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=s7osuggkPIIVtxUXBrIG2O6UdpbZzP0sM/RHEQnRkLwJyuIiG/an2nZXLr9Gp4A2BXrKc0vzn/0/l9U74syzb39NNkbpuOd8dURZ0LwehxdM4h1tW0HlRc+XxrDLJ+hLqvKJ6VkcpQtsek3xND9Ua2mtt4ieGCvNFkQ5pcaMl68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gtucker.io; spf=pass smtp.mailfrom=gtucker.io; dkim=pass (2048-bit key) header.d=gtucker.io header.i=@gtucker.io header.b=OEHVZmZ3; arc=none smtp.client-ip=217.70.183.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gtucker.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gtucker.io
Received: by mail.gandi.net (Postfix) with ESMTPSA id A199643B48;
	Thu, 22 Jan 2026 14:07:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gtucker.io; s=gm1;
	t=1769090832;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ELUAB8rPpZBfx/pf2+f40Rmk9ME9ideSlq/XiQKdxsg=;
	b=OEHVZmZ3Wa2VEfOmAQ4IbraGv3rGSI1L9cychL3LrYkOjEsoPFiofWpCGIDrFeNdL7/gok
	PS8uBdt1S6IIlGxBcZnMD3pIyEET35nlHRXoExiHaHAdQRsB9U6Zj6Lw4OLhNmLDH2wCeo
	3SQy9SOUft8Ze5ZZ001EwciZAFA6jUPwC2/HlR4wLI0tOt6QqutHLAScm5va4DVIQN61aL
	WLnPN/2ARmoECox9ErlqvCYLK4KHtwuVffQN/JlZ7U0nMQkHbyuE0LAgsK0VoFokMWCAgK
	zscWWP0o7/+h+8Jp36yN/vGBzaOWwXxf6PaVGbMCG5Edt7zxvU5sPeIv1gTLPg==
From: Guillaume Tucker <gtucker@gtucker.io>
To: Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nsc@kernel.org>,
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
Subject: [PATCH v4 1/2] scripts: add tool to run containerized builds
Date: Thu, 22 Jan 2026 15:06:59 +0100
Message-ID: <9b8da20157e409e8fa3134d2101678779e157256.1769090419.git.gtucker@gtucker.io>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1769090419.git.gtucker@gtucker.io>
References: <cover.1769090419.git.gtucker@gtucker.io>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-GND-Sasl: gtucker@gtucker.io
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddugeeifeeiucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffojghfgggtgfesthekredtredtjeenucfhrhhomhepifhuihhllhgruhhmvgcuvfhutghkvghruceoghhtuhgtkhgvrhesghhtuhgtkhgvrhdrihhoqeenucggtffrrghtthgvrhhnpeeiudettdfhkeehveehfeegueelgeelteeuteettddtgeeiudeiudejfedvleegteenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecukfhppedvtddtudemkeeiudemgegrgedtmeekiedvtdemvdeigegsmedurgefheemuggsheegmedufeegvgenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvtddtudemkeeiudemgegrgedtmeekiedvtdemvdeigegsmedurgefheemuggsheegmedufeegvgdphhgvlhhopehrihhnghhordhlrghnpdhmrghilhhfrhhomhepghhtuhgtkhgvrhesghhtuhgtkhgvrhdrihhopdhqihgupeetudelleeigeefueegkedpmhhouggvpehsmhhtphhouhhtpdhnsggprhgtphhtthhopedufedprhgtphhtthhopehnrghthhgrnheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepnhhstgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepohhjvggurgeskhgvr
 hhnvghlrdhorhhgpdhrtghpthhtohepuggrvhhiughgohifsehgohhoghhlvgdrtghomhdprhgtphhtthhopeifohhrkhesohhnuhhrohiikhgrnhdruggvvhdprhgtphhtthhopehgthhutghkvghrsehgthhutghkvghrrdhioh
X-GND-State: clean
X-GND-Score: -100
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.46 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_DKIM_ALLOW(-0.20)[gtucker.io:s=gm1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	DMARC_NA(0.00)[gtucker.io];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-10806-lists,linux-kbuild=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gtucker@gtucker.io,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[gtucker.io:+];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	ASN(0.00)[asn:7979, ipnet:142.0.200.0/24, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[cls.name:url,onurozkan.dev:email,logging.info:url,abc.abc:url,dfw.mirrors.kernel.org:helo,dfw.mirrors.kernel.org:rdns,gtucker.io:email,gtucker.io:dkim,gtucker.io:mid,runtime.name:url,args.shell:url]
X-Rspamd-Queue-Id: 11BE968549
X-Rspamd-Action: no action

Add a 'scripts/container' tool written in Python to run any command in
the source tree from within a container.  This can typically be used
to call 'make' with a compiler toolchain image to run reproducible
builds but any arbitrary command can be run too.  Only Docker and
Podman are supported in this initial version.

Add a new entry to MAINTAINERS accordingly.

Cc: Nathan Chancellor <nathan@kernel.org>
Cc: Nicolas Schier <nsc@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>
Cc: David Gow <davidgow@google.com>
Cc: "Onur Özkan" <work@onurozkan.dev>
Link: https://lore.kernel.org/all/affb7aff-dc9b-4263-bbd4-a7965c19ac4e@gtucker.io/
Signed-off-by: Guillaume Tucker <gtucker@gtucker.io>
---
 MAINTAINERS       |   6 ++
 scripts/container | 199 ++++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 205 insertions(+)
 create mode 100755 scripts/container

diff --git a/MAINTAINERS b/MAINTAINERS
index da9dbc1a4019..affd55ff05e0 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -6384,6 +6384,11 @@ S:	Supported
 F:	drivers/video/console/
 F:	include/linux/console*
 
+CONTAINER BUILD SCRIPT
+M:	Guillaume Tucker <gtucker@gtucker.io>
+S:	Maintained
+F:	scripts/container
+
 CONTEXT TRACKING
 M:	Frederic Weisbecker <frederic@kernel.org>
 M:	"Paul E. McKenney" <paulmck@kernel.org>
@@ -13676,6 +13681,7 @@ F:	scripts/Makefile*
 F:	scripts/bash-completion/
 F:	scripts/basic/
 F:	scripts/clang-tools/
+F:	scripts/container
 F:	scripts/dummy-tools/
 F:	scripts/include/
 F:	scripts/mk*
diff --git a/scripts/container b/scripts/container
new file mode 100755
index 000000000000..09663eccb8d3
--- /dev/null
+++ b/scripts/container
@@ -0,0 +1,199 @@
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
+import pathlib
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
+        self._shell = args.shell
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
+        """Runtime-specific handler to abort a running container"""
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
+class CommonRuntime(ContainerRuntime):
+    """Common logic for Docker and Podman"""
+
+    def _do_run(self, image, cmd, container_name):
+        cmdline = [self.name, 'run']
+        cmdline += self._get_opts(container_name)
+        cmdline.append(image)
+        cmdline += cmd
+        self._logger.debug('command: %s', ' '.join(cmdline))
+        return subprocess.call(cmdline)
+
+    def _get_opts(self, container_name):
+        opts = [
+            '--name', container_name,
+            '--rm',
+            '--volume', f'{pathlib.Path.cwd()}:/src',
+            '--workdir', '/src',
+        ]
+        if self._env_file:
+            opts += ['--env-file', self._env_file]
+        if self._shell:
+            opts += ['--interactive', '--tty']
+        return opts
+
+    def _do_abort(self, container_name):
+        subprocess.call([self.name, 'kill', container_name])
+
+
+class DockerRuntime(CommonRuntime):
+    """Run a command in a Docker container"""
+
+    name = 'docker'
+
+    def _get_opts(self, container_name):
+        return super()._get_opts(container_name) + [
+            '--user', f'{self._uid}:{self._gid}'
+        ]
+
+
+class PodmanRuntime(CommonRuntime):
+    """Run a command in a Podman container"""
+
+    name = 'podman'
+
+    def _get_opts(self, container_name):
+        return super()._get_opts(container_name) + [
+            '--userns', f'keep-id:uid={self._uid},gid={self._gid}',
+        ]
+
+
+class Runtimes:
+    """List of all supported runtimes"""
+
+    runtimes = [PodmanRuntime, DockerRuntime]
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
+        description="See the documentation for more details: "
+        "https://docs.kernel.org/dev-tools/container.html"
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
+        "on the system will be used i.e. Podman if present, otherwise Docker."
+    )
+    parser.add_argument(
+        '-s', '--shell', action='store_true',
+        help="Run the container in an interactive shell."
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


