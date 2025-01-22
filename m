Return-Path: <linux-kbuild+bounces-5541-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DBB39A1987F
	for <lists+linux-kbuild@lfdr.de>; Wed, 22 Jan 2025 19:34:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2DA401653FF
	for <lists+linux-kbuild@lfdr.de>; Wed, 22 Jan 2025 18:34:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9FAC2215171;
	Wed, 22 Jan 2025 18:34:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="cw4ao5zy"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE69F20FA9C;
	Wed, 22 Jan 2025 18:34:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737570883; cv=none; b=MS2KXtaJxgB0zBF+6ECuYpjJOY2YMpCjcxDcGNsXLYJBHMW67SPdc4S5Ffn7AESYT4KoUXUW3E0aC2eeWfAOp6MmnzE77RaNlOPYHKB7HYMfj4dMULURhXaXHVyk6OznfseeOliKale+OJvrlniuQ+/yqZqgnKrcDPit6S1p1rM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737570883; c=relaxed/simple;
	bh=MOEeERAYCKUd5sjEBPna3zjhDLviKmplR3Uh04XSko0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eK6qTMzvYR1IRomm45F6D9HBFTvYKhu/b42mBqprCBbgw5T4Vuw/eA+cBNKFvEt7SXa47VnCYj7vH22kaBN9e/JLKCR4jT6xjRQcbeoILS+zvNlY3KrdcrOHbKRRk03zSqtNd3FaIlqNGvwCaaz/MteNTL7mrm6FwAUeuAyIhcg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=cw4ao5zy; arc=none smtp.client-ip=80.241.56.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp2.mailbox.org (smtp2.mailbox.org [IPv6:2001:67c:2050:b231:465::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4YdXmS290hz9tRR;
	Wed, 22 Jan 2025 19:34:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1737570872;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7xjqJvVOaLjSeanWCwL0RNq6e7+9VKZwvEtpCriM/fs=;
	b=cw4ao5zyKqTHyG3CcbpHFu9iY1wepN84bi2AdOAnPzABLIcFsryOgIebqQP9I8P91/VUpj
	LLjkZXRuGlhn54Rtqu4RZ97LqlRYaWjCJHKAuzDQQw9XLgJDIPAZkuPy2qeeawJLXX6qnK
	+H+6gompB7Nl2B2UNn+kexX8+pJDBwQHEWJiwj1LUzDJh3ZQDIPwgdcBl8t6ZL/vKv0sAF
	WnvQAnvkSznvCumHWHmLSz57e+9ebRTmjPys0yCFIK3ZChT3N+fyiuvlHSUALmMAXAdnbj
	2cFSlSXe7HKeRDxJuZIQwY0WS+jEL3KDLOFlPHL9V3SIPEJBL5ocv2zmORW3yQ==
Message-ID: <a8edf0c1-1fd1-4101-8c42-073a314dcb51@mailbox.org>
Date: Wed, 22 Jan 2025 19:34:23 +0100
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v2] kbuild: Add CONFIG_LZ4_LEVEL for choosing compression
 level
To: Jann Horn <jannh@google.com>, Masahiro Yamada <masahiroy@kernel.org>,
 Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-kbuild@vger.kernel.org,
 linux-kernel@vger.kernel.org, Ard Biesheuvel <ardb@kernel.org>
References: <20250122-kernel-compress-fast-v2-1-bde9d71b6b88@google.com>
Content-Language: en-US
From: Tor Vic <torvic9@mailbox.org>
In-Reply-To: <20250122-kernel-compress-fast-v2-1-bde9d71b6b88@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-META: di7su3twmnwiq1pfi8qm15nmrwqjabkm
X-MBO-RS-ID: 751b29a29f429865bb5



On 1/22/25 16:08, Jann Horn wrote:
> Allow choosing the LZ4 compression level using the new config flag
> CONFIG_LZ4_LEVEL.
> 
> This will allow developers who want to quickly iterate with one-off kernel
> builds to speed up kernel compression at the cost of creating a larger
> kernel image.
> 
> LZ4 at level 9 (which the kernel uses by default) takes ~2.8
> seconds to compress a 110M large vmlinux.bin on my machine; LZ4 at level 1
> just needs ~220ms wall clock time.
> 
> Signed-off-by: Jann Horn <jannh@google.com>
> ---
> My patch provides kconfig for choosing compression level of LZ4; Tor Vic
> mentioned using kconfig for choosing the compression level of ZSTD.
> 
> Does my current approach of having a kconfig option specifically for
> LZ4 compression level look good (and we can add the same for ZSTD later
> if necessary); or should there be a single kconfig option that sets a
> compression level that is used across all compression algorithms?
> I guess doing it separately for different algorithms makes more sense
> because different compression levels might mean different things for
> different algorithms?

Hi Jann,

Yes, different algos have different ways of specifying compression 
levels. You cannot have one single option for all of the available 
compressors.

> 
> Do I need to somehow make it explicit that cmd_lz4 and cmd_lz4_with_size
> rely on CONFIG_LZ4_LEVEL, or does the build system figure that out on
> its own somehow? Experimentally it seems like the build system triggers
> a rebuild when the config option changes, but I'm not sure how that
> actually works.

Here is my take for zstd which I've been using for a while now.
(zstd levels above 19 need the '--ultra' switch, hence the honkytonk below).

--
 From 2e9a0e058e10a428d2ee079b969627e475cc0f2e Mon Sep 17 00:00:00 2001
From: Tor Vic <torvic9@mailbox.org>
Date: Tue, 6 Aug 2024 11:24:32 +0200
Subject: [PATCH] Kbuild, zstd: Allow users to choose a compression level for
  the kernel image

Signed-off-by: Tor Vic <torvic9@mailbox.org>
---
  init/Kconfig         | 13 +++++++++++++
  scripts/Makefile.lib |  9 ++++++++-
  2 files changed, 21 insertions(+), 1 deletion(-)

diff --git a/init/Kconfig b/init/Kconfig
index 105cdd05db759..9c39bc17964de 100644
--- a/init/Kconfig
+++ b/init/Kconfig
@@ -380,6 +380,19 @@ config KERNEL_UNCOMPRESSED

  endchoice

+menu "ZSTD compression options"
+	depends on KERNEL_ZSTD
+
+config ZSTD_COMPRESSION_LVL
+	int "Compression level (1-22)"
+	range 1 22
+	default "22"
+	help
+	  Choose a compression level for zstd kernel compression.
+	  Default is 22, which is the maximum.
+
+endmenu
+
  config DEFAULT_INIT
  	string "Default init path"
  	default ""
diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
index 7395200538da8..58884363ebc62 100644
--- a/scripts/Makefile.lib
+++ b/scripts/Makefile.lib
@@ -516,6 +516,13 @@ quiet_cmd_xzmisc = XZMISC  $@
  # decompression is used, like initramfs decompression, zstd22 should 
likely not
  # be used because it would require zstd to allocate a 128 MB buffer.

+ifdef CONFIG_ZSTD_COMPRESSION_LVL
+zstd_comp_lvl	:= $(CONFIG_ZSTD_COMPRESSION_LVL)
+ifeq ($(call test-gt, $(zstd_comp_lvl), 19),y)
+zstd_comp_lvl	+= --ultra
+endif
+endif
+
  quiet_cmd_zstd = ZSTD    $@
        cmd_zstd = cat $(real-prereqs) | $(ZSTD) -19 > $@

@@ -523,7 +530,7 @@ quiet_cmd_zstd22 = ZSTD22  $@
        cmd_zstd22 = cat $(real-prereqs) | $(ZSTD) -22 --ultra > $@

  quiet_cmd_zstd22_with_size = ZSTD22  $@
-      cmd_zstd22_with_size = { cat $(real-prereqs) | $(ZSTD) -22 
--ultra; $(size_append); } > $@
+      cmd_zstd22_with_size = { cat $(real-prereqs) | $(ZSTD) -T0 
-$(zstd_comp_lvl); $(size_append); } > $@

  # ASM offsets
  # 
---------------------------------------------------------------------------
-- 


