Return-Path: <linux-kbuild+bounces-10807-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mClvKeM/cmnpfAAAu9opvQ
	(envelope-from <linux-kbuild+bounces-10807-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Thu, 22 Jan 2026 16:18:59 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 3486D6894D
	for <lists+linux-kbuild@lfdr.de>; Thu, 22 Jan 2026 16:18:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 6060394956A
	for <lists+linux-kbuild@lfdr.de>; Thu, 22 Jan 2026 14:08:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2FB523491C2;
	Thu, 22 Jan 2026 14:07:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gtucker.io header.i=@gtucker.io header.b="Rud1y+dt"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67580345743;
	Thu, 22 Jan 2026 14:07:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769090844; cv=none; b=ETZgIWnLCmlMTqZWXrdFndltjK2kAS9MGOaoOQ8v2KTp1Mh3Vw75MKpWh/Y4ibP4ZEoCNdsiIW7/UoGaFuz6v94S8Q+ZDWH2FM6lCot3VyM5M2BzOz32Svg+utT/eXcCLrqsBDr4L1ZH1CBwvz/z8hBSSKLIRPVifMB9KadWOoY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769090844; c=relaxed/simple;
	bh=MPFWzCRMQFvNBBWMESM2u/ts+T7p/a41Aaoq0Z93YoA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hXShk0z2YE0mMnD2Hlb9IxF9SIOGL2C8Ged8P/sbkabBpuVbhEHBx3fosDd61ESUxHo6VpxG/sQy04QUqbJcJrc5V7twfccKGlhSXvHmsWm7wQfSAdzcgQH4TLLGTuxm6D/YPSRELcg8klueWBTRz0qavqtuaItkcmgNWwIJA9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gtucker.io; spf=pass smtp.mailfrom=gtucker.io; dkim=pass (2048-bit key) header.d=gtucker.io header.i=@gtucker.io header.b=Rud1y+dt; arc=none smtp.client-ip=217.70.183.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gtucker.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gtucker.io
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3638441DF3;
	Thu, 22 Jan 2026 14:07:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gtucker.io; s=gm1;
	t=1769090833;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WV9yo6vv4rX2CVpVHGPy28S5A9jqZyPD+02tk7gtpU8=;
	b=Rud1y+dtpT/bj7voBBSMnGGDvn4VTaL5IRHgqhteS2DwWbu5dUf+CtFa4kPxqxdawUlvkA
	/pC8rOFJvyOjg2Vqd2fIW5qPI3vvPNxJSI+4w9if86BDai56XXzOxDXF4niNVwhwclbrVl
	DM+wSISOhCigEBIb+ah4ffBX0ohqYpKpZUsjk5GDWYczk4fWK5Li5TUKAkmRLvalImtWTC
	y0fqy6dBhUxOT1mNhx+2wUXlsn6Fi+78PkMQNAjZ0RDb7LC2mxIB03oMHsc6JXPf2MM2dB
	CkunDy7M90x0oEp4jM1i2CCVx/eiNaMwJLxSFIMhgFWb3Yva+1TZZspFX8IyUg==
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
Subject: [PATCH v4 2/2] Documentation: dev-tools: add container.rst page
Date: Thu, 22 Jan 2026 15:07:00 +0100
Message-ID: <af886533cc5cbdd6ef1d909793b79a1ad42c74ca.1769090419.git.gtucker@gtucker.io>
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
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddugeeifeeiucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffojghfgggtgfesthekredtredtjeenucfhrhhomhepifhuihhllhgruhhmvgcuvfhutghkvghruceoghhtuhgtkhgvrhesghhtuhgtkhgvrhdrihhoqeenucggtffrrghtthgvrhhnpeelvdegheehuedvhfehheevfeekleefgefgieevteeugfdvteeiudduvddvvdfgvdenucffohhmrghinhepughotghkvghrrdhiohdpphhoughmrghnqdguvghskhhtohhprdhiohdpughotghkvghrrdgtohhmpdhkvghrnhgvlhdrohhrghdpghhithhlrggsrdgtohhmnecukfhppedvtddtudemkeeiudemgegrgedtmeekiedvtdemvdeigegsmedurgefheemuggsheegmedufeegvgenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvtddtudemkeeiudemgegrgedtmeekiedvtdemvdeigegsmedurgefheemuggsheegmedufeegvgdphhgvlhhopehrihhnghhordhlrghnpdhmrghilhhfrhhomhepghhtuhgtkhgvrhesghhtuhgtkhgvrhdrihhopdhqihgupeefieefkeeggedufffhfedpmhhouggvpehsmhhtphhouhhtpdhnsggprhgtphhtthhopedufedprhgtphhtthhopehnrghthhgrn
 heskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepnhhstgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepohhjvggurgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepuggrvhhiughgohifsehgohhoghhlvgdrtghomhdprhgtphhtthhopeifohhrkhesohhnuhhrohiikhgrnhdruggvvhdprhgtphhtthhopehgthhutghkvghrsehgthhutghkvghrrdhioh
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
	TAGGED_FROM(0.00)[bounces-10807-lists,linux-kbuild=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[podman-desktop.io:url,docker.io:url,gitlab.com:url,onurozkan.dev:email,gtucker.io:email,gtucker.io:dkim,gtucker.io:mid,dfw.mirrors.kernel.org:helo,dfw.mirrors.kernel.org:rdns,docker.com:url]
X-Rspamd-Queue-Id: 3486D6894D
X-Rspamd-Action: no action

Add a dev-tools/container.rst documentation page for the
scripts/container tool.  This covers the basic usage with additional
information about environment variables and user IDs.  It also
includes a number of practical examples with a reference to the
experimental kernel.org toolchain images.

Update MAINTAINERS accordingly with a reference to the added file.

Cc: Nathan Chancellor <nathan@kernel.org>
Cc: Nicolas Schier <nsc@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>
Cc: David Gow <davidgow@google.com>
Cc: "Onur Özkan" <work@onurozkan.dev>
Signed-off-by: Guillaume Tucker <gtucker@gtucker.io>
---
 Documentation/dev-tools/container.rst | 227 ++++++++++++++++++++++++++
 Documentation/dev-tools/index.rst     |   1 +
 MAINTAINERS                           |   1 +
 3 files changed, 229 insertions(+)
 create mode 100644 Documentation/dev-tools/container.rst

diff --git a/Documentation/dev-tools/container.rst b/Documentation/dev-tools/container.rst
new file mode 100644
index 000000000000..452415b64662
--- /dev/null
+++ b/Documentation/dev-tools/container.rst
@@ -0,0 +1,227 @@
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
+    i.e. Podman if present, otherwise Docker.
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
+used while giving priority to Podman.  Support for other runtimes may be added
+later depending on their popularity among users.
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
+.. note::
+
+   Out-of-tree builds are not fully supported yet.  The ``O=`` option can
+   however already be used with a relative path inside the source tree to keep
+   separate build outputs.  A workaround to build outside the tree is to use
+   ``mount --bind``, see the examples section further down.
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
+  scripts/container -i docker.io/tuxmake/korg-clang LLVM=1 make  # won't work
+
+this will work::
+
+  scripts/container -i docker.io/tuxmake/korg-clang make LLVM=1
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
+.. note::
+
+   Podman's `Docker compatibility
+   <https://podman-desktop.io/docs/migrating-from-docker/managing-docker-compatibility>`__
+   mode to run ``docker`` commands on top of a Podman backend is more complex
+   and not fully supported yet.  As such, Podman will take priority if both
+   runtimes are available on the system.
+
+
+Examples
+========
+
+The TuxMake project provides a variety of prebuilt container images available
+on `Docker Hub <https://hub.docker.com/u/tuxmake>`__.  Here's the shortest
+example to build a kernel using a TuxMake Clang image::
+
+  scripts/container -i docker.io/tuxmake/korg-clang -- make LLVM=1 defconfig
+  scripts/container -i docker.io/tuxmake/korg-clang -- make LLVM=1 -j$(nproc)
+
+.. note::
+
+   When running a command with options within the container, it should be
+   separated with a double dash ``--`` to not confuse them with the
+   ``container`` tool options.  Plain commands with no options don't strictly
+   require the double dashes e.g.::
+
+     scripts/container -i docker.io/tuxmake/korg-clang make mrproper
+
+To run ``checkpatch.pl`` in a ``patches`` directory with a generic Perl image::
+
+  scripts/container -i perl:slim-trixie scripts/checkpatch.pl patches/*
+
+As an alternative to the TuxMake images, the examples below refer to
+``kernel.org`` images which are based on the `kernel.org compiler toolchains
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
+For an out-of-tree build, a trick is to bind-mount the destination directory to
+a relative path inside the source tree::
+
+  mkdir -p $HOME/tmp/my-kernel-build
+  mkdir -p build
+  sudo mount --bind $HOME/tmp/my-kernel-build build
+  scripts/container -i kernel.org/gcc -- make mrproper
+  scripts/container -i kernel.org/gcc -- make O=build defconfig
+  scripts/container -i kernel.org/gcc -- make O=build -j$(nproc)
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
diff --git a/MAINTAINERS b/MAINTAINERS
index affd55ff05e0..4e82dba3bd25 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -6387,6 +6387,7 @@ F:	include/linux/console*
 CONTAINER BUILD SCRIPT
 M:	Guillaume Tucker <gtucker@gtucker.io>
 S:	Maintained
+F:	Documentation/dev-tools/container.rst
 F:	scripts/container
 
 CONTEXT TRACKING
-- 
2.47.3


