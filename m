Return-Path: <linux-kbuild+bounces-8711-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 15BBEB430A0
	for <lists+linux-kbuild@lfdr.de>; Thu,  4 Sep 2025 05:47:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C07A3568046
	for <lists+linux-kbuild@lfdr.de>; Thu,  4 Sep 2025 03:47:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 00A83238C3A;
	Thu,  4 Sep 2025 03:46:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WxUuM0l0"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C146723814D;
	Thu,  4 Sep 2025 03:46:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756957617; cv=none; b=J9L2KCEmCaTTj7RKDvIm9AUEeH74bGGhGdd3poRXkUTJWdlHzoyvhMxTbXXbfTavL/OUXvKXXTxjxQ/4/qD1xvSsEPmiR3JJMWGJgq4ZHuQ7StZja+cJnw+3CksSnO3xULWKvwbcT2kdVqRpXGvUgMQtCvC/C/yqCj59GG7mFmM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756957617; c=relaxed/simple;
	bh=xAOGr0wz5pVGa6TAyVuH2Ski5/R27AIRietPZivlbmo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=OYeCwwCBjJncf6jubfjug6EzLSByutUWZ2PMwaragsUaT+Hiinm7BQDXzDIdYLVKMZi9B5FMwMIA+Mf6LnkSEpiC8uVysfpQzKQtjf8ufrij4yknvwxC6TJB6Kh+w2/pD64VpPKO3V25NJBe6IqXvneQfUZo/seh9JcluIBZufE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WxUuM0l0; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D26DC4AF09;
	Thu,  4 Sep 2025 03:46:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756957617;
	bh=xAOGr0wz5pVGa6TAyVuH2Ski5/R27AIRietPZivlbmo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=WxUuM0l0f6VAAADe9tpJw8aZR/FHuaXXhhclaetWnKatzrmKi6ULANZV52XYZUpPf
	 NTdQcABHTS9HYn4nNWXtYCJ8UXxgdsWbJXIULuaS76nQ+RlFVkwRYUHbeWeBiHtS+3
	 e/Vbnr8NFwQKJ6toL2gZulhjRTAN+kSSM6quA6WGwUkezR9ngqGJQbqj/DmklpOi2r
	 zbKYtjBexzhoDD5Pz2s2ODzYX19xf9/mvJ9Vub/CqhC7ccjcoRAU3qI45jULzhIvsC
	 FCXWrTyXe7XRCdGkWL9Wlr9m0uP7NTslglMW1chFs2+WHSJWnGeMHobGsBxsAG/ZXA
	 4GYXUb7113nFg==
From: Kees Cook <kees@kernel.org>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Kees Cook <kees@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Vegard Nossum <vegard.nossum@oracle.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
	Randy Dunlap <rdunlap@infradead.org>,
	David Woodhouse <dwmw2@infradead.org>,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Marco Elver <elver@google.com>,
	Przemek Kitszel <przemyslaw.kitszel@intel.com>,
	Ramon de C Valle <rcvalle@google.com>,
	Jonathan Corbet <corbet@lwn.net>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Nicolas Schier <nicolas.schier@linux.dev>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Sami Tolvanen <samitolvanen@google.com>,
	Mark Rutland <mark.rutland@arm.com>,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	linux-doc@vger.kernel.org,
	linux-kbuild@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	x86@kernel.org,
	linux-hardening@vger.kernel.org
Subject: [PATCH v2 2/9] x86/traps: Clarify KCFI instruction layout
Date: Wed,  3 Sep 2025 20:46:41 -0700
Message-Id: <20250904034656.3670313-2-kees@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250904033217.it.414-kees@kernel.org>
References: <20250904033217.it.414-kees@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=902; i=kees@kernel.org; h=from:subject; bh=xAOGr0wz5pVGa6TAyVuH2Ski5/R27AIRietPZivlbmo=; b=owGbwMvMwCVmps19z/KJym7G02pJDBk7OYv+GWdP3f0jz/ecudlNqZ2MUk+XdjndX6TGcmXJX Mmiovv+HaUsDGJcDLJiiixBdu5xLh5v28Pd5yrCzGFlAhnCwMUpABN53cTIMCG2z3jpxYd+zROt DkRvZTHaI+nde21V1OEvD7fNWH+27jgjQ1fBrcSXK3ubLVRPpx3TPudw2mN654+p71OLJ+cdrFv VzQEA
X-Developer-Key: i=kees@kernel.org; a=openpgp; fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Just a nit-picky change to the KCFI indirect call check instruction
documentation. The addl offset isn't always -4 (it depends on patchable
function entry configuration).

Signed-off-by: Kees Cook <kees@kernel.org>
---
Cc: Peter Zijlstra <peterz@infradead.org>
---
 arch/x86/kernel/cfi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/x86/kernel/cfi.c b/arch/x86/kernel/cfi.c
index 77086cf565ec..638eb5c933e0 100644
--- a/arch/x86/kernel/cfi.c
+++ b/arch/x86/kernel/cfi.c
@@ -27,7 +27,7 @@ static bool decode_cfi_insn(struct pt_regs *regs, unsigned long *target,
 	 * for indirect call checks:
 	 *
 	 *   movl    -<id>, %r10d       ; 6 bytes
-	 *   addl    -4(%reg), %r10d    ; 4 bytes
+	 *   addl    -<pos>(%reg), %r10d; 4 bytes
 	 *   je      .Ltmp1             ; 2 bytes
 	 *   ud2                        ; <- regs->ip
 	 *   .Ltmp1:
-- 
2.34.1


