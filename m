Return-Path: <linux-kbuild+bounces-3597-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C736397B142
	for <lists+linux-kbuild@lfdr.de>; Tue, 17 Sep 2024 16:19:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 048DB1C21870
	for <lists+linux-kbuild@lfdr.de>; Tue, 17 Sep 2024 14:19:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 628221917F4;
	Tue, 17 Sep 2024 14:17:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FuehOgjg"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37D67190486;
	Tue, 17 Sep 2024 14:17:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726582673; cv=none; b=L7yi9M5/3Vft84b6014wYzuKLBrcYvnsSbFdf8yB2Auyfzhv7k//Dx8PYFr9Ydx1SFOiswvfAzdbwcWNXyaKFSlV20ktaMzEGb+NKEcgbvsESm57ARmSZ2xF/pGTJ/r3WMyEVgNJGaWgWk+r/RhK8HWhEM/Yj5lDsGpYlfQkCtI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726582673; c=relaxed/simple;
	bh=WhinTnECYKQ6Ay8RYWYnKkOB1a4zHCeW5QL3zgxwZ7o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JxLu1QAO60KNnjvuij+iUBXY0DAUh9s9HNKC0TlmsFuQ8+T+HXbJR/nmnB8SH5uxb5Ezr8jmkH0UsuhwGGKRhzAVojZbf5UcSdK6aENU7nG4WShan0Ps2l/f1MbpqteFmqN7dvf78M4OwI3YXB/M0TdoaQECRV/0hxRl1s6nldM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FuehOgjg; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 05521C4CEC5;
	Tue, 17 Sep 2024 14:17:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726582672;
	bh=WhinTnECYKQ6Ay8RYWYnKkOB1a4zHCeW5QL3zgxwZ7o=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=FuehOgjgaEL1OGaw0GMYGiAp1C257VwJJ3DDlRIAKvje33x2KLQ6aQ9off2YHjPoJ
	 qzc2BMF3u+Jm17lrfCn23ZpHJBCm0ytPSJEZXQUYQaGPjlluJ+ekJ2fU6MiYZ3v6JW
	 ggR+XCMn5RARvkuX/Vf17kTgMK7l+II1yH+WndUAh9V76DzVI9kMLPJjOyx3dBiwhb
	 658ABNr0U0MbgiTa4LBdA2VHzv6R8siZeHDMPee8EsKTAFvnT8BSw5oOBPn1GVnpqc
	 57aP0YQcEl5cJx4V3ge9vCzBL/lmEsj86ZTA/ZexgbqpoUugEWfpp/cJmt2rIT7HVg
	 tCXdrWqmACbUQ==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Miguel Ojeda <ojeda@kernel.org>,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>,
	Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH 10/23] kbuild: refactor the check for missing config files
Date: Tue, 17 Sep 2024 23:16:38 +0900
Message-ID: <20240917141725.466514-11-masahiroy@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240917141725.466514-1-masahiroy@kernel.org>
References: <20240917141725.466514-1-masahiroy@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This commit refactors the check for missing configuration files, making
it easier to add more files to the list.

The format of the error message has been slightly changed, as follows:

[Before]

    ERROR: Kernel configuration is invalid.
           include/generated/autoconf.h or include/config/auto.conf are missing.
           Run 'make oldconfig && make prepare' on kernel src to fix it.

[After]

  ***
  ***  ERROR: Kernel configuration is invalid. The following files are missing:
  ***    - include/generated/autoconf.h
  ***    - include/config/auto.conf
  ***  Run "make oldconfig && make prepare" on kernel source to fix it.
  ***

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 Makefile | 21 +++++++++++++--------
 1 file changed, 13 insertions(+), 8 deletions(-)

diff --git a/Makefile b/Makefile
index 4992b2895dd5..3f5c273c2901 100644
--- a/Makefile
+++ b/Makefile
@@ -778,17 +778,22 @@ $(KCONFIG_CONFIG):
 else # !may-sync-config
 # External modules and some install targets need include/generated/autoconf.h
 # and include/config/auto.conf but do not care if they are up-to-date.
-# Use auto.conf to trigger the test
+# Use auto.conf to show the error message
+
+checked-configs := include/generated/autoconf.h include/config/auto.conf
+missing-configs := $(filter-out $(wildcard $(checked-configs)), $(checked-configs))
+
+ifdef missing-configs
 PHONY += include/config/auto.conf
 
 include/config/auto.conf:
-	@test -e include/generated/autoconf.h -a -e $@ || (		\
-	echo >&2;							\
-	echo >&2 "  ERROR: Kernel configuration is invalid.";		\
-	echo >&2 "         include/generated/autoconf.h or $@ are missing.";\
-	echo >&2 "         Run 'make oldconfig && make prepare' on kernel src to fix it.";	\
-	echo >&2 ;							\
-	/bin/false)
+	@echo   >&2 '***'
+	@echo   >&2 '***  ERROR: Kernel configuration is invalid. The following files are missing:'
+	@printf >&2 '***    - %s\n' $(missing-configs)
+	@echo   >&2 '***  Run "make oldconfig && make prepare" on kernel source to fix it.'
+	@echo   >&2 '***'
+	@/bin/false
+endif
 
 endif # may-sync-config
 endif # need-config
-- 
2.43.0


