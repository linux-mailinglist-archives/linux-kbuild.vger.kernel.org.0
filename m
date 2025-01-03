Return-Path: <linux-kbuild+bounces-5348-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A171A00D94
	for <lists+linux-kbuild@lfdr.de>; Fri,  3 Jan 2025 19:20:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 982627A1F8C
	for <lists+linux-kbuild@lfdr.de>; Fri,  3 Jan 2025 18:20:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 106F81BD9E5;
	Fri,  3 Jan 2025 18:20:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="i3WWJOuS"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74B15BE4F;
	Fri,  3 Jan 2025 18:20:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735928441; cv=none; b=LJxmTDLk1q5f4Ctd87QQDcFROl7Y0thTVV5wXNIzwGJywkK6oUrf0SuwIacJQntKtMBjJIhCq96BtzQlH3a++PY6TAg0/ZFHs1Vz3HVoOO+XHx8dWwBoV7R701WN6GUwpFtBDrDtBbhJpn83eES41/809UM41vYh+ahUItWUTgM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735928441; c=relaxed/simple;
	bh=+mnWRj5ovCZm3fki+8rkRvB24EUZ5kcyKSco/GGVSyc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=sjZ5YfahLtftUZP5MoJWOcwE168Cmn/4kVggEm9ElWR/NEq2q+KAlJZ5/WMimopr7tXXCwGzg9BLURe4FeQyrQV6WWq0o3nIHtTjtij17mxjcx2jsDJRfSMtAZVbRruRVdezoULAPONCCCPPR+ShIOb8NnePPESwahcZCP9DjhY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=i3WWJOuS; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1735928435;
	bh=+mnWRj5ovCZm3fki+8rkRvB24EUZ5kcyKSco/GGVSyc=;
	h=From:Date:Subject:To:Cc:From;
	b=i3WWJOuSpUcqmFdQCBU8tma4nwtQoARyjZ9eF+WRgN6+7lqiSYbuk2bcZ0lCid7sl
	 VS3jKZZio4aln/aPVZjAFauwtJmIkm/Grpn1v06i6KePsKuKb4xivl3tQkRYD+Kylx
	 E7k6ke7pCpG1fSi99sPr3Q8AH4r8WJMGvR/A3Ft0=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Fri, 03 Jan 2025 19:20:23 +0100
Subject: [PATCH] kbuild: pacman-pkg: provide versioned linux-api-headers
 package
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250103-kbuild-pacman-pkg-provides-v1-1-d568b4b9cfd5@weissschuh.net>
X-B4-Tracking: v=1; b=H4sIAGYqeGcC/x3MQQqAIBAAwK/EnltYjQr6SnSw3GqpTJQkiP6ed
 JzLPBA5CEfoigcCJ4lyugxVFjCtxi2MYrNBk65JUYXbeMlu0ZvpMA79tqAPZxLLEakZSVutKm5
 ryIEPPMv95/3wvh97HcGTbAAAAA==
X-Change-ID: 20250103-kbuild-pacman-pkg-provides-06b02d213e75
To: Christian Heusel <christian@heusel.eu>, 
 Nathan Chancellor <nathan@kernel.org>, 
 Masahiro Yamada <masahiroy@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1735928434; l=1170;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=+mnWRj5ovCZm3fki+8rkRvB24EUZ5kcyKSco/GGVSyc=;
 b=7ztPKjyHm/pTHj3SBb0Cv7LSwuF5eRxDRJiyNE18QjRINnYQ0pdQM8BvjlGK6rNmXkAeIxqDi
 DCmJxmFWDz0CkqCjwwHEv/urILx+853dWdE1JYkvvwzE6j6gh0Uyhvx
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=

The Arch Linux glibc package contains a versioned dependency on
"linux-api-headers". If the linux-api-headers package provided by
pacman-pkg does not specify an explicit version this dependency is not
satisfied.
Fix the dependency by providing an explicit version.

Fixes: c8578539deba ("kbuild: add script and target to generate pacman package")
Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
 scripts/package/PKGBUILD | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/package/PKGBUILD b/scripts/package/PKGBUILD
index f83493838cf96ac9f209c6fc8f9b219705f9715b..dca706617adc76d01a09a86785815a48db15b099 100644
--- a/scripts/package/PKGBUILD
+++ b/scripts/package/PKGBUILD
@@ -103,7 +103,7 @@ _package-headers() {
 
 _package-api-headers() {
 	pkgdesc="Kernel headers sanitized for use in userspace"
-	provides=(linux-api-headers)
+	provides=(linux-api-headers="${pkgver}")
 	conflicts=(linux-api-headers)
 
 	_prologue

---
base-commit: 0bc21e701a6ffacfdde7f04f87d664d82e8a13bf
change-id: 20250103-kbuild-pacman-pkg-provides-06b02d213e75

Best regards,
-- 
Thomas Weißschuh <linux@weissschuh.net>


