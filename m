Return-Path: <linux-kbuild+bounces-2319-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C4DE39246E9
	for <lists+linux-kbuild@lfdr.de>; Tue,  2 Jul 2024 20:04:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 80882287786
	for <lists+linux-kbuild@lfdr.de>; Tue,  2 Jul 2024 18:04:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C660D1C230E;
	Tue,  2 Jul 2024 18:03:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fdFGdGQS"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A01281C2308;
	Tue,  2 Jul 2024 18:03:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719943417; cv=none; b=YPaRutgKLI7NSSTvIHV5ccdz1ERQYlb86li5kPzbE9oAG31YbmaIL+U/SV3F4/I6tZ8LLrJAHAIt0hzzWXl3axk8c4Af6Z1ReAFMXD5L8TiLBV1p5rMDGSRLXj6IcSQRbuOfWlJgbsQgEXaHr3XNX32Xvf+UoYC8F9qcklnvlJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719943417; c=relaxed/simple;
	bh=lf+3YIV6GJEHHtvc0aZRR8uMxi/pZD7e0qFLN3AxOXE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Ut72xbD3bWIRtQ7cPvo9R6T6vVI5ZkqhOvogDxLSEyYBfUCC//0bIBTsAffXMgSUGw6x6mEYvOgEMzXasgRWvyO4kWtJHMKdbyhn8V5kDOPZ+Z7s2wE2jyjfYwqfda+y4WtBqeLzhN0DvP+isUHQQNYtL4jqYBU/cHHZCD0d/Uo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fdFGdGQS; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB7E4C116B1;
	Tue,  2 Jul 2024 18:03:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719943417;
	bh=lf+3YIV6GJEHHtvc0aZRR8uMxi/pZD7e0qFLN3AxOXE=;
	h=From:To:Cc:Subject:Date:From;
	b=fdFGdGQS5PT1epVp298uigkPx2CD7bLcjOGM+Hsx9OYtw0H3FK4C+yYQ1e/ttZaGc
	 +XiVvpGRtmhllb5j2noqZISj4JKvSUl/JefAIHu8zT0zbcWi3SQDhRlF7Y7vMdJxQB
	 OJ60BfP75VotLZdXKDn4oz/hz5o2MBWIL0j06VXN68kU2yzBn0iUgHFUR7p8VhBPfu
	 nba5TfNQCogjLg+maNqgNnweIa6i8dtBwJVUesfYWiwfgqwQL/DB80LmXzEQmIoLgc
	 XM5nHA34FK8l3sdFjqpaSWNyCdKQanK0PSRxVCnJ+xmZxY0HsNyE5bGGnuBS9esmQh
	 Vei1psezg3Jzw==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>
Subject: [PATCH v2 1/3] kbuild: deb-pkg: remove support for EMAIL environment variable
Date: Wed,  3 Jul 2024 03:02:40 +0900
Message-ID: <20240702180332.398978-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit edec611db047 ("kbuild, deb-pkg: improve maintainer
identification") added the EMAIL and NAME environment variables.

Commit d5940c60e057 ("kbuild: deb-pkg improve maintainer address
generation") removed support for NAME, but kept support for EMAIL.

The EMAIL and NAME environment variables are still supported by some
tools (see 'man debchange'), but not by all.

We should support both of them, or neither of them. We should not stop
halfway.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

Changes in v2:
 - New patch

 scripts/package/mkdebian | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/package/mkdebian b/scripts/package/mkdebian
index b9a5b789c655..589f92b88c42 100755
--- a/scripts/package/mkdebian
+++ b/scripts/package/mkdebian
@@ -125,7 +125,7 @@ gen_source ()
 rm -rf debian
 mkdir debian
 
-email=${DEBEMAIL-$EMAIL}
+email=${DEBEMAIL}
 
 # use email string directly if it contains <email>
 if echo "${email}" | grep -q '<.*>'; then
-- 
2.43.0


