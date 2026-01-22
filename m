Return-Path: <linux-kbuild+bounces-10805-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WAttEVtHcmnpfAAAu9opvQ
	(envelope-from <linux-kbuild+bounces-10805-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Thu, 22 Jan 2026 16:50:51 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id DC5BA693F6
	for <lists+linux-kbuild@lfdr.de>; Thu, 22 Jan 2026 16:50:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id D925F72895E
	for <lists+linux-kbuild@lfdr.de>; Thu, 22 Jan 2026 14:07:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 78963345750;
	Thu, 22 Jan 2026 14:07:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gtucker.io header.i=@gtucker.io header.b="nW0oaoBd"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54B07332EA0;
	Thu, 22 Jan 2026 14:07:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769090840; cv=none; b=J3ryAVglBf8jb+5mrw4SLpFjoFSMvHmDafSUGgxw4wr9XrSAbkwcvXAubDcGl5EfuuJ6uCFGO0zZnIomoY7SQEewtDBc3XvieO7m18MwxWSj49K28e0aRmcUkQ3WYk0Ms45B2UuGZKK0/Rv3Mq5+3xb3/Q6CG8H2qrjqRzCLR7Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769090840; c=relaxed/simple;
	bh=o8Fnc7tDA9u7e+WKUpP5ddt+AauQSklbPDRdQjam9bk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=ZpexZvGWjKE1sDQr/JM+x0Ie/RU3bjJ3eZk1g0ufflPGh2mAZ8FrApaRLXzF2GBiBTiFN8inKaABM0Dcq2iIC/2H4putZTaK2EHIJ+qxdGs7pRdvi+R9Z5GLaW11BPsUTf1IoP5lB+T90tfwzhPATX2D4vynnAn5TPDDmca99AQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gtucker.io; spf=pass smtp.mailfrom=gtucker.io; dkim=pass (2048-bit key) header.d=gtucker.io header.i=@gtucker.io header.b=nW0oaoBd; arc=none smtp.client-ip=217.70.183.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gtucker.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gtucker.io
Received: by mail.gandi.net (Postfix) with ESMTPSA id AFD3A43B7E;
	Thu, 22 Jan 2026 14:07:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gtucker.io; s=gm1;
	t=1769090830;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=c3aQ7QA+yecgc0GxY7POFPLQiHPMdmuQa4DEpJX4QTk=;
	b=nW0oaoBd2qd2Zb0OCnfB8VMGnYIzAU3GOCK3xL8F8i2lrqYqArsYaI7MxzymZ1LE2DoNcH
	AOoHMrs4No3xs7cW3QnoGqGof1R6gKWf8mhMQhqJiA2r2t18ehJYuShTGy17i/04Pg8bY+
	ChZWgY+PfB56ZkGQHmPjONFzyx7mK7gnymwq2wiwxBBIl7IY28H2ne9MMxBh6TPyWeg9lL
	axnwOg9w/jWNwci0b1BdW+up/qn/WO4Xb9pXvHQxj/W82guBrA7ufzF2vTOXk+LdWqnXzv
	eZ1zz7Lcvnllsg0dAoBH6i8hhMELqVdc8uSQCE/kcggb9jYw5y8/SILwJE+RCQ==
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
Subject: [PATCH v4 0/2] scripts: introduce containerized builds
Date: Thu, 22 Jan 2026 15:06:58 +0100
Message-ID: <cover.1769090419.git.gtucker@gtucker.io>
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
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddugeeifeeiucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffogggtgfesthekredtredtjeenucfhrhhomhepifhuihhllhgruhhmvgcuvfhutghkvghruceoghhtuhgtkhgvrhesghhtuhgtkhgvrhdrihhoqeenucggtffrrghtthgvrhhnpeeuuefggeevheekueeuhfduvdevtdeugeehvdeiieekjeeuudettdeutdevgedvkeenucffohhmrghinhepkhgvrhhnvghlrdhorhhgpdguohgtkhgvrhdrihhopdhgihhtlhgrsgdrtghomhenucfkphepvddttddumeekiedumeegrgegtdemkeeivddtmedvieegsgemudgrfeehmegusgehgeemudefgegvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvddttddumeekiedumeegrgegtdemkeeivddtmedvieegsgemudgrfeehmegusgehgeemudefgegvpdhhvghloheprhhinhhgohdrlhgrnhdpmhgrihhlfhhrohhmpehgthhutghkvghrsehgthhutghkvghrrdhiohdpqhhiugeptefhffefteegfeeujefgpdhmohguvgepshhmthhpohhuthdpnhgspghrtghpthhtohepudefpdhrtghpthhtohepnhgrthhhrghnsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehnshgtsehkvghrnhgvlhdro
 hhrghdprhgtphhtthhopehojhgvuggrsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegurghvihgughhofiesghhoohhglhgvrdgtohhmpdhrtghpthhtohepfihorhhksehonhhurhhoiihkrghnrdguvghvpdhrtghpthhtohepghhtuhgtkhgvrhesghhtuhgtkhgvrhdrihho
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
	TAGGED_FROM(0.00)[bounces-10805-lists,linux-kbuild=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gtucker@gtucker.io,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[gtucker.io:+];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	ASN(0.00)[asn:7979, ipnet:2a01:60a::/32, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[docker.io:url,ams.mirrors.kernel.org:helo,ams.mirrors.kernel.org:rdns,gitlab.com:url,gtucker.io:mid,gtucker.io:dkim]
X-Rspamd-Queue-Id: DC5BA693F6
X-Rspamd-Action: no action

This proposal emerged from discussions over email and after a talk at
Plumbers 2024:

    https://lore.kernel.org/all/affb7aff-dc9b-4263-bbd4-a7965c19ac4e@gtucker.io/

The aim is to facilitate reproducing builds for CI bots as well as
developers using containers.  Here's an illustrative example with a
kernel.org toolchain in a Docker image from tuxmake:

    $ scripts/container -i docker.io/tuxmake/korg-clang-21 make LLVM=1 defconfig
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
Changes in v4:
- Add entries to MAINTAINERS for the new script and docs
- Give priority to Podman over Docker when no -r option given
- Update help message and docs regarding Podman priority
- Add note and workaround for out-of-tree builds in the docs
- Mention TuxMake prebuilt images more explicitly in the docs

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

 Documentation/dev-tools/container.rst | 227 ++++++++++++++++++++++++++
 Documentation/dev-tools/index.rst     |   1 +
 MAINTAINERS                           |   7 +
 scripts/container                     | 199 ++++++++++++++++++++++
 4 files changed, 434 insertions(+)
 create mode 100644 Documentation/dev-tools/container.rst
 create mode 100755 scripts/container

-- 
2.47.3


