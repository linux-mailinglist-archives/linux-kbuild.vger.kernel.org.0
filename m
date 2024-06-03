Return-Path: <linux-kbuild+bounces-1980-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A3B958D8704
	for <lists+linux-kbuild@lfdr.de>; Mon,  3 Jun 2024 18:19:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D4DC81C217D2
	for <lists+linux-kbuild@lfdr.de>; Mon,  3 Jun 2024 16:19:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 106BA13667E;
	Mon,  3 Jun 2024 16:19:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="B1TzhTBF"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE04F13666E;
	Mon,  3 Jun 2024 16:19:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717431551; cv=none; b=H5BSY1otwJ/WrvUpS3TnX0G0d6jjD1FmqBFQkdyBnhIBScefVgTzBEYDBCSh+1MIX6+/lZFrsgGcA4I8XUTMH+b4ipW2UJZVyDD3H+pie1gVaQonMu1o3ucSl4wH4zqg0or4Px5i+hdXnVJGzHKHUxqEBeZ9IuXZFETeCVXc91E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717431551; c=relaxed/simple;
	bh=0bw9I6ni7Nse9gvjkZM4wnIf7S4Gr9HtUnYYALwSU9k=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=G8LcSFE4PemgA1LmJazDsQUd6eM4DHRL3TNB4aeknFYBSwOMQsUupl+Jm34rHh5iR5A7K+hOHs4SNiwJDfttsYT3tpbtxUo19BHpdlm/BMCk2XuSmVSDvorSB3fswOpHsKkk8nhGBVO9yPGckQCRiwSZpuuxsVPB8doyn1+ZgkI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=B1TzhTBF; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81A70C4AF07;
	Mon,  3 Jun 2024 16:19:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717431549;
	bh=0bw9I6ni7Nse9gvjkZM4wnIf7S4Gr9HtUnYYALwSU9k=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=B1TzhTBF64viQqPXi128HEVvAo0+Vm+xMXkfnMxdV01EB/SAjdVNQoHxlW1IwNgPU
	 rrX+8QfXODepI1oSZbwr58Gnc52YsVCeHu9b1tkmntAQLtyGuh/YWa2Bw8mTlZvZ9N
	 0UzohFxNMvM2by1W+wcVrdPHP6JuzrEGAFvbjuPrOE9fmb79KgOYXALaurOFAcfe0I
	 fqdNJs795Bw2gpkS6jzXpGJBRZcykYN4KF9Wfwe5vSWmTBRRu0uKwZf6hBTn6dAG/n
	 jxMfwcpQPZLx00Hlgzd69iH4hEnPBv68VRFXECHZOhemwEzkTrqPy/mhE5PRl9ARf1
	 qYecH3q6cFL1Q==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH 2/3] kconfig: doc: document behavior of 'select' and 'imply' followed by 'if'
Date: Tue,  4 Jun 2024 01:19:03 +0900
Message-Id: <20240603161904.1663388-2-masahiroy@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240603161904.1663388-1-masahiroy@kernel.org>
References: <20240603161904.1663388-1-masahiroy@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Documentation/kbuild/kconfig-language.rst explains the behavior of
'select' as follows:

  reverse dependencies can be used to force a lower limit of
  another symbol. The value of the current menu symbol is used as the
  minimal value <symbol> can be set to.

This is not true when the 'select' property is followed by 'if'.

[Test Code]

    config MODULES
            def_bool y
            modules

    config A
            def_tristate y
            select C if B

    config B
            def_tristate m

    config C
            tristate

[Result]

    CONFIG_MODULES=y
    CONFIG_A=y
    CONFIG_B=m
    CONFIG_C=m

If "the value of A is used as the minimal value C can be set to",
C must be 'y'.

The actual behavior is "C is selected by (A && B)". The lower limit of
C is downgraded due to B being 'm'.

I have always thought this behavior was odd, and this ha arisen several
times in the mailing list.

I do not know whether it is a bug or intended behavior. Anyway, it is
not feasible to change it now because many Kconfig files rely on this
behavior. The same applies to 'imply'.

Document this (but reserve the possibility for a future change).

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 Documentation/kbuild/kconfig-language.rst | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/kbuild/kconfig-language.rst b/Documentation/kbuild/kconfig-language.rst
index 86be5b857cc4..1fb3f5e6193c 100644
--- a/Documentation/kbuild/kconfig-language.rst
+++ b/Documentation/kbuild/kconfig-language.rst
@@ -150,6 +150,12 @@ applicable everywhere (see syntax).
 	That will limit the usefulness but on the other hand avoid
 	the illegal configurations all over.
 
+	If "select" <symbol> is followed by "if" <expr>, <symbol> will be
+	selected by the logical AND of the value of the current menu symbol
+	and <expr>. This means, the lower limit can be downgraded due to the
+	presence of "if" <expr>. This behavior may seem weird, but we rely on
+	it. (The future of this behavior is undecided.)
+
 - weak reverse dependencies: "imply" <symbol> ["if" <expr>]
 
   This is similar to "select" as it enforces a lower limit on another
@@ -202,6 +208,10 @@ applicable everywhere (see syntax).
 	imply BAR
 	imply BAZ
 
+  Note: If "imply" <symbol> is followed by "if" <expr>, the default of <symbol>
+  will be the logical AND of the value of the current menu symbol and <expr>.
+  (The future of this behavior is undecided.)
+
 - limiting menu display: "visible if" <expr>
 
   This attribute is only applicable to menu blocks, if the condition is
-- 
2.40.1


