Return-Path: <linux-kbuild+bounces-4820-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B2059D6829
	for <lists+linux-kbuild@lfdr.de>; Sat, 23 Nov 2024 09:27:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BFD13281BDD
	for <lists+linux-kbuild@lfdr.de>; Sat, 23 Nov 2024 08:27:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 556E11514EE;
	Sat, 23 Nov 2024 08:27:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OGSCqUW2"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27BD44A0A;
	Sat, 23 Nov 2024 08:27:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732350465; cv=none; b=jMBAxKep7A0c4CMMI1ldldjhpiGWfg2g6avt4kv0QTMbvTkNSxzEAjK7nMPu3Fvl4GvPC+HTvZ+fLG1qTW3KWmQjy13pcYhSqXW5IXS3uIkI6TR6O0Aksu1p4v/mkFE8tdYUzu20xom3v1ejPrFn2em7RqVgENC2o3mng9beLJo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732350465; c=relaxed/simple;
	bh=9gXljZSOPW3Ws9UCb797xoqNFZLM14duh2GIo+1DBdg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TS6+WeahhKJnuADNstJGcuy0laumeI3+aYH9j3LDDD+wMn/LnGUrk9BRl8m+4gCJQea1YXA7yqWUmn1q5BEFcDT8Yim1/l2iEKoZr+dcnmkhW3ogOlhSRz2wTNSTMXuzYD1mK9d356NW2Xrln2bKg1tDrflpTJgdn7yD5Sd6XtY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OGSCqUW2; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2CF2BC4CECD;
	Sat, 23 Nov 2024 08:27:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732350464;
	bh=9gXljZSOPW3Ws9UCb797xoqNFZLM14duh2GIo+1DBdg=;
	h=From:To:Cc:Subject:Date:From;
	b=OGSCqUW2xLwnv2ggSJsmHnqvjHK4FWH2GBa0LaLcETh7FSGOUro/zbMas//4PPP6R
	 XXdqHxJTTXEMWJ1I+GzXzel56tVs+fmyVlVDmqgQcRku6ShcN0dJrNzG2uWxLsBpcu
	 ul9W8jeFwgDBVFr1oxBYLqCtbvtgVCK8tihg7DhC2ZAtSOP12c4DOyCrULeIcPdf2n
	 njf2cvhevh1jLm23Cj203Jw7R0SGfTXzwCJyLoRzhxIwhH/+H06XXtwBfgpYAx9kjT
	 dnuMGbUjZGHM5xPbMwJti1GCVTSOYpE65MrNS3RvYSCs55NfkjP31gjr3dc59ktZj+
	 /v0LUbl3uJl4w==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>,
	linux-kernel@vger.kernel.org
Subject: [PATCH] kbuild: deb-pkg: add python3:native to build dependency
Date: Sat, 23 Nov 2024 17:26:45 +0900
Message-ID: <20241123082736.26822-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Python3 is necessary for running some scripts such as
drivers/gpu/drm/msm/registers/gen_header.py

Both scripts/package/kernel.spec and scripts/package/PKGBUILD already
list Python as the build dependency.

Do likewise for scripts/package/mkdebian.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/package/mkdebian | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/package/mkdebian b/scripts/package/mkdebian
index fc3b7fa709fc..4ffcc70f8e31 100755
--- a/scripts/package/mkdebian
+++ b/scripts/package/mkdebian
@@ -202,7 +202,7 @@ Build-Depends-Arch: bc, bison, cpio, flex,
  gcc-${host_gnu} <!pkg.${sourcename}.nokernelheaders>,
  kmod, libelf-dev:native,
  libssl-dev:native, libssl-dev <!pkg.${sourcename}.nokernelheaders>,
- rsync
+ python3:native, rsync
 Homepage: https://www.kernel.org/
 
 Package: $packagename-$version
-- 
2.43.0


