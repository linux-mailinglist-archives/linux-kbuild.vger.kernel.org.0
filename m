Return-Path: <linux-kbuild+bounces-5700-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 561F0A2F4C2
	for <lists+linux-kbuild@lfdr.de>; Mon, 10 Feb 2025 18:11:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id AF5D47A1F11
	for <lists+linux-kbuild@lfdr.de>; Mon, 10 Feb 2025 17:10:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B4EF2417C2;
	Mon, 10 Feb 2025 17:11:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="jgeXBblM"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EBE022258D;
	Mon, 10 Feb 2025 17:11:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739207474; cv=none; b=UT65YB+ORxKcvWtJTWfd4wTmT0HJAfCepA37J0h4QI86vgsZaYBtXJPCOIXPHeep0QH8R+5PLBlPImPnxibv3G6spzjPl7iKgm84GovWX0ybbW/RbN8dxHyYQei8CL3MbTFTKf8I5wJet/Wc+cSIX9v4KReLD0AiHLG6lKT3XTA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739207474; c=relaxed/simple;
	bh=i//L9LO/eHFu/2zQpwB5EoGkGlMUVpJiGcOVAdHJs0M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=q8ndpEXDHrs6oEid+aDJGSO1esTp/7r6ClTx/KX7DuoyEz/LaQBLeZaxHz51INQJKXilFzCAXssMVSatXAfcOOeHy20hTymZWfO6xM5iXDMrFY28T+/mPIyzY30pm9kfYIzaW7uVO7uu6+dhNZGI8YHjm99cJlHFf+2biZBI8pI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=jgeXBblM; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1739207469;
	bh=i//L9LO/eHFu/2zQpwB5EoGkGlMUVpJiGcOVAdHJs0M=;
	h=From:Date:Subject:To:Cc:From;
	b=jgeXBblMIsuM6MZpQnOKK27pfoht4YM+NT8gRuObsbsCla4ZoqElZQWeK9jrhWnEN
	 KFauw6aJiOE2+jWDYynA/Ug/iSMIO8TSXnvjOdzWboJLK59Z3vTPhgtu8olUjjehAg
	 T8j7dCApUnJPfaEWFiJtvUgCwZyzmgp3TdCZ7OOI=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Mon, 10 Feb 2025 18:08:50 +0100
Subject: [PATCH] kbuild, rust: use -fremap-path-prefix to make paths
 relative
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250210-rust-path-remap-v1-1-021c48188df1@weissschuh.net>
X-B4-Tracking: v=1; b=H4sIAKEyqmcC/x3MQQ5AMBBG4avIrE3SNkG4ilg09WMWaKaIRNxdY
 /kt3nsoQQWJuuIhxSVJ9i3DlgWFxW8zWMZscsZVxlnDeqaDoz8WVqw+MtomIDQWtfWUq6iY5P6
 P/fC+H/j5Q7FhAAAA
X-Change-ID: 20250210-rust-path-remap-e97cec71e61a
To: Masahiro Yamada <masahiroy@kernel.org>, 
 Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, 
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <benno.lossin@proton.me>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1739207468; l=1373;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=i//L9LO/eHFu/2zQpwB5EoGkGlMUVpJiGcOVAdHJs0M=;
 b=l/N+YPuwNOcWbbf448LFb4B7j4VKk1V6lKcjHk2C9Jmf/LWE6wp5JThfogVQG+Z8o+FDsrxb1
 OCEzxqoxaevB90o4TSddldWZ9VB/9tEm5PZFFPUkJ1MEtjKJuUkbGyh
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=

Remap source path prefixes in all output, including compiler
diagnostics, debug information, macro expansions, etc.
This removes a few absolute paths from the binary and also makes it
possible to use core::panic::Location properly.

Equivalent to the same configuration done for C sources in
commit 1d3730f0012f ("kbuild: support -fmacro-prefix-map for external modules")
and commit a73619a845d5 ("kbuild: use -fmacro-prefix-map to make __FILE__ a relative path").

Link: https://doc.rust-lang.org/rustc/command-line-arguments.html#--remap-path-prefix-remap-source-names-in-output
Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
 Makefile | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Makefile b/Makefile
index 9e0d63d9d94b90672f91929e5e148e5a0c346cb6..ac35083180c825b72f13149ec3acfd7d6d74ef98 100644
--- a/Makefile
+++ b/Makefile
@@ -1068,6 +1068,7 @@ endif
 # change __FILE__ to the relative path to the source directory
 ifdef building_out_of_srctree
 KBUILD_CPPFLAGS += $(call cc-option,-fmacro-prefix-map=$(srcroot)/=)
+KBUILD_RUSTFLAGS += $(call rustc-option,--remap-path-prefix=$(srcroot)/=)
 endif
 
 # include additional Makefiles when needed

---
base-commit: beeb78d46249cab8b2b8359a2ce8fa5376b5ad2d
change-id: 20250210-rust-path-remap-e97cec71e61a

Best regards,
-- 
Thomas Weißschuh <linux@weissschuh.net>


