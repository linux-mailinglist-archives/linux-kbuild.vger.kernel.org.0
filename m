Return-Path: <linux-kbuild+bounces-6844-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CEB41AA6440
	for <lists+linux-kbuild@lfdr.de>; Thu,  1 May 2025 21:48:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7E7F29A8090
	for <lists+linux-kbuild@lfdr.de>; Thu,  1 May 2025 19:48:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D136923504D;
	Thu,  1 May 2025 19:48:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iEZ0cBDP"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B2F721C183;
	Thu,  1 May 2025 19:48:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746128909; cv=none; b=B0jb3JlBFPiOlM/VD+x72SzYbOjOaX07R5zuoi8gYCgjE+Tl5jmMJOr7zSCuD24BZhTIcRCmbhba4SQt46z8P4DxkGzynDQAW24IjYBOc9jXxSlC9FbvMTLo7QgIFUILmpqeSrTn1e+tC9KQfgcCoq1ONYqOKbhneNcC9+EDVD0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746128909; c=relaxed/simple;
	bh=EquXf22t1MG3qlvTmHUyGycZGdk2twt1J14XgIQ4XgY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=IsCyeAZxymGbD3WvTdNXMZGR/UnuEkUxPJ/Ie/cO+iYjBzn+BEgdl2LVXwDtmKFAe9zE1kuJ71t/9rYnWVhDp79EctZexCjBRNowGn+NSEQ8AW95khxW6qCjnI+oYGddnAk2XST52mnNker8JeRT/ER50fS0FhWgSUurNxE2KME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iEZ0cBDP; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D297C4AF0C;
	Thu,  1 May 2025 19:48:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746128909;
	bh=EquXf22t1MG3qlvTmHUyGycZGdk2twt1J14XgIQ4XgY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=iEZ0cBDPV30yaUNfww7jGrgei/ijNalpIuUG+CJCcxbQuOoOGDcEQIc/oDWAT1Il5
	 XJpo3iwq2Iq+CcCQZRQfVzWgwxb3lqDZJZi9tjwP1x3fF8sPpo/eAd6uFrtAIajMhS
	 Akwn/sqpsq/foMuM5yfPfbhQMLwnfl7Yq4Z4OQofvnH1qkJYH32xUnn5QDyLNiUbaq
	 EheXsWooLzvPhkm4BiYkw1QyMJsOqahVECr8aTA5h0sa+xWgSRnsJAWazs51mw+o2z
	 41nbI8sONxQAMXBLCNyazNZVoYDpMj+OmNADQDaYshHu27WdMrCyd1GatDWbMs32Nl
	 kn+MdUxVEFDTg==
From: Kees Cook <kees@kernel.org>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Kees Cook <kees@kernel.org>,
	Justin Stitt <justinstitt@google.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas.schier@linux.dev>,
	Marco Elver <elver@google.com>,
	Andrey Konovalov <andreyknvl@gmail.com>,
	Andrey Ryabinin <ryabinin.a.a@gmail.com>,
	linux-kbuild@vger.kernel.org,
	kasan-dev@googlegroups.com,
	linux-hardening@vger.kernel.org,
	Petr Pavlu <petr.pavlu@suse.com>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/3] integer-wrap: Force full rebuild when .scl file changes
Date: Thu,  1 May 2025 12:48:18 -0700
Message-Id: <20250501194826.2947101-3-kees@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250501193839.work.525-kees@kernel.org>
References: <20250501193839.work.525-kees@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2139; i=kees@kernel.org; h=from:subject; bh=EquXf22t1MG3qlvTmHUyGycZGdk2twt1J14XgIQ4XgY=; b=owGbwMvMwCVmps19z/KJym7G02pJDBnCFxhVw5LkMtT9F1052nPHuakx/wafkvXdLeWmT+V0x I5O0EvtKGVhEONikBVTZAmyc49z8XjbHu4+VxFmDisTyBAGLk4BmEiHOcP/+vxpzp/EF33dfr7I rHzutYapwnX5fJ9t70n23E33Oau8npHh19meOVfrLig1qc56t0x7ZcinFGPV3KJ/4i/eZy9VbJL hBgA=
X-Developer-Key: i=kees@kernel.org; a=openpgp; fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
Content-Transfer-Encoding: 8bit

Since the integer wrapping sanitizer's behavior depends on its
associated .scl file, we must force a full rebuild if the file changes.
Universally include a synthetic header file that is rebuilt when the
.scl file changes.

Signed-off-by: Kees Cook <kees@kernel.org>
---
Cc: Masahiro Yamada <masahiroy@kernel.org>
Cc: Justin Stitt <justinstitt@google.com>
Cc: Nathan Chancellor <nathan@kernel.org>
Cc: Nicolas Schier <nicolas.schier@linux.dev>
Cc: Marco Elver <elver@google.com>
Cc: Andrey Konovalov <andreyknvl@gmail.com>
Cc: Andrey Ryabinin <ryabinin.a.a@gmail.com>
Cc: <linux-kbuild@vger.kernel.org>
Cc: <kasan-dev@googlegroups.com>
Cc: <linux-hardening@vger.kernel.org>
---
 scripts/Makefile.ubsan | 1 +
 scripts/basic/Makefile | 9 +++++++++
 2 files changed, 10 insertions(+)

diff --git a/scripts/Makefile.ubsan b/scripts/Makefile.ubsan
index 9e35198edbf0..254d5a7ec994 100644
--- a/scripts/Makefile.ubsan
+++ b/scripts/Makefile.ubsan
@@ -15,6 +15,7 @@ ubsan-cflags-$(CONFIG_UBSAN_TRAP)		+= $(call cc-option,-fsanitize-trap=undefined
 export CFLAGS_UBSAN := $(ubsan-cflags-y)
 
 ubsan-integer-wrap-cflags-$(CONFIG_UBSAN_INTEGER_WRAP)     +=	\
+	-include $(objtree)/scripts/basic/integer-wrap.h	\
 	-fsanitize-undefined-ignore-overflow-pattern=all	\
 	-fsanitize=signed-integer-overflow			\
 	-fsanitize=unsigned-integer-overflow			\
diff --git a/scripts/basic/Makefile b/scripts/basic/Makefile
index 31637ce4dc5c..04f5620a3f8b 100644
--- a/scripts/basic/Makefile
+++ b/scripts/basic/Makefile
@@ -15,3 +15,12 @@ $(obj)/randstruct_hash.h $(obj)/randstruct.seed: $(gen-randstruct-seed) FORCE
 	$(call if_changed,create_randstruct_seed)
 
 always-$(CONFIG_RANDSTRUCT) += randstruct.seed randstruct_hash.h
+
+# integer-wrap: if the .scl file changes, we need to do a full rebuild.
+quiet_cmd_integer_wrap_updated = UPDATE  $@
+      cmd_integer_wrap_updated = echo '/* $^ */' > $(obj)/integer-wrap.h
+
+$(obj)/integer-wrap.h: $(srctree)/scripts/integer-wrap-ignore.scl FORCE
+	$(call if_changed,integer_wrap_updated)
+
+always-$(CONFIG_UBSAN_INTEGER_WRAP) += integer-wrap.h
-- 
2.34.1


