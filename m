Return-Path: <linux-kbuild+bounces-8520-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B027B2B104
	for <lists+linux-kbuild@lfdr.de>; Mon, 18 Aug 2025 20:59:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 852C4564375
	for <lists+linux-kbuild@lfdr.de>; Mon, 18 Aug 2025 18:58:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB95B2741B0;
	Mon, 18 Aug 2025 18:57:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="L4aYaJy9"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AF65273D8C;
	Mon, 18 Aug 2025 18:57:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755543469; cv=none; b=dUUUCxSh47FNmNl4PsF+3dHSP8NMooyYgSUOpSH0bZZxFK49zP0tMO4N7NQlFW1v5W4kQovsNKZduuT3U5JuJBD1stgaqXXa2nziw+mvbd30OAu4b7S8omYHAgQCmTUTW8CKFMHtBvqiN6P8MqKx75CBH7GDpB3HONSMYiFwRz0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755543469; c=relaxed/simple;
	bh=IDG166K1atPKY7m9tz5d771kcEokrOl3YOwP4VHZB2Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NGg/jwgJ9QsU8S0etfYwUFv7hlDOC4xZ5nQiJQ8gltuFltNYgAh1TyeAoHWgprh5TXfXNkd8uoClX1pwBHYs4zdCFcb+48d/ZHGOX0885+UnUgBG2wJ27hTw2SlSQqGrSUGRuKNuPNnJuxU+3RJj0EyynKvlmXXfZtYO59wQJcc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=L4aYaJy9; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C9E7C116D0;
	Mon, 18 Aug 2025 18:57:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755543468;
	bh=IDG166K1atPKY7m9tz5d771kcEokrOl3YOwP4VHZB2Y=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=L4aYaJy9cDV+/UnJTWcR0iNDVk6FjVvwluccsEI6E/0AJYmgjDFwRfgMc+VbRcpvm
	 WOvciQIoqrceYsxzy9CmszhbH5UHp6owiaQcwu2Yuy3mkeDrqEWFMmPNHnSL4E9PHl
	 zt1b2U7Wl8g5XDdwsMRXfW+jIFwUQPPcFPbk8AacQCgtZMOrraZKddy2ZfO4wPKfh5
	 M7WHTMdW+8z3IsN4Iab7PMjPdSo745auY8G1j0icvM5R9JsjnsWN7ZEzHqIb4sTwuZ
	 sECxWz8frYn829tcn8zD2B/MJk3S00OYO/qyMN/lpYjSDtQF/R1vOiNXa9g4KmFDf3
	 sVN3ftsVlcAEw==
From: Nathan Chancellor <nathan@kernel.org>
Date: Mon, 18 Aug 2025 11:57:17 -0700
Subject: [PATCH 01/10] kbuild: Bump minimum version of LLVM for building
 the kernel to 15.0.0
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250818-bump-min-llvm-ver-15-v1-1-c8b1d0f955e0@kernel.org>
References: <20250818-bump-min-llvm-ver-15-v1-0-c8b1d0f955e0@kernel.org>
In-Reply-To: <20250818-bump-min-llvm-ver-15-v1-0-c8b1d0f955e0@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Kees Cook <kees@kernel.org>, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev, patches@lists.linux.dev, 
 Nathan Chancellor <nathan@kernel.org>, linux-kbuild@vger.kernel.org
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2339; i=nathan@kernel.org;
 h=from:subject:message-id; bh=IDG166K1atPKY7m9tz5d771kcEokrOl3YOwP4VHZB2Y=;
 b=owGbwMvMwCUmm602sfCA1DTG02pJDBmLyxcWvmb41ZlXxD75o5cc03Rmb/uzvLxTL3InZB3s2
 bLQIJK7o5SFQYyLQVZMkaX6sepxQ8M5ZxlvnJoEM4eVCWQIAxenAExk0hyG/6XBnWXhyc2NuaZP
 fhRXJGUuPLR1xUyL6PMajTsdZ6dPdmZkuCZmz+GdFS8xw8HAyUnp36vil8HRVyrqK0QucOtvsOv
 kAQA=
X-Developer-Key: i=nathan@kernel.org; a=openpgp;
 fpr=2437CB76E544CB6AB3D9DFD399739260CB6CB716

s390 and x86 have required LLVM 15 since

  30d17fac6aae ("scripts/min-tool-version.sh: raise minimum clang version to 15.0.0 for s390")
  7861640aac52 ("x86/build: Raise the minimum LLVM version to 15.0.0")

respectively but most other architectures allow LLVM 13.0.1 or newer. In
accordance with the recent minimum supported version of GCC bump that
happened in

  118c40b7b503 ("kbuild: require gcc-8 and binutils-2.30")

do the same for LLVM to 15.0.0.

Of the supported releases of Arch Linux, Debian, Fedora, and OpenSUSE
surveyed in evaluating this bump, this only leaves behind Debian
Bookworm (14.0.6) and Ubuntu Jammy (14.0.0). Debian Trixie has 19.1.7
and Ubuntu Noble has 18.1.3 (so there are viable upgrade paths) or users
can use apt.llvm.org, which provides even newer packages for those
distributions.

Signed-off-by: Nathan Chancellor <nathan@kernel.org>
---
Cc: linux-kbuild@vger.kernel.org
---
 Documentation/process/changes.rst | 2 +-
 scripts/min-tool-version.sh       | 6 ++----
 2 files changed, 3 insertions(+), 5 deletions(-)

diff --git a/Documentation/process/changes.rst b/Documentation/process/changes.rst
index bccfa19b45df..b38622b0d525 100644
--- a/Documentation/process/changes.rst
+++ b/Documentation/process/changes.rst
@@ -30,7 +30,7 @@ you probably needn't concern yourself with pcmciautils.
         Program        Minimal version       Command to check the version
 ====================== ===============  ========================================
 GNU C                  8.1              gcc --version
-Clang/LLVM (optional)  13.0.1           clang --version
+Clang/LLVM (optional)  15.0.0           clang --version
 Rust (optional)        1.78.0           rustc --version
 bindgen (optional)     0.65.1           bindgen --version
 GNU make               4.0              make --version
diff --git a/scripts/min-tool-version.sh b/scripts/min-tool-version.sh
index 0d223b4a9445..99b5575c1ef7 100755
--- a/scripts/min-tool-version.sh
+++ b/scripts/min-tool-version.sh
@@ -24,12 +24,10 @@ gcc)
 	fi
 	;;
 llvm)
-	if [ "$SRCARCH" = s390 -o "$SRCARCH" = x86 ]; then
-		echo 15.0.0
-	elif [ "$SRCARCH" = loongarch ]; then
+	if [ "$SRCARCH" = loongarch ]; then
 		echo 18.0.0
 	else
-		echo 13.0.1
+		echo 15.0.0
 	fi
 	;;
 rustc)

-- 
2.50.1


