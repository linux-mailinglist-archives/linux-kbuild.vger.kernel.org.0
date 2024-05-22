Return-Path: <linux-kbuild+bounces-1913-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CAA88CBF60
	for <lists+linux-kbuild@lfdr.de>; Wed, 22 May 2024 12:43:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CC728B215A8
	for <lists+linux-kbuild@lfdr.de>; Wed, 22 May 2024 10:43:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 18770823CC;
	Wed, 22 May 2024 10:43:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iAFKYgzy"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3BB180035;
	Wed, 22 May 2024 10:43:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716374609; cv=none; b=cwCmmC0LQGLRJxoPcIbnz01zvPKIB6gGXcN/uvkSc+9QxeYTcm1FdrSf+ORn7+BMZwYsg0txSf1j5o2QCsiOv2WfieNlCABrcAome77+uJ/KHyFTJjmsiFrYoD4vKA9U0DCapzmDJ4gd3i1+QEe/nXXlW/usRkAEjmuMJc57tc4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716374609; c=relaxed/simple;
	bh=0ttUgRMixP8hVb/G+KNIz9L/c2GGq97WFw0Sz8mAXd0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=A1DpTAWXc+Fzj28ctLKoxKKKKYA0AwALJ1L+yUDSkR3fXwqkgP1mX6njnLSn+5tOSrIi0P/qsh2Iudl2BNObX9y7Rt/nh9my1Co0EDor2SrVzPpXw4i5DZ7KZM8fFt5DR8wuBBqcd32Q6AmT58FpZegidBmkcm9C4Kovx24bFAo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iAFKYgzy; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 15ADEC2BD11;
	Wed, 22 May 2024 10:43:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716374608;
	bh=0ttUgRMixP8hVb/G+KNIz9L/c2GGq97WFw0Sz8mAXd0=;
	h=From:To:Cc:Subject:Date:From;
	b=iAFKYgzyikSSFYF9Jil1edCq+NiU755BLCzC6/NRPCLol7IRoBBtXzdCoTVwPGf/0
	 QAyjsP9Qiuz1B8OSFFnvR/3SuwOVXRvZ74c0IJ5FcgZseTPZhEUy39IaZZjAHevpL1
	 crCQ4zDaiSYNLR67BWEXhIJXWDjPgocFwe6JnvpxfrALd7vG+DSnBGgN8UUM/+Lp3r
	 MSEcBzR3u4T1VqUi5DTaaV7mpd/CE59zVpK5iolbVBMo2UYGyAPEOGLhWrKAz8B5yG
	 ZzR/9jlxIrMNS7igmjLzPOTerEMbGF2SLrSTBHhx2Rt61V6ToOfgiojXkANU5hwK9B
	 dftylqkmdfKKA==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>
Subject: [PATCH] kbuild: remove a stale comment about cleaning in link-vmlinux.sh
Date: Wed, 22 May 2024 19:43:11 +0900
Message-Id: <20240522104311.292925-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.40.1
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove the left-over of commit 51eb95e2da41 ("kbuild: Don't remove
link-vmlinux temporary files on exit/signal").

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/link-vmlinux.sh | 1 -
 1 file changed, 1 deletion(-)

diff --git a/scripts/link-vmlinux.sh b/scripts/link-vmlinux.sh
index 7aca51b24e9f..46ce5d04dbeb 100755
--- a/scripts/link-vmlinux.sh
+++ b/scripts/link-vmlinux.sh
@@ -201,7 +201,6 @@ sorttable()
 	${objtree}/scripts/sorttable ${1}
 }
 
-# Delete output files in case of error
 cleanup()
 {
 	rm -f .btf.*
-- 
2.40.1


