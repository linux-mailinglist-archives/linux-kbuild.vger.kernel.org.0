Return-Path: <linux-kbuild+bounces-10153-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2497ECCBD63
	for <lists+linux-kbuild@lfdr.de>; Thu, 18 Dec 2025 13:50:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DAD4E300980D
	for <lists+linux-kbuild@lfdr.de>; Thu, 18 Dec 2025 12:50:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 06984333745;
	Thu, 18 Dec 2025 12:50:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gtucker.io header.i=@gtucker.io header.b="L1dU708F"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mslow3.mail.gandi.net (mslow3.mail.gandi.net [217.70.178.249])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1458333453;
	Thu, 18 Dec 2025 12:50:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.178.249
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766062220; cv=none; b=ARXTQdJME51r0wcAlRBMIHwndnLsQ5doCLjx+8h6fjqrCP5r2/CGvT/l3RBCbHlCJL2z5t2NLUd4KEQ1wbajuvg6iBE5lW6l55EgL9zJOyl3ODGlodseixLzqmy1c9QhbRfobouBQLw2hfu5ML2dSTX6MM7leGbPvuNI2wIxCh0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766062220; c=relaxed/simple;
	bh=3FqguW+N1KWgl+BPYfmhGoqZNth4k6R3BJaV+6K12Cc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Wtj43quQVkVDJNWHqnMCPK7dRAuEKeBBLmVIvspQXNla4xZ+PxUndDOTNC2xypMc7+NykJEiOMlqIJk6flZa1Kpj0MrfdyMi9sxUmJbtrz23NhEW5S5FBRUi/AcS8nhZ8cS3pIeLWjKH6m86jOcGBTacOtFEuABrNmqL1cntgq0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gtucker.io; spf=pass smtp.mailfrom=gtucker.io; dkim=pass (2048-bit key) header.d=gtucker.io header.i=@gtucker.io header.b=L1dU708F; arc=none smtp.client-ip=217.70.178.249
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gtucker.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gtucker.io
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
	by mslow3.mail.gandi.net (Postfix) with ESMTP id AE8995813A3;
	Thu, 18 Dec 2025 12:50:15 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 94E1F443C7;
	Thu, 18 Dec 2025 12:50:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gtucker.io; s=gm1;
	t=1766062207;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=V8s2tGKSq0ssGPTlSp7MzGNZDN/P/3Qao4OZXsz56BQ=;
	b=L1dU708F0axmku8kVd1BQ41p4l4SGdsCPl0TO1sPvbUjnKcfHSfO0uGGGgmFxxtyvA+5yl
	7v9G9zqn2tLRRDNsxN+5eWkiRZlRIgvulsXne7LReXYehqwPP74ALXdRNZoKowL2SIOP2M
	m0nKZcd4LUHugdqN0XhrPRxPxXUnhkCgrLMFhX2APvH18XylnhndkYLtWky97V+3sWDdc7
	h78UuKJWoBgA07rmCOr+KUyKlDg9uLrwSNsDJ/clAfJW4RCsvLlj1o88CnlwMXq4lKiZeS
	USpSmRS1y+6bvUznDmTRlRLc++4qNluv0+Z7D3wdQHxNQkYB/PVhIe5q429khA==
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
Subject: [PATCH v2 0/2] scripts: introduce containerized builds
Date: Thu, 18 Dec 2025 13:49:51 +0100
Message-ID: <cover.1766061692.git.gtucker@gtucker.io>
X-Mailer: git-send-email 2.47.3
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
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdegheegjecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefufffkofggtgfgsehtkeertdertdejnecuhfhrohhmpefiuhhilhhlrghumhgvucfvuhgtkhgvrhcuoehgthhutghkvghrsehgthhutghkvghrrdhioheqnecuggftrfgrthhtvghrnhepteehhffgudetheehheetffehtdfgvdehiefggedvhefgkeduvdfhgfdtteduteefnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghdpghhithhlrggsrdgtohhmnecukfhppedvtddtudemkeeiudemgegrgedtmeekiedvtdemheegiegvmeekfeefrgemfeeffhgumegvieekfeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvtddtudemkeeiudemgegrgedtmeekiedvtdemheegiegvmeekfeefrgemfeeffhgumegvieekfedphhgvlhhopehrihhnghhordhlrghnpdhmrghilhhfrhhomhepghhtuhgtkhgvrhesghhtuhgtkhgvrhdrihhopdhqihgupeelgefgudfhgeegfeevjedpmhhouggvpehsmhhtphhouhhtpdhnsggprhgtphhtthhopeduvddprhgtphhtthhopehnrghthhgrnheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepohhjvggurgeskhgvrhhnvghlrdhorhhgpdhrtghpthhto
 hepuggrvhhiughgohifsehgohhoghhlvgdrtghomhdprhgtphhtthhopeifohhrkhesohhnuhhrohiikhgrnhdruggvvhdprhgtphhtthhopehgthhutghkvghrsehgthhutghkvghrrdhiohdprhgtphhtthhopegrrhhnugesrghrnhgusgdruggv

This proposal emerged from an email discussion and a talk at Plumbers
last year:

    https://lore.kernel.org/all/affb7aff-dc9b-4263-bbd4-a7965c19ac4e@gtucker.io/

The aim is to facilitate reproducing builds for CI bots as well as
developers using containers.  Here's an illustrative example with a
kernel.org toolchain in a Docker image from tuxmake:

    $ scripts/container -i tuxmake/korg-clang-21 make LLVM=1 defconfig
      HOSTCC  scripts/basic/fixdep
      HOSTCC  scripts/kconfig/conf.o
    [...]
      HOSTCC  scripts/kconfig/util.o
      HOSTLD  scripts/kconfig/conf
    *** Default configuration is based on 'x86_64_defconfig'
    #
    # configuration written to .config
    #

and a follow-up command to build the kernel with the verbose flag
turned on to show DEBUG log messages from the container tool:

    $ scripts/container -i tuxmake/korg-clang-21 -v -- make LLVM=1 -j8
    [container DEBUG] runtime: docker
    [container DEBUG] image: tuxmake/korg-clang-21
    [container DEBUG] container: c5a88761-f55a-4027-84c9-bc3c6dc9c4cd
      GEN     arch/x86/include/generated/asm/orc_hash.h
      HOSTCC  scripts/basic/fixdep
      SYSHDR  arch/x86/include/generated/uapi/asm/unistd_32.h
    [...]
      BUILD   arch/x86/boot/bzImage
    Kernel: arch/x86/boot/bzImage is ready  (#1)

As a next step to make this tool more useful, I'm in the process of
preparing reference container images with kernel.org toolchains and no
third-party dependencies other than the base Debian distro:

    https://gitlab.com/gtucker/korg-containers

Say, to run KUnit using the latest kernel.org GCC toolchain:

    scripts/container \
        -i registry.gitlab.com/gtucker/korg-containers/gcc:kunit -- \
        tools/testing/kunit/kunit.py \
            run \
            --arch=x86_64 \
            --cross_compile=x86_64-linux-

This patch series also include a documentation page with all the
relevant details about how to use the tool and the images currently
available.

---
Changes in v2:
- Drop default image but make -i option required
- Look for Docker and Podman if no runtime specified
- Catch SIGINT from user to abort container with Docker
- Explicitly name each container with a UUID
- Update documentation accordingly

---

Guillaume Tucker (2):
  scripts: add tool to run containerized builds
  Documentation: dev-tools: add container.rst page

 Documentation/dev-tools/container.rst | 175 +++++++++++++++++++++++
 Documentation/dev-tools/index.rst     |   1 +
 scripts/container                     | 194 ++++++++++++++++++++++++++
 3 files changed, 370 insertions(+)
 create mode 100644 Documentation/dev-tools/container.rst
 create mode 100755 scripts/container

-- 
2.47.3


