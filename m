Return-Path: <linux-kbuild+bounces-5768-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BD69A36F51
	for <lists+linux-kbuild@lfdr.de>; Sat, 15 Feb 2025 17:16:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 72DD23AE88A
	for <lists+linux-kbuild@lfdr.de>; Sat, 15 Feb 2025 16:16:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6ADAE194A75;
	Sat, 15 Feb 2025 16:16:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="vI/etSOK"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F713D529;
	Sat, 15 Feb 2025 16:16:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739636170; cv=none; b=KmXjkkySGOt7dbPcZdNlmdvIRGCAHmkUnE8aWP4B1ZRsj0Ss7sSN253TpXn4rlTz/0Z+YQ/D4kOVrIn+sPonchaM6zVg5jMbOy5EIsX0Liejvi/1OYX7PNImDKa9M1wPsBjgLpmU+A/iA0o4dLvJTNktpJ+wCQ0rBCrfoqtDexM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739636170; c=relaxed/simple;
	bh=T6bXdVf2S8BJAOTUw+uZN8UtATDc6/uNXI0at3jZRBQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=D69v0YRbVaYhUZmIhbpbsUY/kX7q7dCSUp82JyRZFBEfnEj6J4dvX91iTRTNRxfzGc2qD43fktnxGi69vVe7et3A36VOVOJgYyxVaGdbkwvJkfyBZxnxnZ9mU9gY1YxvfycZ9Uk6v71XM/q2UDGzsTz2aDOBtU5zEaKsA1VWsaA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=vI/etSOK; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A0E32C4CEDF;
	Sat, 15 Feb 2025 16:16:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739636170;
	bh=T6bXdVf2S8BJAOTUw+uZN8UtATDc6/uNXI0at3jZRBQ=;
	h=From:To:Cc:Subject:Date:From;
	b=vI/etSOKaaGTdCMe6zy5Rw43fEisQr1u0fGn97KT0h3sBYb7mQi6uyuRDhU5JmNvg
	 nBYZdzoSK/Rq0tRx2n7nGD38n8scghbrvKiwjgZQB8RvCZ8EtjVxgxK9hMyPUMLX4/
	 1/QyuRpbZDVmKe5tOcv7EyM/y8vXAL44FyknkNXD+V+NqWH/ZtyGOcijk/Wbwvj4G4
	 5Ncu01liUoH2uG9eWYvGYRRRczTKQ9lHHWhs9e617hmvI1CIesVMADBef5KXu8eGws
	 tdghhmysYgI4qwa0rJ07SlN4qUmG38URog/zLl8SUAt9JNH8Q+rJY371Dh60cr7KiV
	 bKZ3Ewpe8MeOg==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Kees Cook <kees@kernel.org>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>
Subject: [PATCH] kbuild: move -fzero-init-padding-bits=all to the top-level Makefile
Date: Sun, 16 Feb 2025 01:15:52 +0900
Message-ID: <20250215161604.690467-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The -fzero-init-padding-bits=all option is not a warning flag, so
defining it in scripts/Makefile.extrawarn is inconsistent.

Move it to the top-level Makefile for consistency.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 Makefile                   | 3 +++
 scripts/Makefile.extrawarn | 3 ---
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/Makefile b/Makefile
index 89628e354ca7..4a36864dd4bd 100644
--- a/Makefile
+++ b/Makefile
@@ -928,6 +928,9 @@ KBUILD_CFLAGS	+= $(CC_AUTO_VAR_INIT_ZERO_ENABLER)
 endif
 endif
 
+# Explicitly clear padding bits during variable initialization
+KBUILD_CFLAGS += $(call cc-option,-fzero-init-padding-bits=all)
+
 # While VLAs have been removed, GCC produces unreachable stack probes
 # for the randomize_kstack_offset feature. Disable it for all compilers.
 KBUILD_CFLAGS	+= $(call cc-option, -fno-stack-clash-protection)
diff --git a/scripts/Makefile.extrawarn b/scripts/Makefile.extrawarn
index dc081cf46d21..d75897559d18 100644
--- a/scripts/Makefile.extrawarn
+++ b/scripts/Makefile.extrawarn
@@ -82,9 +82,6 @@ KBUILD_CFLAGS += $(call cc-option,-Werror=designated-init)
 # Warn if there is an enum types mismatch
 KBUILD_CFLAGS += $(call cc-option,-Wenum-conversion)
 
-# Explicitly clear padding bits during variable initialization
-KBUILD_CFLAGS += $(call cc-option,-fzero-init-padding-bits=all)
-
 KBUILD_CFLAGS += -Wextra
 KBUILD_CFLAGS += -Wunused
 
-- 
2.43.0


