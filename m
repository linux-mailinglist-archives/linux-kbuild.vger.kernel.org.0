Return-Path: <linux-kbuild+bounces-4382-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AACC9B4C88
	for <lists+linux-kbuild@lfdr.de>; Tue, 29 Oct 2024 15:50:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0ECFEB22D7F
	for <lists+linux-kbuild@lfdr.de>; Tue, 29 Oct 2024 14:50:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E4B84191F6A;
	Tue, 29 Oct 2024 14:49:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="f8RUtOX9"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DCA018C939;
	Tue, 29 Oct 2024 14:49:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730213395; cv=none; b=Tu838YPZBsgor0Q3yJI4uAayquZ6eIgYW3m74CVCx+OfJCy1UKx9DqzFPuYhJKId9efdmeAEJqZGpFb3QfL09lFC9s1iDS4qsCiSKL6Hhd7Dp7VK9Q/Xd1/7afFoU/ZteVStUped0rZWsKKpBBNFhH7MqKXBHQpt9WhCx6ixZG0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730213395; c=relaxed/simple;
	bh=dxu8NGLbbkNXI+3HmhHSQPHx4jpdDIhPx1liJ8XwGUY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=HiSdPVl7tv3/3TrsXawKvx74dhH9x/tWSaha1ughQ6WKBHQZZfVpkXTWgz87zi9cQ37J9b44U9JT48jCf5R89DHK5maQ2xFHFFEvxpBiFJOdDejRmbQcK8UBOCSbkxyvxMF4YSDXayJ4btqg1qSqsNu+KRMKK/54jZRrseYocH8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=f8RUtOX9; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 26807C4CEE5;
	Tue, 29 Oct 2024 14:49:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730213395;
	bh=dxu8NGLbbkNXI+3HmhHSQPHx4jpdDIhPx1liJ8XwGUY=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=f8RUtOX9v/yr7teb2eTHS7GMgsyArQl3bsBlQfUT/GLqeOwtYLawn2oqrIQ5YNx/w
	 WH0xWqPx0aGpisGHk0uFNIuxzS77BGexeZFrNaqf4ZnSMK882MAi0j4vtLPS0/8vQ+
	 BDEozqc8eZjZxKEtOOeHQhvElKmxjZwzG0aJmmfSx+Lof8BbuNhgPOdB7uYS+BWo0O
	 ugMvSwpXBPtowayW0eWv0Ci6aNqUV5VD2htifb1EiTNabRS7YOnY75xYZn+R0FFGav
	 3vQw4Mk4DEkYa3qpphoVhK4T/RqBse54YsTJeEQU5nBIOf/rQmLepYNKXgZeXE7zmP
	 Z/y17BRY6NS/w==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 105C7D3A665;
	Tue, 29 Oct 2024 14:49:55 +0000 (UTC)
From: Koakuma via B4 Relay <devnull+koachan.protonmail.com@kernel.org>
Subject: [PATCH v3 0/2] sparc/build: Rework CFLAGS for clang compatibility
Date: Tue, 29 Oct 2024 21:49:06 +0700
Message-Id: <20241029-sparc-cflags-v3-0-b28745a6bd71@protonmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOL1IGcC/3XMTQqDMBCG4atI1p0Sp2qwq96jdJGfiQbUSCKhR
 bx7o5tCS5fvDN+zskjBUWTXYmWBkovOTzkup4LpXk4dgTO5GXKseIMc4iyDBm0H2UUgYdEoZSr
 VGpYncyDrngd3f+TuXVx8eB16KvfrHyiVUIJSUhhurTAV3ubgFz+N0g1n7Ue2awk/gijFl4DAA
 es2v6ghVdsfYdu2NzvMEAbvAAAA
X-Change-ID: 20240620-sparc-cflags-e7f2dbbd4b9d
To: "David S. Miller" <davem@davemloft.net>, 
 Andreas Larsson <andreas@gaisler.com>, 
 Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <ndesaulniers@google.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 glaubitz@physik.fu-berlin.de, Masahiro Yamada <masahiroy@kernel.org>, 
 Nicolas Schier <nicolas@fjasle.eu>, Jonathan Corbet <corbet@lwn.net>
Cc: sparclinux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 llvm@lists.linux.dev, linux-kbuild@vger.kernel.org, 
 linux-doc@vger.kernel.org, Koakuma <koachan@protonmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1730213393; l=2365;
 i=koachan@protonmail.com; s=20240620; h=from:subject:message-id;
 bh=dxu8NGLbbkNXI+3HmhHSQPHx4jpdDIhPx1liJ8XwGUY=;
 b=Cpa9Kjmy4yNXmh+4u4E9dL73GLbapjGZbMr1QhlAkTR5avAlOpIVo6RdEvVF63/G1AVuMrly0
 e8KpgKglyqaCUC2fR+c3tAIi+W+ay3g6BJ/7zN7p/pVdNLBcz8GMcJ5
X-Developer-Key: i=koachan@protonmail.com; a=ed25519;
 pk=UA59FS3yiAA1cnAAUZ1rehTmr6skh95PgkNRBLcoKCg=
X-Endpoint-Received: by B4 Relay for koachan@protonmail.com/20240620 with
 auth_id=174
X-Original-From: Koakuma <koachan@protonmail.com>
Reply-To: koachan@protonmail.com

Hello~

This changes the CFLAGS for building the SPARC kernel so that it can be
built with clang, as a follow up from the discussion in this thread:

https://lore.kernel.org/lkml/JAYB7uS-EdLABTR4iWZdtFOVa5MvlKosIrD_cKTzgeozCOGRM7lhxeLigFB1g3exX445I_W5VKB-tAzl2_G1zCVJRQjp67ODfsSqiZWOZ9o=@protonmail.com/T/#u

The changes are removal of various `-fcall-used-*` flags, and adding
clang target flags for SPARC:

- `-fcall-used-*` flags is gated behind cc-option as it is
  not supported in clang. It should be safe; clang won't use the registers
  specified as temporaries, but it is a safe change wrt. the ABI.
  Assembly code can still use those registers as needed.
  A cursory look at the assembly generated by GCC 13.2 shows that
  the compiler was able to reallocate uses of those registers into
  other temporary registers without adding extra spills, so there
  should be no change in performance.

- More trivial is to add CLANG_TARGET_FLAGS for SPARC target.

Building with these changes still result in a working kernel,
at least for Sun T5120, Oracle T4-1, and qemu virtual machines.

On the LLVM side, the effort for building Linux/SPARC is tracked here:
https://github.com/llvm/llvm-project/issues/40792

Signed-off-by: Koakuma <koachan@protonmail.com>
---
Changes in v3:
- Use cc-option to allow GCC to still use -fcall-used-* flags.
- Add documentation on building on SPARC, along with required LLVM version.
- Link to v2: https://lore.kernel.org/r/20240717-sparc-cflags-v2-0-259407e6eb5f@protonmail.com

Changes in v2:
- Remove the -mv8plus change; it will be handled on clang side:
  https://github.com/llvm/llvm-project/pull/98713
- Add CLANG_TARGET_FLAGS as suggested in v1 review.
- Link to v1: https://lore.kernel.org/r/20240620-sparc-cflags-v1-1-bba7d0ff7d42@protonmail.com

---
Koakuma (2):
      sparc/build: Put usage of -fcall-used* flags behind cc-option
      sparc/build: Add SPARC target flags for compiling with clang

 Documentation/kbuild/llvm.rst | 3 +++
 arch/sparc/Makefile           | 4 ++--
 arch/sparc/vdso/Makefile      | 2 +-
 scripts/Makefile.clang        | 1 +
 4 files changed, 7 insertions(+), 3 deletions(-)
---
base-commit: c2ee9f594da826bea183ed14f2cc029c719bf4da
change-id: 20240620-sparc-cflags-e7f2dbbd4b9d

Best regards,
-- 
Koakuma <koachan@protonmail.com>



