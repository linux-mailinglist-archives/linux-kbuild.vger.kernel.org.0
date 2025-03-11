Return-Path: <linux-kbuild+bounces-6049-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F53CA5BE7B
	for <lists+linux-kbuild@lfdr.de>; Tue, 11 Mar 2025 12:06:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A00291897AE1
	for <lists+linux-kbuild@lfdr.de>; Tue, 11 Mar 2025 11:06:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 23CC02512E3;
	Tue, 11 Mar 2025 11:06:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="y7VevJRA"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A8F423F295
	for <linux-kbuild@vger.kernel.org>; Tue, 11 Mar 2025 11:06:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741691192; cv=none; b=DgGgibpG0P7bxDnSbEz1SW6c+7hzCLTt/6lNKMcrVyceXEtqVTEtAphqidLkWkg1Dx3gv1fvz7L2EEeKbuQVZe3H9nWKshcg2zB7g469T8og8bFaC2aVBXeq1rOGl3N+riCvxHnjM15bJmAdAGZiCXH5z5k04G87vW8c8mRPXjw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741691192; c=relaxed/simple;
	bh=J3wha0HLIt1oOebFs3Pu7UxTsvGviiB/W8p+TDA5yNc=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=mB/J1TUOjDuOh+ocZcm+aT6WrbiU7fkLUOOJn/e1ZzjDYiGG9NWpgGZXcNc+UGZ+fRQ9nLyuJQlzfHOv6ZiQd0IyUxIKMgg9mMwq8Kzvh+dw4i5UX4Ql8otllDYPKs376w7qA8WI5ViZgbZG9PhrJltvCLejIvtIAltDOfKalKs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--ardb.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=y7VevJRA; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ardb.bounces.google.com
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-43cec217977so14968545e9.0
        for <linux-kbuild@vger.kernel.org>; Tue, 11 Mar 2025 04:06:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1741691188; x=1742295988; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Jl0jQUvb42uyFp4EBwl8ReVcozC2T0AqGgikLtwYGaU=;
        b=y7VevJRAAP5uOmPkp0pcgrNXq+volNZxpaPynpwd9IBVi+feYCD4C08XU1PP5eRw2h
         10q6tmohhEwvLdAhMuXPHUAws2yomCsGM//A8KaM/78S21osK2tsnu1nJiPqRwYnPft4
         gUFU4kWIoVTXRH7xffMfbJ9sGVV6rFHUWrsXOp0REtmyuJfncEHdo3n6U4iCRv1YrdaJ
         HywuMvggTi4Cr1DnYQVdr4nfzVjTEcrSAZgXO1ycSGK1a7xlDCzGDm25GHgk4QWvk+Fm
         RLQejTc4whOyDuW3kV0NrYuW/bfGg4/bMcGijMgIfYsnt6ps6OnVzX5qFwuDkvcwbomf
         z2AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741691188; x=1742295988;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Jl0jQUvb42uyFp4EBwl8ReVcozC2T0AqGgikLtwYGaU=;
        b=uq0ZVtGg8csUBdJRPPyaVJcOMU/WKHna1KvTwU3QSK5PADF8bCh0QMx4oQ9oJPwBhv
         AVI9Y5VQSj3VSHt45VmHnwz4TC3ltot9DWs/T1VmaHmRIzlpC7daSDmiNFwIXJUHJ1s1
         uWYYLqCp2VviIAwer2C78j+52b65r6SQ8brzreaMQmu739lm9fgGn0ifFNjb+VB3Mas0
         WJWB2H1GttCIFiWNRZMtt+JvskPjpvZb8MyhnWkzuhp4qZFSqtSJv57f/s4bgCcG8ECu
         UrFyBcZ9kW8IlgwfHKphjK9vVyW79dhhi2iE0Nv80cl0jycQh48b+2hSUpoTemzbhOzd
         XPEQ==
X-Gm-Message-State: AOJu0YxinIfXN2pL+GghiLCidUk8RMtPTg2OrP5i4YUeF2A5GmkIhH8O
	vKVXiErfOFzqOsRjtmXeqW+4LBx/vQR8z0CnN4tD3i0YRPFrf2/2VBz4cfMvvxNZbrsrKg==
X-Google-Smtp-Source: AGHT+IGBua3pLZQz6LdNmfZDVGcpFrFEc3/Tfvd1hQfzu8/wEZcKy6eQdpyQrhqEJXtc3wrHfyplDVJR
X-Received: from wmbec10.prod.google.com ([2002:a05:600c:610a:b0:43c:fefe:4eb5])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:3b21:b0:43c:fe85:e4a0
 with SMTP id 5b1f17b1804b1-43cfe85e60bmr62348855e9.7.1741691188805; Tue, 11
 Mar 2025 04:06:28 -0700 (PDT)
Date: Tue, 11 Mar 2025 12:06:17 +0100
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=3167; i=ardb@kernel.org;
 h=from:subject; bh=gBvO1L36h6n5aNaXT8DoxiMFbhDdcu0gKVSU+mPXLI8=;
 b=owGbwMvMwCFmkMcZplerG8N4Wi2JIf2CpIaI/BfTqsziHyf91+xIF39y+5PLTl6B7ROjjbM97
 iYW71vRUcrCIMbBICumyCIw+++7nacnStU6z5KFmcPKBDKEgYtTACayexojwyrtE7LTVV4sv9Ur
 9HLthMw1f+LUzqUfPPvwl8Okb6V/7ygz/DN/waxwWiDhuOj957ExS/54W4tG3mPz/uuYrx0tsoh vERcA
X-Mailer: git-send-email 2.49.0.rc0.332.g42c0ae87b1-goog
Message-ID: <20250311110616.148682-6-ardb+git@google.com>
Subject: [PATCH v2 0/4] x86/build: Get rid of vmlinux postlink step
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-kernel@vger.kernel.org
Cc: linux-kbuild@vger.kernel.org, x86@kernel.org, 
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

Changes since v1:
- add vmlinux.unstripped to .gitignore and to the 'clean' target
- move cmd_strip_relocs into Makefile.vmlinux

[0] https://lore.kernel.org/all/Z5ARucnUgqjwBnrp@gmail.com/T/#m731ed0206949fc3f39fcc8a7b82fe348a8fc80c4

Cc: Masahiro Yamada <masahiroy@kernel.org>
Cc: Ingo Molnar <mingo@kernel.org>

Ard Biesheuvel (4):
  Kbuild/link-vmlinux.sh: Make output file name configurable
  Kbuild: Introduce Kconfig symbol for linking vmlinux with relocations
  Kbuild: Create intermediate vmlinux build with relocations preserved
  x86: Get rid of Makefile.postlink

 .gitignore                        |  1 +
 Makefile                          |  6 ++-
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
 arch/x86/boot/compressed/Makefile |  9 +++--
 scripts/Makefile.lib              |  3 --
 scripts/Makefile.vmlinux          | 30 +++++++++++----
 scripts/link-vmlinux.sh           | 11 +++---
 20 files changed, 57 insertions(+), 90 deletions(-)
 delete mode 100644 arch/x86/Makefile.postlink

-- 
2.49.0.rc0.332.g42c0ae87b1-goog


