Return-Path: <linux-kbuild+bounces-10047-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 99D30CB317A
	for <lists+linux-kbuild@lfdr.de>; Wed, 10 Dec 2025 15:03:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1B28C3190C05
	for <lists+linux-kbuild@lfdr.de>; Wed, 10 Dec 2025 13:58:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE3DB32695D;
	Wed, 10 Dec 2025 13:58:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gtucker.io header.i=@gtucker.io header.b="ikrjS9wn"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C59A325734;
	Wed, 10 Dec 2025 13:58:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765375133; cv=none; b=jt92bNg02JMFyFUHX1l2m8YpmAejf34V93rP+H47H62f+SnuEZ7LgloJeBeIW9rfrdETxqE/HZyrwO8+03q7+kvOBxvukrqQ0vno9jEnMnrwXErrUOl5jJ4kikNDywMnoeUFCPIWTbWXrnWJGFZKvjMzCnjTaZ2mZbk1DNChQzs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765375133; c=relaxed/simple;
	bh=/JzziIh37MwT/Lfc9x2Hc7McrdTQf1fNaek9/J7N4B4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Nd3mc/U9LdrHwLxNQi/Rwy1GlLHPrr6uouVBwod8LBcln9oobH+GnHqBTSPqFMO8SfFFm3uWcJbLHTNQ53v3LuqoBlZ896jnF/dRSYnhrUyPdpfs3W3DwS0YMPgRdzsDfVf4uSWq2Zqv6/Wq1yjL9534CzZnIbTVhIEy0vRwzgs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gtucker.io; spf=pass smtp.mailfrom=gtucker.io; dkim=pass (2048-bit key) header.d=gtucker.io header.i=@gtucker.io header.b=ikrjS9wn; arc=none smtp.client-ip=217.70.183.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gtucker.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gtucker.io
Received: by mail.gandi.net (Postfix) with ESMTPSA id 92CC64441A;
	Wed, 10 Dec 2025 13:58:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gtucker.io; s=gm1;
	t=1765375124;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NFTzSy6FXFZbxrTvw84HxQJWfiUUGwmuc4pWf0PrSYI=;
	b=ikrjS9wnllx6lvLrWk5y5uI86Y9rXEB6BMOdoK1CR0y47zqbfnkvsshIeu29oraAuQ3Eh6
	AVlMsTil4uvj6UjulZFUZQVFdWZm0iQF85ZuO4b9blatYCShMHocIf3tlXQRXD66XPUrb6
	Ph80YiSUX4y6MMnE+F5Gbmr7HpjeCxih1+w4vAYnSiNRj8yWZdJ4ch8bTaXf4KtD8taDCq
	Wny8vIc3AQ27BZiZyHevvTDdXH4GXrxkayliaWXB7UEwF8h65qrPYfSIRFrQdsLB+mxOUO
	hpVpgXgkLQI54IZ8a7rReHjzh2lStJICSRFXINtLdqSbR1miaVJUhkgTARQ0oA==
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
Subject: [PATCH v1 2/2] Documentation: dev-tools: add container.rst page
Date: Wed, 10 Dec 2025 14:58:29 +0100
Message-ID: <97fb956ee0d303c8e41f4266f25ebadc9ce295d7.1765374789.git.gtucker@gtucker.io>
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
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddvvdeiudcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepifhuihhllhgruhhmvgcuvfhutghkvghruceoghhtuhgtkhgvrhesghhtuhgtkhgvrhdrihhoqeenucggtffrrghtthgvrhhnpedvgfevuedtteeiudduffetgedtkeeigfegffdvledutdeviedvkeegleetkeefudenucffohhmrghinhepkhgvrhhnvghlrdhorhhgpdhgihhtlhgrsgdrtghomhenucfkphepvddttddumeekiedumeegrgegtdemkeeivddtmeejkegrsgemkehfkedumedvkeeludemgegsvgegnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvddttddumeekiedumeegrgegtdemkeeivddtmeejkegrsgemkehfkedumedvkeeludemgegsvgegpdhhvghlohepshhtrghrughushhtrdhlrghnpdhmrghilhhfrhhomhepghhtuhgtkhgvrhesghhtuhgtkhgvrhdrihhopdhqihgupeelvdevveeigeeggedutedpmhhouggvpehsmhhtphhouhhtpdhnsggprhgtphhtthhopedutddprhgtphhtthhopehnrghthhgrnheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepohhjvggurgeskhgvrhhnvghlrdhorhhgpdhrt
 ghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprhhushhtqdhfohhrqdhlihhnuhigsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgsuhhilhgusehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprghuthhomhgrthgvugdqthgvshhtihhngheslhhishhtshdrhihotghtohhprhhojhgvtghtrdhorhhg
X-GND-State: clean

Add a dev-tools/container.rst documentation page for the
scripts/container tool.  This covers the basic usage with additional
information about environment variables and user IDs.  It also
includes a number of practical examples with a reference to the
experimental kernel.org toolchain images.

Cc: Nathan Chancellor <nathan@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>
Signed-off-by: Guillaume Tucker <gtucker@gtucker.io>
---
 Documentation/dev-tools/container.rst | 175 ++++++++++++++++++++++++++
 Documentation/dev-tools/index.rst     |   1 +
 2 files changed, 176 insertions(+)
 create mode 100644 Documentation/dev-tools/container.rst

diff --git a/Documentation/dev-tools/container.rst b/Documentation/dev-tools/container.rst
new file mode 100644
index 000000000000..2a56f256f648
--- /dev/null
+++ b/Documentation/dev-tools/container.rst
@@ -0,0 +1,175 @@
+.. SPDX-License-Identifier: GPL-2.0-only
+.. Copyright (C) 2025 Guillaume Tucker
+
+====================
+Containerized Builds
+====================
+
+The ``container`` tool can be used to run any command in the kernel source tree
+from within a container.  Doing so facilitates reproducing builds across
+various platforms, for example when a test bot has reported an issue which
+requires a specific version of a compiler or an external test suite.  While
+this can already be done by users who are familiar with containers, having a
+dedicated tool in the kernel tree lowers the barrier to entry by solving common
+problems once and for all (e.g. user id management).  It also makes it easier
+to share an exact command line leading to a particular result.  The main use
+case is likely to be kernel builds but virtually anything can be run: KUnit,
+checkpatch etc. provided a suitable image is available.
+
+
+Options
+=======
+
+Command line syntax::
+
+  scripts/container [OPTION]... CMD...
+
+Available options:
+
+``-e, --env-file ENV_FILE``
+
+    Path to an environment file to load in the container.
+
+``-g, --gid GID``
+
+    Group id to use inside the container.
+
+``-i, --image IMAGE``
+
+    Container image, default is ``gcc``.
+
+``-r, --runtime RUNTIME``
+
+    Container runtime, default is ``docker``.  Supported runtimes: ``docker``,
+    ``podman``.
+
+``-u, --uid UID``
+
+    User id to use inside the container.  If the ``-g`` option is not
+    specified, the user id will also be used for the group id.
+
+``-v, --verbose``
+
+    Enable verbose output.
+
+``-h, --help``
+
+    Show the help message and exit.
+
+
+Usage
+=====
+
+It's entirely up to the user to choose which image to use and the ``CMD``
+arguments are passed directly as an arbitrary command line to run in the
+container.  The tool will take care of mounting the source tree as the current
+working directory and adjust the user and group id as needed.
+
+The container images are provided by the user and selected via the ``-i``
+option.  They will typically include a compiler toolchain to build the kernel
+and as such, the default image tag is set to ``gcc`` to give a convenient way
+of running builds.  Any local image with a GCC compiler toolchain could be
+tagged as ``gcc`` to make it point to it.  For example::
+
+  docker tag my-user/gcc:15 gcc
+
+The container runtime can be selected with the ``-r`` option, which can be
+either Docker or Podman.  Support for other runtimes may be added later
+depending on their popularity among users.
+
+
+Environment Variables
+=====================
+
+Environment variables are not propagated to the container so they have to be
+either defined in the image itself or via the ``-e`` option using an
+environment file.  In some cases it makes more sense to have them defined in
+the Containerfile used to create the image.  For example, a Clang-only compiler
+toolchain image would most likely have ``LLVM=1`` defined.  The local
+environment file is more useful for user-specific variables during development.
+
+Please note that ``make`` options can still be passed on the command line, so
+while this can't be done as the first argument needs to be the executable::
+
+  scripts/container INSTALL_MOD_STRIP=1 make modules_install
+
+this will work::
+
+  scripts/container make modules_install INSTALL_MOD_STRIP=1
+
+
+User IDs
+========
+
+This is an area where the behaviour will vary slightly depending on the
+container runtime.  The goal is to run commands as the user invoking the tool.
+With Podman, a namespace is created to map the current user id to a different
+one in the container (1000 by default).  With Docker, while this is also
+possible with recent versions it requires a special feature to be enabled in
+the daemon so it's not used here for simplicity.  Instead, the container is run
+with the current user id directly.  In both cases, this will provide the same
+file permissions for the kernel source tree mounted as a volume.  The only
+difference is that when using Docker without a namespace, the user id may not
+be the same as the default one set in the image.
+
+Say, we're using an image which sets up a default user with id 1000 and the
+current user calling the ``container`` tool has id 1234.  The kernel source
+tree was checked out by this same user so the files belong to user 1234.  With
+Podman, the container will be running as user id 1000 with a mapping to id 1234
+so that the files from the mounted volume appear to belong to id 1000 inside
+the container.  With Docker and no namespace, the container will be running
+with user id 1234 which can access the files in the volume but not in the user
+1000 home directory.  This shouldn't be an issue when running commands only in
+the kernel tree but it is worth highlighting here as it might matter for
+special corner cases.
+
+
+Examples
+========
+
+The shortest example is to run a basic kernel build using Docker and the
+default ``gcc`` image::
+
+  scripts/container -- make defconfig
+  scripts/container -- make -j$(nproc)
+
+.. note::
+
+   When running a command with options within the container, it should be
+   separated with a double dash ``--`` to not confuse them with the
+   ``container`` tool options.  Simple make targets with no options don't
+   strictly require the double dashes e.g.::
+
+     scripts/container make mrproper
+
+To run ``checkpatch.pl`` in a ``patches`` directory with a generic image::
+
+  scripts/container -i perl:slim-trixie scripts/checkpatch.pl patches/*
+
+To build using the TuxMake Clang image::
+
+  scripts/container -i tuxmake/x86_64_korg-clang -- make LLVM=1 -j$(nproc)
+
+The examples below refer to ``kernel.org`` images which are based on the
+`kernel.org compiler toolchains
+<https://mirrors.edge.kernel.org/pub/tools/>`__.  These aren't (yet) available
+in any public registry but users can build their own locally instead using this
+`experimental repository <https://gitlab.com/gtucker/korg-containers>`__ by
+running ``make PREFIX=kernel.org/``.
+
+To build just ``bzImage`` using Clang::
+
+  scripts/container -i kernel.org/clang -- make bzImage -j$(nproc)
+
+To run KUnit::
+
+  scripts/container -i kernel.org/gcc:kunit -- \
+      tools/testing/kunit/kunit.py \
+          run \
+          --arch=x86_64 \
+          --cross_compile=x86_64-linux-
+
+To build the HTML documentation, which requires the ``kdocs`` image built with
+``make PREFIX=kernel.org/ extra`` as it's not a compiler toolchain::
+
+  scripts/container -i kernel.org/kdocs make htmldocs
diff --git a/Documentation/dev-tools/index.rst b/Documentation/dev-tools/index.rst
index 4b8425e348ab..527a0e4cf2ed 100644
--- a/Documentation/dev-tools/index.rst
+++ b/Documentation/dev-tools/index.rst
@@ -38,6 +38,7 @@ Documentation/process/debugging/index.rst
    gpio-sloppy-logic-analyzer
    autofdo
    propeller
+   container
 
 
 .. only::  subproject and html
-- 
2.47.3


