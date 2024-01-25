Return-Path: <linux-kbuild+bounces-650-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AD0083CA0D
	for <lists+linux-kbuild@lfdr.de>; Thu, 25 Jan 2024 18:32:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4DF7D1C20CF1
	for <lists+linux-kbuild@lfdr.de>; Thu, 25 Jan 2024 17:32:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9684D745E9;
	Thu, 25 Jan 2024 17:32:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CWxf9fgh"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66E1B79C7;
	Thu, 25 Jan 2024 17:32:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706203937; cv=none; b=lWxgtmt3EBsiif94lSsNifvJpf+WvJ+b4irwE+DmkOKojFZGm8uqymKtT25yhnKBZ8XOUdiHqU61jc6jcYpgm96axqrS7bUuRFiPi6PAKPQDctfU6ity69zkioety+gsBEhalAlSdoBMGHKfFdwG4of/6vvjdu07TR+Djtap8SY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706203937; c=relaxed/simple;
	bh=3PvCiAQrtJD/zuf2t8VwlvCpBAFoHiP16hfmstASs9E=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=XiTxViLzi1W6dj1wwDMYuoMNwHIEJ1eBXjnk4QTxXWbyrrq+RI/QT6ROZHR5DdQjduDeRM1BR5Y5JNoNnP+NCqX977dSZudheMtXcj87UAVg4GfdpYwUSlC3Bz0+ALUPTq0XnCEkDepaaPGCt/tF1ICe7okwOO9/IkLcLBCff3s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CWxf9fgh; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41D85C433F1;
	Thu, 25 Jan 2024 17:32:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706203937;
	bh=3PvCiAQrtJD/zuf2t8VwlvCpBAFoHiP16hfmstASs9E=;
	h=From:Subject:Date:To:Cc:From;
	b=CWxf9fgh7SWQbUv+w60Q5mT7c9OYxjTpVll1i2bNNiKg/wlwZujGzhs6cb7vgRveQ
	 JIbAMjVa0NuS6kCH5gSwTCOSdZJbgSsvyE1jlYQgtc3122EOKqhYbNyq/HUJEAQcCe
	 AE67+vBF68+wDM0d/uqKkmi7ddKkTU/iGyYZ/iRxhGwICCehWPNvirHw2VprPJJKCp
	 qt3DoTAajdBm5iVbw6m1bKg0sKzk1cKsHNVCok1/vJFBTxdFBYZG9gcl6D8rgWa5mT
	 LMMs1euY2mE26V3uO1k002IEp4fjCyZe3l9YU6JaJXjEz9JSshp/uSnlDr86s44SSW
	 DDLQQNqSgC02A==
From: Nathan Chancellor <nathan@kernel.org>
Subject: [PATCH 0/2] RISC-V: Fix CONFIG_AS_HAS_OPTION_ARCH with tip of tree
 LLVM
Date: Thu, 25 Jan 2024 10:32:10 -0700
Message-Id: <20240125-fix-riscv-option-arch-llvm-18-v1-0-390ac9cc3cd0@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABqbsmUC/x2MSwqFMAwAryJZv0Bbxd9VxEWtUQP+SKUI4t0Nb
 zkwMw9EEqYIbfaAUOLIx65gfxmExe8zIY/K4IwrjHUFTnyjcAwJj/NSGb2EBdc1bWhrzMNA1WA
 a72wJ+jiFNPj/u/59P/u0YW9vAAAA
To: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
 masahiroy@kernel.org
Cc: nicolas@fjasle.eu, andy.chiu@sifive.com, conor.dooley@microchip.com, 
 linux-riscv@lists.infradead.org, linux-kbuild@vger.kernel.org, 
 llvm@lists.linux.dev, patches@lists.linux.dev, stable@vger.kernel.org, 
 Eric Biggers <ebiggers@kernel.org>, Nathan Chancellor <nathan@kernel.org>
X-Mailer: b4 0.13-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1526; i=nathan@kernel.org;
 h=from:subject:message-id; bh=3PvCiAQrtJD/zuf2t8VwlvCpBAFoHiP16hfmstASs9E=;
 b=owGbwMvMwCUmm602sfCA1DTG02pJDKmbZsszSfLFTrfQc+X5/21XXcmGTcwG/6/tad9ZEOjzz
 2TXzOU1HaUsDGJcDLJiiizVj1WPGxrOOct449QkmDmsTCBDGLg4BWAi8ucZGdY+zVm9yNNafwG3
 gMmPxYyCm7Y09Pt2flr47PSRXtbDvosY/gd7PHZ1uLt4qpwAw501soe+ZT6qnpr06I+v7vSlXL5
 SQYwA
X-Developer-Key: i=nathan@kernel.org; a=openpgp;
 fpr=2437CB76E544CB6AB3D9DFD399739260CB6CB716

Hi all,

Eric reported that builds of LLVM with [1] (close to tip of tree) have
CONFIG_AS_HAS_OPTION_ARCH=n because the test for expected failure on
invalid input has started succeeding.

This Kconfig test was added because '.option arch' only causes an
assembler warning when it is unsupported, rather than a hard error,
which is what users of as-instr expect when something is unsupported.

This can be resolved by turning assembler warnings into errors with
'-Wa,--fatal-warnings' like we do with the compiler with '-Werror',
which is what the first patch does. The second patch removes the invalid
test, as the valid test is good enough with fatal warnings.

I have diffed several configurations for the different architectures
that use as-instr and I have found no issues.

I think this could go in through either the kbuild or RISC-V tree with
sufficient acks but I will let them fight over who takes it :)

[1]: https://github.com/llvm/llvm-project/commit/3ac9fe69f70a2b3541266daedbaaa7dc9c007a2a

---
Nathan Chancellor (2):
      kbuild: Add -Wa,--fatal-warnings to as-instr invocation
      RISC-V: Drop invalid test from CONFIG_AS_HAS_OPTION_ARCH

 arch/riscv/Kconfig        | 1 -
 scripts/Kconfig.include   | 2 +-
 scripts/Makefile.compiler | 2 +-
 3 files changed, 2 insertions(+), 3 deletions(-)
---
base-commit: 6613476e225e090cc9aad49be7fa504e290dd33d
change-id: 20240124-fix-riscv-option-arch-llvm-18-3cbe7b09a216

Best regards,
-- 
Nathan Chancellor <nathan@kernel.org>


