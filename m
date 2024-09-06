Return-Path: <linux-kbuild+bounces-3425-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C53296F242
	for <lists+linux-kbuild@lfdr.de>; Fri,  6 Sep 2024 13:03:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1E9331F256B9
	for <lists+linux-kbuild@lfdr.de>; Fri,  6 Sep 2024 11:03:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 325451CCB50;
	Fri,  6 Sep 2024 11:01:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ofC2lUFC"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E32531CC8B7;
	Fri,  6 Sep 2024 11:01:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725620501; cv=none; b=BOQ5TRJRZxGG+Q1guW2J1c/uUaytfH4lJJFereYq1eRCW6O/b0O/HSUm0PqV2jZM7JceXlOX3aHWN/AKhIrUBc2s125gs4WOyjmOWuGt65Nhole52qQ/wfOCsYmRDaSOYS+HvsCo+ObA2xLVfRokqdMV+ZivprJoLJvktpDhhZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725620501; c=relaxed/simple;
	bh=j5NLnKfLikKaiGUo55GPDDGSIhsaNwRaLqF2L4zGDA4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MYw06OrS9uXW6ehxLFW4qHdT+kEEfuSFe9shsR2pFJp8ykek1ns9IxzdgWZ3CIiKrrbT1bIj/aPhL8P15wwT+v/2hkjK6waJA52bLL1Es1x8JO0yTEB9CmYMtt9lbaU/DdNjAI1b8X+7qET1gLxPXdsKCZ76EbYBrBkNQaINf0M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ofC2lUFC; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 77582C4CEC9;
	Fri,  6 Sep 2024 11:01:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725620500;
	bh=j5NLnKfLikKaiGUo55GPDDGSIhsaNwRaLqF2L4zGDA4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=ofC2lUFCD8SQtLyfB7aJIjTwQ6ja5bwved9nuqgSpT79j5V0G6XUrEwhu9truM66F
	 nqsbT/i3hFYZhqoMi3e/ySHl7QjU4/8urc4JGoihR/NDAnDCAr2mnW3AlcSONXITaT
	 +SOHHjXgj29mc5xaoOWm7MH2yyFX1yl/xKfduJHln0pDPsCu7Gd4o+dAq/WJlRLKC3
	 b2I4DBReFYcqVAbG/EmPRM/SPLKpS5cBcUQx5L3KbnNuj/PQbLcsMFtT/ZBdKGbH5M
	 L60B/guW873cfc6OHQU9pheA9ancfcDt6wu5AOju/SSMVxX64YAe2lOdrKvNvKcLSX
	 UQSmNNUI50XPw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6CDF6CE7AFB;
	Fri,  6 Sep 2024 11:01:40 +0000 (UTC)
From: Daniel Gomez via B4 Relay <devnull+da.gomez.samsung.com@kernel.org>
Date: Fri, 06 Sep 2024 13:01:32 +0200
Subject: [PATCH v2 5/8] scripts: add bee-headers support
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240906-macos-build-support-v2-5-06beff418848@samsung.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1725620498; l=2346;
 i=da.gomez@samsung.com; s=20240621; h=from:subject:message-id;
 bh=rO0S7maRhdJSc9tMl+lVEiGJtiOKRJnj+HrU4cPgHCc=;
 b=al9Ec0NojpTaSaRwAcb8OIVZLwyagRzcfEeZfqwPN8DMD52+Ne1gNpwPCnObnF9pgxs9wkUwP
 NXqHeNxIaZfBHXqgwlwsU3AuElhprb0HUA+oNzt4mxAdkffpup52ZyT
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
 scripts/Makefile     | 4 +++-
 scripts/mod/Makefile | 5 +++++
 2 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/scripts/Makefile b/scripts/Makefile
index 6bcda4b9d054..40f6a9159f8c 100644
--- a/scripts/Makefile
+++ b/scripts/Makefile
@@ -25,8 +25,10 @@ generate_rust_target-rust := y
 rustdoc_test_builder-rust := y
 rustdoc_test_gen-rust := y
 
-HOSTCFLAGS_sorttable.o = -I$(srctree)/tools/include
+HOSTCFLAGS_sorttable.o = -I$(srctree)/tools/include \
+	$(shell $(HOSTPKG_CONFIG) --cflags bee-headers 2> /dev/null)
 HOSTLDLIBS_sorttable = -lpthread
+HOSTCFLAGS_insert-sys-cert.o = $(shell $(HOSTPKG_CONFIG) --cflags bee-headers 2> /dev/null)
 HOSTCFLAGS_asn1_compiler.o = -I$(srctree)/include
 HOSTCFLAGS_sign-file.o = $(shell $(HOSTPKG_CONFIG) --cflags libcrypto 2> /dev/null)
 HOSTLDLIBS_sign-file = $(shell $(HOSTPKG_CONFIG) --libs libcrypto 2> /dev/null || echo -lcrypto)
diff --git a/scripts/mod/Makefile b/scripts/mod/Makefile
index 75c12c045f21..33bb032039ba 100644
--- a/scripts/mod/Makefile
+++ b/scripts/mod/Makefile
@@ -9,6 +9,11 @@ modpost-objs	:= modpost.o file2alias.o sumversion.o symsearch.o
 devicetable-offsets-file := devicetable-offsets.h
 
 HOSTCFLAGS_file2alias.o += -D_UUID_T -D__GETHOSTUUID_H
+HOSTCFLAGS_modpost.o = $(shell $(HOSTPKG_CONFIG) --cflags bee-headers 2> /dev/null)
+HOSTCFLAGS_file2alias.o = $(shell $(HOSTPKG_CONFIG) --cflags bee-headers 2> /dev/null)
+HOSTCFLAGS_sumversion.o = $(shell $(HOSTPKG_CONFIG) --cflags bee-headers 2> /dev/null)
+HOSTCFLAGS_symsearch.o = $(shell $(HOSTPKG_CONFIG) --cflags bee-headers 2> /dev/null)
+HOSTCFLAGS_mk_elfconfig.o = $(shell $(HOSTPKG_CONFIG) --cflags bee-headers 2> /dev/null)
 
 $(obj)/$(devicetable-offsets-file): $(obj)/devicetable-offsets.s FORCE
 	$(call filechk,offsets,__DEVICETABLE_OFFSETS_H__)

-- 
2.46.0



