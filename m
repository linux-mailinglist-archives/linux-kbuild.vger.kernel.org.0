Return-Path: <linux-kbuild+bounces-10052-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id DB326CB39FD
	for <lists+linux-kbuild@lfdr.de>; Wed, 10 Dec 2025 18:29:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 505363031B9E
	for <lists+linux-kbuild@lfdr.de>; Wed, 10 Dec 2025 17:29:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C34B32868B0;
	Wed, 10 Dec 2025 17:29:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="QTYFtRRZ"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-106120.protonmail.ch (mail-106120.protonmail.ch [79.135.106.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25A0E324B30
	for <linux-kbuild@vger.kernel.org>; Wed, 10 Dec 2025 17:28:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.120
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765387742; cv=none; b=d5E4oZWNj+hCK+LsZ/TQn5znm3tpkzAE5gL6grIM8ub7CI1yK389zm3bScEaXL5pQsD0O1JG4bliJ92kZ6uPQxG5eFgv1lM7f24C0mJmAMwi76u5mMKe/AK/c/zXi5TX5uINGtEUo0+qwCER007fOF3LrOCjfKGaLHHQOP54Bak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765387742; c=relaxed/simple;
	bh=MOW+FEXSkjqoA9gO0vl1FWTSXtEjOD+DXsStw9lDKJE=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UxLrUat0dLRm/EpGsmZw8GliWFpepkS6M1Y2XSr9xbxt8t1wr1V0Lx68joN9bcpS85o4bpqV9MtG7J/efhdvuSJs/zDeX86gI/o0VwkdLs4LNdX9tnMdOhki2FZ+XnTOlLLmX1NwzijcK3L+ottQdTLrj+nXVWDDmomcvSFGt0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=QTYFtRRZ; arc=none smtp.client-ip=79.135.106.120
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1765387736; x=1765646936;
	bh=i82hVLnXXbAVfgARSkNfTSungiQEgJywgSx/RsX/wSc=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=QTYFtRRZSv5HMgCvLl5j70fefNNpEH8Vd1RNrChuePSJpM8jr7yUaqlbcP+bUmUT/
	 RcoSdi0g+qlPiC9rqCPDtQU7gMfNuJCDNJwrCF6WmDuj9Y0G6DyAoWUKNnzlh8SVWD
	 cuSBNiYSJpJuVvcfsnv418i5V3/VmE+N/tvxafhFRj37FVgRiy/W6gh5Db3MfEFMB1
	 5DD6FkNkHtIed5sykhPZSImlqnhvX9cSJ9gCGa/y86ObAS1gXMQN6gNDweRWuaLQ+Q
	 GLdQMG82NcuhzvJWhG9s5jDYoXmqRWg5KZILJfXQBjHVn8fe7TD26C13TQqvDxJ8AL
	 +8ah8xL5tjfjA==
Date: Wed, 10 Dec 2025 17:28:51 +0000
To: Andrey Ryabinin <ryabinin.a.a@gmail.com>, Alexander Potapenko <glider@google.com>, Andrey Konovalov <andreyknvl@gmail.com>, Dmitry Vyukov <dvyukov@google.com>, Vincenzo Frascino <vincenzo.frascino@arm.com>, Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas.schier@linux.dev>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>
From: Maciej Wieczor-Retman <m.wieczorretman@pm.me>
Cc: m.wieczorretman@pm.me, Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>, linux-kbuild@vger.kernel.org, kasan-dev@googlegroups.com, linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Subject: [PATCH v7 03/15] kasan: Fix inline mode for x86 tag-based mode
Message-ID: <b06ac8eb411157c7c60f6893cfdd8148b6dcc0d0.1765386422.git.m.wieczorretman@pm.me>
In-Reply-To: <cover.1765386422.git.m.wieczorretman@pm.me>
References: <cover.1765386422.git.m.wieczorretman@pm.me>
Feedback-ID: 164464600:user:proton
X-Pm-Message-ID: a7071320bc0417d682deed36d6eb1da05840a46c
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

From: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>

The LLVM compiler uses hwasan-instrument-with-calls parameter to setup
inline or outline mode in tag-based KASAN. If zeroed, it means the
instrumentation implementation will be pasted into each relevant
location along with KASAN related constants during compilation. If set
to one all function instrumentation will be done with function calls
instead.

The default hwasan-instrument-with-calls value for the x86 architecture
in the compiler is "1", which is not true for other architectures.
Because of this, enabling inline mode in software tag-based KASAN
doesn't work on x86 as the kernel script doesn't zero out the parameter
and always sets up the outline mode.

Explicitly zero out hwasan-instrument-with-calls when enabling inline
mode in tag-based KASAN.

Signed-off-by: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>
Reviewed-by: Andrey Konovalov <andreyknvl@gmail.com>
Reviewed-by: Alexander Potapenko <glider@google.com>
---
Changelog v7:
- Add Alexander's Reviewed-by tag.

Changelog v6:
- Add Andrey's Reviewed-by tag.

Changelog v3:
- Add this patch to the series.

 scripts/Makefile.kasan | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/scripts/Makefile.kasan b/scripts/Makefile.kasan
index 0ba2aac3b8dc..e485814df3e9 100644
--- a/scripts/Makefile.kasan
+++ b/scripts/Makefile.kasan
@@ -76,8 +76,11 @@ CFLAGS_KASAN :=3D -fsanitize=3Dkernel-hwaddress
 RUSTFLAGS_KASAN :=3D -Zsanitizer=3Dkernel-hwaddress \
 =09=09   -Zsanitizer-recover=3Dkernel-hwaddress
=20
+# LLVM sets hwasan-instrument-with-calls to 1 on x86 by default. Set it to=
 0
+# when inline mode is enabled.
 ifdef CONFIG_KASAN_INLINE
 =09kasan_params +=3D hwasan-mapping-offset=3D$(KASAN_SHADOW_OFFSET)
+=09kasan_params +=3D hwasan-instrument-with-calls=3D0
 else
 =09kasan_params +=3D hwasan-instrument-with-calls=3D1
 endif
--=20
2.52.0



