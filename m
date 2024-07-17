Return-Path: <linux-kbuild+bounces-2581-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 712A8934216
	for <lists+linux-kbuild@lfdr.de>; Wed, 17 Jul 2024 20:14:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 25F051F229CC
	for <lists+linux-kbuild@lfdr.de>; Wed, 17 Jul 2024 18:14:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F346A180A9E;
	Wed, 17 Jul 2024 18:14:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dN8ib9Hm"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C916079D2;
	Wed, 17 Jul 2024 18:14:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721240053; cv=none; b=bc9zMLE0nVlOUyS5Y5JbtQw8OjylKL0eDSJov16S7VxqJPre4630o8Gcot3KDlCOCcxFM57rgJEv5yPFnsBbuvtTskor7UC44jZHHll+//fA7N5UscFv0uLeK6+cYOgqNqyfkgb1/lGuY/iws/e1ne3C95AKOjT8zqFell5wauo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721240053; c=relaxed/simple;
	bh=fh7m5+NrFclsZc8n74Ngafn5U2kLjhzygfYGyECYYoQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=WPqzAto9ngWXWnRv6puG1u3Uqlnq5MclXw1E2HZOvI8g6GEJmdUEhbzzLAGxIDNV+BCqwk8gyvB5VBzBAve6RaxDPtJcahrFCtHTIu4WQppRz8sa47jVjhjh6Oxhg6DCuL3FIICo8w/45Tvc/czKnAIs0zrY/5l3fkUxQFwe/cs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dN8ib9Hm; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 92EC0C2BD10;
	Wed, 17 Jul 2024 18:14:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721240053;
	bh=fh7m5+NrFclsZc8n74Ngafn5U2kLjhzygfYGyECYYoQ=;
	h=From:To:Cc:Subject:Date:From;
	b=dN8ib9HmEgKhJlFEA3vqEkh4FI3RSMf6e6j2pPj3GcqJEaXN+m1d4uxqXq/Mt+phQ
	 NL0/7GAo//PJTvXI7TQmYyhuP9b6pefBqIm9dzaREC/Y9B/yijb0LEHYXZTBu7//84
	 25/rCSTXI6MVRgKZ2fIbLZFRkv6S8M3VCTAZWABpugofR891GNz46Eubn0jVpaXSa9
	 N5uV+3D+QQ3XAlYyvrFsJGcQyHZvXnQPlYEAtVqhgP6jz1hHThG1OpB+6GI7Oukit9
	 LD9fXjMuhw1TVB9LxIf+bCAVBalG5IPdi+4rZccp3plsLyUMQyqIOZvE7VID4p+jQ/
	 DNYKqYwX7vx3g==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH] kbuild: clean up scripts/remove-stale-files
Date: Thu, 18 Jul 2024 03:13:22 +0900
Message-ID: <20240717181340.1518266-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

These lines have been here for more than a year. Remove them.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/remove-stale-files | 18 ------------------
 1 file changed, 18 deletions(-)

diff --git a/scripts/remove-stale-files b/scripts/remove-stale-files
index 385610fe3936..f38d26b78c2a 100755
--- a/scripts/remove-stale-files
+++ b/scripts/remove-stale-files
@@ -20,22 +20,4 @@ set -e
 # yard. Stale files stay in this file for a while (for some release cycles?),
 # then will be really dead and removed from the code base entirely.
 
-rm -f arch/powerpc/purgatory/kexec-purgatory.c
-rm -f arch/riscv/purgatory/kexec-purgatory.c
-rm -f arch/x86/purgatory/kexec-purgatory.c
-
-rm -f scripts/extract-cert
-
-rm -f scripts/kconfig/[gmnq]conf-cfg
-
-rm -f rust/target.json
-
-rm -f scripts/bin2c
-
-rm -f .scmversion
-
-rm -rf include/ksym
-
-find . -name '*.usyms' | xargs rm -f
-
 rm -f *.spec
-- 
2.43.0


