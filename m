Return-Path: <linux-kbuild+bounces-10395-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D1E87CEC51E
	for <lists+linux-kbuild@lfdr.de>; Wed, 31 Dec 2025 18:08:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2BB0A3013967
	for <lists+linux-kbuild@lfdr.de>; Wed, 31 Dec 2025 17:07:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D178F29BDB0;
	Wed, 31 Dec 2025 17:07:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gtucker.io header.i=@gtucker.io header.b="iuAbOG0r"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mslow3.mail.gandi.net (mslow3.mail.gandi.net [217.70.178.249])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90E7B27E040;
	Wed, 31 Dec 2025 17:07:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.178.249
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767200865; cv=none; b=K5ovV8WP3lSwMnczKIoGZyo5lu9JfbCzMUH0llnZIgsMcSzHSjo74MRqlQ0S3L990T5WWT+hTud+Zj27gY+yaFVkvCkovNm6U5/avPz9DJ3BzzKMOWjfAQo9Ok2Q+l3KORhWkwxe7OhBy+5e6g5CaZ+WRqYcSyzMhJ+nH7p1TeY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767200865; c=relaxed/simple;
	bh=zXzBQVYOVZtCeBWwTOWDok+0Gmvjb9G1jyZ6W0/6hFY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=JYqqjiujCxk9qjekYfEp1m8O5On7+DcrId7Fd135eVySJ/RjTJ5ZqEZIPhYkn8YLDbnGRR3hsg/PJav1AyXW1UIx+KbabGyFM2J2RzG0UrUVaSQ682B67cq9cDYySTFY+x6MYda8LFMT5KKVNOH12R5j372KRI/r2qfYVvyxrFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gtucker.io; spf=pass smtp.mailfrom=gtucker.io; dkim=pass (2048-bit key) header.d=gtucker.io header.i=@gtucker.io header.b=iuAbOG0r; arc=none smtp.client-ip=217.70.178.249
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gtucker.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gtucker.io
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
	by mslow3.mail.gandi.net (Postfix) with ESMTP id 412A55801D7;
	Wed, 31 Dec 2025 16:52:10 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 158CB44369;
	Wed, 31 Dec 2025 16:51:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gtucker.io; s=gm1;
	t=1767199921;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=evmHzmeXGr9WFVB5GGpxyKiY3i5zd0f9TxFsBMVcac8=;
	b=iuAbOG0rBbSgMR2mu2b2SmprcEGhVesYdO+HGAar94r3nC80AoekfGc2MCnYBLiq3eVV7o
	g6LxV9GjM5rmM4/IZhP85pvVoOjtcMScA39QanBdJePB/0w/3GepTleB/f0X7ZxlVCcj1O
	XlVZ9GQeXzG08sY6L+dRykP5m8o3g8+9wkMtKs4p7dZY+8Wvr0xnL5u9oGgIlYx6n1X8vT
	DYM9EJKWxcvxYoZDL5hnt0Y1eNuSoz/pweW+TO/m1YG3d8ReaSl+Wf+C+ADgyG/9KpStLk
	W3leMld6vxyq9Y6IX3+Cgdvlg8jeBXXDB3m43jbHv3Eq23mhD6zNvmglzsp6Vw==
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
Subject: [PATCH v3 0/2] scripts: introduce containerized builds
Date: Wed, 31 Dec 2025 17:51:48 +0100
Message-ID: <cover.1767199119.git.gtucker@gtucker.io>
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
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdekfeegvdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefufffkofggtgfgsehtkeertdertdejnecuhfhrohhmpefiuhhilhhlrghumhgvucfvuhgtkhgvrhcuoehgthhutghkvghrsehgthhutghkvghrrdhioheqnecuggftrfgrthhtvghrnhepteehhffgudetheehheetffehtdfgvdehiefggedvhefgkeduvdfhgfdtteduteefnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghdpghhithhlrggsrdgtohhmnecukfhppedvtddtudemkeeiudemgegrgedtmeekiedvtdemhegtuggsmegrugeisgemjegvkegtmeegvdehfeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvtddtudemkeeiudemgegrgedtmeekiedvtdemhegtuggsmegrugeisgemjegvkegtmeegvdehfedphhgvlhhopehrihhnghhordhlrghnpdhmrghilhhfrhhomhepghhtuhgtkhgvrhesghhtuhgtkhgvrhdrihhopdhqihgupeduheekveeugeegfeeiledpmhhouggvpehsmhhtphhouhhtpdhnsggprhgtphhtthhopeduvddprhgtphhtthhopehnrghthhgrnheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepohhjvggurgeskhgvrhhnvghlrdhorhhgpdhrtghpthhto
 hepuggrvhhiughgohifsehgohhoghhlvgdrtghomhdprhgtphhtthhopeifohhrkhesohhnuhhrohiikhgrnhdruggvvhdprhgtphhtthhopehgthhutghkvghrsehgthhutghkvghrrdhiohdprhgtphhtthhopegrrhhnugesrghrnhgusgdruggv
X-GND-State: clean
X-GND-Score: -100

This proposal emerged from discussions over email and after a talk at
Plumbers 2024:

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

This patch series also includes a documentation page with all the
relevant details and further examples about how to use the tool.

To go one step further, I'm in the process of preparing reference
container images with kernel.org toolchains and no third-party
dependencies other than the base Debian distro.  See this thread for
more details and options to host them in an upstream way:

    https://lore.kernel.org/all/cc737636-2a43-4a97-975e-4725733f7ee4@gtucker.io/

Say, to run KUnit using the latest kernel.org GCC toolchain:

    scripts/container --shell \
        -i registry.gitlab.com/gtucker/korg-containers/gcc:kunit -- \
        tools/testing/kunit/kunit.py \
            run \
            --arch=x86_64 \
            --cross_compile=x86_64-linux-

---
Changes in v3:
- Refactor common code for Docker and Podman
- Add docs.kernel.org URL in help message
- Use pathlib Python package
- Handle signals in parent process by default
- Add --shell option to use an interactive shell
- Tweak debug messages in verbose mode
- Specify Python 3.10 as minimum version in the docs
- Provide an example env file in the docs
- Update docs regarding interactive shell usage

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

 Documentation/dev-tools/container.rst | 201 ++++++++++++++++++++++++++
 Documentation/dev-tools/index.rst     |   1 +
 scripts/container                     | 199 +++++++++++++++++++++++++
 3 files changed, 401 insertions(+)
 create mode 100644 Documentation/dev-tools/container.rst
 create mode 100755 scripts/container

-- 
2.47.3


