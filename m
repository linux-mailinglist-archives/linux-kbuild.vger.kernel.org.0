Return-Path: <linux-kbuild+bounces-2571-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 948E6934030
	for <lists+linux-kbuild@lfdr.de>; Wed, 17 Jul 2024 18:12:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4FF91282EBD
	for <lists+linux-kbuild@lfdr.de>; Wed, 17 Jul 2024 16:12:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 753091822D0;
	Wed, 17 Jul 2024 16:12:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uPh7sqh7"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4265D1822CA;
	Wed, 17 Jul 2024 16:12:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721232731; cv=none; b=YeWjhLbjJzFSJuXSNFKKo94Hovw0WaagpZej0gLrLfwZfj3bcR2x3rpt6Hw4VdEPboU1zL2F4TkE68TdWHk9lWa2WnyilNB/OWnel2sJP/YlQNZ0XMESwzdvF1gAJOYXvQno2UAlUrqPARvyBoO+gYYi87vRpvqKzcg2/guTi70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721232731; c=relaxed/simple;
	bh=V0CKkAQdRN3WbHfKZmvbfid5D/WhcFJk+hpVN1F1yt0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=A62i9vbwzw5pmXapvQp9NeDDvtzkud4uub9mLJtTC35VU7ABda2aDlXPotIXkR5YR5WbUMxmxaCnKLebq4lUBVdAXi6qf6Tiw69VHfsHv81BAxzwebEixEh5xSuu2Xc8jzqzUzkiVGRg766brID6C5rHE1rHErrIWzNGeYXvplo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uPh7sqh7; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id D6905C32782;
	Wed, 17 Jul 2024 16:12:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721232728;
	bh=V0CKkAQdRN3WbHfKZmvbfid5D/WhcFJk+hpVN1F1yt0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=uPh7sqh7SibxE8K1uzJj+ZdSz6qUady772KQwyQ3F5x9HU42HcwN/LvJqtsAmxvpn
	 qx4wAQcO7HvEi8ojn8SUPFboEtK/+5TTIAVkt7CauGhddm4ScrYFbJ5m24iT+UQ6Ef
	 K643+vZ1nNakOtofv5X+1S+7udl46K2PCsMEnekpBOd3PjBHHVuJuHHbMuDPLhIe/3
	 nJKlbp1bUb0sONPUpij5jw/N52dHH50Fv+d2qUVU6Tw8mnSTYcd51kgjhT8ktXYLpf
	 QvJG+RedhIucu9MFMCgYfyEO+A88eNRTeTlfRX9wEFZut/HGCIAYzLgKhFzPpdfXyx
	 eKO6q0UF+q5CA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE748C3DA42;
	Wed, 17 Jul 2024 16:12:08 +0000 (UTC)
From: Koakuma via B4 Relay <devnull+koachan.protonmail.com@kernel.org>
Date: Wed, 17 Jul 2024 23:10:16 +0700
Subject: [PATCH v2 2/2] sparc/build: Add SPARC target flags for compiling
 with clang
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240717-sparc-cflags-v2-2-259407e6eb5f@protonmail.com>
References: <20240717-sparc-cflags-v2-0-259407e6eb5f@protonmail.com>
In-Reply-To: <20240717-sparc-cflags-v2-0-259407e6eb5f@protonmail.com>
To: "David S. Miller" <davem@davemloft.net>, 
 Andreas Larsson <andreas@gaisler.com>, 
 Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <ndesaulniers@google.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 glaubitz@physik.fu-berlin.de, Masahiro Yamada <masahiroy@kernel.org>, 
 Nicolas Schier <nicolas@fjasle.eu>
Cc: sparclinux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 llvm@lists.linux.dev, linux-kbuild@vger.kernel.org, 
 Koakuma <koachan@protonmail.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1721232727; l=1022;
 i=koachan@protonmail.com; s=20240620; h=from:subject:message-id;
 bh=Sa5MwKGuBYGAJmb585d/SZ5+q8ysIBSVFXuit392tK0=;
 b=kc0NkRwgjz1/ds7jqN4e7rwUpz8AF62xmINjqcnMb3N+eAaVm2/tzRDrmnOX7R9bxEFmwd8U2
 hzvjHSf7w3NBj9gygcQtKkXfc5LHmQrJTNV53JIKetVnY9QYTXzIIj9
X-Developer-Key: i=koachan@protonmail.com; a=ed25519;
 pk=UA59FS3yiAA1cnAAUZ1rehTmr6skh95PgkNRBLcoKCg=
X-Endpoint-Received: by B4 Relay for koachan@protonmail.com/20240620 with
 auth_id=174
X-Original-From: Koakuma <koachan@protonmail.com>
Reply-To: koachan@protonmail.com

From: Koakuma <koachan@protonmail.com>

clang only supports building 64-bit kernel, so we use the
sparc64-linux-gnu target.

See also: https://lore.kernel.org/lkml/e26PTXUXEz8OYXmaeKn4Mpuejr4IOlFfFwdB5vpsluXlYiqDdlyQTYcDtdAny_o4gO4SfPeQCCN2qpyT6e0nog5EaP3xk2SeUPTrF54p1gM=@protonmail.com/T/#m068e010dcf8b99d3510a90d7532bcdb70e2e2c6b

Signed-off-by: Koakuma <koachan@protonmail.com>
---
 scripts/Makefile.clang | 1 +
 1 file changed, 1 insertion(+)

diff --git a/scripts/Makefile.clang b/scripts/Makefile.clang
index 6c23c6af797f..2435efae67f5 100644
--- a/scripts/Makefile.clang
+++ b/scripts/Makefile.clang
@@ -10,6 +10,7 @@ CLANG_TARGET_FLAGS_mips		:= mipsel-linux-gnu
 CLANG_TARGET_FLAGS_powerpc	:= powerpc64le-linux-gnu
 CLANG_TARGET_FLAGS_riscv	:= riscv64-linux-gnu
 CLANG_TARGET_FLAGS_s390		:= s390x-linux-gnu
+CLANG_TARGET_FLAGS_sparc	:= sparc64-linux-gnu
 CLANG_TARGET_FLAGS_x86		:= x86_64-linux-gnu
 CLANG_TARGET_FLAGS_um		:= $(CLANG_TARGET_FLAGS_$(SUBARCH))
 CLANG_TARGET_FLAGS		:= $(CLANG_TARGET_FLAGS_$(SRCARCH))

-- 
2.45.2



