Return-Path: <linux-kbuild+bounces-5869-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C9074A42068
	for <lists+linux-kbuild@lfdr.de>; Mon, 24 Feb 2025 14:22:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0547316A8EC
	for <lists+linux-kbuild@lfdr.de>; Mon, 24 Feb 2025 13:22:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C76923ED56;
	Mon, 24 Feb 2025 13:21:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="tbIR93iK"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A364C248862
	for <linux-kbuild@vger.kernel.org>; Mon, 24 Feb 2025 13:21:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740403313; cv=none; b=VSCbE71ap3esU56nTR1Gpm+lovLAjotr6YyKmYng/IQfcDAJbYZfJq/taQAXNNqzirZCwF/xCJ+i1NxKQZbF8gHoh4YENrivJw86UtJuvDvZTRRfx4Z3aFi+ZSsgEeHBnKmXsOkI3mIMbC9iAcstJZSCuuNM/ZbHhipP0FI58ko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740403313; c=relaxed/simple;
	bh=Oy07TeCnfbpWPSwxM8Z6cTmvSYren2dJqc7NY7nv4nc=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=TvCLmr6HEYXofKHtreGvcMVPFOxLlB/OddaZRfcDeW1KXU+DElY5XjGY39t1OewnMk5jytDmt+pXrfynpI2cu3J4bHcoomcpKnweW++VrVWlQS3DD+ZWPT+t+kIwKcyvcB6gvAHLSMbCWMxTEr8RWCTMK7hS8dhVPJqY62nujpE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--ardb.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=tbIR93iK; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ardb.bounces.google.com
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-4398a60b61fso22448075e9.0
        for <linux-kbuild@vger.kernel.org>; Mon, 24 Feb 2025 05:21:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1740403310; x=1741008110; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=4G60LNJ4QUWH+5iAZPEr11sSYa924Pp9ggcWXrajw8Q=;
        b=tbIR93iKdigw1/o0TRkB3/RTJAita9boezEkYPqMXVR86sHP4dc3EkuDTAR/hE8wbZ
         4wIht5UzawlRlBDtWT5eYssueYWG8qU/xCP79NKAozzi4vrcj0tJ9q2Pb+Ux7Q6Zq89h
         hjQNTzQwc4fuBOA7cV4I1ukTsoZDSpcljCrVg5R+rA5YXWIXPTc69QI2YJDzq3HtX2xT
         q48L1N4zAAthjmYUv4Vprr/Ytv4R2n4VP/RqvyFsK3bbfCTpzw1jjd6/ACB42rwZuizJ
         nc1a+VZ0SKZcPVcNcavGVUiwezo7zSxy8PlX+178OPildnrlHBD49vmPwfnt2GACYqlK
         1CaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740403310; x=1741008110;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4G60LNJ4QUWH+5iAZPEr11sSYa924Pp9ggcWXrajw8Q=;
        b=Wc5PH6IoaPZSdyHlpHfTv/oSJF+nfWfiS93/Y3PlzRk3p+SGBL4k/m8WR2JWkm+jY9
         ASI0kU6ghhihHXGFXmk+411j9C10cjInmvtLNFsJtUyxgeyCbeecWWLjLh51DanQC6S+
         QGyfN0PtTqZBAa6U57ZQbhwBWg6Mvy4nV9yI2yoEufgC/l7v4pQRjNIFbfYcu5e6aTY6
         pihz8nAmpNMEZGNkyY+BtcY8Q+8siJ37+7TPhzI4of/Owz8pg8Spcx2xlhuacDZ+fWEa
         ErIdr54kcqt3et4bg7VPrL1XCHS6PFl1AvTPaAse+KWg3Y7MzuCeJNIn0flhrzjIUunH
         vomg==
X-Forwarded-Encrypted: i=1; AJvYcCWShzmKfBAw+u8sqina8bRsYfbzuj5KUg6AiClokcMYn3DIkVkXpDEyiBtP2DCi3dv3K5Go6Zu07WLmJd8=@vger.kernel.org
X-Gm-Message-State: AOJu0YylQyFqyviQC9OCN20SdqmcnN/18DehH7/ZeLaHiEiMZMlxGs58
	E7V8Hwurh0ThSb13WOIuQ4x8aQtoj8WapFTmZMcb1DaVy3/gNeNeEaoKA7IZc4LJMMQiiA==
X-Google-Smtp-Source: AGHT+IHHcPjN4jytk/EH4VMj8UFkSmrWefJL98q6vjgDpyjT4ufS9VD5paeSFiU3hrbVWuTwUf+OH+6h
X-Received: from wmbg6.prod.google.com ([2002:a05:600c:a406:b0:439:80fc:8bc9])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:3508:b0:439:99d1:d4a4
 with SMTP id 5b1f17b1804b1-439ae1f1864mr107315805e9.18.1740403310084; Mon, 24
 Feb 2025 05:21:50 -0800 (PST)
Date: Mon, 24 Feb 2025 14:21:33 +0100
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=2982; i=ardb@kernel.org;
 h=from:subject; bh=S2aIumU8fZBnlmZGEf1mwt6ddnpvhDqK3FOh22qSesk=;
 b=owGbwMvMwCFmkMcZplerG8N4Wi2JIX1PUaz9wbd3fT/f2llYJMlX/WdNsIdL1vwHl7cnpP96e
 rz27SP+jlIWBjEOBlkxRRaB2X/f7Tw9UarWeZYszBxWJpAhDFycAjARqSeMDI9Yl2i+yvD5MOvF
 D/Ev2co3nI3+zZhes2K3xJSpUZd2St1gZPjd3iiXN6W976/OHMlURtU3914cDXP7oXW9K5jpcGy jAycA
X-Mailer: git-send-email 2.48.1.601.g30ceb7b040-goog
Message-ID: <20250224132132.1765115-6-ardb+git@google.com>
Subject: [RFC PATCH 0/4] x86/build: Get rid of vmlinux postlink step
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-kernel@vger.kernel.org
Cc: x86@kernel.org, linux-kbuild@vger.kernel.org, 
	Ard Biesheuvel <ardb@kernel.org>, Masahiro Yamada <masahiroy@kernel.org>, Ingo Molnar <mingo@kernel.org>
Content-Type: text/plain; charset="UTF-8"

From: Ard Biesheuvel <ardb@kernel.org>

Kbuild supports an architecture specific Makefile.postlink file that is
invoked for the vmlinux target after it has been built. This Makefile
takes 'vmlinux' (which has just been built) as the target, and mangles
the file and/or constructs other intermediate artifacts from it.

This violates the general philosophy of Make, which is based on rules
and dependencies, and artifacts that are rebuilt only when any of their
dependencies have been updated.

Instead, the different incarnations of vmlinux that are consumed by
different stages of the build should be emitted as distinct files, where
rules and dependencies are used to define one in terms of the other.

This also works around an error observed here [0], where vmlinux is
deleted by Make because a subsequent step that consumes it as input
throws an error.

So refactor the vmlinux shell scripts and build rules so that
architectures that rely on --emit-relocs to construct vmlinux with
static relocations preserved will get a separate vmlinux.unstripped file
carrying those relocations. This removes the need for an imperative
postlink step, given that any rules that depend on the unstripped
vmlinux can now simply depend on vmlinux.unstripped, rather than inject
a build step into Makefile.postlink

S390 should be able to do the same. MIPS and RISC-V perform some
post-build checks on vmlinux, which is reasonable in principle for a
postlink step, although deleting vmlinux when the check fails is equally
unhelpful.

[0] https://lore.kernel.org/all/Z5ARucnUgqjwBnrp@gmail.com/T/#m731ed0206949fc3f39fcc8a7b82fe348a8fc80c4

Cc: Masahiro Yamada <masahiroy@kernel.org>
Cc: Ingo Molnar <mingo@kernel.org>

Ard Biesheuvel (4):
  Kbuild/link-vmlinux.sh: Make output file name configurable
  Kbuild: Introduce Kconfig symbol for linking vmlinux with relocations
  Kbuild: Create intermediate vmlinux build with relocations preserved
  x86: Get rid of Makefile.postlink

 Makefile                          |  4 ++
 arch/Kconfig                      |  7 ++++
 arch/mips/Kconfig                 |  1 +
 arch/mips/Makefile                |  4 --
 arch/mips/Makefile.postlink       |  2 +-
 arch/riscv/Kconfig                |  1 +
 arch/riscv/Makefile               |  2 +-
 arch/riscv/Makefile.postlink      | 11 +-----
 arch/riscv/boot/Makefile          |  5 +--
 arch/s390/Kconfig                 |  1 +
 arch/s390/Makefile                |  2 +-
 arch/s390/Makefile.postlink       |  4 +-
 arch/x86/Kconfig                  |  1 +
 arch/x86/Makefile                 |  6 ---
 arch/x86/Makefile.postlink        | 40 --------------------
 arch/x86/boot/compressed/Makefile |  8 ++--
 scripts/Makefile.lib              |  2 +-
 scripts/Makefile.vmlinux          | 27 +++++++++----
 scripts/link-vmlinux.sh           | 11 +++---
 19 files changed, 52 insertions(+), 87 deletions(-)
 delete mode 100644 arch/x86/Makefile.postlink

-- 
2.48.1.601.g30ceb7b040-goog


