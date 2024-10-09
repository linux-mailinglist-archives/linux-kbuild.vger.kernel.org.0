Return-Path: <linux-kbuild+bounces-3990-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FA2D996753
	for <lists+linux-kbuild@lfdr.de>; Wed,  9 Oct 2024 12:29:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5218F1C241E1
	for <lists+linux-kbuild@lfdr.de>; Wed,  9 Oct 2024 10:29:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 62A3218EFE6;
	Wed,  9 Oct 2024 10:28:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YDHWG1sl"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38AA518D645;
	Wed,  9 Oct 2024 10:28:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728469718; cv=none; b=u1cmzKjOv+mB6sQ2qNLPlFr0xlD/JrlufIY1wGS0bNTJkKxETypWEitROifA+ZADl2c1TvRtBKr9hQ+2dlmlYGe8assIv/r/LeyBaShlmTdWOcDobYjuEZ0rQ//wetEFUwC/bFn1496GrWbB21zuW5XRVU17QRgbUWbtksMpIF0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728469718; c=relaxed/simple;
	bh=ynvcfPLticyw5LZTtzT991G9ZuvASWvEuoagqvzDQCI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lU0LI0aKbUsvWaGfSWB3zhYMTg+KvxX95Dpg7URZDPMIppvGDmIvMdd2EOf9qrblcC4kVMW9QRZGlJ815XW3qPAvd/dQnubAKN2VQedCN/d87gTJiak7c8V4Se25ziPWq2StqxrnX6C/NBIl+6M6HPIv0G7Kbd0iWvU+1jXIBuQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YDHWG1sl; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5B3BC4CEC5;
	Wed,  9 Oct 2024 10:28:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728469717;
	bh=ynvcfPLticyw5LZTtzT991G9ZuvASWvEuoagqvzDQCI=;
	h=From:To:Cc:Subject:Date:From;
	b=YDHWG1slD0xUmU7XbR/CjXh/r9tPBOXt2VBuC6xQTzCd2kzvZKqiKAr+HHo00gDv3
	 cqn3P0nP7VXDwGQqwTpugx14seAeW7vDefG8DJLgfoaoctXoHJOBnXdtEwqrQzDU/Z
	 tEGZqW7/toyAf3spItYU/b+jvdrvXB5dx7y6CZNa4PMDb3nPgmsWbNWpIXIFMZEJbY
	 4jnsI9zIXwKDTUqwNOi1aKLmvDXxC/k+opdELkvkj9kPMK++mKVqljZA3fzDzOy8Ng
	 UHOexp5Wjs5uiEH1Ex0Qi1uNx0yngfEWURu0aRl+XHr0G+LpH359YbnIUjxX+2w0uX
	 658lsUJlG/EHg==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Miguel Ojeda <ojeda@kernel.org>,
	Matthew Maurer <mmaurer@google.com>,
	Alice Ryhl <aliceryhl@google.com>,
	rust-for-linux@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Benno Lossin <benno.lossin@proton.me>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>,
	Trevor Gross <tmgross@umich.edu>,
	linux-kernel@vger.kernel.org
Subject: [PATCH] kbuild: refactor cc-option-yn, cc-disable-warning, rust-option-yn macros
Date: Wed,  9 Oct 2024 19:27:37 +0900
Message-ID: <20241009102821.2675718-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

cc-option-yn and cc-disable-warning duplicate the compile command seen
a few lines above. These can be defined based on cc-option.

I also refactored rustc-option-yn in the same way, although there are
currently no users of it.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

This avoids applying similar fixes to rustc-option and rustc-option-yn.

 scripts/Makefile.compiler | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/scripts/Makefile.compiler b/scripts/Makefile.compiler
index 057305eae85c..73d611d383b2 100644
--- a/scripts/Makefile.compiler
+++ b/scripts/Makefile.compiler
@@ -53,13 +53,11 @@ cc-option = $(call __cc-option, $(CC),\
 
 # cc-option-yn
 # Usage: flag := $(call cc-option-yn,-march=winchip-c6)
-cc-option-yn = $(call try-run,\
-	$(CC) -Werror $(KBUILD_CPPFLAGS) $(KBUILD_CFLAGS) $(1) -c -x c /dev/null -o "$$TMP",y,n)
+cc-option-yn = $(if $(call cc-option,$1),y,n)
 
 # cc-disable-warning
 # Usage: cflags-y += $(call cc-disable-warning,unused-but-set-variable)
-cc-disable-warning = $(call try-run,\
-	$(CC) -Werror $(KBUILD_CPPFLAGS) $(KBUILD_CFLAGS) -W$(strip $(1)) -c -x c /dev/null -o "$$TMP",-Wno-$(strip $(1)))
+cc-disable-warning = $(if $(call cc-option,-W$(strip $1)),-Wno-$(strip $1))
 
 # gcc-min-version
 # Usage: cflags-$(call gcc-min-version, 70100) += -foo
@@ -85,5 +83,4 @@ rustc-option = $(call __rustc-option, $(RUSTC),\
 
 # rustc-option-yn
 # Usage: flag := $(call rustc-option-yn,-Cinstrument-coverage)
-rustc-option-yn = $(call try-run,\
-	$(RUSTC) $(KBUILD_RUSTFLAGS) $(1) --crate-type=rlib /dev/null --out-dir=$$TMPOUT -o "$$TMP",y,n)
+rustc-option-yn = $(if $(call rustc-option,$1),y,n)
-- 
2.43.0


