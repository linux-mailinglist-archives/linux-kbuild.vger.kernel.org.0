Return-Path: <linux-kbuild+bounces-2570-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id F26B393402B
	for <lists+linux-kbuild@lfdr.de>; Wed, 17 Jul 2024 18:12:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A5D11282E27
	for <lists+linux-kbuild@lfdr.de>; Wed, 17 Jul 2024 16:12:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 62378181CFB;
	Wed, 17 Jul 2024 16:12:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RXZ4CB77"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26057181BA0;
	Wed, 17 Jul 2024 16:12:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721232729; cv=none; b=kYTCdV0G5hnF9wNnm15Y4s4WekddKsE01h/RVx7IGYG2QuopjK/rO1XWrYcInZGcbxP5eVaJiCf2A3MEXBQbgjO46UaUxvHcby3BiWYPIEtTbgU0iGIzOnxaWk9jQjhAY+Z5q+ZyeYwvsvSScHbnfu1is9GwdyKTrNAYws/Tu2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721232729; c=relaxed/simple;
	bh=+vuBp56A/4xWmV9rsrvj3pG/ujdv01S+Xt8klquQAiU=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=qG56rcKDsjzSVwYg+78cXhIJ+9dnY3EaF1W5nZJROI9ZHMBr9WFyoVOur+fz0YOoXiQFLWG7APR2B+IOJ2/szfdZ0vOMN7oUBQgx6nv6ShW9ieJbJ2gR7Pta7Ldty8AsQ2/zvHzXUUGd5DHsCyhF0xvPtFLlLRBSIcq6IF8wvto=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RXZ4CB77; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id AFF64C2BD10;
	Wed, 17 Jul 2024 16:12:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721232728;
	bh=+vuBp56A/4xWmV9rsrvj3pG/ujdv01S+Xt8klquQAiU=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=RXZ4CB77y2QCIV3tBLW1HVx8My6V8GIGPAUsQp5DO/Ab2bQqwPp4/krPQ7/ksD4Po
	 UjAXTW8nh8tmIXivRc05xJRQMggCyqSh+6rlrpvY4O+Eeyan3Dd/3jX6rjogRzzvuv
	 uSAuPcmA77G8YpfXZ7HinNIIJfdUrZ7c5/PLsiS7YbWc7GFJnhfNlor63Q1FkqC1t4
	 ISeZZ6Ih+fmJvBPTF+hlBZbSu1E/zN3K8/azMW2vjqZne6JI+Z8p7Se9YkO8h2QzYh
	 OSfgkpFMQc+l/AYkKJJM6a8bBvjBs7FgbpqqM8ZRNDvO1UaZOKlHvxF/VhcXu+iOdc
	 51e5wxd4Qco0g==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A8DAC3DA60;
	Wed, 17 Jul 2024 16:12:08 +0000 (UTC)
From: Koakuma via B4 Relay <devnull+koachan.protonmail.com@kernel.org>
Subject: [PATCH v2 0/2] sparc/build: Rework CFLAGS for clang compatibility
Date: Wed, 17 Jul 2024 23:10:14 +0700
Message-Id: <20240717-sparc-cflags-v2-0-259407e6eb5f@protonmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOfsl2YC/3XMSwrDIBSF4a2EO67FiFTaUfdRMvBxTS4kKhqkJ
 bj32sw7/A+c74CCmbDAYzggY6VCMfQQlwHsosOMjFxvEFxIfhOclaSzZdavei4MlRfOGCfN3UG
 /pIye3if3mnovVPaYP6dex9/6B6ojG5kxWjnuvXJSPFOOewybpvVq4wZTa+0LvHP85q0AAAA=
To: "David S. Miller" <davem@davemloft.net>, 
 Andreas Larsson <andreas@gaisler.com>, 
 Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <ndesaulniers@google.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 glaubitz@physik.fu-berlin.de, Masahiro Yamada <masahiroy@kernel.org>, 
 Nicolas Schier <nicolas@fjasle.eu>
Cc: sparclinux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 llvm@lists.linux.dev, linux-kbuild@vger.kernel.org, 
 Koakuma <koachan@protonmail.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1721232726; l=2056;
 i=koachan@protonmail.com; s=20240620; h=from:subject:message-id;
 bh=+vuBp56A/4xWmV9rsrvj3pG/ujdv01S+Xt8klquQAiU=;
 b=O6Z8IG8iXTMBNUmCsTKUbdhKajZSKd1rfBULOK4P0CeyePF/ai0dkuUh+Ym65lpah6t2VSJQv
 odE66/ayk4hD03y34EN5PETyjz8GIeVxthqBO1vd//cczyEaRO6aLkv
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

- `-fcall-used-*` flags is removed as it is not supported in clang.
  Those should be safe to remove; the compiler will stop using the
  registers specified as temporaries, but it is a safe change wrt.
  the ABI. Assembly code can still use those registers as needed.
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
Changes in v2:
- Remove the -mv8plus change; it will be handled on clang side:
  https://github.com/llvm/llvm-project/pull/98713
- Add CLANG_TARGET_FLAGS as suggested in v1 review.
- Link to v1: https://lore.kernel.org/r/20240620-sparc-cflags-v1-1-bba7d0ff7d42@protonmail.com

---
Koakuma (2):
      sparc/build: Remove all usage of -fcall-used* flags
      sparc/build: Add SPARC target flags for compiling with clang

 arch/sparc/Makefile      | 4 ++--
 arch/sparc/vdso/Makefile | 2 +-
 scripts/Makefile.clang   | 1 +
 3 files changed, 4 insertions(+), 3 deletions(-)
---
base-commit: 4d145e3f830ba2c2745b42bfba5c2f8fcb8d078a
change-id: 20240620-sparc-cflags-e7f2dbbd4b9d

Best regards,
-- 
Koakuma <koachan@protonmail.com>



