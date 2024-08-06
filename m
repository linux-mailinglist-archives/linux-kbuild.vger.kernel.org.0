Return-Path: <linux-kbuild+bounces-2864-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D1E23949BFD
	for <lists+linux-kbuild@lfdr.de>; Wed,  7 Aug 2024 01:11:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0C9101C23291
	for <lists+linux-kbuild@lfdr.de>; Tue,  6 Aug 2024 23:11:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1CB1817A59C;
	Tue,  6 Aug 2024 23:10:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aLbLyJxt"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE456155307;
	Tue,  6 Aug 2024 23:10:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722985803; cv=none; b=PdvZhebzZiHCIyfEm8x40bX5BXvUSbBx6OZCkftblVXutxl2XqyAENfetw8vAQpn5+nMA6RoiK9AClRGr/gH96IA5LIuu5duImDA6gsA79sfm7buZXD6x8Zu+8h6jy7mS4d93lesh6ZfhyGLRRZMTm1xd1eyuFhcGlg0c1zk7LU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722985803; c=relaxed/simple;
	bh=+He+gtxBEfl84UV5f19qlMQcV5CCfyJDOMqxiVvtbII=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uWkOutlbkYMrhYEo8I0miQ7F35lNINt0E4WrBP2hxDcMth6l9CK0QB/yJslfQPpPELrYrHDMXBbueMbXO409QCL4qFJ8NhIRX5NRmJMheKRNR9ECKQGPw+BXddBeygfixQAgm9SBW/0HsjUIcPbKNv8K682WFZFO7ianF/MASsE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aLbLyJxt; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 21795C4AF52;
	Tue,  6 Aug 2024 23:10:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722985803;
	bh=+He+gtxBEfl84UV5f19qlMQcV5CCfyJDOMqxiVvtbII=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=aLbLyJxtYoDu5TGf0hBkTczCnA5tXznd/CqtRPoDueECJQqPixBgxrK1R6VJU4ALQ
	 wHZifyZwJpUqkcXzqh6ZTUeJXh9uE8lwd+OxU3dU99uZ56ZTSP+q0vSy4QSJktfZ2x
	 /tZyFRY2dnCmPxOfo9NVMRqfVfcLqsZZVeXzBKgqj3BArSKVY8my2wx9g9QVJssTD6
	 gNmwARWq1WXchHb2JkQ5HlE7cifTbfItuWLYcMPM7rUweSS21IVX5l3qCGZP/bNc0S
	 UUfSWuCWYu8/aAQmFYejLcdLA2FzilLeIF0l4Ry824CqiUIGQZq5bXm3UEaPJIRGnc
	 RI9UhDJq7BmUw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13D5DC52D7D;
	Tue,  6 Aug 2024 23:10:03 +0000 (UTC)
From: Daniel Gomez via B4 Relay <devnull+da.gomez.samsung.com@kernel.org>
Date: Wed, 07 Aug 2024 01:09:19 +0200
Subject: [PATCH 05/12] accessiblity/speakup: genmap and makemapdata require
 linux/version.h
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240807-macos-build-support-v1-5-4cd1ded85694@samsung.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1722985800; l=1496;
 i=da.gomez@samsung.com; s=20240621; h=from:subject:message-id;
 bh=D/b2l/ogAQ53pGShlNQZ21O8ea5Cj2WGeFYeW0o1yvE=;
 b=R4qyiYP+OSMcXzv9ooR7/t6MnLqProoNVp1nlUQ8nIYUNbvpy7GzUbYP6W8c5xRb6Xs1z5qrf
 NNsKqstejrNCJU8W3NSEixOEN8GSNjVGvk+o0yOAwyi6oB306luifET
X-Developer-Key: i=da.gomez@samsung.com; a=ed25519;
 pk=BqYk31UHkmv0WZShES6pIZcdmPPGay5LbzifAdZ2Ia4=
X-Endpoint-Received: by B4 Relay for da.gomez@samsung.com/20240621 with
 auth_id=175
X-Original-From: Daniel Gomez <da.gomez@samsung.com>
Reply-To: da.gomez@samsung.com

From: Daniel Gomez <da.gomez@samsung.com>

Both genmap and makemapdata require the linux/version.h header. To
ensure successful builds on macOS hosts, make sure usr/include is
included in the HOSTCFLAGS.

Fixes errors:
drivers/accessibility/speakup/genmap.c:13:10: fatal error: 'linux/version.h' file not found
   13 | #include <linux/version.h>
      |          ^~~~~~~~~~~~~~~~~
1 error generated.

drivers/accessibility/speakup/makemapdata.c:13:10: fatal error: 'linux/version.h' file not found
   13 | #include <linux/version.h>
      |          ^~~~~~~~~~~~~~~~~
1 error generated.

Signed-off-by: Daniel Gomez <da.gomez@samsung.com>
---
 drivers/accessibility/speakup/Makefile | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/accessibility/speakup/Makefile b/drivers/accessibility/speakup/Makefile
index 6f6a83565c0d..74ee0c31370f 100644
--- a/drivers/accessibility/speakup/Makefile
+++ b/drivers/accessibility/speakup/Makefile
@@ -38,6 +38,7 @@ clean-files := mapdata.h speakupmap.h
 # Generate mapdata.h from headers
 hostprogs += makemapdata
 makemapdata-objs := makemapdata.o
+HOSTCFLAGS_makemapdata.o += -I$(srctree)/usr/include
 
 quiet_cmd_mkmap = MKMAP   $@
       cmd_mkmap = TOPDIR=$(srctree) \
@@ -51,6 +52,7 @@ $(obj)/mapdata.h: $(obj)/makemapdata
 # Generate speakupmap.h from mapdata.h
 hostprogs += genmap
 genmap-objs := genmap.o
+HOSTCFLAGS_genmap.o += -I$(srctree)/usr/include
 $(obj)/genmap.o: $(obj)/mapdata.h
 
 quiet_cmd_genmap = GENMAP  $@

-- 
Git-146)



