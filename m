Return-Path: <linux-kbuild+bounces-6981-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C8C1AAD579
	for <lists+linux-kbuild@lfdr.de>; Wed,  7 May 2025 07:48:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3BD6C1BA603B
	for <lists+linux-kbuild@lfdr.de>; Wed,  7 May 2025 05:48:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A2DDD1DE4EF;
	Wed,  7 May 2025 05:48:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b="pNXiYJ5S"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtpbg154.qq.com (smtpbg154.qq.com [15.184.224.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 433401A00E7;
	Wed,  7 May 2025 05:48:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=15.184.224.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746596913; cv=none; b=aKDlW088z3yFSYPdwJEzGnPkle5h2uErv4ltpHnuTHYDcFNTK3s6WaH0NorxMbVsw0vuKIWDRITFtDVC7IfrUzXiRp7nkHM8yfr2BVYAFK4hKESm5LBc7KmoPvu6epq6dc0tCRx2FGsRZ10I1IwvhFSKd5F8HTLdZMWIp8abuBo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746596913; c=relaxed/simple;
	bh=ajKkmLBQHltQ3aT5vOIXwjpiHq5xNEDklbkdv09yMlg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=K0m1xJ0KI/vppnNEsRUozxuvyted1Agbt0E/yArhpJjYiO99Ip+YoUb2pgzbwfxiNuJl2MmGD4Wmeeh9vKXIri6GvmcYmbU5Groi29ALTgs3yq303IjtulkXgXuHI39vzXA6qgtYl2khxostbFpAJsN3IPip2GqnxUeZUsXTFdA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b=pNXiYJ5S; arc=none smtp.client-ip=15.184.224.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1746596880;
	bh=RR1o4h1D7RP+bPdxjng3MvYjCb48F+Na98fT4d1P2gU=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=pNXiYJ5SV3/q5ixiaQwHyDwW0P0kS9mUlp7z7/2h2JE0n5dlEXn0oNYa+0pCptSKo
	 bvd2K3Njfgr0JKM0WstlrWr6HpurNN7qFKPpWXU1u6LY2vYxTncxXR4bwUwOBvyukf
	 1PQmhnWnZhNXxIOY6qAefNyPGkXCeOkcSYhe5gDU=
X-QQ-mid: zesmtpip4t1746596836tfa752b55
X-QQ-Originating-IP: GUD0Ib9eO0p6JFXKSx5eJadelh7ZUQJDvk8upfg5mMM=
Received: from localhost.localdomain ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 07 May 2025 13:47:13 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 813654498485384309
EX-QQ-RecipientCnt: 9
From: WangYuli <wangyuli@uniontech.com>
To: masahiroy@kernel.org,
	nathan@kernel.org,
	nicolas.schier@linux.dev
Cc: linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	zhanjun@uniontech.com,
	niecheng1@uniontech.com,
	guanwentao@uniontech.com,
	WangYuli <wangyuli@uniontech.com>
Subject: [PATCH] extrawarn: Use cc-disable-warning for shift-negative-value
Date: Wed,  7 May 2025 13:47:05 +0800
Message-ID: <70AA6123A55FEA70+20250507054705.1196184-1-wangyuli@uniontech.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpip:uniontech.com:qybglogicsvrgz:qybglogicsvrgz8a-1
X-QQ-XMAILINFO: MSrLYp2Q5Rma2GHgAMHmrBi7+2meX3Iu4okAg93eZClj9stk/pg9Vk7B
	z/30zrA7fOf1r+ovGfTv58Wi30QoArbzi67csbYxfkv5bsvGlxnRTZNdHWqfRe6HRxJ5X/T
	Gj+BOSvWtYBIcmwzk3fIWKr5OmbhJri7DAtu5qNlh+ACXklxOZgcDgFA0zxHewen2q3AqYu
	c5ZHM6qc3r+D+hfpok0EHDkoK/toNzGwFqR7IR6BmYDMC+XqcYBJiLXlnrvWLDM6x1HucXQ
	jWJ2ewgKa1fctm2ofLoxrbyaWu3TmIFrYA0b1OZYIMq9UL8R0A4xKw7rdrJiXit+tsbYrhr
	KRFKzObiMa8ETV1RkXduyaNISwogRlsk4qK2ZXTO3ffvE+q5zt9dKbO8TjmjnseeiacMaHl
	R9rg5aQaFzsSEjdN/JQ4A6sPIz5SNXAcJBnkpEieWGy/Ae08ywNvLZFom9+egQkFoANJo+r
	s2p19KDIlty/sY0kaVbWUlbL7FKAjIart8b+YaLNJxSt8LjruCGeUBBOS1k/abQHR+94Y1y
	8YLXUlRSC2oWoxiF2K0csFH54k2nlwdw2oC9eOQ+zjs/epdIdpP2C2ccisp/5Pa63K7cUUD
	9Ued4IWNw7UYMrLIF9KB8x6cebPKb+dP/9RZYpOr7oJtr2XPr6j3ORQWqoTvqb3q94FTz7u
	ii8JUj9B7WGIz4dUm1PMI+TDCY8jWpQ5MA6x+WbM7HYOTl0S9Wa19Tc8yUXYGee057vLdMu
	SoZTxkG6eiVqpKFMwtuhb6rkGP6La4ohwWfQssN2RTBSfQVc7eDII9Ow9N+sQELbvd7cPBV
	9sXNWHxmq/vO/inCZDYqli8NiVzE86tQwFH4qA6Sk6D+ftQkFs9dmELHP3vXes5djJIuaJ6
	Ikstc1zVU08SrOoKpYN+0eH7Tpg3T8So2x+8voeDpjlqoZKhcb+Ar/FOHUGSp5GURco8jdm
	ognAFR5YKcRqdZx1M77rgj2//9PKy/f9xGvXEFmvZhJX++SBn52+xxtr8VSMfu3r0wwyYaf
	mhY6ZgILCYJQOM7CcresmoG7j0x9nJlkc5rT5Vc3mLtPTPBPbkrHVRlRlRGjk=
X-QQ-XMRINFO: MPJ6Tf5t3I/ycC2BItcBVIA=
X-QQ-RECHKSPAM: 0

The -Wno-shift-negative-value option is not supported by GCC 5.4.0.

This could potentially result in extra warnings under certain
circumstances.

Utilize cc-disable-warning to prevent the following from occurring:
  mm/vmscan.c: At top level:
  cc1: error: unrecognized command line option ‘-Wno-shift-negative-value’ [-Werror]
  cc1: all warnings being treated as errors

Link: https://lore.kernel.org/all/62726950F697595A+20250507040827.1147510-1-wangyuli@uniontech.com/
Signed-off-by: WangYuli <wangyuli@uniontech.com>
---
 scripts/Makefile.extrawarn | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/Makefile.extrawarn b/scripts/Makefile.extrawarn
index d88acdf40855..375475e7b3bd 100644
--- a/scripts/Makefile.extrawarn
+++ b/scripts/Makefile.extrawarn
@@ -158,7 +158,7 @@ else
 # The following turn off the warnings enabled by -Wextra
 KBUILD_CFLAGS += -Wno-missing-field-initializers
 KBUILD_CFLAGS += -Wno-type-limits
-KBUILD_CFLAGS += -Wno-shift-negative-value
+KBUILD_CFLAGS += $(call cc-disable-warning, shift-negative-value)
 
 ifdef CONFIG_CC_IS_CLANG
 KBUILD_CFLAGS += -Wno-enum-enum-conversion
-- 
2.49.0


