Return-Path: <linux-kbuild+bounces-3458-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B3EEF97010E
	for <lists+linux-kbuild@lfdr.de>; Sat,  7 Sep 2024 10:53:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6A3941F23145
	for <lists+linux-kbuild@lfdr.de>; Sat,  7 Sep 2024 08:53:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1942314D6EB;
	Sat,  7 Sep 2024 08:53:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PZP2qio4"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4A361BC23;
	Sat,  7 Sep 2024 08:53:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725699214; cv=none; b=AcHHzMokWmuNGQmr1q6T7KaUZvm/Z9rWobsaEi2VknvxT9QALvA3z6QDIkPoIlac9xmgWJJC9DC/kkHJTBJEZRqUHsR6WlKmBaqvh1YTOdz3Dm5sIxfWOW74iK3EqmXncR4S4S47KiFoPs/EklsKKFxJE2ntue6IK/RDAyssHrg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725699214; c=relaxed/simple;
	bh=/DNGuzdxEIN4OIYC8u0bRlwlNUKKmsWXBrkwNV4Ey24=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Zi+eiVa9fbDe4qJ2G7DMaaozGSgOUrlGXWQ3PRkrbcaH8fZl2F885LZbFYGyN0/59MKCP6nl3sYLzZ0Sdh2fDOuvQzsPy4BI7JnfhGqn8XD74UUHCVLqp6GBhyC1kZ4QvVAcivaIMqF4kXBxzjMRhctsjWhu8pg6gJNv9+Ldjlg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PZP2qio4; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9ADDAC4CEC2;
	Sat,  7 Sep 2024 08:53:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725699213;
	bh=/DNGuzdxEIN4OIYC8u0bRlwlNUKKmsWXBrkwNV4Ey24=;
	h=From:To:Cc:Subject:Date:From;
	b=PZP2qio4ID3wtcyixkHzrUfW00t2Wak1lPVcAiDM8QWp+G0hOiP8wndu57N+xb8+C
	 Uom777Kz4D7Vi1MQPIIwh/UlQBfo5xyVFyUDseXCE1Lt2lgjPHbXDiNGsA5mlpCWQs
	 Z4mUl7MNVk7rw4RfukbhHt6Fj/8u/UKh0Ui+e9cWkUQ1cogOrue7hqKsdA1NDMXQgH
	 f0mMhnoI2MrPXnR6kN8Nyo2/NLLKHc3kWelmoEbANX1vlQeJZn4nfTNcJ11qdGDxs0
	 Obt1/tH4nOuhW5sAfwRBj51RMvJsoU3XSJKb6ek6vxSS0VT05jfx5S87u1EylFbApE
	 02wxyndPgBqsA==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH 1/2] kallsyms: squash output_address()
Date: Sat,  7 Sep 2024 17:53:22 +0900
Message-ID: <20240907085328.1374086-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

After commit 64e166099b69 ("kallsyms: get rid of code for absolute,
kallsyms"), there is only one call site for output_address(). Squash it.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/kallsyms.c | 15 +++++----------
 1 file changed, 5 insertions(+), 10 deletions(-)

diff --git a/scripts/kallsyms.c b/scripts/kallsyms.c
index c70458e68ece..f6bb7fb2536b 100644
--- a/scripts/kallsyms.c
+++ b/scripts/kallsyms.c
@@ -292,15 +292,6 @@ static void output_label(const char *label)
 	printf("%s:\n", label);
 }
 
-/* Provide proper symbols relocatability by their '_text' relativeness. */
-static void output_address(unsigned long long addr)
-{
-	if (_text <= addr)
-		printf("\tPTR\t_text + %#llx\n", addr - _text);
-	else
-		printf("\tPTR\t_text - %#llx\n", _text - addr);
-}
-
 /* uncompress a compressed symbol. When this function is called, the best table
  * might still be compressed itself, so the function needs to be recursive */
 static int expand_symbol(const unsigned char *data, int len, char *result)
@@ -488,7 +479,11 @@ static void write_src(void)
 	printf("\n");
 
 	output_label("kallsyms_relative_base");
-	output_address(relative_base);
+	/* Provide proper symbols relocatability by their '_text' relativeness. */
+	if (_text <= relative_base)
+		printf("\tPTR\t_text + %#llx\n", relative_base - _text);
+	else
+		printf("\tPTR\t_text - %#llx\n", _text - relative_base);
 	printf("\n");
 
 	sort_symbols_by_name();
-- 
2.43.0


