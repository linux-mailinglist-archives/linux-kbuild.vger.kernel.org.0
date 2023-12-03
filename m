Return-Path: <linux-kbuild+bounces-243-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CC69080226B
	for <lists+linux-kbuild@lfdr.de>; Sun,  3 Dec 2023 11:14:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 08A32280EDF
	for <lists+linux-kbuild@lfdr.de>; Sun,  3 Dec 2023 10:14:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C5D17465;
	Sun,  3 Dec 2023 10:14:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NmJ1avpb"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF34928FE;
	Sun,  3 Dec 2023 10:14:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68FB5C433C7;
	Sun,  3 Dec 2023 10:14:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701598465;
	bh=SGw12HvAh6TeQkpp7+yNIE4rnwWaTLqwCH5qBGJLnPo=;
	h=From:To:Cc:Subject:Date:From;
	b=NmJ1avpbXG/IdCjt2tV9705sdIZXNYxaRNYb0NrLDWYjC2HRPhwatyCll0V5oRvIC
	 LRcqvi1UI1OApssEtcpQgzI5myhiaDRfGWy9iHvusH5/eFZFyM8WP21OerrNKTtflB
	 k1edi6XjHZFpY4Rh3JzXO7EFua+u/OtTZeTowPwFn5mXQFSkTfHDLGmmjQCkN2Zriz
	 jGLr344AvH2DLlh9vvhYOWDrKZIZeDNCOcrWtOCPrC6788/UTmfAqP+ptVgZDpcYD9
	 scHM14/olcPuel7rjRcG4MlezAJszmFQBcTgGVGSqtmpA0bLOKUXduV8agxgo3ALUk
	 tb3irtm0FktYQ==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <masahiroy@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	linux-kernel@vger.kernel.org,
	sparclinux@vger.kernel.org
Subject: [PATCH 1/3] sparc: vdso: clean up build artifacts in arch/sparc/vdso/
Date: Sun,  3 Dec 2023 19:14:16 +0900
Message-Id: <20231203101418.1910661-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.40.1
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Currently, vdso-image-*.c, vdso*.so, vdso*.so.dbg are not cleaned
because 'make clean' does not include include/config/auto.conf,
resulting in $(vdso_img-y) being empty.

Add the build artifacts to 'targets' unconditionally.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 arch/sparc/vdso/Makefile | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/arch/sparc/vdso/Makefile b/arch/sparc/vdso/Makefile
index d08c3a0443f3..eb52d0666ffc 100644
--- a/arch/sparc/vdso/Makefile
+++ b/arch/sparc/vdso/Makefile
@@ -24,11 +24,8 @@ targets += vdso.lds $(vobjs-y)
 
 # Build the vDSO image C files and link them in.
 vdso_img_objs := $(vdso_img-y:%=vdso-image-%.o)
-vdso_img_cfiles := $(vdso_img-y:%=vdso-image-%.c)
-vdso_img_sodbg := $(vdso_img-y:%=vdso%.so.dbg)
 obj-y += $(vdso_img_objs)
-targets += $(vdso_img_cfiles)
-targets += $(vdso_img_sodbg) $(vdso_img-y:%=vdso%.so)
+targets += $(foreach x, 32 64, vdso-image-$(x).c vdso$(x).so vdso$(x).so.dbg)
 
 CPPFLAGS_vdso.lds += -P -C
 
-- 
2.40.1


