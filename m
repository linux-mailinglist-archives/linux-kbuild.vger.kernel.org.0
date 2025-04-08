Return-Path: <linux-kbuild+bounces-6501-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 98A6AA7F1C1
	for <lists+linux-kbuild@lfdr.de>; Tue,  8 Apr 2025 02:54:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2641D3AE3C1
	for <lists+linux-kbuild@lfdr.de>; Tue,  8 Apr 2025 00:54:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CBF1425F784;
	Tue,  8 Apr 2025 00:53:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="loJvLlGj"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B1AC25B663;
	Tue,  8 Apr 2025 00:53:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744073632; cv=none; b=k1TFkMRc4GBY05oFy9ekYwh3mBwRieOF7ITL/PeXAbOHOT8t3LGfO/dvhoOOg9MUheYye003y61mvjmjxoOwEISMuyD3ce/khmk/NU0qd+gTEynts0QT9TKryfmtZjYjKRUTCztNF3xrlYqSK8Gh1SpWffGy+cmzrMsbFP/Vq0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744073632; c=relaxed/simple;
	bh=zNq4FkvWSaUd6BSfXs8OWjKhmTxTR9rqi0g6Pe3iLdA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=SbsZ9bJuD8ah47udlI1qWyOjxdZ7SazBNgTh6Yp6PThnhyLKRO5pibBTCGKQ4jaXNqAnKFld5N+IIR08QHKb/gEse7ZFJJGn6RkuBp6wrIrrRdJB3dNaF4e3uCq4NWMFqOMLjJxVdZDJX2+VaSkCLvWAERkqVT8SbHfcINfB3LY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=loJvLlGj; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0067FC4CEDD;
	Tue,  8 Apr 2025 00:53:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744073632;
	bh=zNq4FkvWSaUd6BSfXs8OWjKhmTxTR9rqi0g6Pe3iLdA=;
	h=From:To:Cc:Subject:Date:From;
	b=loJvLlGjSXED5sBvoCk30HuAMLwkc7jMBt40k4H+TgixURMXbsUW5jwVSG6woEhzE
	 QypmjSOfqqvNWpVfpYA3M9lXtBs3r+H0hDtc4JNB3KycPZyCobiBX2v2EWiWJplejV
	 EoT4ulnwZtvEb52yAa1DWdk17sapD1x5uJiZdKXULInpJFmywkt4G20qAOCmEjMeb4
	 fuJUasalNm87baFP3q30bM7+aKi/lzyB4Z5lgqG7+5TJWQxw/ID4s++1Xu3UohxIPX
	 S4B3P5hgGxJkn85MRyXcuHSCrSNUwUyzPqKzauiADrrK8bGVxknNACIJNreOZDd3Qi
	 jcyzX9+abor3Q==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: =?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <linux@weissschuh.net>,
	Miguel Ojeda <ojeda@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	alex.gaynor@gmail.com,
	linux-kbuild@vger.kernel.org,
	rust-for-linux@vger.kernel.org
Subject: [PATCH AUTOSEL 6.13 1/3] kbuild, rust: use -fremap-path-prefix to make paths relative
Date: Mon,  7 Apr 2025 20:53:45 -0400
Message-Id: <20250408005347.3334681-1-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.13.10
Content-Transfer-Encoding: 8bit

From: Thomas Weißschuh <linux@weissschuh.net>

[ Upstream commit dbdffaf50ff9cee3259a7cef8a7bd9e0f0ba9f13 ]

Remap source path prefixes in all output, including compiler
diagnostics, debug information, macro expansions, etc.
This removes a few absolute paths from the binary and also makes it
possible to use core::panic::Location properly.

Equivalent to the same configuration done for C sources in
commit 1d3730f0012f ("kbuild: support -fmacro-prefix-map for external
modules") and commit a73619a845d5 ("kbuild: use -fmacro-prefix-map to
make __FILE__ a relative path").

Link: https://doc.rust-lang.org/rustc/command-line-arguments.html#--remap-path-prefix-remap-source-names-in-output
Acked-by: Miguel Ojeda <ojeda@kernel.org>
Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
Tested-by: Gary Guo <gary@garyguo.net>
Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 Makefile | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Makefile b/Makefile
index 21a34e8991ac6..9c1b66bf4bf6e 100644
--- a/Makefile
+++ b/Makefile
@@ -1067,6 +1067,7 @@ endif
 # change __FILE__ to the relative path to the source directory
 ifdef building_out_of_srctree
 KBUILD_CPPFLAGS += $(call cc-option,-fmacro-prefix-map=$(srcroot)/=)
+KBUILD_RUSTFLAGS += --remap-path-prefix=$(srcroot)/=
 endif
 
 # include additional Makefiles when needed
-- 
2.39.5


