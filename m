Return-Path: <linux-kbuild+bounces-6127-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id F3746A5FA94
	for <lists+linux-kbuild@lfdr.de>; Thu, 13 Mar 2025 17:00:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EC8343B5DFB
	for <lists+linux-kbuild@lfdr.de>; Thu, 13 Mar 2025 15:59:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE24B269833;
	Thu, 13 Mar 2025 15:59:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="XKWp7XEa"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 084042690E0;
	Thu, 13 Mar 2025 15:59:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741881568; cv=none; b=N48C99x8SiMadnyxopRh8DTuzIGYV4zOh3AWI9J5FCmPZOGi4q5/MsS0bzbQlTmenkTz3Gf/bBDxjxu0LBqH2N0Eza6Gx0hBOVXc8/IxevxGxspY2iiKCZM8og5378WcJbdVb5SCcqx58KP8fCKQ3sQhQxWewY6CIKJdzOnO08E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741881568; c=relaxed/simple;
	bh=gyxM7lG01ijM+q9FeI1Qe7my1goYfeHfCY5Or3iKvhc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dbqjXV8FsWPXXoUw2LNsdn871fCAUJGu9QJ7W3x+mDIZ3nIY96PSzcwkd4cKRrvRbNCd3ccvxK9e8f9opDLzD/6JTcLqCevb4M8lx62KIDapQCK9NjCGIXzNZZwZ+Y7G6C/h62QB5ttf4ueBQ6pfdmNScQKKsJeZeM7YPH8wVws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=XKWp7XEa; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1741881564;
	bh=gyxM7lG01ijM+q9FeI1Qe7my1goYfeHfCY5Or3iKvhc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=XKWp7XEaPNogvM4KJMipTkIfSU/UCx/0aFR+j1H+TgExEvoVexz0+ywB3QZODdQqC
	 G49A2H+IMv5nUXzd4PMQ2NFRsmT3PwYyOpOksviH4JsGlJ4J/vZDAgKsDcZ5VOFK1T
	 X/625tJcB/VgF72DqCVDi3HLK+IQeM3KWliGvPYE=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Thu, 13 Mar 2025 16:59:11 +0100
Subject: [PATCH 3/4] x86/boot: Switch to -ffile-prefix-map
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250313-kbuild-prefix-map-v1-3-38cea8448c5f@weissschuh.net>
References: <20250313-kbuild-prefix-map-v1-0-38cea8448c5f@weissschuh.net>
In-Reply-To: <20250313-kbuild-prefix-map-v1-0-38cea8448c5f@weissschuh.net>
To: Masahiro Yamada <masahiroy@kernel.org>, 
 Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, 
 Jonathan Corbet <corbet@lwn.net>, Thomas Gleixner <tglx@linutronix.de>, 
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
 Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
 "H. Peter Anvin" <hpa@zytor.com>, Ben Hutchings <ben@decadent.org.uk>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1741881563; l=905;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=gyxM7lG01ijM+q9FeI1Qe7my1goYfeHfCY5Or3iKvhc=;
 b=llYdqfj8gYiv8E+Lv9OLrBimDd13l3YWxcunDbm9vsTdDkwpWrWy0B2YgEZuGbQZw/5WFIbMr
 PLkebp8XuvBDDEpm+weTom9YcIoLu0O3HBtf526tOrpjxMKLUAmvzZz
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=

-ffile-prefix-map is a more general variant of the currently used
-fmacro-prefix-map. It is also what the top-level Makefile is using now.

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
 arch/x86/boot/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/x86/boot/Makefile b/arch/x86/boot/Makefile
index 9cc0ff6e9067d574488a35573eff4d0f8449e398..f500f82864aae80deb74faa3df9a8b6333d6c4ca 100644
--- a/arch/x86/boot/Makefile
+++ b/arch/x86/boot/Makefile
@@ -54,7 +54,7 @@ targets += cpustr.h
 
 KBUILD_CFLAGS	:= $(REALMODE_CFLAGS) -D_SETUP
 KBUILD_AFLAGS	:= $(KBUILD_CFLAGS) -D__ASSEMBLY__
-KBUILD_CFLAGS	+= $(call cc-option,-fmacro-prefix-map=$(srctree)/=)
+KBUILD_CFLAGS	+= $(call cc-option,-ffile-prefix-map=$(srctree)/=)
 KBUILD_CFLAGS	+= -fno-asynchronous-unwind-tables
 KBUILD_CFLAGS	+= $(CONFIG_CC_IMPLICIT_FALLTHROUGH)
 

-- 
2.48.1


