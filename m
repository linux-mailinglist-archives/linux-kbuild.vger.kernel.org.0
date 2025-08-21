Return-Path: <linux-kbuild+bounces-8564-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CE5DB3082D
	for <lists+linux-kbuild@lfdr.de>; Thu, 21 Aug 2025 23:18:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C4F96722047
	for <lists+linux-kbuild@lfdr.de>; Thu, 21 Aug 2025 21:16:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF4C22C0278;
	Thu, 21 Aug 2025 21:15:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="m2b2KJq3"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F31B2C026D;
	Thu, 21 Aug 2025 21:15:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755810957; cv=none; b=R8L4VqN5KjfAgsrEza5AT4tPKdNLwZ7zNNOmR9sAGEP5esJaC1INuzPUbR3vGfLfsLzg4h6IO2wBsdQNQsvPLpcRrPTpazLpDtCyUX9YuUZxfPvdf/ANGFlPygXk/4A0glpVouSi2rYdIL7MXrJoYpHzr1ZolPkr9HWZXUYORsw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755810957; c=relaxed/simple;
	bh=jXdHROA3GuPa9KXSK0WR0hDPRA2+mn8KCSN4tJRdzOs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NzBYmMG0lXbgpCo9kT+/gR2AOjHLPmQqjvdcdVyswrQORbgl/G13eMymU42k8GDCrz6AHeoTdTnoUFmk58AuDVyG3ZOFvZ/xJDyvohMgsu1p7vH6jPlymb29mV2mM1tdn6ZbTpQvVHoz8cav1R/6TgBu1OJdUAxwVKW5q2H0hhg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=m2b2KJq3; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EED3AC4CEF4;
	Thu, 21 Aug 2025 21:15:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755810957;
	bh=jXdHROA3GuPa9KXSK0WR0hDPRA2+mn8KCSN4tJRdzOs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=m2b2KJq33G/Ck2J/lPJWErayxF+05MyJuXE/3ZygxuNEYEAJ2H4sdx4sptPHIV4lw
	 LKsmndsoz4FWMl6qOS+s7Ak96Y43W2YBtlDqQIalWxi6H+VlJ/sHtUvg7hRW1etpsc
	 iWVdLiLLdRB4kEG1xUFdwxxqVKWXeCXqUJAPMbIfeaokH8BXeVf1hgorFJzeexY+Cp
	 POBad6H5YgTIod4hkALsCrfNXIZjGz9peZuvtK6V4Z7PitednHwAocD52jqHZwDvkJ
	 stFjL11Hddf6F/k6fcLpqiBsO0K+Vkb81awm5Jf+0wvUHni/RPz6aXnwUxeQlyCPSW
	 LushuVEyM0rMQ==
From: Nathan Chancellor <nathan@kernel.org>
Date: Thu, 21 Aug 2025 14:15:38 -0700
Subject: [PATCH v2 01/12] kbuild: Bump minimum version of LLVM for building
 the kernel to 15.0.0
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250821-bump-min-llvm-ver-15-v2-1-635f3294e5f0@kernel.org>
References: <20250821-bump-min-llvm-ver-15-v2-0-635f3294e5f0@kernel.org>
In-Reply-To: <20250821-bump-min-llvm-ver-15-v2-0-635f3294e5f0@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>, Kees Cook <kees@kernel.org>, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 llvm@lists.linux.dev, patches@lists.linux.dev, 
 Nicolas Schier <nsc@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
 linux-kbuild@vger.kernel.org
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2465; i=nathan@kernel.org;
 h=from:subject:message-id; bh=jXdHROA3GuPa9KXSK0WR0hDPRA2+mn8KCSN4tJRdzOs=;
 b=owGbwMvMwCUmm602sfCA1DTG02pJDBnLexpnH/110KbpwV15w9+J3td2LTm2a5uPcEyq+oovH
 epVTJ3qHaUsDGJcDLJiiizVj1WPGxrOOct449QkmDmsTCBDGLg4BWAi2d8ZGdpFVqdc9bXS4Tn6
 yY3jN7+gfuoGzzDBq8v6Ag9VqRQYsDH8r5os51UW8DTtUOGV9ie88xQPOOz64sdbuJ9R4hPT8q8
 1PAA=
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

Reviewed-by: Kees Cook <kees@kernel.org>
Acked-by: Arnd Bergmann <arnd@arndb.de>
Acked-by: Nicolas Schier <nsc@kernel.org>
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


