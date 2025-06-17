Return-Path: <linux-kbuild+bounces-7527-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B7C6ADDCDD
	for <lists+linux-kbuild@lfdr.de>; Tue, 17 Jun 2025 22:04:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E688E188A1E0
	for <lists+linux-kbuild@lfdr.de>; Tue, 17 Jun 2025 20:04:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D3692E54D0;
	Tue, 17 Jun 2025 20:04:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nFoLuLhi"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D71902E3AF8;
	Tue, 17 Jun 2025 20:04:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750190650; cv=none; b=eQHc91cK+QIrkcqHWGoAa4wPL3BcaYq0wxXUaAw/KzA9PcLSOOyETS7FfOBFCUa2EfUXNlSu4dEMz7L1TiIwMLLC9DmUjqaSOM0d9zf7Nw0MzHqHJpYtbBZ81uDBr/uftBF+fVUvQNwBRO9o5agRLikiG4kWwiuI3/Hn2b4fcxk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750190650; c=relaxed/simple;
	bh=pGjplF3VV7f7WBNYLa3u+BbCGJciyZq1HNlyXp3mq4g=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GpWxELCzVA1x2BeUeH1QqvbJPBcHzgjSaC1c52/m8DNPKgWlhyujpGehOBrQ64JQRp4Qibg1/WfbfNIiIarFKeoBGQbjZYUuIMf/iVEMq73LdhjFnN58Jo5BqLBf9yLUO6YuoYa8a2aQVbCqR3ZYdIonajIRI7vGpm5ZbrK9W5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nFoLuLhi; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 42536C4CEE3;
	Tue, 17 Jun 2025 20:04:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750190650;
	bh=pGjplF3VV7f7WBNYLa3u+BbCGJciyZq1HNlyXp3mq4g=;
	h=Date:From:To:Cc:Subject:From;
	b=nFoLuLhi7ViutAtgg+glKMXV6bKjaxoHVsC3uK+dwzUebTq8BI19iUouQlQY2tj+c
	 e+6Bmf1fK0m4x6NegQ1y8ZQ5SBqGbszHJLxjhdPGYIj4y10XCJQDhmgX8t7sjHI/1y
	 p+5vVxigSyKwvPFICIEteKCoOq8X9w7sTdEQtyS0qNwWeB8JJwcmvtre5/eRXMqcFJ
	 xde65K5abt5viLM9vvf1YRCVx1/QMojLkHI7y9WKqCTZeprLqOEZiDzFLTHPzgeTo/
	 U/BbEEb49YphiO+3xiGa+hp0SNmi1/6Ebg8lVXMcmLbcPij78qQNntmOH20KhIF/DK
	 0hHX/yP5agzpg==
Date: Tue, 17 Jun 2025 13:04:06 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-kbuild@vger.kernel.org, Nicolas Schier <nicolas@fjasle.eu>
Subject: as-instr in Kbuild broken for arch/arm
Message-ID: <20250617200406.GA3636948@ax162>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Masahiro,

I backported commit d5c8d6e0fa61 ("kbuild: Update assembler calls to use
proper flags and language target") to 5.4 due to an upstream clang
change that necessitates this [1] but it causes a failure for as-instr
with arm [2] because arch/arm/Makefile uses '-include asm/unified.h' for
KBUILD_AFLAGS but LINUXINCLUDE is not present in the as-instr command,
resulting in

  <built-in>:1:10: fatal error: 'asm/unified.h' file not found
      1 | #include "asm/unified.h"
        |          ^~~~~~~~~~~~~~~
  1 error generated.

There does not appear to be any uses of as-instr within Kbuild (as
opposed to Kconfig) for arch/arm after commit 541ad0150ca4 ("arm: Remove
32bit KVM host support") in 5.7 but as far as I can tell, it is still
possible to hit this issue in upstream if one were to be added.

I see two obvious solutions but I am not sure what you would prefer.

1. Add LINUXINCLUDE to the as-instr invocation, which would ensure
relative '-include' flags can always be interpreted correctly, but I am
unsure if this has other implications.

diff --git a/scripts/Makefile.compiler b/scripts/Makefile.compiler
index ef91910de265..3dc814f0cae8 100644
--- a/scripts/Makefile.compiler
+++ b/scripts/Makefile.compiler
@@ -38,7 +38,7 @@ as-option = $(call try-run,\
 # Usage: aflags-y += $(call as-instr,instr,option1,option2)
 
 as-instr = $(call try-run,\
-	printf "%b\n" "$(1)" | $(CC) -Werror $(CLANG_FLAGS) $(KBUILD_AFLAGS) -Wa$(comma)--fatal-warnings -c -x assembler-with-cpp -o "$$TMP" -,$(2),$(3))
+	printf "%b\n" "$(1)" | $(CC) -Werror $(CLANG_FLAGS) $(LINUXINCLUDE) $(KBUILD_AFLAGS) -Wa$(comma)--fatal-warnings -c -x assembler-with-cpp -o "$$TMP" -,$(2),$(3))
 
 # __cc-option
 # Usage: MY_CFLAGS += $(call __cc-option,$(CC),$(MY_CFLAGS),-march=winchip-c6,-march=i586)

2. Turn 'asm/unified.h' into an absolute path, which easily fixes this
particular instance but does not prevent it from occurring again. It
seems unlikely that it would because '-include' does not appear to be
too common across the tree but I am always leery of silent failures like
this.

diff --git a/arch/arm/Makefile b/arch/arm/Makefile
index 4808d3ed98e4..e31e95ffd33f 100644
--- a/arch/arm/Makefile
+++ b/arch/arm/Makefile
@@ -149,7 +149,7 @@ endif
 # Need -Uarm for gcc < 3.x
 KBUILD_CPPFLAGS	+=$(cpp-y)
 KBUILD_CFLAGS	+=$(CFLAGS_ABI) $(CFLAGS_ISA) $(arch-y) $(tune-y) $(call cc-option,-mshort-load-bytes,$(call cc-option,-malignment-traps,)) -msoft-float -Uarm
-KBUILD_AFLAGS	+=$(CFLAGS_ABI) $(AFLAGS_ISA) -Wa,$(arch-y) $(tune-y) -include asm/unified.h -msoft-float
+KBUILD_AFLAGS	+=$(CFLAGS_ABI) $(AFLAGS_ISA) -Wa,$(arch-y) $(tune-y) -include $(srctree)/arch/arm/include/asm/unified.h -msoft-float
 KBUILD_RUSTFLAGS += --target=arm-unknown-linux-gnueabi
 
 CHECKFLAGS	+= -D__arm__

[1]: https://lore.kernel.org/20250604233141.GA2374479@ax162/
[2]: https://lore.kernel.org/CACo-S-1qbCX4WAVFA63dWfHtrRHZBTyyr2js8Lx=Az03XHTTHg@mail.gmail.com/

Cheers,
Nathan

