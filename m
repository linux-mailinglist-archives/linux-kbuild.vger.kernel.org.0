Return-Path: <linux-kbuild+bounces-7902-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EBE64AFB49F
	for <lists+linux-kbuild@lfdr.de>; Mon,  7 Jul 2025 15:33:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CE1F71AA5136
	for <lists+linux-kbuild@lfdr.de>; Mon,  7 Jul 2025 13:33:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 691DA2BDC2C;
	Mon,  7 Jul 2025 13:32:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cQFYRUZ0"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39E8F194C96;
	Mon,  7 Jul 2025 13:32:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751895140; cv=none; b=fhKvbdr8Lf2qgXHJjPYGHto31n5wg5N0e+zr6L9isDihCTyi3X9fK91gnWY8suL2cz91DHdJpwKbAzbY3wjMON6CNUBLhQotZ1YFrfGj6aNx3t4LR2zIziINtTiE0nujpR36qkhvyOL2xiFuxMPfcX6HLKpwljM74sZmnHR5hFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751895140; c=relaxed/simple;
	bh=rC87q+cE6l79VfDDaP1rreH6c58LNoR3ApaI6m+XCGI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DrPh3iQgmkd6m1DJSa1CJwhOcoLRZyV33Ej+MkYsHS0NJZgbhC/lYTOkI3oUilZ2jrpVC/UDNm7kMJvaeW76U3vkscQMVlphjuIOTN3WTrHlgAihMT5ckIenkf1IDxe59km237fll5EzU6Ix3SK0r3OSI3u2ZuGhaCBAq7u3lx0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cQFYRUZ0; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA555C4CEE3;
	Mon,  7 Jul 2025 13:32:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751895138;
	bh=rC87q+cE6l79VfDDaP1rreH6c58LNoR3ApaI6m+XCGI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=cQFYRUZ0d7xeMJx+pkAhzljIkHcsFhaiuUEia7MJvDNM62TgSV86L2JRHMWH2WibL
	 /4wY/yQvKLFkVvetKW4MYWbBTxriwdKSobjp+13FwP0gEN/jgC9gjMPbCQjEJ4qu+/
	 QY/8ajk2CFPC9Fz/T3ArBzJjQzhrWyjz9WmFZgQob2agn4RNWyFONLwLekfmA/ENol
	 prziF/uZbd3tqd0A6VUtUtc/Cp33Z10jpaThmwZa/k+8SF0PH7eJLIRCCF9FedLFVc
	 knbPRredNHpEthWK4HF75GJx4rnYGa/btQw+z+FlDdojgonxpHikOZqT0muYlZ510S
	 NS35ZwSFvAH0w==
From: Andreas Hindborg <a.hindborg@kernel.org>
Date: Mon, 07 Jul 2025 15:29:11 +0200
Subject: [PATCH v15 7/7] modules: add rust modules files to MAINTAINERS
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250707-module-params-v3-v15-7-c1f4269a57b9@kernel.org>
References: <20250707-module-params-v3-v15-0-c1f4269a57b9@kernel.org>
In-Reply-To: <20250707-module-params-v3-v15-0-c1f4269a57b9@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=810; i=a.hindborg@kernel.org;
 h=from:subject:message-id; bh=rC87q+cE6l79VfDDaP1rreH6c58LNoR3ApaI6m+XCGI=;
 b=owEBbQKS/ZANAwAIAeG4Gj55KGN3AcsmYgBoa8u5TKlqBMqPIfDfZl1ZoFNEqTp/J/82xBY1+
 cZuHse87L6JAjMEAAEIAB0WIQQSwflHVr98KhXWwBLhuBo+eShjdwUCaGvLuQAKCRDhuBo+eShj
 d9whD/4w45JCrbOwOKSgUnzjVKqHh0Uhp+3oRLIMfHq4QC3kAHEDHhzuVLObDeZ4sN530OhF6qZ
 D7bln8Zxm5/wQDycPyuOu66xdJjHOlbgk/yC+2pp04nx3NFQqNl8QxpeQ1s8TCDpiudvCa33W1T
 fIs/CyohNVMUXN4zJHuSM+gfYMkW1iroglOEWY2fUN8JMW9nlQ1AXzi6G2i8Ys4AGAr8yGJBCR+
 0a7hL3QMz583YSeJDHod0zsQAskEwqB1aFUBfSCM/eHn0o7x7p6Hp47fZPMR65Vg2VfvwG7dVbp
 ATT5hPaiNoGiP+NlGZNSP5JTth5m8Nww81LD6s8jtJCz2e2tGA8aHZcKXyPIL0H3k5eLkwR3bcv
 DxEeStUCR+5Keh4V4qxecNamGCx3oOYzq/MP9bPqeUiEw3hTSQNfAnJhjFxaiNXqTy/Zc42rA7R
 ug4QJMr38SwmVTagdop5rwZoPTcfqt2AIfUdmKkgLjDda/n8Bt7bCMGolZKLYG0qXLVkfwlrkz0
 egAsCyzhR42uiQYnYywe+SzNypt0NWBdbjN4fagtHk2/jeNPa3vvkZRA+smgaNDJxXEPA5Ha80P
 TGLBz33H5lxN658ue9Zwq4DrnaijNGyRTL5Fi6STDrTiBEBJP5G/3ez1oaguNFb38349Sz8nm6V
 A/GYL1fT5Ogo+bQ==
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
index d431320ed3b2a..afa385ecc5c4c 100644
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



