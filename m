Return-Path: <linux-kbuild+bounces-7700-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AC86CAE8385
	for <lists+linux-kbuild@lfdr.de>; Wed, 25 Jun 2025 15:01:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0AC2B3AA3A9
	for <lists+linux-kbuild@lfdr.de>; Wed, 25 Jun 2025 12:58:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C6FD261595;
	Wed, 25 Jun 2025 12:58:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Hn5MkkLQ"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E5BD261593;
	Wed, 25 Jun 2025 12:58:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750856320; cv=none; b=uhBjoNFOU1o60xnzgK5j7bhZ31hV6sFac5utc9lV6YBvaL4S4R3y1R6K7syhThbNrs0NAQR2nd3gmYPrrChvJqECnM3nrkt2bZZH8WpZIR2olRBXiPPd3rol3awazSR3rU1PfQOrVKK1xT22yghOuLGZrCgB5HQg7Tjmp29LWTs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750856320; c=relaxed/simple;
	bh=/6MNs104AgtGDaHLg8LouTRM0HNdmAkvMqIT1gJdYpg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Yd+OMzo1ZNd59o1t2Isurif8YWFe6jsl8/V0EXEB2e/qpM2DqPzaowuWwGI7INzTKIah/kpTMSVDu6kU+8kzVcGifUh+30CxrFIZSzjv1OlED5xBL7zztUwT3MJtxvfpgJ59ZC3W7Zg/uIv1txEpqFfBOIBGOqlAEkDS90X8ee8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Hn5MkkLQ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4B8AC4CEEE;
	Wed, 25 Jun 2025 12:58:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750856318;
	bh=/6MNs104AgtGDaHLg8LouTRM0HNdmAkvMqIT1gJdYpg=;
	h=From:To:Cc:Subject:Date:From;
	b=Hn5MkkLQ7YdwotYFW50AFPaDkbXC/h4AXX84vqEktN/Uku61SANGNFj4Wi2qF+SSV
	 igW8Un7qsng0jWK2l/GTvATboMbUKlAMELY16vTuf87FkDgcR4KUjHup57sqwo6WjE
	 ZjDio91HmH4pnPXXhyUiEOQ0M3QcxOiLeaOjg2mbnHXfFfXRI2CRdQGYCcBDSMMm7B
	 GtEdWCf6veHSAygxmUzRc4bYRXP2b01+NTlfUiFCrpxdvOSJ7PelbZXV8xOGH8p6vy
	 QVYZ6PFCrHYzeD8uxLgjBrTZoPiszB0So6zdSRpdg/lBs57ZzF2yeqRcgzMgTSRQOb
	 iGo/RsyQS0IIA==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Ard Biesheuvel <ardb@kernel.org>,
	Ben Hutchings <ben@decadent.org.uk>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas.schier@linux.dev>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] Documentation: kbuild: note CONFIG_DEBUG_EFI in reproducible builds
Date: Wed, 25 Jun 2025 21:57:40 +0900
Message-ID: <20250625125809.2504963-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

CONFIG_EFI_DEBUG embeds absolute file paths into object files, which
makes the resulting vmlinux specific to the build environment.

Add a note about this in reproducible-builds.rst

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 Documentation/kbuild/reproducible-builds.rst | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/kbuild/reproducible-builds.rst b/Documentation/kbuild/reproducible-builds.rst
index f2dcc39044e6..7a16dbc275ca 100644
--- a/Documentation/kbuild/reproducible-builds.rst
+++ b/Documentation/kbuild/reproducible-builds.rst
@@ -61,6 +61,9 @@ supported.
 The Reproducible Builds web site has more information about these
 `prefix-map options`_.
 
+Some CONFIG options such as `CONFIG_DEBUG_EFI` embeds absolute paths in
+object files. Such options should be disabled.
+
 Generated files in source packages
 ----------------------------------
 
-- 
2.43.0


