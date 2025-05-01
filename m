Return-Path: <linux-kbuild+bounces-6846-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C8FAAA66CD
	for <lists+linux-kbuild@lfdr.de>; Fri,  2 May 2025 01:01:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5574F3B6684
	for <lists+linux-kbuild@lfdr.de>; Thu,  1 May 2025 23:00:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B5301E9B09;
	Thu,  1 May 2025 23:00:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="A5qbQUI2"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D65FF1D89E3;
	Thu,  1 May 2025 23:00:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746140440; cv=none; b=SBDiPIdfuAb3tQ3D5PwlQKy/KJQJ7uX0HRwDWqhUrRkKkIlxpkxoutjUUjlY0TFxVGwXNjfOHsvs3yPEaGNrylWr/CwwKv+LEF+hgaQCISLj/Xr4kA+10V5wEa+advYw68/HoB0UjHpx7h/tH4EBaZhUcPJ7w+2emvnbMfEhuP0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746140440; c=relaxed/simple;
	bh=1xRA18ItmOxRA1HPS4t1o2JORpDbr4fyL0IDsEt7UTw=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=DSUh8XoUueRhWMR7btWteK435RN0eK3cDufn7r8VhiI9/L0rxiVuP6ty5isisCflUjexYGL4IovUSMVmXgje30syKfOQntAhc6caHJMnp9Wgzjx2t3gJTkjVOdJCAfhRWIsJqCiBVXWKBFcSpHywyWg5BgB9poryjBuJPANCE60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=A5qbQUI2; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC882C4CEE3;
	Thu,  1 May 2025 23:00:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746140439;
	bh=1xRA18ItmOxRA1HPS4t1o2JORpDbr4fyL0IDsEt7UTw=;
	h=From:Subject:Date:To:Cc:From;
	b=A5qbQUI2iHgOBYOzypoRJpf6LMW2l1GkDXG+/L+frUb6jNZYKW3P7rpAEiqNAqHXu
	 F4xIP+SoOqhzi+sSEN7dTxSL3Jct6vC7TKLy+M5/k4qUu4go3NkCLyTuMwKvtLYT85
	 zUMMttrlilXp/L3v0twxN1seQ3quZHlIpgqMG8BWPTnMNJFAylD87eNFjDU3u+HLt9
	 71aUiKqFyKZ9Y0s4enxgsYF2xXztdwoNQ/nCW8LaoKDcnaBbP41yZFNPszCGPfJqRv
	 3SOr8j8u/RYJVapQFg8hxdByIDVk5XoNd7mEAipEJD5vLg3pQBGTEfrbHKqCUtPeaM
	 Mjiy/8aRJoQyQ==
From: Nathan Chancellor <nathan@kernel.org>
Subject: [PATCH 0/2] Deal with clang's -Wdefault-const-init-unsafe
Date: Thu, 01 May 2025 16:00:20 -0700
Message-Id: <20250501-default-const-init-clang-v1-0-3d2c6c185dbb@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAT9E2gC/x2MQQqAMAwEvyI5G6hVi/gV8dDaVANSpVURxL8bv
 M3A7D6QKTFl6IsHEl2ceYsiVVnAtNg4E7IXB610q5paoadgz/XAaYv5QI4suEqIzpCuXOdV7Qz
 IfE8U+P6vh/F9P9r9ROxqAAAA
X-Change-ID: 20250430-default-const-init-clang-b6e21b8d03b6
To: Andrew Morton <akpm@linux-foundation.org>, 
 Masahiro Yamada <masahiroy@kernel.org>
Cc: Nicolas Schier <nicolas.schier@linux.dev>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 Linus Torvalds <torvalds@linux-foundation.org>, 
 linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
 llvm@lists.linux.dev, patches@lists.linux.dev, stable@vger.kernel.org, 
 Linux Kernel Functional Testing <lkft@linaro.org>, 
 Marcus Seyfarth <m.seyfarth@gmail.com>, 
 Nathan Chancellor <nathan@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=995; i=nathan@kernel.org;
 h=from:subject:message-id; bh=1xRA18ItmOxRA1HPS4t1o2JORpDbr4fyL0IDsEt7UTw=;
 b=owGbwMvMwCUmm602sfCA1DTG02pJDBnCf0XcLK3y+CxTGN68ulxwp2vSvrAHs1WPZt92LFJan
 HPKd/6xjlIWBjEuBlkxRZbqx6rHDQ3nnGW8cWoSzBxWJpAhDFycAjARL2lGhuOKO5VTJ+1r/mef
 bXXq4I7/0xo1th+5u0kn2u6+wZ3+RzGMDKstbpnmRU70K/+z2Gk+i+H7uyaP0j/MTXrZfeRtXOR
 cDV4A
X-Developer-Key: i=nathan@kernel.org; a=openpgp;
 fpr=2437CB76E544CB6AB3D9DFD399739260CB6CB716

A new on by default warning in clang aims to flag cases where a const
variable or field is not initialized and has no default value (i.e., not
static or thread local). The field version of the warning triggers in
several places within the kernel that are not problematic so it is
disabled in the first patch. The variable version of the warning only
triggers in one place, the typecheck() macro, so I opted to silence it
in that one place to keep it enabled until it can be proved to be
problematic enough to disable it.

---
Nathan Chancellor (2):
      kbuild: Disable -Wdefault-const-init-field-unsafe
      include/linux/typecheck.h: Zero initialize dummy variables

 include/linux/typecheck.h  | 4 ++--
 scripts/Makefile.extrawarn | 7 +++++++
 2 files changed, 9 insertions(+), 2 deletions(-)
---
base-commit: ebd297a2affadb6f6f4d2e5d975c1eda18ac762d
change-id: 20250430-default-const-init-clang-b6e21b8d03b6

Best regards,
-- 
Nathan Chancellor <nathan@kernel.org>


