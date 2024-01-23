Return-Path: <linux-kbuild+bounces-636-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 74AB2839CAA
	for <lists+linux-kbuild@lfdr.de>; Wed, 24 Jan 2024 00:00:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2BC4B1F27CA0
	for <lists+linux-kbuild@lfdr.de>; Tue, 23 Jan 2024 23:00:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EFF7D53E37;
	Tue, 23 Jan 2024 23:00:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jAoxWhCq"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFD114120C;
	Tue, 23 Jan 2024 23:00:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706050809; cv=none; b=J54IA522C4isH8kSPm0GYWuv1Qom0MNGYpbPM6ZUbp4KT+e0BC80g/QHHOOehAxmaskzSHnoX6Qub8I4vDxdIGCfFvyfawE5Th6a+wnrtotn1cXekdIiKXH3F7ppQ7juBtXN+nrbz1Om2mcHtyrdiG6TZVGUeKuZ0QxfcctWsZg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706050809; c=relaxed/simple;
	bh=pqpVjk8HX7VL6g1Q9EMOtXMob1urEAYYXk6Z618rEPA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PEIXlOWOETGhcbka0hnatUv8Wsdqf1FfXxAHgSyvl8RNu048mLdUJ/+gbK3NidnuHvtedtApbcgNTA8DbrNZ9Fotn2D2ixvSjj7roc0wPrEGYkBSFIZ3wQlOvrt6/8+7ibqL0NJ1swqGkJ1zn4Mdr2vb4Ismmn2uJq5LWR+4UDM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jAoxWhCq; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 82FB9C43394;
	Tue, 23 Jan 2024 23:00:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706050809;
	bh=pqpVjk8HX7VL6g1Q9EMOtXMob1urEAYYXk6Z618rEPA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=jAoxWhCqM5qLtmyVk4cFQP+mwISnNe7n35p8T8gpypm9mTTinatigBB7ExR4Leip1
	 NlBgIXN/o57qF02Nlgzjhc9A4U29nI+WaBA2+106uaUNxOC/3peQfnK0SuPW1l5eQe
	 2jUZPdMPCWw0cdApKB0gFZfGIq/YDbuM64Kc5HYJqNnmtyaH2GMfZ2ktOk3hps396f
	 KswJ0c1mdynLwJtjI0aVlGgzhhNz2xfijdT96AxkTqrmVP2drGZphoapXsQ6uaigZV
	 CqluqWEP5y8HIwNOTWOVcKSlBaxnhiEljVPYj3UXiJxSxHwZObVdnOhGXKEoC3Zo3V
	 1mlJJfZ0m3Dqg==
From: Nathan Chancellor <nathan@kernel.org>
Date: Tue, 23 Jan 2024 15:59:54 -0700
Subject: [PATCH 1/2] um: Fix adding '-no-pie' for clang
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240123-fix-uml-clang-18-v1-1-efc095519cf9@kernel.org>
References: <20240123-fix-uml-clang-18-v1-0-efc095519cf9@kernel.org>
In-Reply-To: <20240123-fix-uml-clang-18-v1-0-efc095519cf9@kernel.org>
To: richard@nod.at, anton.ivanov@cambridgegreys.com, 
 johannes@sipsolutions.net, masahiroy@kernel.org
Cc: nathan@kernel.org, nicolas@fjasle.eu, ndesaulniers@google.com, 
 morbo@google.com, justinstitt@google.com, linux-um@lists.infradead.org, 
 linux-kbuild@vger.kernel.org, llvm@lists.linux.dev, patches@lists.linux.dev, 
 stable@vger.kernel.org
X-Mailer: b4 0.13-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2539; i=nathan@kernel.org;
 h=from:subject:message-id; bh=pqpVjk8HX7VL6g1Q9EMOtXMob1urEAYYXk6Z618rEPA=;
 b=owGbwMvMwCUmm602sfCA1DTG02pJDKkbXL7XGN+6vvxLxcGMT3k7ljcENiwJYw3IvCTmpN86I
 aXyyepNHaUsDGJcDLJiiizVj1WPGxrOOct449QkmDmsTCBDGLg4BWAi8vmMDKvCe0V5P8XUOZQW
 83F9CenJOti0NvmYwTbR/1OnbHJ9cI+R4e25yU9n6x1e5bO/96HZW+fVgYtuXZ/ZmFjz6vmT3Zd
 cTzAAAA==
X-Developer-Key: i=nathan@kernel.org; a=openpgp;
 fpr=2437CB76E544CB6AB3D9DFD399739260CB6CB716

The kernel builds with -fno-PIE, so commit 883354afbc10 ("um: link
vmlinux with -no-pie") added the compiler linker flag '-no-pie' via
cc-option because '-no-pie' was only supported in GCC 6.1.0 and newer.

While this works for GCC, this does not work for clang because cc-option
uses '-c', which stops the pipeline right before linking, so '-no-pie'
is unconsumed and clang warns, causing cc-option to fail just as it
would if the option was entirely unsupported:

  $ clang -Werror -no-pie -c -o /dev/null-x c /dev/null
  clang-16: error: argument unused during compilation: '-no-pie' [-Werror,-Wunused-command-line-argument]

A recent version of clang exposes this because it generates a relocation
under '-mcmodel=large' that is not supported in PIE mode:

  /usr/sbin/ld: init/main.o: relocation R_X86_64_32 against symbol `saved_command_line' can not be used when making a PIE object; recompile with -fPIE
  /usr/sbin/ld: failed to set dynamic section sizes: bad value
  clang: error: linker command failed with exit code 1 (use -v to see invocation)

Remove the cc-option check altogether. It is wasteful to invoke the
compiler to check for '-no-pie' because only one supported compiler
version does not support it, GCC 5.x (as it is supported with the
minimum version of clang and GCC 6.1.0+). Use a combination of the
gcc-min-version macro and CONFIG_CC_IS_CLANG to unconditionally add
'-no-pie' with CONFIG_LD_SCRIPT_DYN=y, so that it is enabled with all
compilers that support this. Furthermore, using gcc-min-version can help
turn this back into

  LINK-$(CONFIG_LD_SCRIPT_DYN) += -no-pie

when the minimum version of GCC is bumped past 6.1.0.

Cc: stable@vger.kernel.org
Closes: https://github.com/ClangBuiltLinux/linux/issues/1982
Signed-off-by: Nathan Chancellor <nathan@kernel.org>
---
 arch/um/Makefile | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/um/Makefile b/arch/um/Makefile
index 82f05f250634..34957dcb88b9 100644
--- a/arch/um/Makefile
+++ b/arch/um/Makefile
@@ -115,7 +115,9 @@ archprepare:
 	$(Q)$(MAKE) $(build)=$(HOST_DIR)/um include/generated/user_constants.h
 
 LINK-$(CONFIG_LD_SCRIPT_STATIC) += -static
-LINK-$(CONFIG_LD_SCRIPT_DYN) += $(call cc-option, -no-pie)
+ifdef CONFIG_LD_SCRIPT_DYN
+LINK-$(call gcc-min-version, 60100)$(CONFIG_CC_IS_CLANG) += -no-pie
+endif
 LINK-$(CONFIG_LD_SCRIPT_DYN_RPATH) += -Wl,-rpath,/lib
 
 CFLAGS_NO_HARDENING := $(call cc-option, -fno-PIC,) $(call cc-option, -fno-pic,) \

-- 
2.43.0


