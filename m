Return-Path: <linux-kbuild+bounces-6986-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DD4BAADB36
	for <lists+linux-kbuild@lfdr.de>; Wed,  7 May 2025 11:19:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C78B8167BD5
	for <lists+linux-kbuild@lfdr.de>; Wed,  7 May 2025 09:19:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72A6D23A984;
	Wed,  7 May 2025 09:14:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b="R6Oht6xM"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtpbgbr1.qq.com (smtpbgbr1.qq.com [54.207.19.206])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E078239E90;
	Wed,  7 May 2025 09:14:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.207.19.206
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746609298; cv=none; b=V20AQHPKDALtsoKMWNXUh8QtucU18yBFNmh/WrM//RCRV1XYJYPun7K22cb8ZL0fW/e7/y9t5GZC7OCVfPStpFaaiMRPhaVO+4ztB76XSN5gZg/y87fDpPCjAtKSbmPyqDzcIR/cJUQQYqjEaB7njOI9VZOrEQxVkqteWLoesGA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746609298; c=relaxed/simple;
	bh=MwgFJKN7l7kFdYNY6suwGldRZuE0owjh8S7GL/kNLcQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Lr3IWDJXYWRoprA8AJt8yl3Kil1h5zYi2HaXmOJmGgaPCYvaPJHSEwjxXPqhWsyW3ev79DrVLkYgq9RWTA68DePqWFppNtjWb+I/Fr3uRAgQrp1j5fCA+7j9KH3pmbS6yc/sqUhngk1js1JLLDVierotY6mBmxF9F2vGKS/gBo4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b=R6Oht6xM; arc=none smtp.client-ip=54.207.19.206
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1746609244;
	bh=TmJE6Xzc8x7k0lHbsb8PJi+nXReCRhz9/VASnE1oJO0=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=R6Oht6xMeZ0HP2auyNRlqHFur4zyU0+3CG4LJnz+t5Nrhw1E8RHZRYYvf02UZCSKT
	 PzHrDj5RkZ974fF/SnjCCoaHi1EeR1BFzh6sNHPMa+dgykTOg2xMw6QEHO4NzARRsZ
	 5Uc/ZvIJP5OgDvj6PZWLhfK+BfpE+udBEGvmSbas=
X-QQ-mid: zesmtpip2t1746609232t4ca7945c
X-QQ-Originating-IP: npKWDtNpgAvnhADZiJ4Q8/K/84jJsngOlV8SX2izEwk=
Received: from localhost.localdomain ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 07 May 2025 17:13:50 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 7718231128625625772
EX-QQ-RecipientCnt: 10
From: WangYuli <wangyuli@uniontech.com>
To: masahiroy@kernel.org,
	nathan@kernel.org,
	nicolas.schier@linux.dev
Cc: linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	m.seyfarth@gmail.com,
	zhanjun@uniontech.com,
	niecheng1@uniontech.com,
	guanwentao@uniontech.com,
	WangYuli <wangyuli@uniontech.com>
Subject: [PATCH] kbuild: Disable -Wdefault-const-init-var-unsafe
Date: Wed,  7 May 2025 17:13:40 +0800
Message-ID: <7331A23DB8786121+20250507091340.276092-1-wangyuli@uniontech.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpip:uniontech.com:qybglogicsvrgz:qybglogicsvrgz8a-1
X-QQ-XMAILINFO: NGX5+lQVxpC+4pTvz3/eN6omZ4UFI4WqwtTK9sHvLj+ldY0PR1+wWZh5
	PmG6811Tle7rlSt7UNpsBJK5Z4quW+Ha4/0eRJ036uHvvHy/BWewr3b0+RiVKGqocdSlN96
	sMmLw+EUNuHFnhRavUBLClq5Sb7mVNCJcWSA7dvFUkHJhmN1zsIGe/TKENh00WpOpD//rSA
	AA/ccUSGgSFOuWPMPxF1/Pi6xXUbx+z1VF8VP2PqYJi4CL9Pm2CQ2EQQ3Jzz7vcnRufPw3h
	+owfsBkxfppIZvFDJOnTqnYIIrHJdtt/EvU3dQe9qFskY1AedS981R9fJZKg6d1NZWFACAy
	tTUOkeKEVyHrWE23b5Dot0vX6PTIT8kJ5RMqs+LqeKxwLVsprEO8NoHEdUrHn4TLV/eThiB
	ZECES5jMrQ+MJsblV3LLtN16Sd1Hr9MbQlFPvULeZ7OzB7VYfs44YH13J9Jha6YNbltMPoI
	RxsbTSmzcnbpKgKarXvwiB3jrQ+Rg7KQamiNv2ofa8KsmX6WvGsmEjfjTqNoVAS/8fjyXXs
	yYH0tQD3CNltjC4yw+CNdsPn2NX71JEb2U9ZMbZgcRff8O5dQy2QZN20UVrkheTX32yn5Pf
	bEOChw/G/JwVTcAvqvS0XWIFNGeehdWnlNVC3g8oCOH8odB5VBee9h+aTn86eQSYnYD/2RC
	hgoNYyZ7gjmgMarEP6Zf4zRgz4HcbgANnhJoQg6x9ZS2AXeTXTf3bILgjaSarLh8pN8o+Pl
	vfoyN/sfJ1wz0tKpP7Am+SMtXMREIMKlF7Gs4kV3hso+2s5WGkmgvEB67SXnIwt0cwiLIR4
	ysQuMrrZSnPeyp23thqRQr7hHnZGnnfbIVBjGTKaIEZB8VAymozwK+VwDYsYEbdaBaTP2/f
	+BsJPgtOCe5oGViMMWF5SPbxzw69nF8WDjahppgL3XwCCHxdALPl70vjysBaiA1pORozjEN
	PwIKesn8AMFWWiXEt6+DYA3wBAGh+mwY02jLUQMAwTsjKF0uKC7Vr2hWFW3U4hPVxtFTO2B
	lE4E3OxN+q299tUZjFhs6lTq0sshqucxPknieRFg==
X-QQ-XMRINFO: NS+P29fieYNw95Bth2bWPxk=
X-QQ-RECHKSPAM: 0

Similar to ("kbuild: Disable -Wdefault-const-init-field-unsafe")
from list, -Wdefault-const-init-var-unsafe need to be disabled too.

While I haven't found this warning triggered in the kernel code
itself (my testing covers just a tiny fraction), it's clearly
something that should be disabled for the same reason.

Additionally, because dkms uses kernel compile parameters, some
out-of-tree modules might also hit this warning, like the Mucse
network driver.

Fix follow error with -Werror:
  drivers/net/ethernet/mucse/rnpgbe/rnpgbe_main.c:6126:11: error: default initialization of an object of type 'const u8[6]' (aka 'const unsigned char[6]') leaves the object uninitialized and is incompatible with C++ [-Werror,-Wdefault-const-init-var-unsafe]
   6126 |         const u8 target_addr[ETH_ALEN];
        |                  ^
  1 error generated.

Link: https://lore.kernel.org/all/20250501-default-const-init-clang-v1-0-3d2c6c185dbb@kernel.org/
Signed-off-by: WangYuli <wangyuli@uniontech.com>
---
 scripts/Makefile.extrawarn | 1 +
 1 file changed, 1 insertion(+)

diff --git a/scripts/Makefile.extrawarn b/scripts/Makefile.extrawarn
index a7b680df5b24..14e22310fbbf 100644
--- a/scripts/Makefile.extrawarn
+++ b/scripts/Makefile.extrawarn
@@ -44,6 +44,7 @@ KBUILD_CFLAGS += $(call cc-disable-warning, format-truncation-non-kprintf)
 # the field is within a union with other non-const members, or the containing
 # object is not const so the field can be modified via memcpy() / memset().
 KBUILD_CFLAGS += $(call cc-disable-warning, default-const-init-field-unsafe)
+KBUILD_CFLAGS += $(call cc-disable-warning, default-const-init-var-unsafe)
 else
 
 # gcc inanely warns about local variables called 'main'
-- 
2.49.0


