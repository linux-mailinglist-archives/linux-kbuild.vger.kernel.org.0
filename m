Return-Path: <linux-kbuild+bounces-4733-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F2749D311D
	for <lists+linux-kbuild@lfdr.de>; Wed, 20 Nov 2024 00:57:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A1B50B2389E
	for <lists+linux-kbuild@lfdr.de>; Tue, 19 Nov 2024 23:57:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 88EFE1C4A3F;
	Tue, 19 Nov 2024 23:57:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XRRyICJU"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F1AD1C3F0E;
	Tue, 19 Nov 2024 23:57:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732060631; cv=none; b=ru/XIwXijgqwQKvcWgb2BJtIspiJWn5q8HtdM6cDLuIGLvZsf35lppEURXBz2SuuyGA1qM/2dNAlbu35TUZtydwPAkRBSQMrNyPJp9/WZ0i3HL9K6AbWJy5jVKQd+Al4c+YaXikS87sZCuv9flUXlDPgc7cTcS0DgMMjTus6a+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732060631; c=relaxed/simple;
	bh=ZqVUFOpUrJX2TGES1LxXdj47b6mTQNCl9ZFbrzn6zmo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=da7Hw+2QCLtR0daTlonN2t+rb1obb30g5kTzlh83rEoKF7qAWxDyqEOcUHuWt1B4dKcuPSfpm7+nK2XzbT2daiNPOsFARQeNFfkWW8pzdlYJi5UV57s+GdpbxVhnSRv7poMQNU5vHyoISYjiywjkvXQQDJQKOnwfV69tT92PWcU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XRRyICJU; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB771C4CECF;
	Tue, 19 Nov 2024 23:57:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732060631;
	bh=ZqVUFOpUrJX2TGES1LxXdj47b6mTQNCl9ZFbrzn6zmo=;
	h=From:To:Cc:Subject:Date:From;
	b=XRRyICJU9aXZq3YxJqHDMSHGpzOKAUu9JiaaYOSo9Hg09yKoWoEHRkPqo83IMqe33
	 8dWZHGpqL5LoJs+ggTURL9oMv9W11clmAitIRpfkcP6XhnR7mX9vwM/nWb8E8aXH+P
	 hoQSlxierN+wK/4MymHPzi4FeFoiVyOFyR+IVDzAWoY69Hni4j1S9SlS1J7YhNv/K3
	 j7KA6TnrMRVzpiuAMl0llLva03nCIc5w8CqAFmlswUELSC0X9gm+LTYZ/HLAxbC53x
	 rst5/MR0pjd2mJvgcidSXpeZoDcpezxM6T8KYx8KSSu+04nASPYNMFRil0GigkPMl8
	 RW6YUVNuw30Gg==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <masahiroy@kernel.org>,
	Andreas Schwab <schwab@linux-m68k.org>,
	Jean Delvare <khali@linux-fr.org>,
	Jochen Friedrich <jochen@scram.de>,
	Michal Marek <mmarek@suse.cz>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>,
	Sam Ravnborg <sam@ravnborg.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 01/15] modpost: remove incorrect code in do_eisa_entry()
Date: Wed, 20 Nov 2024 08:56:39 +0900
Message-ID: <20241119235705.1576946-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This function contains multiple bugs after the following commits:

 - ac551828993e ("modpost: i2c aliases need no trailing wildcard")
 - 6543becf26ff ("mod/file2alias: make modalias generation safe for cross compiling")

Commit ac551828993e inserted the following code to do_eisa_entry():

    else
            strcat(alias, "*");

This is incorrect because 'alias' is uninitialized. If it is not
NULL-terminated, strcat() could cause a buffer overrun.

Even if 'alias' happens to be zero-filled, it would output:

    MODULE_ALIAS("*");

This would match anything. As a result, the module could be loaded by
any unrelated uevent from an unrelated subsystem.

Commit ac551828993e introduced another bug.            

Prior to that commit, the conditional check was:

    if (eisa->sig[0])

This checked if the first character of eisa_device_id::sig was not '\0'.

However, commit ac551828993e changed it as follows:

    if (sig[0])

sig[0] is NOT the first character of the eisa_device_id::sig. The
type of 'sig' is 'char (*)[8]', meaning that the type of 'sig[0]' is
'char [8]' instead of 'char'. 'sig[0]' and 'symval' refer to the same
address, which never becomes NULL.

The correct conversion would have been:

    if ((*sig)[0])

However, this if-conditional was meaningless because the earlier change
in commit ac551828993e was incorrect.

This commit removes the entire incorrect code, which should never have
been executed.

Fixes: ac551828993e ("modpost: i2c aliases need no trailing wildcard")
Fixes: 6543becf26ff ("mod/file2alias: make modalias generation safe for cross compiling")
Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/mod/file2alias.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/scripts/mod/file2alias.c b/scripts/mod/file2alias.c
index c4cc11aa558f..634e40748287 100644
--- a/scripts/mod/file2alias.c
+++ b/scripts/mod/file2alias.c
@@ -809,10 +809,7 @@ static int do_eisa_entry(const char *filename, void *symval,
 		char *alias)
 {
 	DEF_FIELD_ADDR(symval, eisa_device_id, sig);
-	if (sig[0])
-		sprintf(alias, EISA_DEVICE_MODALIAS_FMT "*", *sig);
-	else
-		strcat(alias, "*");
+	sprintf(alias, EISA_DEVICE_MODALIAS_FMT "*", *sig);
 	return 1;
 }
 
-- 
2.43.0


