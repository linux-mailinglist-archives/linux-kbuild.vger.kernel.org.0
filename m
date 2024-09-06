Return-Path: <linux-kbuild+bounces-3443-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 26E4396F82A
	for <lists+linux-kbuild@lfdr.de>; Fri,  6 Sep 2024 17:29:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D29C928731C
	for <lists+linux-kbuild@lfdr.de>; Fri,  6 Sep 2024 15:29:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4DD6E1D1F56;
	Fri,  6 Sep 2024 15:29:46 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B783C322A;
	Fri,  6 Sep 2024 15:29:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725636586; cv=none; b=MLqIdEzn14zRqL/kCn8fQAm0zW9rs9cBBI/SpuIpTuEcXi2eJ/QliK8kTSRHDZX4qJ0j0rPU2VrWbZ1pa5ThroDD9Z3QwnYNxvhYugfCz7w+ck6IsXHetjZDOL7cNazVpJ/IUZmpXmgsWgpGdkDZdXaRseKTmEXqRnING+RzrF8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725636586; c=relaxed/simple;
	bh=llkO5OsHvfXy44q2lZPmfeJPE2omDkIKU6HWmfQjAho=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=c+XGgLWqup7b3j4bO6lgcXrz9ZG3WrtincDBCpweyoGoSL5uEFQAVmVoKDrWfUTe+rvHOL+BNN0QztiykE4W+JJgqKCG8jMqcMtBx+S557WwAsMks4dcckH9IwRvW75y+nRRIzBuR1GrfgFb+EdmzWpNwrhAtyq5ysKCWgHB8cQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
From: Sam James <sam@gentoo.org>
To: Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>
Cc: Sam James <sam@gentoo.org>,
	Masahiro Yamada <yamada.masahiro@socionext.com>,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] fixdep: handle short reads in read_file
Date: Fri,  6 Sep 2024 16:29:20 +0100
Message-ID: <3132727fea08e81e834104761b5a5630d337340a.1725636560.git.sam@gentoo.org>
X-Mailer: git-send-email 2.46.0
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

50% or so of kernel builds within our package manager fail for me with
'fixdep: read: success' because read(), for some reason - possibly ptrace,
only read a short amount, not the full size.

Unfortunately, this didn't trigger a -Wunused-result warning because
we _are_ checking the return value, but with a bad comparison (it's completely
fine for read() to not read the whole file in one gulp).

Fixes: 01b5cbe7012fb1eeffc5c143865569835bcd405e
Signed-off-by: Sam James <sam@gentoo.org>
---
 scripts/basic/fixdep.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/scripts/basic/fixdep.c b/scripts/basic/fixdep.c
index 84b6efa849f4d..04d7742c99ac2 100644
--- a/scripts/basic/fixdep.c
+++ b/scripts/basic/fixdep.c
@@ -233,9 +233,15 @@ static void *read_file(const char *filename)
 		perror("fixdep: malloc");
 		exit(2);
 	}
-	if (read(fd, buf, st.st_size) != st.st_size) {
-		perror("fixdep: read");
-		exit(2);
+	ssize_t bytes = 0;
+	while (bytes < st.st_size) {
+               ssize_t cur = read(fd, buf + bytes, st.st_size - bytes);
+		if (cur == -1) {
+			perror("fixdep: read");
+			exit(2);
+		} else {
+			bytes += cur;
+		}
 	}
 	buf[st.st_size] = '\0';
 	close(fd);
-- 
2.46.0


