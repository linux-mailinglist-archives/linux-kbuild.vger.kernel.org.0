Return-Path: <linux-kbuild+bounces-2952-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7659F94ED5A
	for <lists+linux-kbuild@lfdr.de>; Mon, 12 Aug 2024 14:49:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2BA891F21C16
	for <lists+linux-kbuild@lfdr.de>; Mon, 12 Aug 2024 12:49:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 302AA17C225;
	Mon, 12 Aug 2024 12:49:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XlaRR4CH"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0932717C21C;
	Mon, 12 Aug 2024 12:49:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723466948; cv=none; b=RnOir28t/gDukHRD034s7oz+H4uWrVVL/oie20QZV9zqCXIFf5oLZY9cUiy33pInpLTZA1ENQHCRNzcczkcHJvYE8AI8+ZFsOXtNn2eDGoLulGYc5yg3wY/n7tFrbBkquwtvEbifSiVzclG5ztN3R0owNZ2YtfTf9f2LlPtQghY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723466948; c=relaxed/simple;
	bh=02Pj1beU0IRFdGsryWL1zfFXnXFEMSju0qFxRU+Flrw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=D4xtjYcdIloMv8ZNOYsS9z+1KpYpYqykRM3gIwLHCs0j2bB/oIr9HIMsU6Rx5hplt5yTcYCikiWRGP4a+Cpp0RCjQMZfkQSwkJkuLqejP77xfIdyd022yIGu0U0YBrk5v5cFK/CUG9W0iEcbWfBlBdTwk9F8UZ2Q1Eh/P65Dl2A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XlaRR4CH; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D4B2C4AF15;
	Mon, 12 Aug 2024 12:49:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723466947;
	bh=02Pj1beU0IRFdGsryWL1zfFXnXFEMSju0qFxRU+Flrw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=XlaRR4CH5Ja+d1IbbJLDT7/BxemcE3PCobmiu41D4g3Z6FlQvSphLjOvwOF2yrdSn
	 9siTE0ItamINcjBiBs/nT2tAlj+WqK6PJNCSXrVWHJ8VZAteS9GqAifk3IqAnY2KrL
	 qaiZZmPiDXcWVwe4h4M0jzy4jEKmKrM6BHk+zFeCzpdYh/zwD6MOg3g5+o2ZeBUTHg
	 43yl5jcxCubonO6De19sYy/pKklw6UD364beHQfwgD3EPe79SHJuAlGg4U7ZMYF3AW
	 PI9lC4gx7dBer4q6D7AqhVSUiwtQeZHcroBM7h4DUi6oYPVLO8XROmytLb9vKmQ26j
	 /EvRPOgj7O6Uw==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>
Subject: [PATCH 4/4] fixdep: use xmalloc()
Date: Mon, 12 Aug 2024 21:48:53 +0900
Message-ID: <20240812124858.2107328-4-masahiroy@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240812124858.2107328-1-masahiroy@kernel.org>
References: <20240812124858.2107328-1-masahiroy@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When malloc() fails, there is not much userspace programs can do.
xmalloc() is useful to bail out on a memory allocation failure.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/basic/fixdep.c | 15 +++++----------
 1 file changed, 5 insertions(+), 10 deletions(-)

diff --git a/scripts/basic/fixdep.c b/scripts/basic/fixdep.c
index 84b6efa849f4..cdd5da7e009b 100644
--- a/scripts/basic/fixdep.c
+++ b/scripts/basic/fixdep.c
@@ -99,6 +99,8 @@
 #include <stdio.h>
 #include <ctype.h>
 
+#include <xalloc.h>
+
 static void usage(void)
 {
 	fprintf(stderr, "Usage: fixdep <depfile> <target> <cmdline>\n");
@@ -131,12 +133,9 @@ static unsigned int strhash(const char *str, unsigned int sz)
 static void add_to_hashtable(const char *name, int len, unsigned int hash,
 			     struct item *hashtab[])
 {
-	struct item *aux = malloc(sizeof(*aux) + len);
+	struct item *aux;
 
-	if (!aux) {
-		perror("fixdep:malloc");
-		exit(1);
-	}
+	aux = xmalloc(sizeof(*aux) + len);
 	memcpy(aux->name, name, len);
 	aux->len = len;
 	aux->hash = hash;
@@ -228,11 +227,7 @@ static void *read_file(const char *filename)
 		perror(filename);
 		exit(2);
 	}
-	buf = malloc(st.st_size + 1);
-	if (!buf) {
-		perror("fixdep: malloc");
-		exit(2);
-	}
+	buf = xmalloc(st.st_size + 1);
 	if (read(fd, buf, st.st_size) != st.st_size) {
 		perror("fixdep: read");
 		exit(2);
-- 
2.43.0


