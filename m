Return-Path: <linux-kbuild+bounces-7215-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0537EAC0575
	for <lists+linux-kbuild@lfdr.de>; Thu, 22 May 2025 09:17:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B2D1F4A4D48
	for <lists+linux-kbuild@lfdr.de>; Thu, 22 May 2025 07:17:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3ADFE1DAC92;
	Thu, 22 May 2025 07:17:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="c/HExBbR"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11996176ADE;
	Thu, 22 May 2025 07:17:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747898271; cv=none; b=AOztbt3YXtY3puw6aQXHtXHDYlOMTfpLd5daO2nI/F12JkCO0TM5ohllybOOtXYy2zI/3VnBV9m/6nM16YIrgFTekVBM+bEHbQMgJyaGJXByuaMzTYiTWwNqw28CHTbS7T8uxZIxYOvtBweGafb2+ekUzu13nTTfuO9R5SUcKiQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747898271; c=relaxed/simple;
	bh=2molLP2ELmkImS8AzK2bLFsj2uDwj+GneJ39C7PQ3kI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=GdBk+QuL7Y0+nXsu8vHtpPm0OAptIb0xu9BaSJ2B8zxFGQ/YNIZDNxFkMs9ZpTF6oZ7dG7YDLoiEaqAzqm6arNJICIgl7ZbEM/qGUfnK4sF/iR6IXlUJ2lkq8m7Dz7eFR9/IT2emZRDPKLypeHe48sigZNbv2Lcp+T+dPboZSp8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=c/HExBbR; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3485EC4CEE4;
	Thu, 22 May 2025 07:17:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747898270;
	bh=2molLP2ELmkImS8AzK2bLFsj2uDwj+GneJ39C7PQ3kI=;
	h=From:To:Cc:Subject:Date:From;
	b=c/HExBbRI7+DEpwuPrvym+grc3HzKqS69HvXuCSbblBkntosULw2JF8/CEPw+7Pk0
	 l2QvMqRXjgKaXzsP47pch//aYP4XyCo8f7Ph1tZE2WQtbxRD+z5oNnlx4ZpfKmqN7d
	 aY+Fo6k8c2XUGgkaHwSzaw9A6FkjxyYAfVVKkrg+S+I63Ja2k1v9jtUx9zWQ3WcJUv
	 9i4bfP9tI7/Zjdtm1F9D/Gkk4AWYIJOzCrQ/k7Y3n4/UGDS7LlblGywjc195kx49Gr
	 rSaA6NyHOeZGsBqPa/mn9vJYnz7VIEPNudSviG7Wf3yxoMRtopJUD0BKVeUiUNb19r
	 V4ghn9RsSt7cQ==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas.schier@linux.dev>
Subject: [PATCH 1/3] modpost: check forbidden MODULE_IMPORT_NS("module:") at compile time
Date: Thu, 22 May 2025 16:17:20 +0900
Message-ID: <20250522071744.2362563-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Explicitly adding MODULE_IMPORT_NS("module:...") is not allowed.

Currently, this is only checked at run time. That is, when such a
module is loaded, an error message like the following is shown:

  foo: module tries to import module namespace: module:bar

Obviously, checking this at compile time improves usability.

In such a case, modpost will report the following error at compile time:

  ERROR: modpost: foo: explicitly importing namespace "module:bar" is not allowed.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/mod/modpost.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
index 16a69a129805..5ca7c268294e 100644
--- a/scripts/mod/modpost.c
+++ b/scripts/mod/modpost.c
@@ -28,6 +28,8 @@
 #include "modpost.h"
 #include "../../include/linux/license.h"
 
+#define MODULE_NS_PREFIX "module:"
+
 static bool module_enabled;
 /* Are we using CONFIG_MODVERSIONS? */
 static bool modversions;
@@ -1597,8 +1599,13 @@ static void read_symbols(const char *modname)
 
 		for (namespace = get_modinfo(&info, "import_ns");
 		     namespace;
-		     namespace = get_next_modinfo(&info, "import_ns", namespace))
+		     namespace = get_next_modinfo(&info, "import_ns", namespace)) {
+			if (strstarts(namespace, MODULE_NS_PREFIX))
+				error("%s: explicitly importing namespace \"%s\" is not allowed.\n",
+				      mod->name, namespace);
+
 			add_namespace(&mod->imported_namespaces, namespace);
+		}
 
 		if (!get_modinfo(&info, "description"))
 			warn("missing MODULE_DESCRIPTION() in %s\n", modname);
-- 
2.43.0


