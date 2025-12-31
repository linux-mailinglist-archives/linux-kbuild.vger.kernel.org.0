Return-Path: <linux-kbuild+bounces-10393-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D1429CEC503
	for <lists+linux-kbuild@lfdr.de>; Wed, 31 Dec 2025 18:05:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 494FD3001010
	for <lists+linux-kbuild@lfdr.de>; Wed, 31 Dec 2025 17:05:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 249CA284883;
	Wed, 31 Dec 2025 17:05:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gtucker.io header.i=@gtucker.io header.b="dp0iqhuz"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mslow3.mail.gandi.net (mslow3.mail.gandi.net [217.70.178.249])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43AFB28134F;
	Wed, 31 Dec 2025 17:05:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.178.249
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767200746; cv=none; b=mMqdLhoNDIb3XGuJF/pbjLNmti+gZImz6EkIZ0Vr7czq8wK9dVKWNGEWqB96efjq6sWFOlcYGkBexJnVPNsFIw9QW8JVp5oGBkut5I6Joum9oCtnpvjoMpPIO9md/2z1BCUbWs+4ri4Oyf6Al8sIO8UlXQswcgte11FyhgyTKUU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767200746; c=relaxed/simple;
	bh=snBHHuvWf5KyvsHCFEdGk2glkLavsJi49GeO5lf6bDA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PqVP79WE2IG49z2xyt3qp/UrtR2mdNWaTwdSIWHnFg1VHB/Uew9gn7pcQ2vmC/5UOGpxm9HBJ04G6qEdVEaxKbZRGl/5njem35ZLc+fdisurqvLUwdCV/6zSp8NOKYIg9lZqrANC5nO3jJ+CPReWJGPNYPKg9MsByFjjkDnswC4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gtucker.io; spf=pass smtp.mailfrom=gtucker.io; dkim=pass (2048-bit key) header.d=gtucker.io header.i=@gtucker.io header.b=dp0iqhuz; arc=none smtp.client-ip=217.70.178.249
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gtucker.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gtucker.io
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::221])
	by mslow3.mail.gandi.net (Postfix) with ESMTP id 262B5580A0E;
	Wed, 31 Dec 2025 16:52:11 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6579F44378;
	Wed, 31 Dec 2025 16:52:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gtucker.io; s=gm1;
	t=1767199924;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/drX+57VWb7xTVKQES/W9fjxSDva5SqLzUqmVIPNHes=;
	b=dp0iqhuzids1AC7oyae5n5xxq9Ii/eLoFgitMMCPtmQeQet5Sqr3yWvg7kP41h8NM+FWq0
	KPzW+EdRcQR4KVmerkLFqNEMJ9TWNdUBlLOJNa3R0rPbKPkQmhGtPH8n2W176/zxCh7/hu
	q3BPTSXUHag+aE9gV7I1xWMYLT6sE1jduWr6JQnDWxfy30lsqwtgO9E4wQHbUvQSng+Bzz
	ctD5iGAHfEHpvuLVmMSw/esaUDJC4Lu5BaJD1mnPCC0vyycANT61ygXo+0My/xpsKKbVvb
	7IV+8y9WnU4WCePjVd9XoQ8876mODivRbftmcdasd33Qb/l9vrXqQQDcbIB2Hg==
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
Subject: [PATCH v3 2/2] Documentation: dev-tools: add container.rst page
Date: Wed, 31 Dec 2025 17:51:50 +0100
Message-ID: <c859f9b6dd5313136f7a445497d6209405eafa7e.1767199119.git.gtucker@gtucker.io>
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
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdekfeegvdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpefiuhhilhhlrghumhgvucfvuhgtkhgvrhcuoehgthhutghkvghrsehgthhutghkvghrrdhioheqnecuggftrfgrthhtvghrnhepheevgfdutdeufefhgfeuleeuffejkeelfefhueffkefgieevheeigeeigfejjeetnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghdpghhithhlrggsrdgtohhmnecukfhppedvtddtudemkeeiudemgegrgedtmeekiedvtdemhegtuggsmegrugeisgemjegvkegtmeegvdehfeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvtddtudemkeeiudemgegrgedtmeekiedvtdemhegtuggsmegrugeisgemjegvkegtmeegvdehfedphhgvlhhopehrihhnghhordhlrghnpdhmrghilhhfrhhomhepghhtuhgtkhgvrhesghhtuhgtkhgvrhdrihhopdhqihgupeeiheejlefhgeegfeejkedpmhhouggvpehsmhhtphhouhhtpdhnsggprhgtphhtthhopeduvddprhgtphhtthhopehnrghthhgrnheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepohhjvggurgeskhgvrhhnvghlrdhorhhgpdhrtghpt
 hhtohepuggrvhhiughgohifsehgohhoghhlvgdrtghomhdprhgtphhtthhopeifohhrkhesohhnuhhrohiikhgrnhdruggvvhdprhgtphhtthhopehgthhutghkvghrsehgthhutghkvghrrdhiohdprhgtphhtthhopegrrhhnugesrghrnhgusgdruggv
X-GND-State: clean
X-GND-Score: -100

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
 Documentation/dev-tools/container.rst | 201 ++++++++++++++++++++++++++
 Documentation/dev-tools/index.rst     |   1 +
 2 files changed, 202 insertions(+)
 create mode 100644 Documentation/dev-tools/container.rst

diff --git a/Documentation/dev-tools/container.rst b/Documentation/dev-tools/container.rst
new file mode 100644
index 000000000000..f6f134ec09f5
--- /dev/null
+++ b/Documentation/dev-tools/container.rst
@@ -0,0 +1,201 @@
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
+``-s, --shell``
+
+    Run the container in an interactive shell.
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
+By default, commands are run non-interactively.  The user can abort a running
+container with SIGINT (Ctrl-C).  To run commands interactively with a TTY, the
+``--shell`` or ``-s`` option can be used.  Signals will then be received by the
+shell directly rather than the parent ``container`` process.  To exit an
+interactive shell, use Ctrl-D or ``exit``.
+
+.. note::
+
+   The only host requirement aside from a container runtime is Python 3.10 or
+   later.
+
+
+Environment Variables
+=====================
+
+Environment variables are not propagated to the container so they have to be
+either defined in the image itself or via the ``-e`` option using an
+environment file.  In some cases it makes more sense to have them defined in
+the Containerfile used to create the image.  For example, a Clang-only compiler
+toolchain image may have ``LLVM=1`` defined.
+
+The local environment file is more useful for user-specific variables added
+during development.  It is passed as-is to the container runtime so its format
+may vary.  Typically, it will look like the output of ``env``.  For example::
+
+  INSTALL_MOD_STRIP=1
+  SOME_RANDOM_TEXT=One upon a time
+
+Please also note that ``make`` options can still be passed on the command line,
+so while this can't be done since the first argument needs to be the
+executable::
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
+The shortest example is to run a basic kernel build using the default runtime
+(e.g. Docker) and a ``tuxmake`` Clang image::
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
+To run KUnit in an interactive shell and get the full output::
+
+  scripts/container -s -i kernel.org/gcc:kunit -- \
+      tools/testing/kunit/kunit.py \
+          run \
+          --arch=x86_64 \
+          --cross_compile=x86_64-linux-
+
+To just start an interactive shell::
+
+  scripts/container -si kernel.org/gcc bash
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


