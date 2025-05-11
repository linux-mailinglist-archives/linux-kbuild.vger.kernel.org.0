Return-Path: <linux-kbuild+bounces-7076-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5945DAB26D4
	for <lists+linux-kbuild@lfdr.de>; Sun, 11 May 2025 08:02:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D8E43178425
	for <lists+linux-kbuild@lfdr.de>; Sun, 11 May 2025 06:02:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0426E19CC36;
	Sun, 11 May 2025 06:02:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="Fp1zJ/gn"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0185613AA2D;
	Sun, 11 May 2025 06:02:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746943366; cv=none; b=srDwGL4vv0B8jv1t55XMA08+V9nlAa7kocBEwAF6v0gP6ArHRB8lcNl1KyEO2Mie6E5Sb15U6fEX74fu1CKzLs5SpV4xSwUzi1S0agzWMgXgh01VK6vJhEhClYJxEFe3KQekLQ39Jd35BiNBolnFwOMrLrqbFhYEdE6fFGmG/R8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746943366; c=relaxed/simple;
	bh=E6dUnp8Z6EAVfOCyWJCzyJ22T2+/T258DUngWl+nQOU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dmBFydYbNhcf70d0z5krbfz76md09iSQlyToRuI9j1TDFsFYgxi+7dJt7cVsF///RImTX6DSVCeDFyGliJ9IFvVWUFsTecptM30o7WQRKzuZwKJgoPuKyLhsGBsOKtJ1rXVboMWZwwafUGJyp2Y52fmC0bWtSoq/JiYpXLNR/ik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=Fp1zJ/gn; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1746943360;
	bh=E6dUnp8Z6EAVfOCyWJCzyJ22T2+/T258DUngWl+nQOU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Fp1zJ/gneFkfyekYadOxb001jSiM6cThzi0nni5n5m570C0MtsesxqFWpClprI7Lp
	 1m/nXjFIPODKQ4pCk6/Dqs/SirmaJri0p/6e3C9C1Zu3/KFq17Ps3V1BMJGx7MbUCC
	 37bMvmVj4meen+4DWgpfRHXTD8d3gXpbahS8MzcQ=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Sun, 11 May 2025 08:02:28 +0200
Subject: [PATCH 2/2] Revert "kbuild, rust: use -fremap-path-prefix to make
 paths relative"
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250511-kbuild-revert-file-prefix-map-v1-2-9ba640c8411e@weissschuh.net>
References: <20250511-kbuild-revert-file-prefix-map-v1-0-9ba640c8411e@weissschuh.net>
In-Reply-To: <20250511-kbuild-revert-file-prefix-map-v1-0-9ba640c8411e@weissschuh.net>
To: Masahiro Yamada <masahiroy@kernel.org>, 
 Nathan Chancellor <nathan@kernel.org>, 
 Nicolas Schier <nicolas.schier@linux.dev>, Jonathan Corbet <corbet@lwn.net>, 
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <benno.lossin@proton.me>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>
Cc: linux-kbuild@vger.kernel.org, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 Matthieu Baerts <matttbe@kernel.org>, 
 =?utf-8?q?Ville_Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1746943359; l=1147;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=E6dUnp8Z6EAVfOCyWJCzyJ22T2+/T258DUngWl+nQOU=;
 b=l5ameOO3HpZgwnNbg5UmRetT/LOsJjp058woQn3eN9NfCXt7GOsTnHrJ1+Gbwc9LE8X2yVGaQ
 NxynrvRy39rDJ0uLtQNxKYqa48GwVfTxWzw7KMVOApk84x6VLi2DL9+
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=

This reverts commit dbdffaf50ff9cee3259a7cef8a7bd9e0f0ba9f13.

--remap-path-prefix breaks the ability of debuggers to find the source
file corresponding to object files. As there is no simple or uniform
way to specify the source directory explicitly, this breaks developers
workflows.

Revert the unconditional usage of --remap-path-prefix, equivalent to the
same change for -ffile-prefix-map in KBUILD_CPPFLAGS.

Fixes: Fixes: dbdffaf50ff9 ("kbuild, rust: use -fremap-path-prefix to make paths relative")
Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
 Makefile | 1 -
 1 file changed, 1 deletion(-)

diff --git a/Makefile b/Makefile
index f3f7dbf8ca284fbbab6bf2459982447471234f5f..1e1d28d50bf373afb9de787afd7f4148191cc463 100644
--- a/Makefile
+++ b/Makefile
@@ -1069,7 +1069,6 @@ KBUILD_CFLAGS += -fno-builtin-wcslen
 # change __FILE__ to the relative path to the source directory
 ifdef building_out_of_srctree
 KBUILD_CPPFLAGS += $(call cc-option,-fmacro-prefix-map=$(srcroot)/=)
-KBUILD_RUSTFLAGS += --remap-path-prefix=$(srcroot)/=
 endif
 
 # include additional Makefiles when needed

-- 
2.49.0


