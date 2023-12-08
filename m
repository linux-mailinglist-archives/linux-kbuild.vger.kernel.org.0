Return-Path: <linux-kbuild+bounces-301-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A5F480ABEC
	for <lists+linux-kbuild@lfdr.de>; Fri,  8 Dec 2023 19:19:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D889528184D
	for <lists+linux-kbuild@lfdr.de>; Fri,  8 Dec 2023 18:19:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B56447A4A;
	Fri,  8 Dec 2023 18:19:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="cdmIiX2j"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9A95A8E
	for <linux-kbuild@vger.kernel.org>; Fri,  8 Dec 2023 10:19:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1702059563;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=JoC6C0Qt+cZ8XaWFigMJ7rxzgccRqB4PBw4Ey/TxzFU=;
	b=cdmIiX2jP4WG3JyiS7lDzwdYVzUox8P7rSk5m0nfCNEvip4Y3q5/9FeK9kdYE/w2DH5LWK
	TZh+E5/Y2fJ4DayGcW/lyn4A0XEc4iKZTt5vj6pCkLECPfs1eHGqKFYIZzaX7mrfJE6cdh
	7+SuZvuLcul/Q+akRtCYjsRHrku0il4=
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-19-SdAQWJAoPZCzEU7Pv2e2fQ-1; Fri, 08 Dec 2023 13:19:21 -0500
X-MC-Unique: SdAQWJAoPZCzEU7Pv2e2fQ-1
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-286da86884aso2449748a91.2
        for <linux-kbuild@vger.kernel.org>; Fri, 08 Dec 2023 10:19:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702059560; x=1702664360;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JoC6C0Qt+cZ8XaWFigMJ7rxzgccRqB4PBw4Ey/TxzFU=;
        b=dkeN1pgAlTYbm8YppsQ79lqiJWLqeFt8f2YZZzRnpNjb41VenGs6PIBOzcdvzCSRTf
         s5CjyxL5AJbUWySQDfoRZZV7xfkqgQp23BPb1y1cRkJEjLmSqH6ECE4M4qOzhlgUu8kN
         R6ZLgnnFSz8fn8l7TIYZFvuOCbEY5IqBkbaWsYx++kTDTuSXmYeHfYi/7uiN/P6nPVpJ
         YMPc6BpNtTjwTJeOA5b3r5pnv1H4QfXsJ5kKUXdfPMP9FIeuv/jmhPOh/OHfMj3+IUDe
         e2CjbGkoUJMBcI2N6c5ni3/FSorrp7uMynWtRJq3Bht3xSGJUUjO2lzeuj824KCLUdAv
         cFGA==
X-Gm-Message-State: AOJu0YzJgoG2UwYaNkzKNcIGNwWG8M5HR6aRjJ+9Z7VFUp4iiYAQnFr7
	afSNQrDO2nAOh1tT0fwih0z6Hlk/1yq39A8sKBsdu1FNVqbVuSnbHy2pTJ9Z4rHwtYYLBF5gi6B
	ApNgibWxUJcNCOSfjx7fVskgj
X-Received: by 2002:a17:90a:31c1:b0:286:f3ec:2a1 with SMTP id j1-20020a17090a31c100b00286f3ec02a1mr481794pjf.31.1702059560077;
        Fri, 08 Dec 2023 10:19:20 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHq4cBA5GOYYWapZTOYQl4KicLt+LHsS/YF5ucQ7VRArZok5+KjzEjAHu97Bhur3Vorj76H3g==
X-Received: by 2002:a17:90a:31c1:b0:286:f3ec:2a1 with SMTP id j1-20020a17090a31c100b00286f3ec02a1mr481786pjf.31.1702059559735;
        Fri, 08 Dec 2023 10:19:19 -0800 (PST)
Received: from localhost.localdomain ([2804:1b3:a802:3102:945e:6f76:fb73:6512])
        by smtp.gmail.com with ESMTPSA id nk10-20020a17090b194a00b002865781c51dsm3711169pjb.18.2023.12.08.10.19.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Dec 2023 10:19:19 -0800 (PST)
From: Leonardo Bras <leobras@redhat.com>
To: Randy Dunlap <rdunlap@infradead.org>,
	Nicolas Schier <nicolas@fjasle.eu>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Leonardo Bras <leobras@redhat.com>
Cc: linux-kernel@vger.kernel.org,
	linux-kbuild@vger.kernel.org
Subject: [RFC PATCH v5 1/1] scripts: Introduce a default git.orderFile
Date: Fri,  8 Dec 2023 15:18:03 -0300
Message-ID: <20231208181802.88528-3-leobras@redhat.com>
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


 scripts/git.orderFile | 39 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 39 insertions(+)
 create mode 100644 scripts/git.orderFile

diff --git a/scripts/git.orderFile b/scripts/git.orderFile
new file mode 100644
index 0000000000000..31649ff53d22c
--- /dev/null
+++ b/scripts/git.orderFile
@@ -0,0 +1,39 @@
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
+*Kconfig*
+*Kbuild*
+*Makefile*
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


