Return-Path: <linux-kbuild+bounces-3422-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 18F3996F238
	for <lists+linux-kbuild@lfdr.de>; Fri,  6 Sep 2024 13:02:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 421511C20EC6
	for <lists+linux-kbuild@lfdr.de>; Fri,  6 Sep 2024 11:02:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA03C1CC8B2;
	Fri,  6 Sep 2024 11:01:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oglDOhcp"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94F7F1CC15B;
	Fri,  6 Sep 2024 11:01:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725620500; cv=none; b=mdW+yuZYS8UB/31nDo1ymx+TPQcTQ2o0LAQoGffiHskOJkFJwYlravpindeGnfkvfqmxCN0lStj06I6U+0hwpQG7pkTbAuyah4T/t6ZDC4rVtudlfgZXykdRnQ7ueH0URE96o+flZa1ib6nTa4McnC8SqJtgZ0Y8ia/QiZsB4E0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725620500; c=relaxed/simple;
	bh=CZ4Sd6zgDNuwEmkc90VthiZDpWCvWQy9Kc+RHCEsgOQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=p2lDrMZPSWG426CoGjW1qh6IlNTa598IYlx3snDKVDTU+GzyO+HFaKsDfU8Of6F2PplkrkAMKkl+c7mJy5vEsLAiZ0GxsJa0TTw3k/uY51n2qFJZMf/dQEhimvU+CLXK/0fFDUGaem8SZX/DIUZPc+v+DWL0EgA5bZoyfOdvycs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oglDOhcp; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1084BC4CED2;
	Fri,  6 Sep 2024 11:01:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725620500;
	bh=CZ4Sd6zgDNuwEmkc90VthiZDpWCvWQy9Kc+RHCEsgOQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=oglDOhcpmxg9zNKmWK35loqmfWrq7174vQW7yOghE6cQoKUenmq2yyJv/Cjvv5Gfa
	 B7APbxvqjPtzat5d7GEz4LRj1BlDqJho81gJ2VlPC5WU/fRJceZ2YQqAQUDQPwabz6
	 ZIcseOPSymTnnag5e4VDOr2Vhu/o9BxQZvZqF0WaiLcxtyYFqqusWSf4ZLepaUcVoP
	 EwHPTxoArQy2AZfFl356S5M96+SaSjnLjq94zELtCpg6wn2K0dxXbk443nAvcG64sF
	 9WhIAely/i3QNyL1X69KfQkdT1FMFa+jWJWSGvK4NWw5INPEJr0HAuQ8OvgxV98y2e
	 E556rhbiZVAlQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 045F7CE7AFB;
	Fri,  6 Sep 2024 11:01:40 +0000 (UTC)
From: Daniel Gomez via B4 Relay <devnull+da.gomez.samsung.com@kernel.org>
Date: Fri, 06 Sep 2024 13:01:28 +0200
Subject: [PATCH v2 1/8] scripts: subarch.include: fix SUBARCH on macOS
 hosts
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240906-macos-build-support-v2-1-06beff418848@samsung.com>
References: <20240906-macos-build-support-v2-0-06beff418848@samsung.com>
In-Reply-To: <20240906-macos-build-support-v2-0-06beff418848@samsung.com>
To: Masahiro Yamada <masahiroy@kernel.org>, 
 Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, 
 Lucas De Marchi <lucas.demarchi@intel.com>, 
 =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, William Hubbs <w.d.hubbs@gmail.com>, 
 Chris Brannon <chris@the-brannons.com>, Kirk Reiser <kirk@reisers.ca>, 
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
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 Simona Vetter <simona.vetter@ffwll.ch>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1725620498; l=1281;
 i=da.gomez@samsung.com; s=20240621; h=from:subject:message-id;
 bh=ijKRG+KyDGNZNJsR1osTMsvKgO5/NVSV4G6aYDCZyuU=;
 b=bCEWBORAMhzM3X1JpnkGQsiKqWPlOJG9GDKEFa1LXCWwoKrNbvWue+SUs1Xdr1tCLoWm1yKtz
 vPqgnpTHecbDCQLGjD2lGrqM/d5qSwRAFEBNf23yetInPepO8yTVkDi
X-Developer-Key: i=da.gomez@samsung.com; a=ed25519;
 pk=BqYk31UHkmv0WZShES6pIZcdmPPGay5LbzifAdZ2Ia4=
X-Endpoint-Received: by B4 Relay for da.gomez@samsung.com/20240621 with
 auth_id=175
X-Original-From: Daniel Gomez <da.gomez@samsung.com>
Reply-To: da.gomez@samsung.com

From: Nick Desaulniers <nick.desaulniers@gmail.com>

When building the Linux kernel on an aarch64 macOS based host, if we don't
specify a value for ARCH when invoking make, we default to arm and thus
multi_v7_defconfig rather than the expected arm64 and arm64's defconfig.

This is because subarch.include invokes `uname -m` which on MacOS hosts
evaluates to `arm64` but on Linux hosts evaluates to `aarch64`,

This allows us to build ARCH=arm64 natively on macOS (as in ARCH need
not be specified on an aarch64-based system).

Avoid matching arm64 by excluding it from the arm.* sed expression.

Signed-off-by: Nick Desaulniers <nick.desaulniers@gmail.com>
Signed-off-by: Daniel Gomez <da.gomez@samsung.com>
---
 scripts/subarch.include | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/subarch.include b/scripts/subarch.include
index 4bd327d0ae42..c4592d59d69b 100644
--- a/scripts/subarch.include
+++ b/scripts/subarch.include
@@ -6,7 +6,7 @@
 
 SUBARCH := $(shell uname -m | sed -e s/i.86/x86/ -e s/x86_64/x86/ \
 				  -e s/sun4u/sparc64/ \
-				  -e s/arm.*/arm/ -e s/sa110/arm/ \
+				  -e /^arm64$$/!s/arm.*/arm/ -e s/sa110/arm/ \
 				  -e s/s390x/s390/ \
 				  -e s/ppc.*/powerpc/ -e s/mips.*/mips/ \
 				  -e s/sh[234].*/sh/ -e s/aarch64.*/arm64/ \

-- 
2.46.0



