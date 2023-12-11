Return-Path: <linux-kbuild+bounces-332-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 59FFD80DE0B
	for <lists+linux-kbuild@lfdr.de>; Mon, 11 Dec 2023 23:14:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 697671C2149A
	for <lists+linux-kbuild@lfdr.de>; Mon, 11 Dec 2023 22:14:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A88435577C;
	Mon, 11 Dec 2023 22:14:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ZmnZpweg"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 660CAA6
	for <linux-kbuild@vger.kernel.org>; Mon, 11 Dec 2023 14:14:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1702332844;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=iPVf4tIFm+3r3HHF66qfweGUV+NYW/dRVWEv9IV2zdY=;
	b=ZmnZpwegjDpdggFUrxMn2nOW0p3Ct37cTbadZUJPzhzs/zVJgg+LvNwlkKi7ZOIT+swPVG
	4fD3cr3NuuJ7vZXzLU+MYpDBrlIQ0Q7oRl9iic8Vo52dxTWCB1oP6IMqJT32nXgzZF2zEM
	8EjY2bsZ95f62uCpopZSBm/8reJinOU=
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-84-kjrYrfNoO6GZpFDL-9GnBQ-1; Mon, 11 Dec 2023 17:14:01 -0500
X-MC-Unique: kjrYrfNoO6GZpFDL-9GnBQ-1
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-1d1e42e807cso32412415ad.3
        for <linux-kbuild@vger.kernel.org>; Mon, 11 Dec 2023 14:14:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702332840; x=1702937640;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iPVf4tIFm+3r3HHF66qfweGUV+NYW/dRVWEv9IV2zdY=;
        b=kjsHCZRNIuAFZRFYZL0lzzia8jPRimMAZZc1/ZJ2B0dxQ6T1FgCF/u9nNshR/5v/kB
         rfienYEO/r76D/VpdAOjhN/xvu8NXrkrY61Hr/97FtkyU1qXw/M9kFSY3rZvXnsyuLjO
         CGD9kgT7oFW4NxhnxM22Q4WP2m4MBKSg5mLfuS1HnmvrhkeU7Z0tSKx181Q+h9vMQEc7
         NknvOuhQOH3sMER/E22p1m7DuDrgmELIznsmymanxSA1SNly5mni2by3quQHPp/XO5YN
         8IJbazFQZrFU8Yykh3ZMGkdAlWqr+g3Ps6yPgcgTElFhDU58iuSM35ihXAmDvt5UlYYc
         R7xg==
X-Gm-Message-State: AOJu0YwqjZK6USnCmPtzE1gWXWGZrKgbgbeqmCwRwY5KBv/dZIFNe3nM
	4j1bm8spMP9Yn5c8rU/Dzvq1V6lrBhlXNCKLIMk9p5MT8LLoX2ySS/HxOSOvHVXSfhVJtN7uPaV
	kmjQ41SD7HZblUHpg1z6S4Q1O
X-Received: by 2002:a17:902:e5ce:b0:1d3:2a94:cb46 with SMTP id u14-20020a170902e5ce00b001d32a94cb46mr1288777plf.31.1702332840671;
        Mon, 11 Dec 2023 14:14:00 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFkKKD1GNOH8Kn0zpCPYCYxVlnLcOySoe0F3975EC+0WOd8bY3cWRYFMYInjvFkdNRrdMJLZw==
X-Received: by 2002:a17:902:e5ce:b0:1d3:2a94:cb46 with SMTP id u14-20020a170902e5ce00b001d32a94cb46mr1288768plf.31.1702332840343;
        Mon, 11 Dec 2023 14:14:00 -0800 (PST)
Received: from localhost.localdomain ([2804:1b3:a802:3102:945e:6f76:fb73:6512])
        by smtp.gmail.com with ESMTPSA id h4-20020a170902f54400b001cf85115f3asm7161187plf.235.2023.12.11.14.13.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Dec 2023 14:13:59 -0800 (PST)
From: Leonardo Bras <leobras@redhat.com>
To: Masahiro Yamada <masahiroy@kernel.org>,
	Leonardo Bras <leobras@redhat.com>,
	Randy Dunlap <rdunlap@infradead.org>,
	Nicolas Schier <nicolas@fjasle.eu>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	linux-kbuild@vger.kernel.org
Subject: [RFC PATCH v6 1/1] scripts: Introduce a default git.orderFile
Date: Mon, 11 Dec 2023 19:13:36 -0300
Message-ID: <20231211221338.127407-1-leobras@redhat.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When reviewing patches, it looks much nicer to have some changes shown
before others, which allow better understanding of the patch before the
the .c files reviewing.

Introduce a default git.orderFile, in order to help developers getting the
best ordering easier.

Signed-off-by: Leonardo Bras <leobras@redhat.com>
Acked-by: Randy Dunlap <rdunlap@infradead.org>
---
Changes since RFCv5:
- Replace "*Kconfig*" by "Kconfig*" + "*/Kconfig*" to avoid matching files
  like foo-Kconfig, which should not be valid here.
- Same of above for "*Kbuild*" and "*Makefile*"
- Thanks Masahiro Yamada for this suggestion!

Changes since RFCv4:
- Added scripts/* into "build system" section
- Added "git-specific" section with this script and .gitignore
- Thanks for this feedback Nicolas!

Changes since RFCv3:
- Added "*types.h" matching so type headers appear before regular headers
- Removed line ends ($) in patterns: they previously provided a
  false-positive
- Fixed build patterns to allow matching Kconfig, Kbuild & Makefile
  in any subdirectory

Changes since RFCv2:
- Fixed licence comment to from /**/ to #
- Fixed filename in how-to comment
- Fix build order: Kconfig -> Kbuild -> Makefile
- Add *.mk extension
- Add line-ends ($) to make sure and get the correct extensions
- Thanks Masahiro Yamada for above suggestions!
- 1 Ack, thanks Randy!

Changes since RFCv1:
- Added Kconfig* (thanks Randy Dunlap!)
- Changed Kbuild to Kbuild* (improve matching)


 scripts/git.orderFile | 42 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 42 insertions(+)
 create mode 100644 scripts/git.orderFile

diff --git a/scripts/git.orderFile b/scripts/git.orderFile
new file mode 100644
index 0000000000000..5102ba73357f0
--- /dev/null
+++ b/scripts/git.orderFile
@@ -0,0 +1,42 @@
+# SPDX-License-Identifier: GPL-2.0
+
+# order file for git, to produce patches which are easier to review
+# by diffing the important stuff like header changes first.
+#
+# one-off usage:
+#   git diff -O scripts/git.orderFile ...
+#
+# add to git config:
+#   git config diff.orderFile scripts/git.orderFile
+#
+
+MAINTAINERS
+
+# Documentation
+Documentation/*
+*.rst
+
+# git-specific
+.gitignore
+scripts/git.orderFile
+
+# build system
+Kconfig*
+*/Kconfig*
+Kbuild*
+*/Kbuild*
+Makefile*
+*/Makefile*
+*.mak
+*.mk
+scripts/*
+
+# semantic patches
+*.cocci
+
+# headers
+*types.h
+*.h
+
+# code
+*.c
-- 
2.43.0


