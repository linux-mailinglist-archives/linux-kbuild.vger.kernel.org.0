Return-Path: <linux-kbuild+bounces-5902-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FED7A43ACA
	for <lists+linux-kbuild@lfdr.de>; Tue, 25 Feb 2025 11:08:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 115883B507C
	for <lists+linux-kbuild@lfdr.de>; Tue, 25 Feb 2025 10:05:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D85BD261571;
	Tue, 25 Feb 2025 10:00:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="s/EX3EdZ"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD1832144BF;
	Tue, 25 Feb 2025 10:00:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740477642; cv=none; b=J7hGS3WWKGSV7y+yQNbYMWdHaRC7PsVMygjs0fERYFBiPwb0cjdQLg40DVkm2D+w14/FmYW9c3Or7+LXVKfeBxgpRuNrjUFCoImBnHPFgjKjbgSyxltZZr2oVN9cQtm/FLLjzyNFx5OeWlukyloxrIwNhgsQfLQKx+peDRj0jYg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740477642; c=relaxed/simple;
	bh=EJ6vWPnC77dmHQ122+ULTLzJINIW/YADLEaC8xWgSdU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=anfKquX6OevGXsv6kX6Pmtb7kyME4Mic1jyUtTNRuQyxwTIJ63dggmz1nKwXuZcXHDU9MG/ACycKMvT2y/sdqymrt1VaDAuUKe+1OdPmzWlyf/pbWdMx5pYl/eJCr3I/O845A+bvoG/fkVdiZ+kZbPTBlGAD6C3VfOUxEiP+vTs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=s/EX3EdZ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09937C4CEDD;
	Tue, 25 Feb 2025 10:00:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740477642;
	bh=EJ6vWPnC77dmHQ122+ULTLzJINIW/YADLEaC8xWgSdU=;
	h=From:To:Cc:Subject:Date:From;
	b=s/EX3EdZcCQwj+vOkoAQGUfKYstjdbERK+kapSdyZawDWna2/5gYNVG3LYrmWn0wh
	 XZZwQRVd7YoYnyt6uYviJYE7tQTivy7x2BGKz93PdUBtD6/lk0TKCI1PLIcDzdw9jj
	 VxVpW2t8Fspeh55tPT1fQ9an9AodsMWZUvFCifRDmldmg8OFGnKdWxUbBhEsUOmEEM
	 krjW+0lnhqQNXsuCYi2FKQ3drzegl7JrTMVPUyBi7PxAs40PbnaRhwYsIrmgK4pEF6
	 fHuPvvHAULVqqYIQD5/fPVtONczn+CNjV0UXLcG/mFQOcqW1Eq+TNrBAhM+hdvM0kv
	 Cesf+tCODHeJQ==
From: Arnd Bergmann <arnd@kernel.org>
To: Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Nicolas Schier <nicolas@fjasle.eu>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH] [v3] kbuild: hdrcheck: fix cross build with clang
Date: Tue, 25 Feb 2025 11:00:31 +0100
Message-Id: <20250225100037.2709624-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

The headercheck tries to call clang with a mix of compiler arguments
that don't include the target architecture. When building e.g. x86
headers on arm64, this produces a warning like

   clang: warning: unknown platform, assuming -mfloat-abi=soft

Add in the KBUILD_CPPFLAGS, which contain the target, in order to make it
build properly.

See also 1b71c2fb04e7 ("kbuild: userprogs: fix bitsize and target
detection on clang").

Reviewed-by: Nathan Chancellor <nathan@kernel.org>
Fixes: feb843a469fb ("kbuild: add $(CLANG_FLAGS) to KBUILD_CPPFLAGS")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
v2: use same approach as the other patch.
v3: fix changelog text
---
 usr/include/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/usr/include/Makefile b/usr/include/Makefile
index 58a9cbe4eba4..b9a2640b4bb7 100644
--- a/usr/include/Makefile
+++ b/usr/include/Makefile
@@ -10,7 +10,7 @@ UAPI_CFLAGS := -std=c90 -Wall -Werror=implicit-function-declaration
 
 # In theory, we do not care -m32 or -m64 for header compile tests.
 # It is here just because CONFIG_CC_CAN_LINK is tested with -m32 or -m64.
-UAPI_CFLAGS += $(filter -m32 -m64 --target=%, $(KBUILD_CFLAGS))
+UAPI_CFLAGS += $(filter -m32 -m64 --target=%, $(KBUILD_CPPFLAGS) $(KBUILD_CFLAGS))
 
 # USERCFLAGS might contain sysroot location for CC.
 UAPI_CFLAGS += $(USERCFLAGS)
-- 
2.39.5


