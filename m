Return-Path: <linux-kbuild+bounces-3602-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DDF9897B14C
	for <lists+linux-kbuild@lfdr.de>; Tue, 17 Sep 2024 16:21:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1CC1B1C21C86
	for <lists+linux-kbuild@lfdr.de>; Tue, 17 Sep 2024 14:21:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F00E193091;
	Tue, 17 Sep 2024 14:18:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YSht7sGd"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8BE1181339;
	Tue, 17 Sep 2024 14:18:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726582685; cv=none; b=sXJ5dSX/feEphSRkVbsZs5n6s5j2sb3UJMyVq6osbaw92R2MAKundCYaW23afTL/8EP6SRjOI82D2e3rqQH2TxMtFqYp68IX2kN4kmTkpHqk0kuUuXeXuvAY3O/zZKxWcbZIQMSDR+7VlEUXu7iAj9yGfbSPli+tbpxa/ZCZAcQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726582685; c=relaxed/simple;
	bh=lf/ZusSJTTcvWWbKf+tPGBQ2Lsaj7xnEDyV2byZ55dg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XK1ApRgFMb8lulHGpvXxqSyeaZGQ3ebC2dEAj+5vKmLYAP2Gcv5TOS5iYGQoob6dpGPtIywxw0GvuwAryb+8KQhkBKwMVKkK0QxAbBBDnx14NCH33j2BdNqmtF02U6JxKfzW+0j16/ppOVMPhSOKddlyAxwlfQfU/dWTYX/ZROs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YSht7sGd; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A9F9CC4CEC5;
	Tue, 17 Sep 2024 14:18:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726582684;
	bh=lf/ZusSJTTcvWWbKf+tPGBQ2Lsaj7xnEDyV2byZ55dg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=YSht7sGdptXhO3YCVWjSFjEnvDgmPbBRhnvjHUlHEoa1d8cjTb3mXka24xbS5ZG3V
	 wPAtAQf9mDwYJN5DWv1MUaJb1W99lk/o97D3FjYHIGaHwJmywl+HPtxyydIrH6JMjr
	 50AABl4Oje1D3AP9DmCQDDe4R+aXYKly2kRc1SIQ6kiMiiLF4pKJbFqNBUPO+SvdGU
	 gm96Nul5sJDu20O8lbxU/25vMh9t+Gg7wwvu3BKg089flfx8slIuD52ekmmBfSvkV/
	 /ODBNo8Y7aE2qcWl78WDi4JL7wAD1m/udiIF6uA6Ej5Gm2tbLQWati1RNpuXFEXMa8
	 /ebgLQIirKBcA==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Miguel Ojeda <ojeda@kernel.org>,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>,
	Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH 15/23] kbuild: rename abs_objtree to abs_output
Date: Tue, 17 Sep 2024 23:16:43 +0900
Message-ID: <20240917141725.466514-16-masahiroy@kernel.org>
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

'objtree' refers to the top of the output directory of kernel builds.

Rename abs_objtree to a more generic name, to better reflect its use in
the context of external module builds.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 Makefile | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/Makefile b/Makefile
index c923bea7043b..254f05a1cc0f 100644
--- a/Makefile
+++ b/Makefile
@@ -40,7 +40,7 @@ __all:
 
 this-makefile := $(lastword $(MAKEFILE_LIST))
 abs_srctree := $(realpath $(dir $(this-makefile)))
-abs_objtree := $(CURDIR)
+abs_output := $(CURDIR)
 
 ifneq ($(sub_make_done),1)
 
@@ -185,8 +185,8 @@ ifneq ($(KBUILD_OUTPUT),)
 # $(realpath ...) gets empty if the path does not exist. Run 'mkdir -p' first.
 $(shell mkdir -p "$(KBUILD_OUTPUT)")
 # $(realpath ...) resolves symlinks
-abs_objtree := $(realpath $(KBUILD_OUTPUT))
-$(if $(abs_objtree),,$(error failed to create output directory "$(KBUILD_OUTPUT)"))
+abs_output := $(realpath $(KBUILD_OUTPUT))
+$(if $(abs_output),,$(error failed to create output directory "$(KBUILD_OUTPUT)"))
 endif # ifneq ($(KBUILD_OUTPUT),)
 
 ifneq ($(words $(subst :, ,$(abs_srctree))), 1)
@@ -197,7 +197,7 @@ export sub_make_done := 1
 
 endif # sub_make_done
 
-ifeq ($(abs_objtree),$(CURDIR))
+ifeq ($(abs_output),$(CURDIR))
 # Suppress "Entering directory ..." if we are at the final work directory.
 no-print-directory := --no-print-directory
 else
@@ -221,7 +221,7 @@ $(filter-out $(this-makefile), $(MAKECMDGOALS)) __all: __sub-make
 
 # Invoke a second make in the output directory, passing relevant variables
 __sub-make:
-	$(Q)$(MAKE) $(no-print-directory) -C $(abs_objtree) \
+	$(Q)$(MAKE) $(no-print-directory) -C $(abs_output) \
 	-f $(abs_srctree)/Makefile $(MAKECMDGOALS)
 
 else # need-sub-make
-- 
2.43.0


