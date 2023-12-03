Return-Path: <linux-kbuild+bounces-249-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6056080227D
	for <lists+linux-kbuild@lfdr.de>; Sun,  3 Dec 2023 11:25:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C0C96B20A68
	for <lists+linux-kbuild@lfdr.de>; Sun,  3 Dec 2023 10:25:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 641C49473;
	Sun,  3 Dec 2023 10:25:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Vj+fwQJa"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F0AC79DC
	for <linux-kbuild@vger.kernel.org>; Sun,  3 Dec 2023 10:25:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E37B6C433C9;
	Sun,  3 Dec 2023 10:25:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701599137;
	bh=LEoTggARida+p4FLdOShzFKl4z7iyh9a/kviqyZ5sDY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Vj+fwQJayDbwrfs2+Hs+St+PCRLNFFY8IDpG2/4YAkzdbMeKDiNE472eFVcZw9Ezc
	 8dFreVRKLo4w6cAS8YUWeD8Q92tyUA7fF+4vmeD+tp9Pzd/2JYLtyAcWG4Vi7dd7q5
	 Qw2tFWn2qqxLJB010d/eYVy7dmWHsiiDWPVo/wVZkEXeCrao3W+CWHYlvy+KP4uYBo
	 rBmOYjV9W3U81PjmHHKkfWalzGcrmgKwg+163ciOjhohFHK2CKezf6disP4A5fO0Zr
	 Dcvuxr5j0gFQrcaoH/RrWS+V+5IgjaI5RFJCcZ0pXh7a0UTdqBjaZZZEKW+ERKZcjp
	 1dW9m6ivPmmPw==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <masahiroy@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 4/6] kconfig: add include guard to lkc_proto.h
Date: Sun,  3 Dec 2023 19:25:26 +0900
Message-Id: <20231203102528.1913822-4-masahiroy@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231203102528.1913822-1-masahiroy@kernel.org>
References: <20231203102528.1913822-1-masahiroy@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/kconfig/lkc_proto.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/scripts/kconfig/lkc_proto.h b/scripts/kconfig/lkc_proto.h
index edd1e617b25c..687d8698d801 100644
--- a/scripts/kconfig/lkc_proto.h
+++ b/scripts/kconfig/lkc_proto.h
@@ -1,4 +1,7 @@
 /* SPDX-License-Identifier: GPL-2.0 */
+#ifndef LKC_PROTO_H
+#define LKC_PROTO_H
+
 #include <stdarg.h>
 
 /* confdata.c */
@@ -50,3 +53,5 @@ char *expand_one_token(const char **str);
 
 /* expr.c */
 void expr_print(struct expr *e, void (*fn)(void *, struct symbol *, const char *), void *data, int prevtoken);
+
+#endif /* LKC_PROTO_H */
-- 
2.40.1


