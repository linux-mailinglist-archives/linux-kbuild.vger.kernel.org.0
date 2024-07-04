Return-Path: <linux-kbuild+bounces-2375-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 60CA7927B0D
	for <lists+linux-kbuild@lfdr.de>; Thu,  4 Jul 2024 18:19:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id EEC32B24FB7
	for <lists+linux-kbuild@lfdr.de>; Thu,  4 Jul 2024 16:19:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C82A1B29B4;
	Thu,  4 Jul 2024 16:19:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pc1loxFy"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CB2B1AEFFF;
	Thu,  4 Jul 2024 16:19:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720109944; cv=none; b=De5wOfZY88xG7YQXzuDslJs6NbwT+S8HLiFS9uizdT/KIYMiirMmFwsFvMGuTd0QVVEp33v6Acw9ma8kmOGCftnVyhpXJbumcSHax9VfAxkEFlfp8iHerck3TSoYN00/lmC008ciWaYU+YPpXlVbiOK1aPLexpWevdID//o/V7I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720109944; c=relaxed/simple;
	bh=FK7xagcryPXQhWjVE09ZqleC0sW1mp/6aeRQYGumgKc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=nBo3/dnpo4F1IW6xWXq/ggg5yH8+xMlkHq9jD1I13p4/J0dp0IckjVXfBqOVjnqtohV9TRsbdXEJ15ezWYOU0uTmtD4cftYJ7x9bwjMl7F8vk75HkdMcTfphfF/AWgenfGzROVv/DUadRKRRuwuWDIt3fBpSsItx6kkOc//4sA4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pc1loxFy; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A719C3277B;
	Thu,  4 Jul 2024 16:19:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720109943;
	bh=FK7xagcryPXQhWjVE09ZqleC0sW1mp/6aeRQYGumgKc=;
	h=From:Date:Subject:To:Cc:From;
	b=pc1loxFy2lAtGe0Tq1t9A3ew7QLklxg3n7Pia68N/7imKeB/FHQaJ5tRa3yXi0KlH
	 HAdfND9Fa7ATHQH1O9N2vZvD6vll8Vd2wOxXKPH7QJJoch0KUDd90jhMlTY2mMV590
	 3DCtOVQiPY6x/zNZ4Ywt2PaSthNmvCLujhOULv/P/EiKMxir4FEvS5NmA1D79KbECh
	 YsdJltEvoDuirGmoOXKNa5ICC8PMGneMpaP/YQ/qRbCRRjqcsiCXoiuDmtJ+2GTSxG
	 eBvsNCKYN1w/IxZI+BwvtwI07HfyYD5zWskwYuce2k5rwkfcdhzayro+y6HCVc51Ax
	 1eGp+WWp7xyog==
From: Nathan Chancellor <nathan@kernel.org>
Date: Thu, 04 Jul 2024 09:18:56 -0700
Subject: [PATCH] kbuild: Update ld-version.sh for change in LLD version
 output
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240704-update-ld-version-for-new-lld-ver-str-v1-1-91bccc020a93@kernel.org>
X-B4-Tracking: v=1; b=H4sIAG/LhmYC/yWN0QqDMBAEf0XuuQtRIkJ/RXxIzKU9kCgXq4L47
 03t4yzDzkmZVTjTszpJeZMscypQPyoa3y69GBIKU2Maazpj8VmCWxlTwMb6sxFnReId039DXhW
 +c9ZF70Mbaypfi3KU4+70w3V9AT/38BZ3AAAA
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Nicolas Schier <nicolas@fjasle.eu>, Fangrui Song <maskray@google.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 linux-kbuild@vger.kernel.org, llvm@lists.linux.dev, patches@lists.linux.dev, 
 stable@vger.kernel.org, Nathan Chancellor <nathan@kernel.org>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2008; i=nathan@kernel.org;
 h=from:subject:message-id; bh=FK7xagcryPXQhWjVE09ZqleC0sW1mp/6aeRQYGumgKc=;
 b=owGbwMvMwCUmm602sfCA1DTG02pJDGltp8sYuePmmG9RvdRlsUIySsakbYOxwdumk9bbnA5fX
 ntg3pRzHaUsDGJcDLJiiizVj1WPGxrOOct449QkmDmsTCBDGLg4BWAiKZcZ/qc8WfdJ1n6+g+Xi
 h3t379y3Za/9NqGQp3Fvt0VdV5R+eIuR4a9EmcnrGHH7T95vvud8bNq9T0qXyYu11VVu690bFZz
 PJ7ADAA==
X-Developer-Key: i=nathan@kernel.org; a=openpgp;
 fpr=2437CB76E544CB6AB3D9DFD399739260CB6CB716

After [1] in upstream LLVM, ld.lld's version output is slightly
different when the cmake configuration option LLVM_APPEND_VC_REV is
disabled.

Before:

  Debian LLD 19.0.0 (compatible with GNU linkers)

After:

  Debian LLD 19.0.0, compatible with GNU linkers

This results in ld-version.sh failing with

  scripts/ld-version.sh: 19: arithmetic expression: expecting EOF: "10000 * 19 + 100 * 0 + 0,"

because the trailing comma is included in the patch level part of the
expression. Remove the trailing comma when assigning the version
variable in the LLD block to resolve the error, resulting in the proper
output:

  LLD 190000

With LLVM_APPEND_VC_REV enabled, there is no issue with the new output
because it is treated the same as the prior LLVM_APPEND_VC_REV=OFF
version string was.

  ClangBuiltLinux LLD 19.0.0 (https://github.com/llvm/llvm-project a3c5c83273358a85a4e02f5f76379b1a276e7714), compatible with GNU linkers

Cc: stable@vger.kernel.org
Fixes: 02aff8592204 ("kbuild: check the minimum linker version in Kconfig")
Link: https://github.com/llvm/llvm-project/commit/0f9fbbb63cfcd2069441aa2ebef622c9716f8dbb [1]
Signed-off-by: Nathan Chancellor <nathan@kernel.org>
---
 scripts/ld-version.sh | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/scripts/ld-version.sh b/scripts/ld-version.sh
index a78b804b680c..f2f425322524 100755
--- a/scripts/ld-version.sh
+++ b/scripts/ld-version.sh
@@ -47,7 +47,9 @@ else
 	done
 
 	if [ "$1" = LLD ]; then
-		version=$2
+		# LLD after https://github.com/llvm/llvm-project/commit/0f9fbbb63cfcd2069441aa2ebef622c9716f8dbb
+		# may have a trailing comma on the patch version with LLVM_APPEND_VC_REV=off.
+		version=${2%,}
 		min_version=$($min_tool_version llvm)
 		name=LLD
 		disp_name=LLD

---
base-commit: 22a40d14b572deb80c0648557f4bd502d7e83826
change-id: 20240704-update-ld-version-for-new-lld-ver-str-b7a4afbbd5f1

Best regards,
-- 
Nathan Chancellor <nathan@kernel.org>


