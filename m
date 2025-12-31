Return-Path: <linux-kbuild+bounces-10394-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DA76CEC509
	for <lists+linux-kbuild@lfdr.de>; Wed, 31 Dec 2025 18:06:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CB0E93007FE6
	for <lists+linux-kbuild@lfdr.de>; Wed, 31 Dec 2025 17:06:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E18C29B778;
	Wed, 31 Dec 2025 17:06:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gtucker.io header.i=@gtucker.io header.b="GMfnFXoc"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mslow3.mail.gandi.net (mslow3.mail.gandi.net [217.70.178.249])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 379682264A8;
	Wed, 31 Dec 2025 17:06:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.178.249
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767200808; cv=none; b=jdlrcSRbd+dD0tZ8HxPwrYBPAeii+S3QU7RMrJQRldkWhCiQ4wJHV3BlAJ1pPdJqbcDOZZKxQh3k5XYuOWPLtLLt7AOT0LOsGx1sdDuBNPk/3aPR8kpEtU+BT/nwUs0b9fcivOY2+C5otkLaLQmb5Z8CC6HlopePz8AkKg8OF+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767200808; c=relaxed/simple;
	bh=08qENKMeP00VQMtrQQsCNu5hwZ3WKCRVlYd937RuWeQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KhsdlEaOYqVq/xgWnZZHGsGWUvPWJgfl39bllNtziyKx9/A2Z1sEpIpwM5jWAWwG/bWTs77vNh8InnTMaCBDVQ7Sa6TRrqkkDaugjTrei7RyJGLJ3I/qMHhgjrNuCwILnh+tJMHOYQgbbLpJSngb5ZbF++vR22IbAUXJdxvpHbQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gtucker.io; spf=pass smtp.mailfrom=gtucker.io; dkim=pass (2048-bit key) header.d=gtucker.io header.i=@gtucker.io header.b=GMfnFXoc; arc=none smtp.client-ip=217.70.178.249
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gtucker.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gtucker.io
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
	by mslow3.mail.gandi.net (Postfix) with ESMTP id 1D029580943;
	Wed, 31 Dec 2025 16:52:10 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id F214744362;
	Wed, 31 Dec 2025 16:52:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gtucker.io; s=gm1;
	t=1767199923;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+8UmjS8S+/8MNsVq58/dgiI/xTcToFpjDLJebr6IuC8=;
	b=GMfnFXocKTyuPgQpigA89xEUV7wlV47LmLm/ieXvrxQgaQmhRDLg/r3IGGj6ZkcAokzeIP
	7rxlkbB+yN5B6o+KzMAspZOe9Ob7kqs+zonze9IQkrCIlVxIN9T9OBDs/xO2Vz5uJfJkyk
	AP6J+NzsRssMKXQ90mWY2ytYlXnQHYLVyQH4XMtzg1Nk/CF2INLtdzbgjf4mN4p9ZpOeSv
	4/W5lh/FYjofo5F6qaxf2yRUKqV4+XxLmdlHgNqNmA0Yvp17Ie3moIGWIasupgVsD5E9gw
	0e64bvyksC63R0EUNICDQR9ltpf4Eh8FDmqwNDcx1O/C4+4swZTa91p0Sq+KwA==
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
Subject: [PATCH v3 1/2] scripts: add tool to run containerized builds
Date: Wed, 31 Dec 2025 17:51:49 +0100
Message-ID: <202d0ddfb13006c784cb0c8ea9a087b6a73bce69.1767199119.git.gtucker@gtucker.io>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1767199119.git.gtucker@gtucker.io>
References: <cover.1767199119.git.gtucker@gtucker.io>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-GND-Sasl: gtucker@gtucker.io
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdekfeegvdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpefiuhhilhhlrghumhgvucfvuhgtkhgvrhcuoehgthhutghkvghrsehgthhutghkvghrrdhioheqnecuggftrfgrthhtvghrnhepiedutedthfekheevheefgeeuleegleetueettedttdegieduiedujeefvdelgeetnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucfkphepvddttddumeekiedumeegrgegtdemkeeivddtmeehtggusgemrgguiegsmeejvgektgemgedvheefnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvddttddumeekiedumeegrgegtdemkeeivddtmeehtggusgemrgguiegsmeejvgektgemgedvheefpdhhvghloheprhhinhhgohdrlhgrnhdpmhgrihhlfhhrohhmpehgthhutghkvghrsehgthhutghkvghrrdhiohdpqhhiugephfdvudegjeeggeefiedvpdhmohguvgepshhmthhpohhuthdpnhgspghrtghpthhtohepuddvpdhrtghpthhtohepnhgrthhhrghnsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehojhgvuggrsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegurghvihgughhof
 iesghhoohhglhgvrdgtohhmpdhrtghpthhtohepfihorhhksehonhhurhhoiihkrghnrdguvghvpdhrtghpthhtohepghhtuhgtkhgvrhesghhtuhgtkhgvrhdrihhopdhrtghpthhtoheprghrnhgusegrrhhnuggsrdguvg
X-GND-State: clean
X-GND-Score: -100

Add a 'scripts/container' tool written in Python to run any command in
the source tree from within a container.  This can typically be used
to call 'make' with a compiler toolchain image to run reproducible
builds but any arbitrary command can be run too.  Only Docker and
Podman are supported in this initial version.

Cc: Nathan Chancellor <nathan@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>
Cc: David Gow <davidgow@google.com>
Cc: "Onur Özkan" <work@onurozkan.dev>
Link: https://lore.kernel.org/all/affb7aff-dc9b-4263-bbd4-a7965c19ac4e@gtucker.io/
Signed-off-by: Guillaume Tucker <gtucker@gtucker.io>
---
 scripts/container | 199 ++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 199 insertions(+)
 create mode 100755 scripts/container

diff --git a/scripts/container b/scripts/container
new file mode 100755
index 000000000000..dbe92630f05b
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
+        "on the system will be used i.e. Docker if present, otherwise Podman."
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


