Return-Path: <linux-kbuild+bounces-6916-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 82FB3AA81F9
	for <lists+linux-kbuild@lfdr.de>; Sat,  3 May 2025 20:46:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 97CA217EF99
	for <lists+linux-kbuild@lfdr.de>; Sat,  3 May 2025 18:46:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 44C9127E7D6;
	Sat,  3 May 2025 18:46:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gOIPfsz9"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E5EA170A2B;
	Sat,  3 May 2025 18:46:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746297987; cv=none; b=MyA4hA6QIUDhfHbq97nmcSFmdNEQdTXHzK3GqkyCd/rCuvTQJf/ipxWbalekr5bBz1Zbli0p8vamePEeMTkSQS7RBogpbz9IpeTWHZASxqu95JbEV9slVAwUpZlrS4RMm6cZrKL9tsyk61OfUpntSL89Sw77Je5H91ny6jP4+u0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746297987; c=relaxed/simple;
	bh=/4TdTrc4aB0kiFO9JBIxqORcQZGXnaXh7CndlvLLjw4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=fUFsW+biDhiTjAL3RvP9O7MuX+CPKZKsq2rGOyRKkRYAaova4wEGHFadH77sYvN33iQWCXDdijIBBxV5qLTb2yZjdhmHnbK5ZWcgmf88DYXSWnlrTNpShRnrGEdWTpPtS1Xt5ql8aWmYTNTfnXFop/zlKNI/3iiVDUcJT2/3wjs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gOIPfsz9; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E60BC4CEEF;
	Sat,  3 May 2025 18:46:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746297986;
	bh=/4TdTrc4aB0kiFO9JBIxqORcQZGXnaXh7CndlvLLjw4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=gOIPfsz9QjVz4I8M3cqzI3vqMbbg4ALmRsWvKoeQ1baBKmQ/SK4jlyFnXER6Aym0b
	 cFKi1sA8BcL4Wpvtc66A/dJIkB2/7eVNbUFgpyZA5mP6VcdzsPC5ad9zVnKh0ch6gp
	 jeTagF0HarqFUGUTEj58W1ASZl+9ErViq3svQZrRHQwcQ38S2apnmTF4toNKKzPq/F
	 v970X2AjJX+LAlZKRm98VyhuAibIwEroXnTS6hgicex8mzPsLlFY4PHhVvVgHozwnD
	 XTsNbqdKAh0kbcyDxX92OpRBA5e3scwRIzczU66RSy7erb2NRjAXbD9sfB8hb2tL43
	 bUvDClK2xCq1g==
From: Kees Cook <kees@kernel.org>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Kees Cook <kees@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas.schier@linux.dev>,
	Petr Pavlu <petr.pavlu@suse.com>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	linux-kbuild@vger.kernel.org,
	Justin Stitt <justinstitt@google.com>,
	Marco Elver <elver@google.com>,
	Andrey Konovalov <andreyknvl@gmail.com>,
	Andrey Ryabinin <ryabinin.a.a@gmail.com>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org,
	kasan-dev@googlegroups.com,
	llvm@lists.linux.dev
Subject: [PATCH v3 2/3] randstruct: Force full rebuild when seed changes
Date: Sat,  3 May 2025 11:46:19 -0700
Message-Id: <20250503184623.2572355-2-kees@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250503184001.make.594-kees@kernel.org>
References: <20250503184001.make.594-kees@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1638; i=kees@kernel.org; h=from:subject; bh=/4TdTrc4aB0kiFO9JBIxqORcQZGXnaXh7CndlvLLjw4=; b=owGbwMvMwCVmps19z/KJym7G02pJDBliyfv3J+WtzL589uiKhFWFjQuOu8ux+8/5JB98+dIOh kKRL4WfO0pYGMS4GGTFFFmC7NzjXDzetoe7z1WEmcPKBDKEgYtTACbi/pmR4Yj4wy3Pn+jVqpiI 8u5tnxmo0l9VHWgYwnHUS/Pi10eiJQw/Lvo8PqCVcGZOuLiG2bfzc6eLdL+15NuTJH6iceJDtVo GAA==
X-Developer-Key: i=kees@kernel.org; a=openpgp; fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
Content-Transfer-Encoding: 8bit

While the randstruct GCC plugin was being rebuilt if the randstruct seed
changed, Clang builds did not notice the change. This could result in
differing struct layouts in a target depending on when it was built.

Include the existing generated header file in compiler-version.h when
its associated feature name, RANDSTRUCT, is defined. This will be picked
up by fixdep and force rebuilds where needed.

Signed-off-by: Kees Cook <kees@kernel.org>
---
Cc: Masahiro Yamada <masahiroy@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>
Cc: Nicolas Schier <nicolas.schier@linux.dev>
Cc: Petr Pavlu <petr.pavlu@suse.com>
Cc: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: <linux-kbuild@vger.kernel.org>
---
 include/linux/compiler-version.h | 3 +++
 include/linux/vermagic.h         | 1 -
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/include/linux/compiler-version.h b/include/linux/compiler-version.h
index 74ea11563ce3..69b29b400ce2 100644
--- a/include/linux/compiler-version.h
+++ b/include/linux/compiler-version.h
@@ -16,3 +16,6 @@
 #ifdef GCC_PLUGINS
 #include <generated/gcc-plugins.h>
 #endif
+#ifdef RANDSTRUCT
+#include <generated/randstruct_hash.h>
+#endif
diff --git a/include/linux/vermagic.h b/include/linux/vermagic.h
index 939ceabcaf06..335c360d4f9b 100644
--- a/include/linux/vermagic.h
+++ b/include/linux/vermagic.h
@@ -33,7 +33,6 @@
 #define MODULE_VERMAGIC_MODVERSIONS ""
 #endif
 #ifdef RANDSTRUCT
-#include <generated/randstruct_hash.h>
 #define MODULE_RANDSTRUCT "RANDSTRUCT_" RANDSTRUCT_HASHED_SEED
 #else
 #define MODULE_RANDSTRUCT
-- 
2.34.1


