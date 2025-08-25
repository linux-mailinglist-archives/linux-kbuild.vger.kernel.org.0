Return-Path: <linux-kbuild+bounces-8584-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 553A7B34B9A
	for <lists+linux-kbuild@lfdr.de>; Mon, 25 Aug 2025 22:18:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id AB6467AB70F
	for <lists+linux-kbuild@lfdr.de>; Mon, 25 Aug 2025 20:17:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F21D28135B;
	Mon, 25 Aug 2025 20:18:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="flvbDJmG"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F46E275AF0;
	Mon, 25 Aug 2025 20:18:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756153124; cv=none; b=nQPTN4xT5EMqjaFtlOA4cwb6zKgxKAqSWEMrcT/T0UnDJOgxnEi5Nh7fIJxxkxE1Dw7DjM2m5ZjaVaarL7qqTtF0FwiZMOzqa+Ej1pcDKt11qCBsI46LGPu4dHqy6vp64u7uylYPKnZ5rqmSURGdq0aNboQ0p2GwGuHT0UJU/c0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756153124; c=relaxed/simple;
	bh=/8eEwcYuuUBWAykVuxqNjnB77io3NFVcBt5ElBMUoWU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=PWIeHXjdyvjpF/IPMcgwtFUSIlUhhTYImG+/+sj2A+KtmaXMKeL9cxZG4nmUWUjc3x038g/vMe6zgioX3ftef2NjHwp1bbl2Dl2aZYHIiMQYQK7XFiYAD+mS2yZ0MJ3edYZ+WFLeNu9PWTGemgwwcu3rp+PBxdMOj3eOgDDJDBc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=flvbDJmG; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2AB98C4CEED;
	Mon, 25 Aug 2025 20:18:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756153121;
	bh=/8eEwcYuuUBWAykVuxqNjnB77io3NFVcBt5ElBMUoWU=;
	h=From:To:Cc:Subject:Date:From;
	b=flvbDJmGj7VN4ZZsgJd7DA8JVv9QMoTlo/KW786fJM2cvOkRErJm2WU5hPaz1wkSL
	 neRYj31KaSDK15TdDOBsVqUOxLmxMx2yb+Ov5FlXPrekm6Rv404qYMXnhWLFnW/zyG
	 cHAPyVI1bn+/3w05UXOBOiSD87WQaFo2F+sdo7vUpXh2fCbdZ0hzgY2naAUDrgErCp
	 sueWrQ9ZZNL7Hy2KUIjF/HyctshW5ueWL2O+QljePGOKqNkgCxSzZtPRNsvOXgY+HX
	 DbBzwuwJz2RE8dvtz09m4WbE3MprgwwmLYB6H5hsxRXvWUq9C7L4v4RFXop5Znf3l1
	 +wVI3EYnet6eA==
From: Jakub Kicinski <kuba@kernel.org>
To: davem@davemloft.net
Cc: netdev@vger.kernel.org,
	edumazet@google.com,
	pabeni@redhat.com,
	andrew+netdev@lunn.ch,
	horms@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kbuild@vger.kernel.org,
	Jakub Kicinski <kuba@kernel.org>,
	dhowells@redhat.com,
	kees@kernel.org,
	gustavoars@kernel.org,
	aleksander.lobakin@intel.com,
	tstruk@gigaio.com
Subject: [PATCH net-next v2] uapi: wrap compiler_types.h in an ifdef instead of the implicit strip
Date: Mon, 25 Aug 2025 13:18:28 -0700
Message-ID: <20250825201828.2370083-1-kuba@kernel.org>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The uAPI stddef header includes compiler_types.h, a kernel-only
header, to make sure that kernel definitions of annotations
like __counted_by() take precedence.

There is a hack in scripts/headers_install.sh which strips includes
of compiler.h and compiler_types.h when installing uAPI headers.
While explicit handling makes sense for compiler.h, which is included
all over the uAPI, compiler_types.h is only included by stddef.h
(within the uAPI, obviously it's included in kernel code a lot).

Remove the stripping from scripts/headers_install.sh and wrap
the include of compiler_types.h in #ifdef __KERNEL__ instead.
This should be equivalent functionally, but is easier to understand
to a casual reader of the code. It also makes it easier to work
with kernel headers directly from under tools/

Signed-off-by: Jakub Kicinski <kuba@kernel.org>
---
v2:
 - remove the hack from scripts/headers_install.sh
 - wrap in __KERNEL__ instead of removing
v1: https://lore.kernel.org/20250818181848.799566-1-kuba@kernel.org

CC: dhowells@redhat.com
CC: kees@kernel.org
CC: gustavoars@kernel.org
CC: aleksander.lobakin@intel.com
CC: tstruk@gigaio.com
---
 scripts/headers_install.sh  | 2 +-
 include/uapi/linux/stddef.h | 2 ++
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/scripts/headers_install.sh b/scripts/headers_install.sh
index 6bbccb43f7e7..4c20c62c4faf 100755
--- a/scripts/headers_install.sh
+++ b/scripts/headers_install.sh
@@ -32,7 +32,7 @@ fi
 sed -E -e '
 	s/([[:space:](])(__user|__force|__iomem)[[:space:]]/\1/g
 	s/__attribute_const__([[:space:]]|$)/\1/g
-	s@^#include <linux/compiler(|_types).h>@@
+	s@^#include <linux/compiler.h>@@
 	s/(^|[^a-zA-Z0-9])__packed([^a-zA-Z0-9_]|$)/\1__attribute__((packed))\2/g
 	s/(^|[[:space:](])(inline|asm|volatile)([[:space:](]|$)/\1__\2__\3/g
 	s@#(ifndef|define|endif[[:space:]]*/[*])[[:space:]]*_UAPI@#\1 @
diff --git a/include/uapi/linux/stddef.h b/include/uapi/linux/stddef.h
index b87df1b485c2..9a28f7d9a334 100644
--- a/include/uapi/linux/stddef.h
+++ b/include/uapi/linux/stddef.h
@@ -2,7 +2,9 @@
 #ifndef _UAPI_LINUX_STDDEF_H
 #define _UAPI_LINUX_STDDEF_H
 
+#ifdef __KERNEL__
 #include <linux/compiler_types.h>
+#endif
 
 #ifndef __always_inline
 #define __always_inline inline
-- 
2.51.0


