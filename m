Return-Path: <linux-kbuild+bounces-2860-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A56E1949BEF
	for <lists+linux-kbuild@lfdr.de>; Wed,  7 Aug 2024 01:11:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 60E0B285239
	for <lists+linux-kbuild@lfdr.de>; Tue,  6 Aug 2024 23:11:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC118179650;
	Tue,  6 Aug 2024 23:10:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hZOOQ616"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C509175D48;
	Tue,  6 Aug 2024 23:10:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722985803; cv=none; b=lTio5QZYNAvY8KVe8eb0q6qBPlkK5hH9/1ldsz499AENxK/EdBse484GTQGQSZBTljUD+pG9NfCJmf2l3ZPYhevCwURsSGlGrZx/qWgoIsJMbLYxRXiu58rP5laDxwVTvYgAEPIM41LaIZwGtp8MW2THUDluPwXn2Q388Tku48M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722985803; c=relaxed/simple;
	bh=TxCIbk5kpqAWpCSxGxR1hhZf2RT69+54zaMWnuFPywQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ElJx7kM166t6y1R8da2zv92mTGaapSicS0y9hA+8+BFAp5ppH5K0epteHQvKN8zx/05zOCcdSNt/nYQVq3TuxnkxuBITJf1IuyIfQ4kq1xXf7+m/c+GTKhHUvauEGLiTvacS8MguyagWrXidyT76Zia54APG21GYqEFQGiHpMbk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hZOOQ616; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id CC20EC4AF0C;
	Tue,  6 Aug 2024 23:10:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722985802;
	bh=TxCIbk5kpqAWpCSxGxR1hhZf2RT69+54zaMWnuFPywQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=hZOOQ616lMICi1so631oPK8lRs/b8+S/8NaZ6SrLVqGuF+LQNJgMyPSJa1nIbWE2q
	 VqyNqczws1XjLMxdIMijDBp6g6qTQwD6CMVOLaiwwwBx9EfUJm2PNcQCxR2HBhdQ9Y
	 Mmtjek0ooH7L0sjGVJ2vTl9/2kYXQwT2EOrBmVxZEyLp8iDAB2AgnrBxIbZQd5BgLm
	 90n8FyZfoEp0mpvKWjPlgi/xZIN/2dCunx9ghGpPs8kYMtNeF5BdN08WnomLmfQZ5K
	 IYyO4kNQrRObqmsxmBC9Cxv1pPaWq1XytcmrulFBUrsRx6OkZDFLr2FTYDc+GVqBcm
	 DHda1Az6QvaXw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3827C52D7B;
	Tue,  6 Aug 2024 23:10:02 +0000 (UTC)
From: Daniel Gomez via B4 Relay <devnull+da.gomez.samsung.com@kernel.org>
Date: Wed, 07 Aug 2024 01:09:15 +0200
Subject: [PATCH 01/12] scripts: subarch.include: fix SUBARCH on MacOS hosts
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240807-macos-build-support-v1-1-4cd1ded85694@samsung.com>
References: <20240807-macos-build-support-v1-0-4cd1ded85694@samsung.com>
In-Reply-To: <20240807-macos-build-support-v1-0-4cd1ded85694@samsung.com>
To: Masahiro Yamada <masahiroy@kernel.org>, 
 Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, 
 Lucas De Marchi <lucas.demarchi@intel.com>, 
 =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 William Hubbs <w.d.hubbs@gmail.com>, Chris Brannon <chris@the-brannons.com>, 
 Kirk Reiser <kirk@reisers.ca>, 
 Samuel Thibault <samuel.thibault@ens-lyon.org>, 
 Paul Moore <paul@paul-moore.com>, 
 Stephen Smalley <stephen.smalley.work@gmail.com>, 
 Ondrej Mosnacek <omosnace@redhat.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
 James Morse <james.morse@arm.com>, 
 Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Zenghui Yu <yuzenghui@huawei.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, 
 Nick Desaulniers <ndesaulniers@google.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>
Cc: linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, 
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 speakup@linux-speakup.org, selinux@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
 linux-serial@vger.kernel.org, llvm@lists.linux.dev, 
 Finn Behrens <me@kloenk.dev>, 
 "Daniel Gomez (Samsung)" <d+samsung@kruces.com>, gost.dev@samsung.com, 
 Daniel Gomez <da.gomez@samsung.com>, 
 Nick Desaulniers <nick.desaulniers@gmail.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1722985800; l=1489;
 i=da.gomez@samsung.com; s=20240621; h=from:subject:message-id;
 bh=pKrUy+kUc7s1sGJ4V0pnKiAjUgJie+thKNoMDcFS8Ws=;
 b=BaL7A1rlA7gJqeye5jr4ewbPFIbJKovsy2703k4UjEVlRUIdHP5xKklCusXzrOGVDQfD0QJSj
 APMBaZZ1ODpAzcjGgS5l4MO4plml4BUxFF4TM1ExHvcSpGvrfIornNn
X-Developer-Key: i=da.gomez@samsung.com; a=ed25519;
 pk=BqYk31UHkmv0WZShES6pIZcdmPPGay5LbzifAdZ2Ia4=
X-Endpoint-Received: by B4 Relay for da.gomez@samsung.com/20240621 with
 auth_id=175
X-Original-From: Daniel Gomez <da.gomez@samsung.com>
Reply-To: da.gomez@samsung.com

From: Nick Desaulniers <nick.desaulniers@gmail.com>

When building the Linux kernel on an aarch64 MacOS based host, if we don't
specify a value for ARCH when invoking make, we default to arm and thus
multi_v7_defconfig rather than the expected arm64 and arm64's defconfig.

This is because subarch.include invokes `uname -m` which on MacOS hosts
evaluates to `arm64` but on Linux hosts evaluates to `aarch64`,

This allows us to build ARCH=arm64 natively on MacOS (as in ARCH need
not be specified on an aarch64-based system).

Utilize a negative lookahead regular expression to avoid matching arm64.

Add a separate expression to support for armv.* as per error reported by
Nicolas Schier [1].

[1] https://lore.kernel.org/all/Y3MRvtwdjIwMHvRo@bergen.fjasle.eu/#t

Signed-off-by: Nick Desaulniers <nick.desaulniers@gmail.com>
Signed-off-by: Daniel Gomez <da.gomez@samsung.com>
---
 scripts/subarch.include | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/scripts/subarch.include b/scripts/subarch.include
index 4bd327d0ae42..5d84ad8c0dee 100644
--- a/scripts/subarch.include
+++ b/scripts/subarch.include
@@ -6,7 +6,8 @@
 
 SUBARCH := $(shell uname -m | sed -e s/i.86/x86/ -e s/x86_64/x86/ \
 				  -e s/sun4u/sparc64/ \
-				  -e s/arm.*/arm/ -e s/sa110/arm/ \
+				  -e s/armv.*/arm/ \
+				  -e s/arm\(?:\(?!64\).*\)/arm/ -e s/sa110/arm/ \
 				  -e s/s390x/s390/ \
 				  -e s/ppc.*/powerpc/ -e s/mips.*/mips/ \
 				  -e s/sh[234].*/sh/ -e s/aarch64.*/arm64/ \

-- 
Git-146)



