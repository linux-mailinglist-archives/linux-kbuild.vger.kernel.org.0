Return-Path: <linux-kbuild+bounces-10155-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D29ACCBD6F
	for <lists+linux-kbuild@lfdr.de>; Thu, 18 Dec 2025 13:50:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B43FC30475CC
	for <lists+linux-kbuild@lfdr.de>; Thu, 18 Dec 2025 12:50:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 78B1C334C1A;
	Thu, 18 Dec 2025 12:50:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gtucker.io header.i=@gtucker.io header.b="M2c1mYol"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mslow3.mail.gandi.net (mslow3.mail.gandi.net [217.70.178.249])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAD2B332EC0;
	Thu, 18 Dec 2025 12:50:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.178.249
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766062223; cv=none; b=UX+qlIuJXWL7cswtoYaMwhpAanZQGRy1V4ROzlm+4O4DbHDzSJEqQaiJDvBrDeKcQBJOmlWhAM2XcTdtGN8Xyd/JbF6Dded0a5WXSTzKCCd8COC/17pSXdXtQ64d/dpmNS2d8ILZmblou7aW3ZTJvRR7Y3SyF+i7bt/hJxybV5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766062223; c=relaxed/simple;
	bh=cb1EYuLPZCGCXdZa0orsidPlMBk7O0+4oMcaMbjHA38=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HeAy35H2eSjYOEV709APB6Bb2QnYhynhFCod/FoD8kYGyrwCr/zKJIPe7C3+/1tSb0CjLQNizNuq+2HbAfFOfgUT2tFasNPDZbjjEeBDEsfhM2nRGePVsmW1cIc1WffCLgW8e8B1qzvCdo8PjqSQxb0it0Ffbz3xBep7m7ws6c0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gtucker.io; spf=pass smtp.mailfrom=gtucker.io; dkim=pass (2048-bit key) header.d=gtucker.io header.i=@gtucker.io header.b=M2c1mYol; arc=none smtp.client-ip=217.70.178.249
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gtucker.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gtucker.io
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::224])
	by mslow3.mail.gandi.net (Postfix) with ESMTP id 1B1485813AF;
	Thu, 18 Dec 2025 12:50:17 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id A87C5443CB;
	Thu, 18 Dec 2025 12:50:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gtucker.io; s=gm1;
	t=1766062209;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hfiV+MXAPfvRTSCJL7TaIGOT2OdBflC/9gc07OtO5hM=;
	b=M2c1mYolZqchb5R1EW7NiuQUkluBmdcrNYgQiL21FG+gcds4f4ZLFQCnMbSFAlQkrRMDYH
	yNtH/JqrMo4UORder2YWmQecHheKkVnmqJIn9aBUm4DkKNSNZke/GzBBBAVQvXq1khE5yA
	Zulr4popkEldBzi51i54mmv+EnZGQMMEVl30Ca23EkwwkcMPivPH0sdeXr4wfBccYe0OxJ
	lWx8fVgWNZugsuQ/Stf+wo47QqWf9sQgOUqeR01aRTG5JSveaQUNcxmPSjIhqpNvVJA3TY
	cQmw0WhpMRqcbM0Xb9JNMgkakDwqPaXDQtlGmRL3vzHQO2p1ZGssR3JTp38Qxg==
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
Subject: [PATCH v2 2/2] Documentation: dev-tools: add container.rst page
Date: Thu, 18 Dec 2025 13:49:53 +0100
Message-ID: <ff8da6b9680ef01ee44f6d0cf89e34dd76abb116.1766061692.git.gtucker@gtucker.io>
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
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdegheegjecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpefiuhhilhhlrghumhgvucfvuhgtkhgvrhcuoehgthhutghkvghrsehgthhutghkvghrrdhioheqnecuggftrfgrthhtvghrnhepheevgfdutdeufefhgfeuleeuffejkeelfefhueffkefgieevheeigeeigfejjeetnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghdpghhithhlrggsrdgtohhmnecukfhppedvtddtudemkeeiudemgegrgedtmeekiedvtdemheegiegvmeekfeefrgemfeeffhgumegvieekfeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvtddtudemkeeiudemgegrgedtmeekiedvtdemheegiegvmeekfeefrgemfeeffhgumegvieekfedphhgvlhhopehrihhnghhordhlrghnpdhmrghilhhfrhhomhepghhtuhgtkhgvrhesghhtuhgtkhgvrhdrihhopdhqihgupeetkeejveehgeegfeevuedpmhhouggvpehsmhhtphhouhhtpdhnsggprhgtphhtthhopeduvddprhgtphhtthhopehnrghthhgrnheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepohhjvggurgeskhgvrhhnvghlrdhorhhgpdhrtghpt
 hhtohepuggrvhhiughgohifsehgohhoghhlvgdrtghomhdprhgtphhtthhopeifohhrkhesohhnuhhrohiikhgrnhdruggvvhdprhgtphhtthhopehgthhutghkvghrsehgthhutghkvghrrdhiohdprhgtphhtthhopegrrhhnugesrghrnhgusgdruggv

Add a dev-tools/container.rst documentation page for the
scripts/container tool.  This covers the basic usage with additional
information about environment variables and user IDs.  It also
includes a number of practical examples with a reference to the
experimental kernel.org toolchain images.

Cc: Nathan Chancellor <nathan@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>
Cc: David Gow <davidgow@google.com>
Cc: "Onur Özkan" <work@onurozkan.dev>
Signed-off-by: Guillaume Tucker <gtucker@gtucker.io>
---
 Documentation/dev-tools/container.rst | 175 ++++++++++++++++++++++++++
 Documentation/dev-tools/index.rst     |   1 +
 2 files changed, 176 insertions(+)
 create mode 100644 Documentation/dev-tools/container.rst

diff --git a/Documentation/dev-tools/container.rst b/Documentation/dev-tools/container.rst
new file mode 100644
index 000000000000..5254feae02c2
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
+  scripts/container -i IMAGE [OPTION]... CMD...
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
+    Container image name (required).
+
+``-r, --runtime RUNTIME``
+
+    Container runtime name.  Supported runtimes: ``docker``, ``podman``.
+
+    If not specified, the first one found on the system will be used
+    i.e. Docker if present, otherwise Podman.
+
+``-u, --uid UID``
+
+    User id to use inside the container.
+
+    If the ``-g`` option is not specified, the user id will also be used for
+    the group id.
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
+The container image which would typically include a compiler toolchain is
+provided by the user and selected via the ``-i`` option.  The container runtime
+can be selected with the ``-r`` option, which can be either ``docker`` or
+``podman``.  If none is specified, the first one found on the system will be
+used.  Support for other runtimes may be added later depending on their
+popularity among users.
+
+
+Environment Variables
+=====================
+
+Environment variables are not propagated to the container so they have to be
+either defined in the image itself or via the ``-e`` option using an
+environment file.  In some cases it makes more sense to have them defined in
+the Containerfile used to create the image.  For example, a Clang-only compiler
+toolchain image may have ``LLVM=1`` defined.  The local environment file is
+more useful for user-specific variables added during development.
+
+Please note that ``make`` options can still be passed on the command line, so
+while this can't be done since the first argument needs to be the executable::
+
+  scripts/container -i tuxmake/korg-clang LLVM=1 make
+
+this will work::
+
+  scripts/container -i tuxmake/korg-clang make LLVM=1
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
+The shortest example is to run a basic kernel build using Docker and a tuxmake
+Clang image::
+
+  scripts/container -i tuxmake/korg-clang -- make LLVM=1 defconfig
+  scripts/container -i tuxmake/korg-clang -- make LLVM=1 -j$(nproc)
+
+.. note::
+
+   When running a command with options within the container, it should be
+   separated with a double dash ``--`` to not confuse them with the
+   ``container`` tool options.  Plain commands with no options don't strictly
+   require the double dashes e.g.::
+
+     scripts/container -i tuxmake/korg-clang make mrproper
+
+To run ``checkpatch.pl`` in a ``patches`` directory with a generic image::
+
+  scripts/container -i perl:slim-trixie scripts/checkpatch.pl patches/*
+
+The examples below refer to ``kernel.org`` images which are based on the
+`kernel.org compiler toolchains
+<https://mirrors.edge.kernel.org/pub/tools/>`__.  These aren't (yet) officially
+available in any public registry but users can build their own locally instead
+using this `experimental repository
+<https://gitlab.com/gtucker/korg-containers>`__ by running ``make
+PREFIX=kernel.org/``.
+
+To build just ``bzImage`` using Clang::
+
+  scripts/container -i kernel.org/clang -- make bzImage -j$(nproc)
+
+Same with GCC 15 as a particular version tag::
+
+  scripts/container -i kernel.org/gcc:15 -- make bzImage -j$(nproc)
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


