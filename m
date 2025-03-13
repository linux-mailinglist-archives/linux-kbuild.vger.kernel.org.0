Return-Path: <linux-kbuild+bounces-6129-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 05259A5FA9D
	for <lists+linux-kbuild@lfdr.de>; Thu, 13 Mar 2025 17:00:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9FF363BC5C6
	for <lists+linux-kbuild@lfdr.de>; Thu, 13 Mar 2025 16:00:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 09088269AE6;
	Thu, 13 Mar 2025 15:59:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="lK3Teh3Y"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6B9B268FDA;
	Thu, 13 Mar 2025 15:59:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741881569; cv=none; b=AP5yir+OBADxMtXHjd688YgE1vNq8fo4PBI+Uz/doof9ZmHqoksqVKwGcbTVDGKjGTRyXGTfoUPdzQwNxekzhAG5tR9h62hoGAkI538dofaXy2n4eyv19fSf69btmD9WcxApnecHHWLbpsyyRyWDUxADF4qVVFEAvHkCXDqxBzk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741881569; c=relaxed/simple;
	bh=62zTkdL3ALYfRPzWe/8lphFjkzK4FS/qXrxPsWWWSrA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TzNdgco6SJqHGfeQUzOGE/1gKJePxEY4DTxgrUfvAmoqVbe3AilqbAJQLAH9xSdX2gUQJ2v8S8rSpgbSFpscEo3vELlxp3V+iNKt76fxQ/FQhLXRv8R/6WcU5uloSFrURq6kekC48rj37ahJ5MMuJua9taIMYOGXZuY7QMVwhDs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=lK3Teh3Y; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1741881564;
	bh=62zTkdL3ALYfRPzWe/8lphFjkzK4FS/qXrxPsWWWSrA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=lK3Teh3YUOjmJFWSy7m5FP7PtmD/xk72BuNPwB/NPIHPW5sNGJTQK2FRSQVHnxAds
	 Abi4Nz6mverESCGS/hz4cVKBzoNuFKh7ljoFR9ZSAW6mHjCnxEwbINk3Xb51rSd+Sj
	 bCPey6dkiDsqBZQ34ryzWFXT+iJCCg/CXlOqjFCI=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Thu, 13 Mar 2025 16:59:09 +0100
Subject: [PATCH 1/4] kbuild: make all file references relative to source
 root
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250313-kbuild-prefix-map-v1-1-38cea8448c5f@weissschuh.net>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1741881563; l=1113;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=62zTkdL3ALYfRPzWe/8lphFjkzK4FS/qXrxPsWWWSrA=;
 b=nfzE1uQOaMdStFiOzQldd0472aZEEpFNHJCNBKyUu13oZ5lyK9asa2U3CpmCC+DkSD1dv/CQ+
 Kp9ZeR1wXQ7C35yDBwoMO2T91+fvoz6Vb1V7uQpG8mNEdeNei+Hqfu5
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=

-fmacro-prefix-map only affects __FILE__ and __BASE_FILE__.
Other references, for example in debug information, is not affected.
This makes handling of file references in the compiler output harder to
use and creates problems for reproducible builds.

Switch to -ffile-prefix map which affects all references.

Suggested-by: Ben Hutchings <ben@decadent.org.uk>
Link: https://lore.kernel.org/lkml/c49cc967294f9a3a4a34f69b6a8727a6d3959ed8.camel@decadent.org.uk/
Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
 Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index 30242e731a0d19faa0ffbeada8313e77c4105b41..7b1683bb60e2f473b255fb8a0bde97b15d19ddb6 100644
--- a/Makefile
+++ b/Makefile
@@ -1067,7 +1067,7 @@ endif
 
 # change __FILE__ to the relative path to the source directory
 ifdef building_out_of_srctree
-KBUILD_CPPFLAGS += $(call cc-option,-fmacro-prefix-map=$(srcroot)/=)
+KBUILD_CPPFLAGS += $(call cc-option,-ffile-prefix-map=$(srcroot)/=)
 KBUILD_RUSTFLAGS += --remap-path-prefix=$(srcroot)/=
 endif
 

-- 
2.48.1


