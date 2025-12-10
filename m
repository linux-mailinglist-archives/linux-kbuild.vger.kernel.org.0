Return-Path: <linux-kbuild+bounces-10045-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FC43CB3165
	for <lists+linux-kbuild@lfdr.de>; Wed, 10 Dec 2025 15:02:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A1402319CE3A
	for <lists+linux-kbuild@lfdr.de>; Wed, 10 Dec 2025 13:58:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0BD7232572B;
	Wed, 10 Dec 2025 13:58:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gtucker.io header.i=@gtucker.io header.b="dvRlJphA"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEE24199230;
	Wed, 10 Dec 2025 13:58:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765375130; cv=none; b=RbKL9dhWaySwj5YnqjBCT9358GTajCv401iZM+7RZj+vY1+dRI0tK0JJnIXpixXHRR2KX8DmWKU1XmnabbQaZ/GONwlLeYWU7oPKFZWIgcVLmLqBEn3aODQ6ZeHQiLD7QE+11y6FnUXZHV51x56iHoOSrfcQyHSiGDnHgPfl+rc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765375130; c=relaxed/simple;
	bh=ZYnbkK7w/9Ce2f4DfTpNrePenSR/1bl9OL8WjCGRX/A=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=huONOEbgmeEiDsn+z56b3gmtYC9ADLHUIk9oAYgDLjikh8jNzjWTY1frqcLX1ho4xtz3ouFK4Caj8BjN61iP7X+CDpiK6gjftoFxuE/sxSvfs5raJLC3fF1DslIKm/MMGTshFTJ1deGIG+WMkN83pfm78bMEigpi3l6lBp1ewVw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gtucker.io; spf=pass smtp.mailfrom=gtucker.io; dkim=pass (2048-bit key) header.d=gtucker.io header.i=@gtucker.io header.b=dvRlJphA; arc=none smtp.client-ip=217.70.183.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gtucker.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gtucker.io
Received: by mail.gandi.net (Postfix) with ESMTPSA id 76DE64428E;
	Wed, 10 Dec 2025 13:58:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gtucker.io; s=gm1;
	t=1765375120;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=sI+gUyOFXYEnZpQhmkAjZV83XJOAgEZ2StiKU6kfikY=;
	b=dvRlJphA4Daf0OIIMyPQBd3HtUqo9i7eO2yF1x+UK7QCeA9IMs5wLg8hVHV3L/uYFKLJl7
	I1+3pOu20RvequvZp48eQlJRbk/0MFEjjZOk1Sk+mpIWnMBLMRqVsmdBDQZrcy1q4d8abs
	vYbwDPQ4X59Q/7ORd+VxoHxHRCcWvfj7CL0RfznKPb7q8I6lABXK/wQhSj0mTKRX42WCan
	bNPNtK5GBJJ8UJ/fyLjtjmqkXigygQea09LxKKMODYLBv1mXR37HakyuEaFxgpshGdM8Ix
	xhpJaRw1M7W3A5m5eYnycbJOGiNKrdvQ+5AT61ktp0fgpXqRKyHcI4GbAboeyg==
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
Subject: [PATCH v1 0/2] scripts: introduce containerized builds
Date: Wed, 10 Dec 2025 14:58:27 +0100
Message-ID: <cover.1765374789.git.gtucker@gtucker.io>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: gtucker@gtucker.io
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddvvdeiudcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefufffkofgggfestdekredtredttdenucfhrhhomhepifhuihhllhgruhhmvgcuvfhutghkvghruceoghhtuhgtkhgvrhesghhtuhgtkhgvrhdrihhoqeenucggtffrrghtthgvrhhnpeevudefgedvheduffekjeetveffteffkeduieehveeifedvtedtgfeluddvffeftdenucffohhmrghinhepkhgvrhhnvghlrdhorhhgpdhgihhtlhgrsgdrtghomhenucfkphepvddttddumeekiedumeegrgegtdemkeeivddtmeejkegrsgemkehfkedumedvkeeludemgegsvgegnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvddttddumeekiedumeegrgegtdemkeeivddtmeejkegrsgemkehfkedumedvkeeludemgegsvgegpdhhvghlohepshhtrghrughushhtrdhlrghnpdhmrghilhhfrhhomhepghhtuhgtkhgvrhesghhtuhgtkhgvrhdrihhopdhqihgupeejieffgfeigeegvdekgfdpmhhouggvpehsmhhtphhouhhtpdhnsggprhgtphhtthhopedutddprhgtphhtthhopehnrghthhgrnheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepohhjvggurgeskhgvrhhnvghlrdhorhhgpdhrtghpt
 hhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprhhushhtqdhfohhrqdhlihhnuhigsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgsuhhilhgusehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprghuthhomhgrthgvugdqthgvshhtihhngheslhhishhtshdrhihotghtohhprhhojhgvtghtrdhorhhg
X-GND-State: clean

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
    [container DEBUG] runtime=docker, image=tuxmake/korg-clang-21
      GEN     arch/x86/include/generated/asm/orc_hash.h
      HOSTCC  scripts/basic/fixdep
      SYSHDR  arch/x86/include/generated/uapi/asm/unistd_32.h
      SYSHDR  arch/x86/include/generated/uapi/asm/unistd_64.h
      SYSHDR  arch/x86/include/generated/uapi/asm/unistd_x32.h
      WRAP    arch/x86/include/generated/uapi/asm/bpf_perf_event.h
      WRAP    arch/x86/include/generated/uapi/asm/errno.h
    [...]
      LD      arch/x86/boot/setup.elf
      OBJCOPY arch/x86/boot/setup.bin
      BUILD   arch/x86/boot/bzImage
    Kernel: arch/x86/boot/bzImage is ready  (#1)

While the example above uses a tuxmake image, I've also started
preparing reference container images with kernel.org toolchains and
no third-party dependencies other than the base Debian distro:

    https://gitlab.com/gtucker/korg-containers

This patch series include a documentation page with all the relevant
details about how to use the tool and images currently available.

Guillaume Tucker (2):
  scripts: add tool to run containerized builds
  Documentation: dev-tools: add container.rst page

 Documentation/dev-tools/container.rst | 175 ++++++++++++++++++++++++++
 Documentation/dev-tools/index.rst     |   1 +
 scripts/container                     | 112 +++++++++++++++++
 3 files changed, 288 insertions(+)
 create mode 100644 Documentation/dev-tools/container.rst
 create mode 100755 scripts/container

-- 
2.47.3


