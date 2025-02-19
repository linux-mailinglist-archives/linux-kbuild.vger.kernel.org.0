Return-Path: <linux-kbuild+bounces-5838-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D6BC2A3CB52
	for <lists+linux-kbuild@lfdr.de>; Wed, 19 Feb 2025 22:22:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B60A4176FD6
	for <lists+linux-kbuild@lfdr.de>; Wed, 19 Feb 2025 21:22:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 611AD257429;
	Wed, 19 Feb 2025 21:22:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="GiELAy0I"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 299E01B87EF;
	Wed, 19 Feb 2025 21:22:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740000157; cv=none; b=kb3nXrG08KpE/wQ6difxQ36r3Qh11ZdUWnRSW5VohmcC7g2UWtFAyJN1Lhz6+wlhfgN4bUu+9NBYTW4Dzrv9qiVKRRMftcxkg2cqaqxXHkQfX7lKejgRks+Yu71qoWUje0fSgIWIegrG/PUF6+JZpd0DCniw+Sqtxn7K/cSjc6s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740000157; c=relaxed/simple;
	bh=io4S/mQ1p7+x+USMolAyIwOlzTIeQ1GNlDhfS1HJeJE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=HxkoAnHrn3DT5IMD+9KMWqQwLBM3C94kOo8mo0HiiyN7bcqXGfJxCP9MyNFH70d1Bl4ViV4j0lTJl36X1B/eDV9/58UiBsWow5Mkjz8rr/m4qHY3vBBHo/AYLg3B6ejQySBIpJIy49pZQxBNISzO5QN0mzLND11wmjDp2LgWA84=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=GiELAy0I; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1740000143;
	bh=io4S/mQ1p7+x+USMolAyIwOlzTIeQ1GNlDhfS1HJeJE=;
	h=From:Date:Subject:To:Cc:From;
	b=GiELAy0ItUKfHMTPX1cuRnSKd4eUmDRy35/3KBGKHkeedlFE86Bp5A8vjunFuEMol
	 IFtJWdO5vgsTNW6bHQ+6jTR+iizcRI+Nqot2hSwLzD7RNzWqhO7RSvDoIIAvTk1/sh
	 Olo87GCh76WwFhmrZemkX+heNzteptF1ZcwPpbNk=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Wed, 19 Feb 2025 22:22:13 +0100
Subject: [PATCH v2] kbuild, rust: use -fremap-path-prefix to make paths
 relative
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250219-rust-path-remap-v2-1-8ce2c10d4d66@weissschuh.net>
X-B4-Tracking: v=1; b=H4sIAIRLtmcC/3WNwQ6CMBBEf4Xs2TXdRqV64j8Mh6Ysdg8C6RbUE
 P7dyt3jm8m8WUE5CSvcqhUSL6IyDgXsoYIQ/fBglK4wWGPPxpLBNGvGyeeIiZ9+Qr7WgUNNfCE
 PZTUl7uW9G+9t4Siax/TZDxb6pf9dCyFhacLJkXNdT82LRVVDnONx4Azttm1fkzGfabMAAAA=
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1740000142; l=1557;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=io4S/mQ1p7+x+USMolAyIwOlzTIeQ1GNlDhfS1HJeJE=;
 b=NVwL5O0oi8poWTcFiARqg/L9tle9872MtuveilYqtrG2g8esCAlGn8oBGbK1xdyDML5ga8FXI
 IjhXYE4CluFBZiK+4JpFjn6QyZGc3aSRRcsvEXX7l37XnFha/C9ckCR
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
Acked-by: Miguel Ojeda <ojeda@kernel.org>
Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
Changes in v2:
- Drop the usage of $(call rustc-option)
- Link to v1: https://lore.kernel.org/r/20250210-rust-path-remap-v1-1-021c48188df1@weissschuh.net
---
 Makefile | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Makefile b/Makefile
index 9e0d63d9d94b90672f91929e5e148e5a0c346cb6..9ed2222fafd4fa37a367b87a5c681936368318e7 100644
--- a/Makefile
+++ b/Makefile
@@ -1068,6 +1068,7 @@ endif
 # change __FILE__ to the relative path to the source directory
 ifdef building_out_of_srctree
 KBUILD_CPPFLAGS += $(call cc-option,-fmacro-prefix-map=$(srcroot)/=)
+KBUILD_RUSTFLAGS += --remap-path-prefix=$(srcroot)/=
 endif
 
 # include additional Makefiles when needed

---
base-commit: beeb78d46249cab8b2b8359a2ce8fa5376b5ad2d
change-id: 20250210-rust-path-remap-e97cec71e61a

Best regards,
-- 
Thomas Weißschuh <linux@weissschuh.net>


