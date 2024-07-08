Return-Path: <linux-kbuild+bounces-2424-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B612929B6A
	for <lists+linux-kbuild@lfdr.de>; Mon,  8 Jul 2024 07:07:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 99A4FB20B06
	for <lists+linux-kbuild@lfdr.de>; Mon,  8 Jul 2024 05:07:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3BAE49445;
	Mon,  8 Jul 2024 05:07:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mfg95EPd"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CD198F5A;
	Mon,  8 Jul 2024 05:07:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720415222; cv=none; b=dX4bZs46d2ZEDpS8UiY1Ms9lbyMYRyQrrI8358Cl69Y9HH6dVRIpvt3nP33jY7oqobgGV95XWjbphA+2HtpQNeVmkTpUfXNIEinYJLydKaZDuoyuiKMIGHHTAgwkhmb2KhL1Zg7BG8h3nsn66tOrbd0AhRaNB0aMXyKIfZpjbOc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720415222; c=relaxed/simple;
	bh=28P5DxuZtpcNeH3XINse8v/z7lEZTB6poCC+rDFkGhc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=lZh8ymdsC3F7/lXTaQJrS6OZgDxQZCDPp0EyCHjZQl+xlGQIy6EAjOv83/b5CKenIyCSwQBYudT5ZkGnZmr+B1on7oTE1DuN/iPj6sZrCWbzWBHlWZpbyMwmwwzRddO4pAIOw8AvOYx68fJCmoSYLx62I0uQPDN7ietnwCqzGv0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mfg95EPd; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17685C116B1;
	Mon,  8 Jul 2024 05:07:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720415221;
	bh=28P5DxuZtpcNeH3XINse8v/z7lEZTB6poCC+rDFkGhc=;
	h=From:Date:Subject:To:Cc:From;
	b=mfg95EPdmWmSWzRNDZbtUgQ9lHfE5G8Evj1XCNPLOC6QUJOkAHu+281M5wpeMnEnP
	 rVSZG3IMWBOeRPmxSLnHC27Y15w/8pu4ZG0pUGD/D/EUGz6g8TzK6+lOVTIXvE1am3
	 rO3wPkqw95XFDb1JBAsXGHCqhjAjDELSf7ew8rO/bV0i8v+aCTmcF4dBO7BKMoMtbv
	 QLfyx2KhFijKPtdFCZb5UoCsgKNlADQDLI5QLYv4wjR0Uasc/HW1KVjTWnzIJTs8dh
	 6aRwfJxU2Mo2LajMm1zq4mAX8wfNZ8mUxrdValka2H5PjFxY8EEO6vzV+d5o+7K5eV
	 +3ll5nFxY0upQ==
From: Nathan Chancellor <nathan@kernel.org>
Date: Sun, 07 Jul 2024 22:06:47 -0700
Subject: [PATCH v2] kbuild: Make ld-version.sh more robust against version
 string changes
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240707-update-ld-version-for-new-lld-ver-str-v2-1-8f24421198c0@kernel.org>
X-B4-Tracking: v=1; b=H4sIAOZzi2YC/5WNSw6CMBRFt0I69pm2YgiO3Adh0M8rNJKWvGLVE
 PZuwRU4PCc396wsIXlM7FatjDD75GMoIE8VM6MKA4K3hZnksuYNr+E5W7UgTBYy0r4GFwkCvmD
 6OUgLgW5UrZzW9uoEK18zofPvo9P1hUeflkifI5vFbv8tZAECWqGNMVxy1V7uD6SA0znSwPpt2
 7523XIW2wAAAA==
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Nicolas Schier <nicolas@fjasle.eu>, Fangrui Song <maskray@google.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 linux-kbuild@vger.kernel.org, llvm@lists.linux.dev, patches@lists.linux.dev, 
 Nathan Chancellor <nathan@kernel.org>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=3291; i=nathan@kernel.org;
 h=from:subject:message-id; bh=28P5DxuZtpcNeH3XINse8v/z7lEZTB6poCC+rDFkGhc=;
 b=owGbwMvMwCUmm602sfCA1DTG02pJDGndxV/kvlmIHLn2TOz1r+kBoXEfb+67lewWP32nHU+v3
 /8HGnwrO0pZGMS4GGTFFFmqH6seNzScc5bxxqlJMHNYmUCGMHBxCsBErJ8yMhy6/UH40t19dyd2
 6Gv4aO83CX9uPlsyuYRBKlbi2WGD4k8M/6sXhCZpHfj0fNvaxFcH92XM1WvsYdjj9PBTM//tQj5
 ZIW4A
X-Developer-Key: i=nathan@kernel.org; a=openpgp;
 fpr=2437CB76E544CB6AB3D9DFD399739260CB6CB716

After [1] in upstream LLVM, ld.lld's version output became slightly
different when the cmake configuration option LLVM_APPEND_VC_REV is
disabled.

Before:

  Debian LLD 19.0.0 (compatible with GNU linkers)

After:

  Debian LLD 19.0.0, compatible with GNU linkers

This results in ld-version.sh failing with

  scripts/ld-version.sh: 18: arithmetic expression: expecting EOF: "10000 * 19 + 100 * 0 + 0,"

because the trailing comma is included in the patch level part of the
expression. While [1] has been partially reverted in [2] to avoid this
breakage (as it impacts the configuration stage and it is present in all
LTS branches), it would be good to make ld-version.sh more robust
against such miniscule changes like this one.

Use POSIX shell parameter expansion [3] to remove the largest suffix
after just numbers and periods, replacing of the current removal of
everything after a hyphen. ld-version.sh continues to work for a number
of distributions (Arch Linux, Debian, and Fedora) and the kernel.org
toolchains and no longer errors on a version of ld.lld with [1].

Fixes: 02aff8592204 ("kbuild: check the minimum linker version in Kconfig")
Link: https://github.com/llvm/llvm-project/commit/0f9fbbb63cfcd2069441aa2ebef622c9716f8dbb [1]
Link: https://github.com/llvm/llvm-project/commit/649cdfc4b6781a350dfc87d9b2a4b5a4c3395909 [2]
Link: https://pubs.opengroup.org/onlinepubs/9699919799/utilities/V3_chap02.html [3]
Suggested-by: Fangrui Song <maskray@google.com>
Reviewed-by: Fangrui Song <maskray@google.com>
Signed-off-by: Nathan Chancellor <nathan@kernel.org>
---
Changes in v2:
- Move to a pattern matching notation with remove largest suffix to
  remove everything after just numbers and periods.
- The LLVM change that prompted this has been partially reverted to
  avoid this problem, so reword commit message to reflect this is being
  done defensively. As such, remove 'Cc: stable@vger.kernel.org'. If it
  is needed there at some point, it can just be manually backported (or
  it will just get AUTOSEL'd).
- Add tags for Fangrui's suggestion and review on v1.
- Link to v1: https://lore.kernel.org/r/20240704-update-ld-version-for-new-lld-ver-str-v1-1-91bccc020a93@kernel.org
---
 scripts/ld-version.sh | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/scripts/ld-version.sh b/scripts/ld-version.sh
index a78b804b680c..b9513d224476 100755
--- a/scripts/ld-version.sh
+++ b/scripts/ld-version.sh
@@ -57,9 +57,11 @@ else
 	fi
 fi
 
-# Some distributions append a package release number, as in 2.34-4.fc32
-# Trim the hyphen and any characters that follow.
-version=${version%-*}
+# There may be something after the version, such as a distribution's package
+# release number (like Fedora's "2.34-4.fc32") or punctuation (like LLD briefly
+# added before the "compatible with GNU linkers" string), so remove everything
+# after just numbers and periods.
+version=${version%%[!0-9.]*}
 
 cversion=$(get_canonical_version $version)
 min_cversion=$(get_canonical_version $min_version)

---
base-commit: 22a40d14b572deb80c0648557f4bd502d7e83826
change-id: 20240704-update-ld-version-for-new-lld-ver-str-b7a4afbbd5f1

Best regards,
-- 
Nathan Chancellor <nathan@kernel.org>


