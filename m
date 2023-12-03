Return-Path: <linux-kbuild+bounces-244-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EFD40802270
	for <lists+linux-kbuild@lfdr.de>; Sun,  3 Dec 2023 11:14:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 835001F20F18
	for <lists+linux-kbuild@lfdr.de>; Sun,  3 Dec 2023 10:14:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 047538F57;
	Sun,  3 Dec 2023 10:14:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iV9ihJQ5"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D897728FE;
	Sun,  3 Dec 2023 10:14:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C1361C433CA;
	Sun,  3 Dec 2023 10:14:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701598466;
	bh=rjTEorOKOasXmLsA7k46njF60U2EzdHdA3xtay0TA6w=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=iV9ihJQ5p1xKzK8ySsg8JXWHcEecEpA1RX9Fvd73XsKS6JgW9SjvRSh/waEcC8Mqt
	 hMB6WklR0jm3+7NQBemBJInVupiZfbolUzX3vHTj29b/Agf2NZKgbh2aBb4Iloo7AH
	 DSoslmN4dUJ1PS4Lc5baA05psWDIvsOJk4CuoZphaf3WIgKQ7b9dH+Qjk0VZ/fTSrh
	 yyVBAmfMqWyp5xt4HcW05xWDgfh8qn/aZeLkYqCU4ziBwRS8SZmLFg20f62jL9JsxO
	 OmsA/o1Amqbs2HG/SEEc/MDxiaieHp/RhFfglXTTLpn7aKm5e4GXjtkNNOM00OtVP0
	 N77fJzoP/ZQRw==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <masahiroy@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	linux-kernel@vger.kernel.org,
	sparclinux@vger.kernel.org
Subject: [PATCH 2/3] sparc: vdso: simplify obj-y addition
Date: Sun,  3 Dec 2023 19:14:17 +0900
Message-Id: <20231203101418.1910661-2-masahiroy@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231203101418.1910661-1-masahiroy@kernel.org>
References: <20231203101418.1910661-1-masahiroy@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add objects to obj-y in a more straightforward way.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 arch/sparc/vdso/Makefile | 11 ++---------
 1 file changed, 2 insertions(+), 9 deletions(-)

diff --git a/arch/sparc/vdso/Makefile b/arch/sparc/vdso/Makefile
index eb52d0666ffc..03a32b6156ee 100644
--- a/arch/sparc/vdso/Makefile
+++ b/arch/sparc/vdso/Makefile
@@ -3,9 +3,6 @@
 # Building vDSO images for sparc.
 #
 
-VDSO64-$(CONFIG_SPARC64)	:= y
-VDSOCOMPAT-$(CONFIG_COMPAT)	:= y
-
 # files to link into the vdso
 vobjs-y := vdso-note.o vclock_gettime.o
 
@@ -13,18 +10,14 @@ vobjs-y := vdso-note.o vclock_gettime.o
 obj-y				+= vma.o
 
 # vDSO images to build
-vdso_img-$(VDSO64-y)		+= 64
-vdso_img-$(VDSOCOMPAT-y)	+= 32
+obj-$(CONFIG_SPARC64)		+= vdso-image-64.o
+obj-$(CONFIG_COMPAT)		+= vdso-image-32.o
 
 vobjs := $(foreach F,$(vobjs-y),$(obj)/$F)
 
 $(obj)/vdso.o: $(obj)/vdso.so
 
 targets += vdso.lds $(vobjs-y)
-
-# Build the vDSO image C files and link them in.
-vdso_img_objs := $(vdso_img-y:%=vdso-image-%.o)
-obj-y += $(vdso_img_objs)
 targets += $(foreach x, 32 64, vdso-image-$(x).c vdso$(x).so vdso$(x).so.dbg)
 
 CPPFLAGS_vdso.lds += -P -C
-- 
2.40.1


