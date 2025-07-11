Return-Path: <linux-kbuild+bounces-7981-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E047AB013B8
	for <lists+linux-kbuild@lfdr.de>; Fri, 11 Jul 2025 08:37:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E9B9B5A301B
	for <lists+linux-kbuild@lfdr.de>; Fri, 11 Jul 2025 06:37:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D9C4D1E7C12;
	Fri, 11 Jul 2025 06:36:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZGGjAEiu"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BFEA1DFD84;
	Fri, 11 Jul 2025 06:36:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752215809; cv=none; b=S2C/1AX4kiQ+AK7WUO1r99QDURrfGdxqoaFnyDpWHez+jeXsq4iuyVvrCJMGyoRKfjNeN+MUtJbTc+w9yjNHUvYAB+nAw2nQjMgYSWZNQci29O6LuTx3pkONAZmL49V30oe2QHVOd4SnKyZPaAC2eRxU7OGdDPmZxmjOrL1QuyY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752215809; c=relaxed/simple;
	bh=9zt2R482VjqDFpGLu4K8dFNTfKUGK2Pxp+dpiGIf3+c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YhHtMrBxX64pBcHMbB1cARSXR5LHbnj1PIQPhVxkXvYq9rTAS5+mtjkf8+mHiLWxhtcqnHUdKPhLStX/X2Rt66hRAwGsSU5wiFtskZRgWeuaCMeUINMeG0eyajL1Z6j5mwSzq0wbsg3CE8IJdf047SQPLKexdmwuWpLHyNZEZIQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZGGjAEiu; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2FEEC4CEF6;
	Fri, 11 Jul 2025 06:36:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752215809;
	bh=9zt2R482VjqDFpGLu4K8dFNTfKUGK2Pxp+dpiGIf3+c=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=ZGGjAEiuyGVQdBfDE9WRHk0kgT+ZbsVdeTQppZGYokLYkph+B8sTpINnHMdRA8O60
	 yaNPSP2cMpjILtpupYLnyMc/eUbumLjqaSfIA1gLxVFMAI9i6LfnveA7pjIZWCfJIU
	 hHjeWEh8U6x4gU3OjNTy80wfKtaW2RGK57ssqIE3zSs1me8Wu46M/iihFC7o3kkTsz
	 oAdzO8y0e80LgY6B4FmT2HBFm4IKXkgqpjZKb5CsdvaihLd00EhTmEagYjhko/gWwi
	 QqAlXBLjPb5RYi2HvgVCyGjohh3P1zARvsAjqMkpLsTqUnz44iz8DbZGQS1c+/xJiX
	 F6Iz3s80xDygQ==
From: Andreas Hindborg <a.hindborg@kernel.org>
Date: Fri, 11 Jul 2025 08:35:49 +0200
Subject: [PATCH v17 7/7] modules: add rust modules files to MAINTAINERS
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250711-module-params-v3-v17-7-cf9b10d4923d@kernel.org>
References: <20250711-module-params-v3-v17-0-cf9b10d4923d@kernel.org>
In-Reply-To: <20250711-module-params-v3-v17-0-cf9b10d4923d@kernel.org>
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Alice Ryhl <aliceryhl@google.com>, Masahiro Yamada <masahiroy@kernel.org>, 
 Nathan Chancellor <nathan@kernel.org>, Luis Chamberlain <mcgrof@kernel.org>, 
 Danilo Krummrich <dakr@kernel.org>, Benno Lossin <lossin@kernel.org>, 
 Benno Lossin <lossin@kernel.org>, Nicolas Schier <nicolas.schier@linux.dev>
Cc: Trevor Gross <tmgross@umich.edu>, 
 Adam Bratschi-Kaye <ark.email@gmail.com>, rust-for-linux@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, 
 Petr Pavlu <petr.pavlu@suse.com>, Sami Tolvanen <samitolvanen@google.com>, 
 Daniel Gomez <da.gomez@samsung.com>, Simona Vetter <simona.vetter@ffwll.ch>, 
 Greg KH <gregkh@linuxfoundation.org>, Fiona Behrens <me@kloenk.dev>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 linux-modules@vger.kernel.org, Andreas Hindborg <a.hindborg@kernel.org>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=808; i=a.hindborg@kernel.org;
 h=from:subject:message-id; bh=9zt2R482VjqDFpGLu4K8dFNTfKUGK2Pxp+dpiGIf3+c=;
 b=owEBbQKS/ZANAwAIAeG4Gj55KGN3AcsmYgBocLDa57mfKillk8qBYVlI9D3IUbIcaOFwtpneK
 D62ptB9ekqJAjMEAAEIAB0WIQQSwflHVr98KhXWwBLhuBo+eShjdwUCaHCw2gAKCRDhuBo+eShj
 dyKAEACmjMn7IrTB4sEkLzRkmPfnnf1u56JklWFL6ZXInd2THjvsCJYxwUsu6VHkPJLmHgwdYLW
 iVmK/kYmlvaDwCQPlM0oCtQcQuMgg3I7DxmXcdcCBV9E1Qch4cuckXHS6A/NmTMnQB5Xjjefa9O
 hTT9yIQ5vTPWsWz715i1WXyYTEPjCcjakoKQoqreL6Ot0JSXCdNv5uCK6QFgVvEKT09khGC23qA
 vKLLOZquoaEORsEkvjlCiVy5B/e6cfMRdKX0kupIGAZvp4AsMjTYrfTerAZlhm9bTb0o2LQQh6T
 pL1ije7oRyy3adbLCxop8yO1RV9x3sqbLtlFHvOswqKuppnbPrQLPlxL7anbmqVZiCtX0pSAVmR
 eoXNf/nnV3ZCHGRK5oWj/ISYIpdyyKRntqOhnX5tmRoKMl04ZKSraPROlADMR0ABSYV9hjULfIk
 J26oDBCWfY0/CkOB//5RI36JObS//hToKmJ9Zyo/KximHkK5UJ60VvX/Mwt+q+EgHOzo2MsuT6J
 80VTkrPN+eyRbVxaipPVB2EFhvVyTqDOnYXPXRCE7qoKu4R34zPNFT+BW4wGuVNk3DbeHE0Vo5A
 rsfqdfJ1S9VWZWk0d5r4jY0bdfvqldSgAVNS4f4KyvFfBDQyMioj04cbg2k2QkxFBlohhb8iGI2
 CN1fJjpBNjzACHg==
X-Developer-Key: i=a.hindborg@kernel.org; a=openpgp;
 fpr=3108C10F46872E248D1FB221376EB100563EF7A7

The module subsystem people agreed to maintain rust support for modules
[1]. Thus, add entries for relevant files to modules entry in MAINTAINERS.

Link: https://lore.kernel.org/all/0d9e596a-5316-4e00-862b-fd77552ae4b5@suse.com/ [1]

Acked-by: Daniel Gomez <da.gomez@samsung.com>
Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
---
 MAINTAINERS | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index d431320ed3b2..afa385ecc5c4 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -16835,6 +16835,8 @@ F:	include/linux/module*.h
 F:	kernel/module/
 F:	lib/test_kmod.c
 F:	lib/tests/module/
+F:	rust/kernel/module_param.rs
+F:	rust/macros/module.rs
 F:	scripts/module*
 F:	tools/testing/selftests/kmod/
 F:	tools/testing/selftests/module/

-- 
2.47.2



