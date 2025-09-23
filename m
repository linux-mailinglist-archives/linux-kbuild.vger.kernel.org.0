Return-Path: <linux-kbuild+bounces-8934-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DBF7B9792C
	for <lists+linux-kbuild@lfdr.de>; Tue, 23 Sep 2025 23:34:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CD4BF4A0D09
	for <lists+linux-kbuild@lfdr.de>; Tue, 23 Sep 2025 21:34:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 193512FF141;
	Tue, 23 Sep 2025 21:34:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Bp2a7tV3"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAF0218A6A5;
	Tue, 23 Sep 2025 21:34:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758663263; cv=none; b=FoUlROkgwClEGAV91wDpoPoTefJ3zcNKxfY5TlZWwVQwV28bm8wQU2BDti1WdPeOju47K2+b1IzHe3XAUzqDIvHDDL3NLGIdGmVi4dljXJ1KsE+qiKzVii/rJniB6h2ypqfhxuxbMFexL0wHZcEo637/ec3q+ij5iIwf+Je/2Kw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758663263; c=relaxed/simple;
	bh=kzLRw90VPtGstaLwMBEFrpjL2J3zR4RxvRjKU0B7Zxw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=HeMkDZieKoPQStz7SDTLfLevLbavWeQyH1VD1PDXmUGYKf2zjfGxy4CnRCZLxMi+15OZF/m6ivR+l+yOmjmZTI2ZOoelLgRwk4fTxKha2zLG+NjAaLAWHhXEKipTD0PcTrlCg+Er1GSUlv1KgEHSwLf5PiZ/XvEQBx/RXBLaafo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Bp2a7tV3; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 99DF8C4CEF5;
	Tue, 23 Sep 2025 21:34:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758663262;
	bh=kzLRw90VPtGstaLwMBEFrpjL2J3zR4RxvRjKU0B7Zxw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Bp2a7tV3auNRR0cOKrWID8tkO9If9Ml0qmHS7upNGwa6xCxAqHq7e4eTGzYptNwqz
	 aVB++QhOTlS+MXPCAWSScOEODuZdP38AHU5VjMD0xkzo0qAgeipKbEp8L2pdjcfQRK
	 eZutv4F9DBtgC6NOQp+1gCrptcuzQBj9l+T66bMgFY8yplacm57uSlmHphcCGxFICc
	 3qpfjogn9JRTFVmh4D0a59hGtuenbbmfMHMC52PeWek+uHBEA+rPIuvYZhoHL8JHJP
	 hJ9yC4lqn2PzHuMqGoiEKeFmOpjFvlyfmV5SXkoANxEYxRVYyVfATWKyoSk9ZsnXzm
	 dTAlKMaHJSlYw==
From: Kees Cook <kees@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Kees Cook <kees@kernel.org>,
	Nicolas Schier <nicolas.schier@linux.dev>,
	Vegard Nossum <vegard.nossum@oracle.com>,
	Masahiro Yamada <masahiroy@kernel.org>,
	linux-kbuild@vger.kernel.org,
	Sami Tolvanen <samitolvanen@google.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Randy Dunlap <rdunlap@infradead.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Puranjay Mohan <puranjay@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-hardening@vger.kernel.org
Subject: [PATCH v3 1/3] kconfig: Fix BrokenPipeError warnings in selftests
Date: Tue, 23 Sep 2025 14:34:17 -0700
Message-Id: <20250923213422.1105654-1-kees@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250923213120.make.332-kees@kernel.org>
References: <20250923213120.make.332-kees@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2658; i=kees@kernel.org; h=from:subject; bh=kzLRw90VPtGstaLwMBEFrpjL2J3zR4RxvRjKU0B7Zxw=; b=owGbwMvMwCVmps19z/KJym7G02pJDBmXhaLmbU677Gx3r3BlRY3E1i2aJeYuJ6yNZk6QWzHx6 DZT70NVHaUsDGJcDLJiiixBdu5xLh5v28Pd5yrCzGFlAhnCwMUpABMx8GNkWGa/841DEceVLDGl KsmejA/a/9xdIibvSP6YrD5p618lZUaGdV3hzKoLrzxYb7iMY15L2Unf0/ExBSs3idQIbpnmtNa bDQA=
X-Developer-Key: i=kees@kernel.org; a=openpgp; fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
Content-Transfer-Encoding: 8bit

The kconfig test harness ("make testconfig") was generating BrokenPipeError
warnings when running interactive tests like oldaskconfig and oldconfig:

  /usr/lib/python3/dist-packages/_pytest/unraisableexception.py:85: PytestUnraisableExceptionWarning: Exception ignored in: <_io.BufferedWriter name=12>

  Traceback (most recent call last):
    File "/srv/code/scripts/kconfig/tests/conftest.py", line 127, in oldaskconfig
      return self._run_conf('--oldaskconfig', dot_config=dot_config,
             ~~~~~~~~~~~~~~^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
                            interactive=True, in_keys=in_keys)
                            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  BrokenPipeError: [Errno 32] Broken pipe

The issue occurred when the test framework attempted to write to stdin
after the conf subprocess had already exited.

Wrap stdin write operations in try/except to catch BrokenPipeError and
stop sending more input. Add explicit flush() after writes so we can see
delivery errors immediately. Ignore BrokenPipeError when closing stdin.
Explicitly call wait() to validate subprocess termination.

Signed-off-by: Kees Cook <kees@kernel.org>
---
Cc: Nathan Chancellor <nathan@kernel.org>
Cc: Nicolas Schier <nicolas.schier@linux.dev>
Cc: Vegard Nossum <vegard.nossum@oracle.com>
Cc: Masahiro Yamada <masahiroy@kernel.org>
Cc: <linux-kbuild@vger.kernel.org>
---
 scripts/kconfig/tests/conftest.py | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/scripts/kconfig/tests/conftest.py b/scripts/kconfig/tests/conftest.py
index 2a2a7e2da060..d94b79e012c0 100644
--- a/scripts/kconfig/tests/conftest.py
+++ b/scripts/kconfig/tests/conftest.py
@@ -81,7 +81,22 @@ class Conf:
                 # For interactive modes such as oldaskconfig, oldconfig,
                 # send 'Enter' key until the program finishes.
                 if interactive:
-                    ps.stdin.write(b'\n')
+                    try:
+                        ps.stdin.write(b'\n')
+                        ps.stdin.flush()
+                    except (BrokenPipeError, OSError):
+                        # Process has exited, stop sending input
+                        break
+
+            # Close stdin gracefully
+            try:
+                ps.stdin.close()
+            except (BrokenPipeError, OSError):
+                # Ignore broken pipe on close
+                pass
+
+            # Wait for process to complete
+            ps.wait()
 
             self.retcode = ps.returncode
             self.stdout = ps.stdout.read().decode()
-- 
2.34.1


