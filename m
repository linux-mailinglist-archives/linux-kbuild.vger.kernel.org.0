Return-Path: <linux-kbuild+bounces-2533-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E95C993171F
	for <lists+linux-kbuild@lfdr.de>; Mon, 15 Jul 2024 16:46:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A1E1B282E30
	for <lists+linux-kbuild@lfdr.de>; Mon, 15 Jul 2024 14:46:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 030B018FC9E;
	Mon, 15 Jul 2024 14:45:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hL+S6mpJ"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C765918FC8E;
	Mon, 15 Jul 2024 14:45:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721054742; cv=none; b=bqbSSt2d7KRFCuJA+1XrUNJ7TA8+Hxba9hBz9JvvY8LjpKr34joZbZBoJhmu8onoTwkadiipirPPIu4O2IglDENnbmu1u8XVatVmwn2wVdMEnUksan89j0b70A3VQETWrplOHTBo+6iMafibh2KokrOQeF5QbWI6TXEcgxY8nb4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721054742; c=relaxed/simple;
	bh=CY/27VOkhPKonvdN87CUpf65BRX4NvWvGVsHrmGrR7U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IKvb7mCiHBukTci5TF3ednNBcOw6a9/051AXkrnD1jjJWdXYta4CuwM/EQcV/egIk1Nahoc2QQzvpVP6X9XIj4ZkvhN9nfbyGH22cZa1p/Ixikd9uaXk0V/jxDxoNkt8QO19t2OUlJ+qp4xprpIynSplfsZ1OIZS/R5Pg4cKhOg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hL+S6mpJ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 61273C4AF0A;
	Mon, 15 Jul 2024 14:45:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721054742;
	bh=CY/27VOkhPKonvdN87CUpf65BRX4NvWvGVsHrmGrR7U=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=hL+S6mpJlqpHSlAk8N9n2p+oaka/wLkFCLC1f/8YbfbkzgI/poBj1+zIKB9MT2eYi
	 M5RDvGZ9T7D9uPxOH/7ohJeLj/is6yWbPhKd4bFDLb/QuDHg+ODaWN4sa1ncPXthey
	 SGlbOBW9NJmtslb30QKgoFySd9aAaNtd1Ehb6/EsobFPSEowkBP2OWVXwM0iX+sKtf
	 SdQErmaPCnY1ke+s/Oz6Z4ObuYAmFrgyGxPmCDYEA1FF6GNf/WYNjcDSB/Ql4WpHjF
	 ROK2FPpTK+IqpKYKW3mwmQRZtTXDMsG18KojZS2KDhMxTnnO7W5rJ3EdhBgCJYHd5c
	 fvn5fAXCEXTDw==
From: Masahiro Yamada <masahiroy@kernel.org>
To: Kees Cook <kees@kernel.org>,
	linux-hardening@vger.kernel.org
Cc: linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH 3/3] fortify: move test_fortify.sh to lib/test_fortify/
Date: Mon, 15 Jul 2024 23:45:25 +0900
Message-ID: <20240715144529.101634-4-masahiroy@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240715144529.101634-1-masahiroy@kernel.org>
References: <20240715144529.101634-1-masahiroy@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This script is only used in lib/test_fortify/.

There is no reason to keep it in scripts/.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 MAINTAINERS                                   | 1 -
 lib/test_fortify/Makefile                     | 4 ++--
 {scripts => lib/test_fortify}/test_fortify.sh | 0
 3 files changed, 2 insertions(+), 3 deletions(-)
 rename {scripts => lib/test_fortify}/test_fortify.sh (100%)

diff --git a/MAINTAINERS b/MAINTAINERS
index 958e935449e5..b68386515067 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -8598,7 +8598,6 @@ F:	include/linux/fortify-string.h
 F:	lib/fortify_kunit.c
 F:	lib/memcpy_kunit.c
 F:	lib/test_fortify/*
-F:	scripts/test_fortify.sh
 K:	\b__NO_FORTIFY\b
 
 FPGA DFL DRIVERS
diff --git a/lib/test_fortify/Makefile b/lib/test_fortify/Makefile
index 8c5bee33ee36..399cae880e1d 100644
--- a/lib/test_fortify/Makefile
+++ b/lib/test_fortify/Makefile
@@ -3,10 +3,10 @@
 ccflags-y := $(call cc-disable-warning,fortify-source)
 
 quiet_cmd_test_fortify = TEST    $@
-      cmd_test_fortify = $(CONFIG_SHELL) $(srctree)/scripts/test_fortify.sh \
+      cmd_test_fortify = $(CONFIG_SHELL) $(src)/test_fortify.sh \
 			$< $@ "$(NM)" $(CC) $(c_flags) -DKBUILD_EXTRA_WARN1
 
-$(obj)/%.log: $(src)/%.c $(srctree)/scripts/test_fortify.sh FORCE
+$(obj)/%.log: $(src)/%.c $(src)/test_fortify.sh FORCE
 	$(call if_changed_dep,test_fortify)
 
 logs = $(patsubst $(src)/%.c, %.log, $(wildcard $(src)/*-*.c))
diff --git a/scripts/test_fortify.sh b/lib/test_fortify/test_fortify.sh
similarity index 100%
rename from scripts/test_fortify.sh
rename to lib/test_fortify/test_fortify.sh
-- 
2.43.0


