Return-Path: <linux-kbuild+bounces-8957-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 10B4DB9BC05
	for <lists+linux-kbuild@lfdr.de>; Wed, 24 Sep 2025 21:48:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B7B3F326677
	for <lists+linux-kbuild@lfdr.de>; Wed, 24 Sep 2025 19:48:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 300BB1DF755;
	Wed, 24 Sep 2025 19:48:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Rrt8DW7c"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01B881DDDD;
	Wed, 24 Sep 2025 19:48:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758743288; cv=none; b=B3qjIG18CH0AP+P5sxsHnabIatIXkQD5/xrm8AZbhj9gbL4Zie41gpfI6Sq3mnBOqHurvydS2RwC+4eHX6YXU3vZyGG6qV5OkEB2aLsYL85sx5q4qZFmAm9AaXr3gi8vCFjLQO7Clgr+g39khSCLSivdOVeR2m008Bm9ZXccC3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758743288; c=relaxed/simple;
	bh=5pfqoAv3+D7vRUeoIo/VfzuXoXjMCi4EDG4XCp0s5lo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=hrmdtRXucl17ASv4444/PnBIfLD9RkvE6ghhVr/x4uFxdsCjtlft91+XLU0pTaJXg7nC5Wp8kkt2ubkxydx/hMk4uXYhWAAbxV05uRLj52+vxewJg1tpekjcBppjHaVmD1ya58AkYppXEZqvcD9+l9yTmpYq2AbbFjOcViluxdI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Rrt8DW7c; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 848B6C4CEF8;
	Wed, 24 Sep 2025 19:48:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758743287;
	bh=5pfqoAv3+D7vRUeoIo/VfzuXoXjMCi4EDG4XCp0s5lo=;
	h=From:Date:Subject:To:Cc:From;
	b=Rrt8DW7cWd3LwnReiGSAU01NRcAYqOt+0OYrXuJfVrqia4pz5GN6RvVH5cAj5JzzK
	 sSFaWaluEKCeHqDgLHcDe2a1TaALAxgu6yjS+rGmnY01ivnp6999kGUT4Y85AXATzr
	 VIgK5YItFGB/IXbwl9XviK/QbiczHwGShBcd5OJRiLUiDTctkiF8fF3yVFkek9b03s
	 8OENasztYI55YJHNYyrd07ZjbxobnbVhdvq05ZIrH5Wh/C2o+IlZDo8YFnaaMB8J/r
	 SeLAisysbUcwCCNmJu2VLxg3W22XG6RHzdjAdCC4WgOpmvSSp/EfT0TbP8CSgcvv3L
	 EVuePkFdHbJOQ==
From: Nicolas Schier <nsc@kernel.org>
Date: Wed, 24 Sep 2025 21:47:58 +0200
Subject: [PATCH v2] Documentation: kbuild: note CONFIG_DEBUG_EFI in
 reproducible builds
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250924-kbuild-doc-config-debug-efi-in-reproducible-builds-v2-1-d2d6b9dcdb7d@kernel.org>
X-B4-Tracking: v=1; b=H4sIAO1K1GgC/yWOwQ6CMBBEf4X07BJaKYIn/8NwKHSBDdiSrRAJ4
 d+teHyTybzZRUAmDOKe7IJxpUDeRVCXRLSDcT0C2chCZUpnlcphbBaaLFjfQutdRz1YbJYesCM
 gB4wze7u01EwIZzUANre8rExpZalFHJ45lj+n9FlHHii8PW/nh1X+0r+uUFoqXWZVGiGviitIe
 JlgBmK/PUZkh1PquRf1cRxf6XwtQsoAAAA=
X-Change-ID: 20250924-kbuild-doc-config-debug-efi-in-reproducible-builds-eb7489a8d185
To: Nathan Chancellor <nathan@kernel.org>, Jonathan Corbet <corbet@lwn.net>
Cc: Ard Biesheuvel <ardb@kernel.org>, Ben Hutchings <ben@decadent.org.uk>, 
 Jonathan Corbet <corbet@lwn.net>, Masahiro Yamada <masahiroy@kernel.org>, 
 Nathan Chancellor <nathan@kernel.org>, Randy Dunlap <rdunlap@infradead.org>, 
 linux-doc@vger.kernel.org, linux-kbuild@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Nicolas Schier <nsc@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758743285; l=1347;
 i=nsc@kernel.org; s=20250924; h=from:subject:message-id;
 bh=WrCEiwhTJ6NTcbC79DuT72IvGk096pO3ljwmap6tib0=;
 b=xot5rA2LwXMdxklW8rby+ZKjbInYkFumHiXZR1CfKm2wY4feOrauw+nMxZSWK7WWVSMCdldkw
 6UFgMUcy8LWDCXjsgQX0qBYlOSJHs7qZotzT0SCFOmaJCF/QO+YW83I
X-Developer-Key: i=nsc@kernel.org; a=ed25519;
 pk=+0ar7sBdSzOoVoXxW8B+48yZbV4azT4joSEm8UyP7z4=

From: Masahiro Yamada <masahiroy@kernel.org>

CONFIG_EFI_DEBUG embeds absolute file paths into object files, which
makes the resulting vmlinux specific to the build environment.

Add a note about this in reproducible-builds.rst

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
Signed-off-by: Nicolas Schier <nsc@kernel.org>
---
Changes in v2:
  * Fixed a grammar typo (Randy)
  * v1: https://lore.kernel.org/linux-kbuild/20250625125809.2504963-1-masahiroy@kernel.org
---
 Documentation/kbuild/reproducible-builds.rst | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/kbuild/reproducible-builds.rst b/Documentation/kbuild/reproducible-builds.rst
index f2dcc39044e66ddd165646e0b51ccb0209aca7dd..96d208e578cd53d3f0c4a24ec983a9179260345d 100644
--- a/Documentation/kbuild/reproducible-builds.rst
+++ b/Documentation/kbuild/reproducible-builds.rst
@@ -61,6 +61,9 @@ supported.
 The Reproducible Builds web site has more information about these
 `prefix-map options`_.
 
+Some CONFIG options such as `CONFIG_DEBUG_EFI` embed absolute paths in
+object files. Such options should be disabled.
+
 Generated files in source packages
 ----------------------------------
 

---
base-commit: cec1e6e5d1ab33403b809f79cd20d6aff124ccfe
change-id: 20250924-kbuild-doc-config-debug-efi-in-reproducible-builds-eb7489a8d185

Best regards,
-- 
Nicolas


