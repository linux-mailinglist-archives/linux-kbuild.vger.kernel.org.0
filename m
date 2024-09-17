Return-Path: <linux-kbuild+bounces-3609-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 42B6897B15A
	for <lists+linux-kbuild@lfdr.de>; Tue, 17 Sep 2024 16:22:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E24DD1F21236
	for <lists+linux-kbuild@lfdr.de>; Tue, 17 Sep 2024 14:22:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC5C81957FD;
	Tue, 17 Sep 2024 14:18:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gMyHmEtB"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3F43185E6A;
	Tue, 17 Sep 2024 14:18:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726582699; cv=none; b=CDNDtlma+90n3GYW+xss4MjsYgduoqGtYrFYTFfnW93Sz8WWvvl+G4kAzdXp+rB40D6JhuFFhh0JMd+Z/fhHDDAHAp6oQI9FfVIqKViWwTYgLCsa4I0cpvQoU+GkdeeM9mNHV9QxfrKh4ryiModMON7v8FmNrzm6WAugwejY/zo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726582699; c=relaxed/simple;
	bh=Ra2sKRWgqwv0KIZWzt1FwqFPZ+ccaJpIfL/OUlJKdGk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jIHYCiAFO3fTOqAg75Z1Nnjn2Hp4ZUduODcjLb06IdLk9nm3Vd6ECKU/2DeSdxZ6wgMi9obiWILmjUqxidebriwKZ0hjs1GgVb01AvGsAr7sxM7LgbhYX7nwyVtppdhV/kvNrvvFmf1tR80R8GiNBYxn7fEnLKmIT6jcPFF1h8Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gMyHmEtB; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F184DC4CEC5;
	Tue, 17 Sep 2024 14:18:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726582699;
	bh=Ra2sKRWgqwv0KIZWzt1FwqFPZ+ccaJpIfL/OUlJKdGk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=gMyHmEtBAND0LFpuaHHdvm0IL6/fXRl36eFKyQbZChRo2vlMflHk4XQ3s8gwIs8Ox
	 G27dtJKz1R+zGfW9Y7vcs6rALMqJ3rGtHrZDkOoB3Js89lsHKyUaTlZNLEe3u9gDL+
	 QY/q84LuowH3vg7iunMQo/iAWsbjsXly2MgNK3O30VdX98lqlrSeAuseLjudBUlKlr
	 FR2EQJsH/fiLABxt6Xni3qSQRQWjwCzyuDlesg18H4l+9169Gop4dT9xl07m5PSfLr
	 l8rluzKhKEeaAfwDmtLIiglXraNgKkA5eEWoRLLf2lXQWPnnMbgrSfiwd6ebgZC6ku
	 ZeWgf4Uqhk0bQ==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Miguel Ojeda <ojeda@kernel.org>,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>,
	Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH 22/23] kbuild: make wrapper Makefile more convenient for external modules
Date: Tue, 17 Sep 2024 23:16:50 +0900
Message-ID: <20240917141725.466514-23-masahiroy@kernel.org>
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

When Kbuild starts building in a separate output directory, it generates
a wrapper Makefile, allowing you to invoke 'make' from the output
directory.

This commit makes it more convenient, so you can invoke 'make' without
M= or MO=.

First, you need to build external modules in a separate directory:

  $ make M=/path/to/module/source/dir MO=/path/to/module/build/dir

Once the wrapper Makefile is generated in /path/to/module/build/dir,
you can proceed as follows:

  $ cd /path/to/module/build/dir
  $ make

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 Makefile | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index 9f0ba07e8f25..81603a50c757 100644
--- a/Makefile
+++ b/Makefile
@@ -641,10 +641,20 @@ ifdef building_out_of_srctree
 # At the same time when output Makefile generated, generate .gitignore to
 # ignore whole output directory
 
+ifdef KBUILD_EXTMOD
+print_env_for_makefile = \
+	echo "export KBUILD_OUTPUT = $(objtree)"; \
+	echo "export KBUILD_EXTMOD = $(_vpath)" ; \
+	echo "export KBUILD_EXTMOD_OUTPUT = $(CURDIR)"
+else
+print_env_for_makefile = \
+	echo "export KBUILD_OUTPUT = $(CURDIR)"
+endif
+
 quiet_cmd_makefile = GEN     Makefile
       cmd_makefile = { \
 	echo "\# Automatically generated by $(abs_srctree)/Makefile: don't edit"; \
-	echo "export KBUILD_OUTPUT = $(CURDIR)"; \
+	$(print_env_for_makefile); \
 	echo "include $(abs_srctree)/Makefile"; \
 	} > Makefile
 
-- 
2.43.0


