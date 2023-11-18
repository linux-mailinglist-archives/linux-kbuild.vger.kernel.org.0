Return-Path: <linux-kbuild+bounces-52-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6413D7EFE60
	for <lists+linux-kbuild@lfdr.de>; Sat, 18 Nov 2023 08:59:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 72A581C20860
	for <lists+linux-kbuild@lfdr.de>; Sat, 18 Nov 2023 07:59:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5BBA9110F;
	Sat, 18 Nov 2023 07:59:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SqkBXj4R"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3524C63B2
	for <linux-kbuild@vger.kernel.org>; Sat, 18 Nov 2023 07:59:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17AD1C433C7;
	Sat, 18 Nov 2023 07:59:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700294356;
	bh=FUJGT7Wxv+A9qlisbFn6Z/VU7oX5Ys4xFHdHW9fEVFQ=;
	h=From:To:Cc:Subject:Date:From;
	b=SqkBXj4ROG6o8h/47chPS34ducc2BQrT+TZDy8Ool3IvQ0UiqmYgaVQm838jnb9h/
	 dh2Eod92LXLdxcInnHoEBD6/o0f7gRxdA0me2vM/GcgoEkfYg5dVH5+O6SQoRYGCG5
	 OE7qeFXedj3McK0OrSTq9mPaVbsQu4dPSscNaDuFZ5ztZ7zDXynQ0Dqxba7zGfHmor
	 0jhLRNRP6HcpIdgjxxn4XSAourXfi3o1KRvDq3Tzi28o8o3wW1d1sa8Ca0pB4Ptd+D
	 nGiYYCsO15qTJzRHCoNpxDdraZWrTqt3cC0s8BuZxaTn8aGGdel0soxC3u//6YlTYs
	 QhV+yQDtLVH6Q==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH 1/6] kconfig: require a space after '#' for valid input
Date: Sat, 18 Nov 2023 16:59:07 +0900
Message-Id: <20231118075912.1303509-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.40.1
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Currently, when an input line starts with '#', (line + 2) is passed to
memcmp() without checking line[1].

It means that line[1] can be any arbitrary character. For example,
"#KCONFIG_FOO is not set" is accepted as valid input, functioning the
same as "# CONFIG_FOO is not set".

More importantly, this can potentially lead to a buffer overrun if
line[1] == '\0'. It occurs if the input only contains '#', as
(line + 2) points to an uninitialized buffer.

Check line[1], and skip the line if it is not a space.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/kconfig/confdata.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/scripts/kconfig/confdata.c b/scripts/kconfig/confdata.c
index 2ba4dfdd1aee..556b7f087dbb 100644
--- a/scripts/kconfig/confdata.c
+++ b/scripts/kconfig/confdata.c
@@ -426,6 +426,8 @@ int conf_read_simple(const char *name, int def)
 		conf_lineno++;
 		sym = NULL;
 		if (line[0] == '#') {
+			if (line[1] != ' ')
+				continue;
 			if (memcmp(line + 2, CONFIG_, strlen(CONFIG_)))
 				continue;
 			p = strchr(line + 2 + strlen(CONFIG_), ' ');
-- 
2.40.1


