Return-Path: <linux-kbuild+bounces-3603-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 559F097B14E
	for <lists+linux-kbuild@lfdr.de>; Tue, 17 Sep 2024 16:21:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E87BAB25C36
	for <lists+linux-kbuild@lfdr.de>; Tue, 17 Sep 2024 14:21:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D687193425;
	Tue, 17 Sep 2024 14:18:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Xhr2bnFx"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22E71193422;
	Tue, 17 Sep 2024 14:18:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726582687; cv=none; b=QPL85Bq8KhYJICp1vbwDR82aopxlwS1FFFkW819W72HDYRLKFVMc2bz8atQN5wCwNPlBpLB5Hz7FBL6U5mxns30DPznLkawKryrGbZcKyFcTmhqmTpfBADzJCGeIPGxE5azh6RDcQ/PvQJvEiHYiet/lUG0OUS5cpTez2whnP0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726582687; c=relaxed/simple;
	bh=Ujo2ggpWsK2c23dBQVr2WlNq1lt94SVOQJZd+ZZqT5Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mEukZPrAFMAxWCXhc6pexJufZBdMjyp3rClBh6gMGp1JLcn/UHxvIHCZ0G0UnseJ8rb7teQ7OtbgBlBpMGJhfhZR7f9uGoRGqfdiP1Zvb/W0o/hpLBJUHFXGHQQ7SixYB2fUAXV5kGeOhLkKmImJ5VYvsrO2ajk4wFyNtFEaNQk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Xhr2bnFx; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0CBC1C4CECD;
	Tue, 17 Sep 2024 14:18:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726582686;
	bh=Ujo2ggpWsK2c23dBQVr2WlNq1lt94SVOQJZd+ZZqT5Y=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Xhr2bnFxx6Qe2WRGAYtU1rvX95LalQzsjFmtepTxfstZfY1gIJz4D6J15Av92AywL
	 CqOfGOSxZ1k0o9rc3LuoquQZB97fiQ/fgfQE/lzOfrsrIqhzjeJHZ2K9+lRMVNJ7/7
	 fnXvHnDBAnMXxJa4vjm+LfnGEFS6xS4YSHce2NJ7uNKCGzZkhM/c9l9Trd1c4BtqIR
	 BfU9OTtkFiJ33wjEWu8cvRyaTNdprCm8jpCAeDFZdMrkRx4KWOwHf4jCmFolSPYkVr
	 ZUYDxNYoYWK8y/KTJLpzu1DpA8ydwcfqBNu86/Sw1gOdIOtOQGJToJYbvWMxDD7N6C
	 tbhwVq4w+OhfQ==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Miguel Ojeda <ojeda@kernel.org>,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>,
	Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH 16/23] kbuild: use 'output' variable to create the output directory
Date: Tue, 17 Sep 2024 23:16:44 +0900
Message-ID: <20240917141725.466514-17-masahiroy@kernel.org>
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

$(KBUILD_OUTPUT) specifies the output directory of kernel builds.

Use a more generic name, 'output', to better reflect this code hunk in
the context of external module builds.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 Makefile | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/Makefile b/Makefile
index 254f05a1cc0f..7a76452049ea 100644
--- a/Makefile
+++ b/Makefile
@@ -176,18 +176,20 @@ export KBUILD_EXTRA_WARN
 # The O= assignment takes precedence over the KBUILD_OUTPUT environment
 # variable.
 
-# Do we want to change the working directory?
 ifeq ("$(origin O)", "command line")
   KBUILD_OUTPUT := $(O)
 endif
 
-ifneq ($(KBUILD_OUTPUT),)
+output := $(KBUILD_OUTPUT)
+
+# Do we want to change the working directory?
+ifneq ($(output),)
 # $(realpath ...) gets empty if the path does not exist. Run 'mkdir -p' first.
-$(shell mkdir -p "$(KBUILD_OUTPUT)")
+$(shell mkdir -p "$(output)")
 # $(realpath ...) resolves symlinks
-abs_output := $(realpath $(KBUILD_OUTPUT))
-$(if $(abs_output),,$(error failed to create output directory "$(KBUILD_OUTPUT)"))
-endif # ifneq ($(KBUILD_OUTPUT),)
+abs_output := $(realpath $(output))
+$(if $(abs_output),,$(error failed to create output directory "$(output)"))
+endif
 
 ifneq ($(words $(subst :, ,$(abs_srctree))), 1)
 $(error source directory cannot contain spaces or colons)
-- 
2.43.0


