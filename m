Return-Path: <linux-kbuild+bounces-3599-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 14A9E97B146
	for <lists+linux-kbuild@lfdr.de>; Tue, 17 Sep 2024 16:20:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C007F1F23B76
	for <lists+linux-kbuild@lfdr.de>; Tue, 17 Sep 2024 14:20:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D5F371925B7;
	Tue, 17 Sep 2024 14:17:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HxsxDyhz"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA3A91925B1;
	Tue, 17 Sep 2024 14:17:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726582677; cv=none; b=T205+eUOt70ocOTel9K6FbzcwunRp7RdJUqD6smukABTl8/+0uSNUgtfi87fiKelWXaPoofzdjOjyNv9+t5y4rZCY1g78KiUeEzmnh7z7QrF5pihjP+0GXFqj2jlJSVOlvWo29q8sY3O4YyfHbGdKHBqehkMLJhxDtvWZEVhK/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726582677; c=relaxed/simple;
	bh=CPGuVVmP9nfnoF+wMfgzB9DaNE/+HVqfHgpUsGHpkck=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ioY400YZboTnuE5kEdBdh05bIrlAuxQ4WLTQ7r8CEGo6Hhdn1HoIon07+EHiFvcYenydkP8DMihnThofVFoZYBcc/zOZS6GMYXfxYxLyrdGYb5IlLh/Y7G8za1k2JTMtq3AtG2HnmhC+cP2EFwhyWIy3j2hoAJH44Y+KDUvyRZ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HxsxDyhz; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94298C4CEC5;
	Tue, 17 Sep 2024 14:17:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726582677;
	bh=CPGuVVmP9nfnoF+wMfgzB9DaNE/+HVqfHgpUsGHpkck=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=HxsxDyhz/AwuzXACq66np4u4XrLpfHNQqs5Bm6tWzlHQ+885AdHOzSiSN1ztMyrAD
	 8ZoaJW7oQZwvS4D3qOdA1SKcRue4DSLjJnZfQP9j3kRDcP9Xac9kxgkbeDYIPE6VeB
	 UJOzimE6zu47d+4fAMPldduXCNxV/+Z/9QEQOL2CVsgV+DiZOX6D4kVmtIpwT+8vHB
	 YQSGUQy15KElY6hGYPmxtM6Qb6ghabXxVDXNS52dXQSCuf79b4HJpSeQsERmOu8YMo
	 jjImF+uCPm8IumSRyvo+Pfmmw1JPYIVEppeKTKGExZiwihShQ0V2fld1xU2UnsOBsJ
	 tF1mdozZZts0w==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Miguel Ojeda <ojeda@kernel.org>,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>,
	Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH 12/23] scripts/nsdeps: use VPATH as src_prefix
Date: Tue, 17 Sep 2024 23:16:40 +0900
Message-ID: <20240917141725.466514-13-masahiroy@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240917141725.466514-1-masahiroy@kernel.org>
References: <20240917141725.466514-1-masahiroy@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This change allows it to work not only for in-tree modules but also for
external modules, even if they are built in a separate build directory.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/nsdeps | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/nsdeps b/scripts/nsdeps
index f1718cc0d700..8b4db63838ce 100644
--- a/scripts/nsdeps
+++ b/scripts/nsdeps
@@ -19,10 +19,10 @@ if ! { echo "$SPATCH_REQ_VERSION"; echo "$SPATCH_VERSION"; } | sort -CV ; then
 	exit 1
 fi
 
-if [ "$KBUILD_EXTMOD" ]; then
+if [ "${VPATH+set}" ]; then
 	src_prefix=
 else
-	src_prefix=$srctree/
+	src_prefix=$VPATH/
 fi
 
 generate_deps_for_ns() {
-- 
2.43.0


