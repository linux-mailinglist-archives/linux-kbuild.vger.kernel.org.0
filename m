Return-Path: <linux-kbuild+bounces-2865-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F06A949BFC
	for <lists+linux-kbuild@lfdr.de>; Wed,  7 Aug 2024 01:11:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9184D1C2370D
	for <lists+linux-kbuild@lfdr.de>; Tue,  6 Aug 2024 23:11:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1DD8317A59F;
	Tue,  6 Aug 2024 23:10:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UcbTcNUC"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFC6A17997D;
	Tue,  6 Aug 2024 23:10:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722985803; cv=none; b=oGESd9B4GfRNEkRtkvlZQ24i/JHkhhP4ZqJ0gb9oZeVEJjorVbXe8sdUy+c4II0mzFeUHDxR2Ep7O4D+AFoAqELXeCJUzWYboGqm3JZbySMrw9ad6F8f+hpXQIs5Z3renOYSyzW/97WWIHdJAz31xSyCR+nKCfWjhbAWp4D6Z1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722985803; c=relaxed/simple;
	bh=v+3D4lb213MioskawpwIVm0n1gy9X7rS+9rTnnk/THc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gF4CxP6uTVJ8FJjcxGVcv7XYihEzMnoeApdpa7Rq10rH1fi9a8fj6YV85sLtpA4TciHj9w0Uh+y7PwWxgGQg5/5Sv1k1MXBdKYIxpwWkz9f17ttUQZ6Gt11OrS4L+n7qU8n2a1Z+z0fb0JM0oWYmaXsx7JgQzEpmlVJddZKYnOM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UcbTcNUC; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4E0C3C4DDE3;
	Tue,  6 Aug 2024 23:10:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722985803;
	bh=v+3D4lb213MioskawpwIVm0n1gy9X7rS+9rTnnk/THc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=UcbTcNUCEVVl6oxvmOWw2BiT+ElArILeG1oAnslTRxcJ2Gi/SKYGJ3ADXB4KM/kSD
	 7zI3tsZhf2PmkVPU5R+uYhWu/TEhYxpocso0dOHhwOgkKklRBv6LdbJ77P9RHQXtaF
	 ApdZKxzrcB/pDn5/1+TiL5lJPZhercu5kvwmQ0W8EooGSrDr+D92E/CzUSfxMOUrFX
	 UnqvanuR+aWSDbCHLTEQEpKrHqWGS7wwJWna8YEFXu+DaJ5DlqM+KpV8TH56nbPlBR
	 YxA2dAU+3VQstKQl5GgOjBjoX8itT3D0ZB6tVaFxDyGYk1zRBxPiivAZr6tuDRFo0o
	 XwlIForxD80Qw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40075C52D6F;
	Tue,  6 Aug 2024 23:10:03 +0000 (UTC)
From: Daniel Gomez via B4 Relay <devnull+da.gomez.samsung.com@kernel.org>
Date: Wed, 07 Aug 2024 01:09:21 +0200
Subject: [PATCH 07/12] selinux/mdp: include bitsperlong and posix_types
 headers
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240807-macos-build-support-v1-7-4cd1ded85694@samsung.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1722985800; l=995;
 i=da.gomez@samsung.com; s=20240621; h=from:subject:message-id;
 bh=amef7shqe+/pJSAuEYnttZteE9emVf2D8FOtG6wVLQs=;
 b=eEEO2XdHsOnjD70zsmSUCRd3hvX9udH5ozkEUFwVyjIqPSuD7NI4opv6Ndry8dslEYtsT1ENp
 5rF5WjiBGzLAJoGrJzqo1wNi95MqafOkOKXvTlY0lrf9E5wgwW5kr+C
X-Developer-Key: i=da.gomez@samsung.com; a=ed25519;
 pk=BqYk31UHkmv0WZShES6pIZcdmPPGay5LbzifAdZ2Ia4=
X-Endpoint-Received: by B4 Relay for da.gomez@samsung.com/20240621 with
 auth_id=175
X-Original-From: Daniel Gomez <da.gomez@samsung.com>
Reply-To: da.gomez@samsung.com

From: Daniel Gomez <da.gomez@samsung.com>

The mdp object requires the bitsperlong.h and posix_types.h headers.
To ensure these headers are found during compilation on macOS hosts,
add usr/include to HOST_EXTRACFLAGS in the genheaders Makefile. This
adjustment allows the compiler to locate all necessary headers when they
are not available by default on macOS.

Signed-off-by: Daniel Gomez <da.gomez@samsung.com>
---
 scripts/selinux/mdp/Makefile | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/scripts/selinux/mdp/Makefile b/scripts/selinux/mdp/Makefile
index d61058ddd15c..19ab8682ae3d 100644
--- a/scripts/selinux/mdp/Makefile
+++ b/scripts/selinux/mdp/Makefile
@@ -2,6 +2,7 @@
 hostprogs-always-y += mdp
 HOST_EXTRACFLAGS += \
 	-I$(srctree)/include/uapi -I$(srctree)/include \
-	-I$(srctree)/security/selinux/include -I$(objtree)/include
+	-I$(srctree)/security/selinux/include -I$(objtree)/include \
+	-I$(srctree)/usr/include
 
 clean-files	:= policy.* file_contexts

-- 
Git-146)



