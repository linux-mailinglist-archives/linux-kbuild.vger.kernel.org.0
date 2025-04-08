Return-Path: <linux-kbuild+bounces-6499-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B2A9A7F1B9
	for <lists+linux-kbuild@lfdr.de>; Tue,  8 Apr 2025 02:53:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0FA151774B3
	for <lists+linux-kbuild@lfdr.de>; Tue,  8 Apr 2025 00:53:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2628325EFBB;
	Tue,  8 Apr 2025 00:53:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="O43cs2gO"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E60CF35973;
	Tue,  8 Apr 2025 00:53:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744073621; cv=none; b=WXpUd2tpEJRPDEruuYLoK7Kqw9tp8OnZfqESKBvwAWKfipAbWh2O+EnqZpdgIyjOoic8OTs+Ye7v2KoAMckUP9NiyOB3e238I5TvDfXXboCgpWYxuUkSi3CteU62/5f8epCfTWpVg5Ov5kaOZfktPij6wuX3YU3HNBIoWzXljOc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744073621; c=relaxed/simple;
	bh=2tioJx7A1oHG6jVTeIhvZwxr2imWJglUGKGr1y1xJkY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=sUymaJXMPvzPTCFuMBSUfIKBOFqGath93WAc5NdOGtCoOEUIR1Jq//GUkwBBGsBcVzSsBKO5OMfc4u/ug9rJpgqn6v0kgLILtAiJO+knvxKoGkHhyugYXesknA1EL4EK5fz0Yoj5GEM7wBPsHoFwmo4J3XpfXnthn4FfeR8qA9o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=O43cs2gO; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A932AC4CEDD;
	Tue,  8 Apr 2025 00:53:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744073620;
	bh=2tioJx7A1oHG6jVTeIhvZwxr2imWJglUGKGr1y1xJkY=;
	h=From:To:Cc:Subject:Date:From;
	b=O43cs2gOdBdLaqG/dW+Ojdf2ozJ3BmEuyYFheOdItkMESfNLXpPSdMi7VgQgvHmBi
	 yKRLWqj+dlAXBTPskDH0GEAYUCb8GS+4rX6K3aVeTmulZ4a7qOylBV474JyRCcIiTk
	 /yIn7N19JpNawTYcoGmxiKu19kDAIbNbbXnTwmL0mIO2xRMO6SVAScaR/glUS+CGb5
	 iVJYtYlLUpNwt3LI/0Yo/ZKxN/oAPf1cC97IYVTHqgdaX9k/MLl+GRGCZhBbUHah2e
	 Jxf7RhYkAUhrwyscD7riE5/RX4RpVXQTePG7V1gnXMCrgLweXnbOSJkcSveJ8xqwpo
	 eMrNCUrd9FNpA==
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
Subject: [PATCH AUTOSEL 6.14 1/3] kbuild, rust: use -fremap-path-prefix to make paths relative
Date: Mon,  7 Apr 2025 20:53:33 -0400
Message-Id: <20250408005335.3334585-1-sashal@kernel.org>
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
X-stable-base: Linux 6.14.1
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
index 8b6764d44a610..c4eeb97ab3df2 100644
--- a/Makefile
+++ b/Makefile
@@ -1068,6 +1068,7 @@ endif
 # change __FILE__ to the relative path to the source directory
 ifdef building_out_of_srctree
 KBUILD_CPPFLAGS += $(call cc-option,-fmacro-prefix-map=$(srcroot)/=)
+KBUILD_RUSTFLAGS += --remap-path-prefix=$(srcroot)/=
 endif
 
 # include additional Makefiles when needed
-- 
2.39.5


