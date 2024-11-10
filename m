Return-Path: <linux-kbuild+bounces-4613-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C5399C305E
	for <lists+linux-kbuild@lfdr.de>; Sun, 10 Nov 2024 02:39:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3C4851F2174F
	for <lists+linux-kbuild@lfdr.de>; Sun, 10 Nov 2024 01:39:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C2656140E2E;
	Sun, 10 Nov 2024 01:37:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GBfoOi0k"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9753A1531E1;
	Sun, 10 Nov 2024 01:37:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731202633; cv=none; b=d+wsQWZN6cV8aPngxwLHE8qOFrU+k1KYqrIjL2ot9c+a7kibALZIe4R2+ejBk/oclnCjroLueAIrQ0dDMrs8JxWNqtsplaubx4XRFcrGW2wwcM+FmKIXk+FMHT6kCiJk9yi0KlqZ1pkmseBdDo6xM0wnFc4l5RiJZklNnXU9M/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731202633; c=relaxed/simple;
	bh=rI9k7enmxwz9ojQI4LH1nAFQpHFd3uNrpzEHxR5/YGk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=H0kOyOohzQOa6H14m3lWMsF6D3m/AdoZl9w2Rf6Qud3L8n9/Uv6sDW1JdCxEXBvcxKDUS1FmR/sJonpMFGcjNX9ydOBVqTdTpnrkAO1+POIphEODFvuqCem7gUmvwLBxERsBtAtUsQhR3HhX8vcw49LVuwA8NGQc1TP5M1X/D8k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GBfoOi0k; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3521EC4CECE;
	Sun, 10 Nov 2024 01:37:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731202633;
	bh=rI9k7enmxwz9ojQI4LH1nAFQpHFd3uNrpzEHxR5/YGk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=GBfoOi0k288Oc2FpvxiCdfmOinmODTTYiDyFLw6K17s+T/wbrVbtbnuZMSDqwE1ET
	 msNvULVPK63bqpTIbrFlLy0KbKYWEin2Ci6T2Fg4ZvI/x/ZvCRikUxejIoGB97Byl9
	 uYPTr678oz1rAViMzpPddJ4CJu/E32uL4xaQAdmWAr+5S/9zKqv5uiHOFpzEySzL6z
	 bQ8PQARZgubVRi6qgUDxHgogBBEVRp5J0vgeYUoEq27uOFL0kzCEx7YL3sTNwJeUN9
	 UuUzef+TBBmDpObs3j8i87lWEhlOacTFmEiPKfX9kK1BwQvy5KjYxy51kOYXV4sHYm
	 Jr/yUTv1Q3Zmg==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	cocci@inria.fr,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>
Subject: [PATCH v2 09/11] kbuild: use absolute path in the generated wrapper Makefile
Date: Sun, 10 Nov 2024 10:34:37 +0900
Message-ID: <20241110013649.34903-10-masahiroy@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241110013649.34903-1-masahiroy@kernel.org>
References: <20241110013649.34903-1-masahiroy@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Keep the consistent behavior when this Makefile is invoked from another
directory.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
Reviewed-by: Nicolas Schier <nicolas@fjasle.eu>
---

(no changes since v1)

 Makefile | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/Makefile b/Makefile
index 5488aa96b46b..35e34cce4942 100644
--- a/Makefile
+++ b/Makefile
@@ -644,8 +644,9 @@ ifdef building_out_of_srctree
 
 quiet_cmd_makefile = GEN     Makefile
       cmd_makefile = { \
-	echo "\# Automatically generated by $(srctree)/Makefile: don't edit"; \
-	echo "include $(srctree)/Makefile"; \
+	echo "\# Automatically generated by $(abs_srctree)/Makefile: don't edit"; \
+	echo "export KBUILD_OUTPUT = $(CURDIR)"; \
+	echo "include $(abs_srctree)/Makefile"; \
 	} > Makefile
 
 outputmakefile:
-- 
2.43.0


