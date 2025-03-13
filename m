Return-Path: <linux-kbuild+bounces-6125-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C3BADA5FA9B
	for <lists+linux-kbuild@lfdr.de>; Thu, 13 Mar 2025 17:00:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B23BD19C396C
	for <lists+linux-kbuild@lfdr.de>; Thu, 13 Mar 2025 15:59:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C5BC4268FF9;
	Thu, 13 Mar 2025 15:59:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="d4N46iWD"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B6D52690C9;
	Thu, 13 Mar 2025 15:59:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741881567; cv=none; b=Xoy8iEYz5qt74YaZSeNPTW/fuFXCuDM9CgS5dlugCcg0QrhoYuYeoj4iZur1omgXq+kvllxZgW1wT8x0AzwXoX+xpFX5yRRg7IC+Az0nOtXKVNh6Oe2nsVy+6RRxHZQ+Z3kgJZRBhaPSBk5lsDNfYRvCKoNdhlW2WL4gZlZcd74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741881567; c=relaxed/simple;
	bh=ltv4SGnYeTNOm4U6udF0M3JRhzGYt4vV6y5YQjJTO1o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hS/bQx7BsZhxLfwrmJV0Hz8rYWYv1GL8Q51S1n0cvhhk6AKk0KqfwtIxI04lpMgf8EzoNm7EjWNd/mJ0tkKc7GSrAGAXNCNj+JQt1e8B6oVqikpTzbe+zUJIsfp29cxlS0BmnQZ4EIq5dqO+U5oDK7B7b9ysXDKpVwww/vlrjuM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=d4N46iWD; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1741881564;
	bh=ltv4SGnYeTNOm4U6udF0M3JRhzGYt4vV6y5YQjJTO1o=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=d4N46iWDYoFjgA9IJwU6S4Y1+DmHZGYeHlBi85p9I/DYwaEL+vy0Io38+A2ztkQPH
	 lN4ly9O1Jyn8uFfV4mEzq5D5h2jT+egOepwLtQN+GPB9FHejNmY3CJg6ydnCBjUT6v
	 gXMzA2YQG8l/UAUAHgBqDqACRh0zfn4ZvCMEVBCs=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Thu, 13 Mar 2025 16:59:12 +0100
Subject: [PATCH 4/4] x86/boot/compressed: Switch to -ffile-prefix-map
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250313-kbuild-prefix-map-v1-4-38cea8448c5f@weissschuh.net>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1741881563; l=1083;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=ltv4SGnYeTNOm4U6udF0M3JRhzGYt4vV6y5YQjJTO1o=;
 b=D/vhrS+o3YPzdcbd9BxcgIN1BT9UTcZQzpCKyao1/h6tggjOZTiXNddWjHUU5jipnsvpYRU65
 rc5mrA2bh2dCok8Gok9Qi8UrZtzf0lVi0AnIGTd9OSlYWkYavDvhdHn
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=

-ffile-prefix-map is a more general variant of the currently used
-fmacro-prefix-map. It is also what the top-level Makefile is using now.

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
 arch/x86/boot/compressed/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/x86/boot/compressed/Makefile b/arch/x86/boot/compressed/Makefile
index 606c74f274593ebaf6200b7d307a453e2c6e872e..73a67366cb706658f9680cd50864a68546d3dc98 100644
--- a/arch/x86/boot/compressed/Makefile
+++ b/arch/x86/boot/compressed/Makefile
@@ -38,7 +38,7 @@ KBUILD_CFLAGS += -fno-stack-protector
 KBUILD_CFLAGS += $(call cc-disable-warning, address-of-packed-member)
 KBUILD_CFLAGS += $(call cc-disable-warning, gnu)
 KBUILD_CFLAGS += -Wno-pointer-sign
-KBUILD_CFLAGS += $(call cc-option,-fmacro-prefix-map=$(srctree)/=)
+KBUILD_CFLAGS += $(call cc-option,-ffile-prefix-map=$(srctree)/=)
 KBUILD_CFLAGS += -fno-asynchronous-unwind-tables
 KBUILD_CFLAGS += -D__DISABLE_EXPORTS
 # Disable relocation relaxation in case the link is not PIE.

-- 
2.48.1


