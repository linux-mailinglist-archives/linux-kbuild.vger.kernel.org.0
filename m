Return-Path: <linux-kbuild+bounces-652-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CE13283CA12
	for <lists+linux-kbuild@lfdr.de>; Thu, 25 Jan 2024 18:32:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6FA98B20F76
	for <lists+linux-kbuild@lfdr.de>; Thu, 25 Jan 2024 17:32:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 79F43131758;
	Thu, 25 Jan 2024 17:32:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="W6W/YgzM"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 420A079C7;
	Thu, 25 Jan 2024 17:32:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706203939; cv=none; b=tTnw+43V5A9UEB8X27gkEHiT0aHobtthuHJ+xFrLl+B4GWmhAOi2gLW5kzD5jBjzi9faSXnMGLgEt1aVR+WpWjYx/jxjirh18yplJQV9iYfmQUOgkLA6HU2FKP1gYsw8Aar4/NCQd+FxTT2HuaJIR9IwGeSzVPOWs0zlJxG1sVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706203939; c=relaxed/simple;
	bh=lICtxkQ3NvVShAwZIuLeByavdbgR2qlvf8P4owRHXS0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qgVJA8YdVcxSkMTaH/Ln7CHAx9rJ/ft58QmtWq0nlPQtxlVv73wB6ytfVhJAXQk6AiYfLgWIm4ZjyXao1UBltbY4QY7wEcDvE4OcxQIkPYUVGdWEr4YAXSUlkvoGnm2k1eN3x1su7fdwPez7rjqsYIoLtl+5WIaIAQQkoA+Ltyg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=W6W/YgzM; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 128E4C43399;
	Thu, 25 Jan 2024 17:32:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706203938;
	bh=lICtxkQ3NvVShAwZIuLeByavdbgR2qlvf8P4owRHXS0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=W6W/YgzMa+vfIWb5fX28wPCUuhezAVgqad/dW1hojJysx+W3zkJX2JeLMuTN1Czdw
	 XYIVjy3QPgiNiEEPG45JgquTNPbEuET9cRyjDlSBUjX5Cb2fXoGJJ/MPsG2VCYPGNN
	 ct+R1QRzVTmlvTNUj5FzmzMQUa4Gl8JpUZli4axBg0lolr38mgqahfUMkf9J8RnLjf
	 kFTJiLqFD2HFiaW6S+3Q+lLJtjaSv08qHf/qTj6CYeVL+U4HZCMNFegfhGyP/ndg3J
	 WJT95mKdfiUVF3wLoGMQJj4HjbSByQMlf3m6ikTWHr9oo5RRNFmyL2cYwDbiAsHi+E
	 PLKymFEVtVD7Q==
From: Nathan Chancellor <nathan@kernel.org>
Date: Thu, 25 Jan 2024 10:32:12 -0700
Subject: [PATCH 2/2] RISC-V: Drop invalid test from
 CONFIG_AS_HAS_OPTION_ARCH
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240125-fix-riscv-option-arch-llvm-18-v1-2-390ac9cc3cd0@kernel.org>
References: <20240125-fix-riscv-option-arch-llvm-18-v1-0-390ac9cc3cd0@kernel.org>
In-Reply-To: <20240125-fix-riscv-option-arch-llvm-18-v1-0-390ac9cc3cd0@kernel.org>
To: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
 masahiroy@kernel.org
Cc: nicolas@fjasle.eu, andy.chiu@sifive.com, conor.dooley@microchip.com, 
 linux-riscv@lists.infradead.org, linux-kbuild@vger.kernel.org, 
 llvm@lists.linux.dev, patches@lists.linux.dev, stable@vger.kernel.org, 
 Eric Biggers <ebiggers@kernel.org>, Nathan Chancellor <nathan@kernel.org>
X-Mailer: b4 0.13-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2365; i=nathan@kernel.org;
 h=from:subject:message-id; bh=lICtxkQ3NvVShAwZIuLeByavdbgR2qlvf8P4owRHXS0=;
 b=owGbwMvMwCUmm602sfCA1DTG02pJDKmbZissneNvc+U8g8IkiV2P1y8V+vnuj1eFVfVy31c+S
 sc4V1/d31HKwiDGxSArpshS/Vj1uKHhnLOMN05NgpnDygQyhIGLUwAmsi6L4X9Wx9n0S4s2cUzV
 q/lYfnDKWrdt3qvWLPzFHJgzVbXZdIcYI8P/j63TYrYsVLNiNKmSnDiZx/TBt7jCBDb+hNe6wUx
 mFUwA
X-Developer-Key: i=nathan@kernel.org; a=openpgp;
 fpr=2437CB76E544CB6AB3D9DFD399739260CB6CB716

Commit e4bb020f3dbb ("riscv: detect assembler support for .option arch")
added two tests, one for a valid value to '.option arch' that should
succeed and one for an invalid value that is expected to fail to make
sure that support for '.option arch' is properly detected because Clang
does not error when '.option arch' is not supported:

  $ clang --target=riscv64-linux-gnu -Werror -x assembler -c -o /dev/null <(echo '.option arch, +m')
  /dev/fd/63:1:9: warning: unknown option, expected 'push', 'pop', 'rvc', 'norvc', 'relax' or 'norelax'
  .option arch, +m
          ^
  $ echo $?
  0

Unfortunately, the invalid test started being accepted by Clang after
the linked llvm-project change, which causes CONFIG_AS_HAS_OPTION_ARCH
and configurations that depend on it to be silently disabled, even
though those versions do support '.option arch'.

The invalid test can be avoided altogether by using
'-Wa,--fatal-warnings', which will turn all assembler warnings into
errors, like '-Werror' does for the compiler:

  $ clang --target=riscv64-linux-gnu -Werror -Wa,--fatal-warnings -x assembler -c -o /dev/null <(echo '.option arch, +m')
  /dev/fd/63:1:9: error: unknown option, expected 'push', 'pop', 'rvc', 'norvc', 'relax' or 'norelax'
  .option arch, +m
          ^
  $ echo $?
  1

The as-instr macros have been updated to make use of this flag, so
remove the invalid test, which allows CONFIG_AS_HAS_OPTION_ARCH to work
for all compiler versions.

Cc: stable@vger.kernel.org
Fixes: e4bb020f3dbb ("riscv: detect assembler support for .option arch")
Link: https://github.com/llvm/llvm-project/commit/3ac9fe69f70a2b3541266daedbaaa7dc9c007a2a
Reported-by: Eric Biggers <ebiggers@kernel.org>
Closes: https://lore.kernel.org/r/20240121011341.GA97368@sol.localdomain/
Signed-off-by: Nathan Chancellor <nathan@kernel.org>
---
 arch/riscv/Kconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index bffbd869a068..e3142ce531a0 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -315,7 +315,6 @@ config AS_HAS_OPTION_ARCH
 	# https://reviews.llvm.org/D123515
 	def_bool y
 	depends on $(as-instr, .option arch$(comma) +m)
-	depends on !$(as-instr, .option arch$(comma) -i)
 
 source "arch/riscv/Kconfig.socs"
 source "arch/riscv/Kconfig.errata"

-- 
2.43.0


