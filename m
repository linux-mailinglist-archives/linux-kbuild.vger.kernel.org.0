Return-Path: <linux-kbuild+bounces-2866-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 52DC0949C04
	for <lists+linux-kbuild@lfdr.de>; Wed,  7 Aug 2024 01:11:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D1AC4B28AA7
	for <lists+linux-kbuild@lfdr.de>; Tue,  6 Aug 2024 23:11:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 31F7817A5B3;
	Tue,  6 Aug 2024 23:10:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fOMwWeuX"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D08FB179665;
	Tue,  6 Aug 2024 23:10:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722985804; cv=none; b=pH0Lzjnq3Ddh/nI5lVy5uC75DtnxXHq6QmNyhrr31jFHWSjjuPZtgbr0Nqesv7JhF+uzUWA9lG9Q2zigcL6gOX91o/m/oKEV2U03gtjNZ1GkrfZcAA/ALdPCcghNWEXi9+FG9QM3dl+QxjcXeNTCrFY37FU9w88RYocP9L6Un/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722985804; c=relaxed/simple;
	bh=D5CNbSA2nd8+8BFJ/Lxf4zZjzdHe9mqU7tf5klT3gu0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tzF1LcxGRmzZqfUpN0uUk7jTdBKXsnQCetPmJLFe1+bJ9vVcLPotZFbuTm0a085yytpZBEf1hsG0q3gSgz+byb0YiNwfhb1E4FGw2/pZlGnYd5HHa5GpHPQWVcpbbXaVgVsnAt8SmoPwVIaG91yS4UwUTwR4FfM6UhlM9b/33K0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fOMwWeuX; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 331BDC4AF63;
	Tue,  6 Aug 2024 23:10:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722985803;
	bh=D5CNbSA2nd8+8BFJ/Lxf4zZjzdHe9mqU7tf5klT3gu0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=fOMwWeuX+6Lfvtx14e8n+SexhkQo577QRdYpNq9mh/HWXy2DjmUULeQdEJJrIovoE
	 4d52aBfFcg/yKGYahmwaE4dwPQjUrghawQhWXyDJ5WW/fZz8yjfflghGrX2ymxjf/9
	 UE2FKzdrsmYjDwZiau3Z0f4L3w6x0WaVYJc7HKru0bj+ALIaNZdjXYr8QpDabbF4oS
	 rvxa8WAvV0gKqwLm+mmlC/cmHUk+lR1bEd9Fu375CaXb4Blquf5Ep1P6d4njo6wL+s
	 pRjUvs3oJeJtI0h2h9ISbF5TaJrz9+zbtPn4QfswfOCDJTLvwo/Mi3QYIPUiitzfhK
	 olW0RHxF3r0qA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2813FC49EA1;
	Tue,  6 Aug 2024 23:10:03 +0000 (UTC)
From: Daniel Gomez via B4 Relay <devnull+da.gomez.samsung.com@kernel.org>
Date: Wed, 07 Aug 2024 01:09:20 +0200
Subject: [PATCH 06/12] selinux/genheaders: include bitsperlong and
 posix_types headers
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240807-macos-build-support-v1-6-4cd1ded85694@samsung.com>
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
 Daniel Gomez <da.gomez@samsung.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1722985800; l=952;
 i=da.gomez@samsung.com; s=20240621; h=from:subject:message-id;
 bh=zkjqCDDWwxxcXmEm+jW0QannFSOP4w7DOpEHzeqzznI=;
 b=KS1HzePsm7adJO0+ulRuXmL0XzGu396kl5PQIL/Y+Ha4sBVswReLg26gtWlRY9ulp9HZfXTef
 mC9Dy8SO9GADeLaEPqz0n4cBifOqORRoKLP9Y+NObQyFVh4zLY67qbh
X-Developer-Key: i=da.gomez@samsung.com; a=ed25519;
 pk=BqYk31UHkmv0WZShES6pIZcdmPPGay5LbzifAdZ2Ia4=
X-Endpoint-Received: by B4 Relay for da.gomez@samsung.com/20240621 with
 auth_id=175
X-Original-From: Daniel Gomez <da.gomez@samsung.com>
Reply-To: da.gomez@samsung.com

From: Daniel Gomez <da.gomez@samsung.com>

The genheaders requires the bitsperlong.h and posix_types.h headers.
To ensure these headers are found during compilation on macOS hosts,
add usr/include to HOST_EXTRACFLAGS in the genheaders Makefile. This
adjustment allows the compiler to locate all necessary headers when they
are not available by default on macOS.

Signed-off-by: Daniel Gomez <da.gomez@samsung.com>
---
 scripts/selinux/genheaders/Makefile | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/scripts/selinux/genheaders/Makefile b/scripts/selinux/genheaders/Makefile
index 1faf7f07e8db..017149c90f8e 100644
--- a/scripts/selinux/genheaders/Makefile
+++ b/scripts/selinux/genheaders/Makefile
@@ -2,4 +2,5 @@
 hostprogs-always-y += genheaders
 HOST_EXTRACFLAGS += \
 	-I$(srctree)/include/uapi -I$(srctree)/include \
-	-I$(srctree)/security/selinux/include
+	-I$(srctree)/security/selinux/include \
+	-I$(srctree)/usr/include

-- 
Git-146)



