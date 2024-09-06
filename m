Return-Path: <linux-kbuild+bounces-3424-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DEA8C96F23B
	for <lists+linux-kbuild@lfdr.de>; Fri,  6 Sep 2024 13:02:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1711B1C23A69
	for <lists+linux-kbuild@lfdr.de>; Fri,  6 Sep 2024 11:02:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0375C1CCB33;
	Fri,  6 Sep 2024 11:01:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AeYQsJSD"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9AA51CC161;
	Fri,  6 Sep 2024 11:01:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725620500; cv=none; b=qIwAi/HvNQCCm/VEH1xZeWcm0udZngfioo8NOq9alH76h5uQ5OMXXevPA92kLfRVK8BawMPyGDXFO3txkE6Tx729xvaAsFiLiOs2zN69by2QFauwqQ/PCaJF6WdWjdgIrh39d6R9D8Td0BgCQZ2q/sMtW+PA2GPY3lKvNgye31M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725620500; c=relaxed/simple;
	bh=vOiGFucJK70rIWW7jwgBqnvMavVEpTpGsxAOe6Ix7ug=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=E+6Nr8IZYk+0eyz5XKlDNlcRoK5JogDcYX0/B9hB1myVplfkQpcgpvmeF/VzNjSSHeKwxT9/rtEWeRj80YM5tDAjJ6GkxNp+B0V/BEZ0VUiS86zA5uBxVIqlHaUBLoSb8pny7II13VBBxaTRoLQ+V0v3Cznw7yB1JHw07rS3ZlU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AeYQsJSD; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 56DCCC4CEDA;
	Fri,  6 Sep 2024 11:01:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725620500;
	bh=vOiGFucJK70rIWW7jwgBqnvMavVEpTpGsxAOe6Ix7ug=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=AeYQsJSDslgwwy0twNQXWpDjaGTpp6dSXTbqc4PSS8oEMXhZUwyuU5P1thrfALpvg
	 /gpHxMFRIydlOV0a/Id9XRuKtStDguG0qznRiF88vdEwec+Dov+06urJWJCvRoLPgJ
	 fAqJzNr4oAnCc5ytHPPn5/V15Wetmoj5KGiolSoOULFG54ENSuFKFu6Cxxj76EYp3N
	 1x0kiMwA0Ueq3kFBZBdtaqGc25x5gJq7JyEn7apsLh8fSF+5hhl94NYfBwTFMtYKZw
	 7dWo4ZHNTYJQ++Xhd9em8x9RczO5wetumMBvHu+fv6opHE0Rlk/ZYuRn9QL/qZ7/EK
	 nwonYs6t8SPFw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 478A0CD5BDD;
	Fri,  6 Sep 2024 11:01:40 +0000 (UTC)
From: Daniel Gomez via B4 Relay <devnull+da.gomez.samsung.com@kernel.org>
Date: Fri, 06 Sep 2024 13:01:31 +0200
Subject: [PATCH v2 4/8] arm64: nvhe: add bee-headers support
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240906-macos-build-support-v2-4-06beff418848@samsung.com>
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
 Daniel Gomez <da.gomez@samsung.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1725620498; l=2402;
 i=da.gomez@samsung.com; s=20240621; h=from:subject:message-id;
 bh=GBZv2DjLBaUWb0PDIN6CGSbBXyjcjj4bMncdBaf72Bg=;
 b=yNvjUITe4cvXufxVrbYIve+SAb1jzGrq0iUGR/YAun7lLTKIwhk8EC7uDEMgN45dqdtRk38Jy
 pDk3TLY/uhoBnN1Zcnbu2S82L1cVlw0uRFYjv554A/iIpET4qlSs/in
X-Developer-Key: i=da.gomez@samsung.com; a=ed25519;
 pk=BqYk31UHkmv0WZShES6pIZcdmPPGay5LbzifAdZ2Ia4=
X-Endpoint-Received: by B4 Relay for da.gomez@samsung.com/20240621 with
 auth_id=175
X-Original-From: Daniel Gomez <da.gomez@samsung.com>
Reply-To: da.gomez@samsung.com

From: Daniel Gomez <da.gomez@samsung.com>

endian.h header is not provided by default in macOS. Use pkg-config with
the new development package 'bee-headers' [1] to find the path where the
headers are installed.

[1] Bee Headers Project links:
https://github.com/bee-headers/headers
https://github.com/bee-headers/homebrew-bee-headers

It requires to install bee-headers Homebrew Tap:

  brew tap bee-headers/bee-headers
  brew install bee-headers/bee-headers/bee-headers

Signed-off-by: Daniel Gomez <da.gomez@samsung.com>
---
 arch/arm64/kernel/pi/Makefile     | 1 +
 arch/arm64/kernel/vdso32/Makefile | 1 +
 arch/arm64/kvm/hyp/nvhe/Makefile  | 3 ++-
 3 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/kernel/pi/Makefile b/arch/arm64/kernel/pi/Makefile
index 4d11a8c29181..259c9a45fba0 100644
--- a/arch/arm64/kernel/pi/Makefile
+++ b/arch/arm64/kernel/pi/Makefile
@@ -20,6 +20,7 @@ KBUILD_CFLAGS	:= $(filter-out $(CC_FLAGS_SCS), $(KBUILD_CFLAGS))
 KBUILD_CFLAGS	:= $(filter-out $(CC_FLAGS_LTO), $(KBUILD_CFLAGS))
 
 hostprogs	:= relacheck
+HOSTCFLAGS_relacheck.o = $(shell $(HOSTPKG_CONFIG) --cflags bee-headers 2> /dev/null)
 
 quiet_cmd_piobjcopy = $(quiet_cmd_objcopy)
       cmd_piobjcopy = $(cmd_objcopy) && $(obj)/relacheck $(@) $(<)
diff --git a/arch/arm64/kernel/vdso32/Makefile b/arch/arm64/kernel/vdso32/Makefile
index 25a2cb6317f3..6cb8a04bd829 100644
--- a/arch/arm64/kernel/vdso32/Makefile
+++ b/arch/arm64/kernel/vdso32/Makefile
@@ -107,6 +107,7 @@ VDSO_LDFLAGS += --orphan-handling=$(CONFIG_LD_ORPHAN_WARN_LEVEL)
 # $(hostprogs) with $(obj)
 munge := ../../../arm/vdso/vdsomunge
 hostprogs := $(munge)
+HOSTCFLAGS_$(munge).o = $(shell $(HOSTPKG_CONFIG) --cflags bee-headers 2> /dev/null)
 
 c-obj-vdso := note.o
 c-obj-vdso-gettimeofday := vgettimeofday.o
diff --git a/arch/arm64/kvm/hyp/nvhe/Makefile b/arch/arm64/kvm/hyp/nvhe/Makefile
index b43426a493df..d20a440b6964 100644
--- a/arch/arm64/kvm/hyp/nvhe/Makefile
+++ b/arch/arm64/kvm/hyp/nvhe/Makefile
@@ -15,7 +15,8 @@ ccflags-y += -fno-stack-protector	\
 	     $(DISABLE_STACKLEAK_PLUGIN)
 
 hostprogs := gen-hyprel
-HOST_EXTRACFLAGS += -I$(objtree)/include
+HOST_EXTRACFLAGS += -I$(objtree)/include \
+	$(shell $(HOSTPKG_CONFIG) --cflags bee-headers 2> /dev/null)
 
 lib-objs := clear_page.o copy_page.o memcpy.o memset.o
 lib-objs := $(addprefix ../../../lib/, $(lib-objs))

-- 
2.46.0



