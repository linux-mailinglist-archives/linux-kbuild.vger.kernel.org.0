Return-Path: <linux-kbuild+bounces-6723-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CAEBBA96698
	for <lists+linux-kbuild@lfdr.de>; Tue, 22 Apr 2025 12:55:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C9D04189D0D6
	for <lists+linux-kbuild@lfdr.de>; Tue, 22 Apr 2025 10:56:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5FC5620D51F;
	Tue, 22 Apr 2025 10:55:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b="K2CBQKPS"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtpbguseast1.qq.com (smtpbguseast1.qq.com [54.204.34.129])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F20E1EDA2C;
	Tue, 22 Apr 2025 10:55:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.204.34.129
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745319351; cv=none; b=BoMcys/oc9iIXLtTjypUdMyX2005fLGvjTY1ZBUTRZWM3fEQrpqdl9RtL+5dUJBUc4T2r2bnTloxay+uUn99P7+f8i45/SzV78juUZ/9rQqI1V42QBLOkaRXketsf+T9JC868239AS2inYhBHgsstZCh/fRe0eMbwSDIs+63DWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745319351; c=relaxed/simple;
	bh=TpJezaEHIMJ4QhxH7cUkgrBdkRbBbxNDsO9RFYdxrqM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=u9NXOMKd0aLhqkvCnpS+yeF6VDkwDtWKXWEz0z58nakHSKX6QHz3cegNeAt3T9PDCqathVCwximc6YEjGMF0wcP9D1MF/Shfg0MHu1v5GHy8sxV6PG2SuHGTgGEG+UaqHBPLwsYkbDuKjv1UMxSrLaAKVfxD/e6UkDu2QDhW2g8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b=K2CBQKPS; arc=none smtp.client-ip=54.204.34.129
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1745319299;
	bh=i7KxMIuwFbJWsdFvTV8UOjQME+V6zLnzu0Zhv73ogN0=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=K2CBQKPSaIg69KbL238McAsDx/Xka/WwYCxu4u2e2HFDk9I4zFDXPvALURH+NE1XJ
	 V8UIdJ6nxU+cWKSDsix7XL3VKaZaUFRzX+eY5nQZuTyRuZ0NsTAbjWB2/FPoeRsima
	 j0DRICCZl7xtlDJbD8p/8aL5Zf4d3gg9TfuFpntc=
X-QQ-mid: zesmtpip2t1745319254te37e0179
X-QQ-Originating-IP: cMmpMeRkw7TPS/DJrTwXfzksKKGdseNrPV9pgrjl/I4=
Received: from localhost.localdomain ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 22 Apr 2025 18:54:11 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 18080512183500850100
EX-QQ-RecipientCnt: 11
From: WangYuli <wangyuli@uniontech.com>
To: wangyuli@uniontech.com
Cc: guanwentao@uniontech.com,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	masahiroy@kernel.org,
	nathan@kernel.org,
	nicolas.schier@linux.dev,
	niecheng1@uniontech.com,
	petr.pavlu@suse.com,
	samitolvanen@google.com,
	zhanjun@uniontech.com
Subject: [PATCH v3 2/2] kbuild: rpm-pkg: Add (elfutils-devel or libdw-devel) to BuildRequires
Date: Tue, 22 Apr 2025 18:54:02 +0800
Message-ID: <D62AECCF56C6EEFC+20250422105402.145635-2-wangyuli@uniontech.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <79C925DCE2E963FF+20250422104927.144252-1-wangyuli@uniontech.com>
References: <79C925DCE2E963FF+20250422104927.144252-1-wangyuli@uniontech.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpip:uniontech.com:qybglogicsvrgz:qybglogicsvrgz8a-1
X-QQ-XMAILINFO: NqQl/VK9LQMfLljVJv3lAZzIyrgdbMqNig5KOtL6KyAKIsN5QfIE4+SG
	2RHmoBRs9HDGEByOTDuKzqEilFz7chXizGRS6gT+MlTGcJoCsa28ECtbYs1ekH8B2yxdf1G
	yEZvMNQLux/zxUntTLaQ8m+RxYTeePcQyAG3JYtBBO3xrCkLPSCg0G4MtILalJFK7EzUqXJ
	+4HxtYN3H4ZZzTGrqC2fPnE/7K21kmE+6mmbYiNWg70xqb8S4J078x3EzIIRhyJoJ81GQ9l
	GgeQ2sbNf3TmRPMx4cLt078GLzyCNsGCizGnThc2VkKFmh1CDL1Ks5nmAjdYMPP1zp4dQVa
	aU+TfujP7sXqI5ecrzxecb2cmsBeVDJ1btyZQPgy0NWp6fNVt1IKTfsegcwC+rz/yDp97yu
	3RMfzkO1v78nMZ80pLnJFe/tatG6ij8u0NJ+zqnpJIRjYLGRssw9m3iPG1WElFEGp2DKQeP
	wqhdDOK4JxNLP/zNKLLv00l0Z/xt14x9Zf65gi6gu8K4Pzxc2vKA5Zhgt8MkB/yPbtPizbr
	B/Pzc3xjqHdWqJ81gCdKdXK9MTEeSzJDPLyQzypOld7klMfcEd1lidiZR+I3Xfk4fQiiKLi
	QU7Ln3KfwZynXoWgWPuxaWd2eBTCD6CxExltclpdYG0CUICJcENFFxI5cOn2heyLh2MY68U
	pWLVysDwewdwbEFeZSfgkLRKt0jUqvmFzpbZHT1vALo8JMmc+W1PgtNgdxHtXBq0aVTDklj
	nRLtAAhvdMFGwfvjZjOsCRCm98hNNjMjKs23V4moQnhgWpVky01Ev2vGi7yijI2MepugOai
	4bO4t/yazFG0flE+sP07sUesy/6A677xgx+5y/PQXJbRvWlFxT0cXbjwDjFGRFWq1Kbcvgh
	43ptEhua5ZknBUFD0DTefwjpktA1rEcgNh0sxKGBuOymm8hp8kDwbO2BMb7H6AoU+Rwx5LV
	M7fyI175H2h2hfP3kpCgt4ZZXCYTKnjhFKizMe+xWM4F8xneuFWgQ+ThOP848oQqRmi5/n6
	KXXmmBia4ScrqUGwScByOnocQ9BEjlKMaGA3h6rAyQu0Mu3TWUgZ4Md//klBAgpFzKjI7At
	yVohYWZrVg6qwiIheYBl4ixKrHdbmqF9A==
X-QQ-XMRINFO: OD9hHCdaPRBwq3WW+NvGbIU=
X-QQ-RECHKSPAM: 0

The dwarf.h header, which is included by
scripts/gendwarfksyms/gendwarfksyms.h, resides within elfutils-devel
or libdw-devel package.

This portion of the code is compiled under the condition that
CONFIG_GENDWARFKSYMS is enabled.

Consequently, add (elfutils-devel or libdw-devel) to BuildRequires to
prevent unforeseen compilation failures.

Fix follow possible error:
  In file included from scripts/gendwarfksyms/cache.c:6:
  scripts/gendwarfksyms/gendwarfksyms.h:6:10: fatal error: 'dwarf.h' file not found
      6 | #include <dwarf.h>
        |          ^~~~~~~~~

Link: https://lore.kernel.org/all/3e52d80d-0c60-4df5-8cb5-21d4b1fce7b7@suse.com/
Fixes: f28568841ae0 ("tools: Add gendwarfksyms")
Suggested-by: Petr Pavlu <petr.pavlu@suse.com>
Signed-off-by: WangYuli <wangyuli@uniontech.com>
---
 scripts/package/kernel.spec | 1 +
 1 file changed, 1 insertion(+)

diff --git a/scripts/package/kernel.spec b/scripts/package/kernel.spec
index 726f34e11960..98f206cb7c60 100644
--- a/scripts/package/kernel.spec
+++ b/scripts/package/kernel.spec
@@ -16,6 +16,7 @@ Source1: config
 Source2: diff.patch
 Provides: kernel-%{KERNELRELEASE}
 BuildRequires: bc binutils bison dwarves
+BuildRequires: (elfutils-devel or libdw-devel)
 BuildRequires: (elfutils-libelf-devel or libelf-devel) flex
 BuildRequires: gcc make openssl openssl-devel perl python3 rsync
 
-- 
2.49.0


