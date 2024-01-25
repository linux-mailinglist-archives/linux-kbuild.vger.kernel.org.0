Return-Path: <linux-kbuild+bounces-651-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A4A383CA0F
	for <lists+linux-kbuild@lfdr.de>; Thu, 25 Jan 2024 18:32:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0D875294842
	for <lists+linux-kbuild@lfdr.de>; Thu, 25 Jan 2024 17:32:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D88F131736;
	Thu, 25 Jan 2024 17:32:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XFn3NOYn"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0ECDF79C7;
	Thu, 25 Jan 2024 17:32:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706203938; cv=none; b=thG1yqcv1fZgwgx+19OIJi2+xi2Eguv6bPCFRnWEkUBv3bV9FlL6+r2B4zDFpoccOuGRfxiKp5SSey6m5ICdeN1MObmFslBz6MiiuT69IQn2WzDS3cj4KyPJRHFBcEJIfkhBGerrIuVAKrWvG34iaknYRYxAVKjcv9wOqFfKOak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706203938; c=relaxed/simple;
	bh=IDSSBzPhxzI+ZK3MxpGpT7LOXd777sA7SwQ1ZR2C1s4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=g0xR7VDYUJlSrAPqGdsiDysHVNMY0ub4h01qEoQNgk0v0b5elA7i0A907J8Uz4PlC2MpSVUAzmi5Gif5JJDcT1Fb0luSkFqYJVHqXnA1pFMqG7UzWGWDr5W3syb0rjtPmcESmP2y/l3zEez8Poy52FxomLqhzs67Qi+SvCmmFSs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XFn3NOYn; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28BBAC433C7;
	Thu, 25 Jan 2024 17:32:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706203937;
	bh=IDSSBzPhxzI+ZK3MxpGpT7LOXd777sA7SwQ1ZR2C1s4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=XFn3NOYndZhJ2KFChTNTUAi9PV1wJbswY7JOjNIj4+XEgp8qCtCZYARLiv5YNm2fv
	 Xfr9vt36bv9KIMKzMShzfACzod4M/vOm64cRl4AGF37q97uQq2Q4KeX0OXxzS22D7g
	 MgiA0Ib1ifvakVI2o8EoEkfHyybf0eaTsKKhzRClTi0Cp4gIrdlxXXPpbMX6e6zbSd
	 LvAWmBiw+1LAPf0bXTHIJm1oCj9I8nua8nuzgphr1KVLDYrDJHg9yVbRHwIKum1qj3
	 +SKvxxWteyxCeAvilAUGM/FQ9pTj6H4gv/8S7kAv9IuXsNDZ3Rw1d1o3Pmvq2xFzrM
	 NC5V/djg1TtVA==
From: Nathan Chancellor <nathan@kernel.org>
Date: Thu, 25 Jan 2024 10:32:11 -0700
Subject: [PATCH 1/2] kbuild: Add -Wa,--fatal-warnings to as-instr
 invocation
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240125-fix-riscv-option-arch-llvm-18-v1-1-390ac9cc3cd0@kernel.org>
References: <20240125-fix-riscv-option-arch-llvm-18-v1-0-390ac9cc3cd0@kernel.org>
In-Reply-To: <20240125-fix-riscv-option-arch-llvm-18-v1-0-390ac9cc3cd0@kernel.org>
To: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
 masahiroy@kernel.org
Cc: nicolas@fjasle.eu, andy.chiu@sifive.com, conor.dooley@microchip.com, 
 linux-riscv@lists.infradead.org, linux-kbuild@vger.kernel.org, 
 llvm@lists.linux.dev, patches@lists.linux.dev, stable@vger.kernel.org, 
 Eric Biggers <ebiggers@kernel.org>, Nathan Chancellor <nathan@kernel.org>
X-Mailer: b4 0.13-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2280; i=nathan@kernel.org;
 h=from:subject:message-id; bh=IDSSBzPhxzI+ZK3MxpGpT7LOXd777sA7SwQ1ZR2C1s4=;
 b=owGbwMvMwCUmm602sfCA1DTG02pJDKmbZsu7K6zaXpv59fmm4t4LfcbtCm9jLi6ssZYLLWOee
 vmvbhJnRykLgxgXg6yYIkv1Y9XjhoZzzjLeODUJZg4rE8gQBi5OAZhIkRDD//B3jdx17xQfM9iZ
 pRb/+3snLFAuM/FoKZPe0zvH17zUN2L4zaZcGrX4yv84AfeJ3nziev6BfF/4DA599lxStzMjqDC
 KDQA=
X-Developer-Key: i=nathan@kernel.org; a=openpgp;
 fpr=2437CB76E544CB6AB3D9DFD399739260CB6CB716

Certain assembler instruction tests may only induce warnings from the
assembler on an unsupported instruction or option, which causes as-instr
to succeed when it was expected to fail. Some tests workaround this
limitation by additionally testing that invalid input fails as expected.
However, this is fragile if the assembler is changed to accept the
invalid input, as it will cause the instruction/option to be unavailable
like it was unsupported even when it is.

Use '-Wa,--fatal-warnings' in the as-instr macro to turn these warnings
into hard errors, which avoids this fragility and makes tests more
robust and well formed.

Cc: stable@vger.kernel.org
Suggested-by: Eric Biggers <ebiggers@kernel.org>
Signed-off-by: Nathan Chancellor <nathan@kernel.org>
---
 scripts/Kconfig.include   | 2 +-
 scripts/Makefile.compiler | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/Kconfig.include b/scripts/Kconfig.include
index 5a84b6443875..3ee8ecfb8c04 100644
--- a/scripts/Kconfig.include
+++ b/scripts/Kconfig.include
@@ -33,7 +33,7 @@ ld-option = $(success,$(LD) -v $(1))
 
 # $(as-instr,<instr>)
 # Return y if the assembler supports <instr>, n otherwise
-as-instr = $(success,printf "%b\n" "$(1)" | $(CC) $(CLANG_FLAGS) -c -x assembler-with-cpp -o /dev/null -)
+as-instr = $(success,printf "%b\n" "$(1)" | $(CC) $(CLANG_FLAGS) -Wa$(comma)--fatal-warnings -c -x assembler-with-cpp -o /dev/null -)
 
 # check if $(CC) and $(LD) exist
 $(error-if,$(failure,command -v $(CC)),C compiler '$(CC)' not found)
diff --git a/scripts/Makefile.compiler b/scripts/Makefile.compiler
index 8fcb427405a6..92be0c9a13ee 100644
--- a/scripts/Makefile.compiler
+++ b/scripts/Makefile.compiler
@@ -38,7 +38,7 @@ as-option = $(call try-run,\
 # Usage: aflags-y += $(call as-instr,instr,option1,option2)
 
 as-instr = $(call try-run,\
-	printf "%b\n" "$(1)" | $(CC) -Werror $(CLANG_FLAGS) $(KBUILD_AFLAGS) -c -x assembler-with-cpp -o "$$TMP" -,$(2),$(3))
+	printf "%b\n" "$(1)" | $(CC) -Werror $(CLANG_FLAGS) $(KBUILD_AFLAGS) -Wa$(comma)--fatal-warnings -c -x assembler-with-cpp -o "$$TMP" -,$(2),$(3))
 
 # __cc-option
 # Usage: MY_CFLAGS += $(call __cc-option,$(CC),$(MY_CFLAGS),-march=winchip-c6,-march=i586)

-- 
2.43.0


