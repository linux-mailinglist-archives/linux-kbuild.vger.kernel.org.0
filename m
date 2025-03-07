Return-Path: <linux-kbuild+bounces-5989-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B471A55F50
	for <lists+linux-kbuild@lfdr.de>; Fri,  7 Mar 2025 05:19:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4CC971894EED
	for <lists+linux-kbuild@lfdr.de>; Fri,  7 Mar 2025 04:19:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 913571922E1;
	Fri,  7 Mar 2025 04:19:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Rz5g9Vap"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6080419006F;
	Fri,  7 Mar 2025 04:19:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741321158; cv=none; b=hmlZDQiqJn3F7UnKlz9F855BMBOA72TiijeXoWjll0S8hxNLEp+UmPdzOhDCZvvH9SATRD9twmvhJbD+WS88BKeRes94CLmUeXlJNJzydd8C3ezVugtTEFhaw+LDyd20TQCnfN/2aihn9do9ipciAOR6NbWBFuKjduHVMSRZpIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741321158; c=relaxed/simple;
	bh=swXPVnzWC/FlvTAyt5YU2bLA06oGPklYrKEuppMNs8o=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=FL6xDRnwheBZ7mmu9jBB1WuaCNsBCFvNzow/SKL3jInr2iX9KzuWIuRc/5k57o0t+gQ78KhUTjfWiBAhVjZu09ey/v3kD5mHFzyA8avMUzRblhzS1IdhWNH1e7kVSevFCKn6ti1q9kIE4RJuMIL3MYMQdEfEDMOxTYeRFfmpiNo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Rz5g9Vap; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2590C4AF0C;
	Fri,  7 Mar 2025 04:19:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741321158;
	bh=swXPVnzWC/FlvTAyt5YU2bLA06oGPklYrKEuppMNs8o=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Rz5g9VapbAqgPoWzPySZOL58XXVRoeHavg1WXOye8yXU1N6VuzaO3vXbfB8TaoZbh
	 6NyLEaX19Ma/qNr3DfUtH41cSs1c+uEGRUqWL4zWaiPPpmefI+5ETXFGyZMQ7NdiL9
	 rNf6PoOeWb+QmEU8OcAavFkJTbGO2oXe7EyJvon7HE1BSwONh8+3x+6q3VAOaIX7sY
	 6QMoDoAe+RundJIXlXlECBOfNH+MoC/nTfotQjFf3pTc/ooWoXW8+f4hndvv3QdYih
	 FdkUtWXLTwoR6k+y6WuDuYwL2nVjhseCB3UHE9fh68xS8Hx8TubzHkfRjPrLIMdB9a
	 Ij2QFKSBI9aCw==
From: Kees Cook <kees@kernel.org>
To: Justin Stitt <justinstitt@google.com>
Cc: Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>,
	Marco Elver <elver@google.com>,
	Andrey Konovalov <andreyknvl@gmail.com>,
	Andrey Ryabinin <ryabinin.a.a@gmail.com>,
	linux-kbuild@vger.kernel.org,
	kasan-dev@googlegroups.com,
	linux-hardening@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Hao Luo <haoluo@google.com>,
	Przemek Kitszel <przemyslaw.kitszel@intel.com>,
	Bill Wendling <morbo@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Tony Ambardar <tony.ambardar@gmail.com>,
	Alexander Potapenko <glider@google.com>,
	Jan Hendrik Farr <kernel@jfarr.cc>,
	Alexander Lobakin <aleksander.lobakin@intel.com>,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH 2/3] ubsan/overflow: Enable pattern exclusions
Date: Thu,  6 Mar 2025 20:19:10 -0800
Message-Id: <20250307041914.937329-2-kees@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250307040948.work.791-kees@kernel.org>
References: <20250307040948.work.791-kees@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2094; i=kees@kernel.org; h=from:subject; bh=swXPVnzWC/FlvTAyt5YU2bLA06oGPklYrKEuppMNs8o=; b=owGbwMvMwCVmps19z/KJym7G02pJDOmnivdFn5JrOxe5UsvST1KT0T7/Z9y/CeZXXiyc2sBj8 qlu7n+tjlIWBjEuBlkxRZYgO/c4F4+37eHucxVh5rAygQxh4OIUgImYiTH899uitEkySfFFhPd5 Twe+z+sZfp7XnD/3eSUL01tGu5u+tgy/mFlqc12+iT/Jfya++uLdam6eJ5l3xSeqvl3FGcJdEHy YFQA=
X-Developer-Key: i=kees@kernel.org; a=openpgp; fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
Content-Transfer-Encoding: 8bit

To make integer wrap-around mitigation actually useful, the associated
sanitizers must not instrument cases where the wrap-around is explicitly
defined (e.g. "-2UL"), being tested for (e.g. "if (a + b < a)"), or
where it has no impact on code flow (e.g. "while (var--)"). Enable
pattern exclusions for the integer wrap sanitizers.

Signed-off-by: Kees Cook <kees@kernel.org>
---
Cc: Justin Stitt <justinstitt@google.com>
Cc: "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: Masahiro Yamada <masahiroy@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>
Cc: Nicolas Schier <nicolas@fjasle.eu>
Cc: Marco Elver <elver@google.com>
Cc: Andrey Konovalov <andreyknvl@gmail.com>
Cc: Andrey Ryabinin <ryabinin.a.a@gmail.com>
Cc: linux-kbuild@vger.kernel.org
Cc: kasan-dev@googlegroups.com
Cc: linux-hardening@vger.kernel.org
---
 lib/Kconfig.ubsan      | 1 +
 scripts/Makefile.ubsan | 1 +
 2 files changed, 2 insertions(+)

diff --git a/lib/Kconfig.ubsan b/lib/Kconfig.ubsan
index 63e5622010e0..888c2e72c586 100644
--- a/lib/Kconfig.ubsan
+++ b/lib/Kconfig.ubsan
@@ -120,6 +120,7 @@ config UBSAN_INTEGER_WRAP
 	bool "Perform checking for integer arithmetic wrap-around"
 	default UBSAN
 	depends on !COMPILE_TEST
+	depends on $(cc-option,-fsanitize-undefined-ignore-overflow-pattern=all)
 	depends on $(cc-option,-fsanitize=signed-integer-overflow)
 	depends on $(cc-option,-fsanitize=unsigned-integer-overflow)
 	depends on $(cc-option,-fsanitize=implicit-signed-integer-truncation)
diff --git a/scripts/Makefile.ubsan b/scripts/Makefile.ubsan
index 4fad9afed24c..233379c193a7 100644
--- a/scripts/Makefile.ubsan
+++ b/scripts/Makefile.ubsan
@@ -15,6 +15,7 @@ ubsan-cflags-$(CONFIG_UBSAN_TRAP)		+= $(call cc-option,-fsanitize-trap=undefined
 export CFLAGS_UBSAN := $(ubsan-cflags-y)
 
 ubsan-integer-wrap-cflags-$(CONFIG_UBSAN_INTEGER_WRAP)     +=	\
+	-fsanitize-undefined-ignore-overflow-pattern=all	\
 	-fsanitize=signed-integer-overflow			\
 	-fsanitize=unsigned-integer-overflow			\
 	-fsanitize=implicit-signed-integer-truncation		\
-- 
2.34.1


