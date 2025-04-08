Return-Path: <linux-kbuild+bounces-6510-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DB3CA7F7B4
	for <lists+linux-kbuild@lfdr.de>; Tue,  8 Apr 2025 10:23:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0A5B21895084
	for <lists+linux-kbuild@lfdr.de>; Tue,  8 Apr 2025 08:22:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B2D5B212B1E;
	Tue,  8 Apr 2025 08:21:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b="AYAy9rO7"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtpbgbr1.qq.com (smtpbgbr1.qq.com [54.207.19.206])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25DE92641DE;
	Tue,  8 Apr 2025 08:21:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.207.19.206
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744100473; cv=none; b=UK+Deay3p9eUh6LLx0V1uhAdku0k568DVviEZil1bgc1CIEtDoV+iu+M+iXsvyp2r4jMCISRJIyIf6/J8NxiyCfLCoBxdGWrM5uFRFnQqWsdIj133d/WK3ZrHBKW6iAq7Nkt/WExHxCi4G1492HwYzsoZ90o+carpemrH1s4JQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744100473; c=relaxed/simple;
	bh=x2c5KdbawGW6p/WQQY1B+ydj7DOJuPlM9xd8MQpj1MQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hSjt/UP9Wnzbt+FwP535H/1pb8LSXdIPgiZ7FTq3qFW39qcDD7cGUHD7p40RgWGjoIaXfQPzsmO4VMrr0CPKbqc970/7NiB2/+mSy+dcQ8Cc5zd3or1kyNFlk4dduld+qs2IbmRTkKTEdStUG/wwqxUw9VdxfKeRSCFFg5i1Jls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b=AYAy9rO7; arc=none smtp.client-ip=54.207.19.206
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1744100423;
	bh=YDMcIt5BzRbFs4if5qmFPL9dl5dOuXEMZqyS0Yql9tY=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=AYAy9rO7PNbnAl8WYX0BxcNfo8jCo4XUoN00dpNGgWz6nqtMX2CCp662Di4V+CHAd
	 YK7tPdY/x2lqC8oSxnsjaxmBTco1PCsEYUDX0l4ak7ly7cB1RpEnk8XkPvIEvOqPl2
	 7l2P7H/fL5iJyWHxgukAw1mfKfyPWeyvUn0qedq8=
X-QQ-mid: bizesmtpip2t1744100373tda0eb2
X-QQ-Originating-IP: MyI0N3qeLkwnj2ePB8tsaxOvuShTPSU2LwOhCllz90s=
Received: from localhost.localdomain ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 08 Apr 2025 16:19:30 +0800 (CST)
X-QQ-SSF: 0001000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 12505545844404580933
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
Subject: [PATCH v2 2/2] kbuild: rpm-pkg: Add elfutils-devel to BuildRequires
Date: Tue,  8 Apr 2025 16:19:21 +0800
Message-ID: <964B3FC2F607F2F4+20250408081921.63040-2-wangyuli@uniontech.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <215802BA292C2DF6+20250408081441.61776-1-wangyuli@uniontech.com>
References: <215802BA292C2DF6+20250408081441.61776-1-wangyuli@uniontech.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtpip:uniontech.com:qybglogicsvrgz:qybglogicsvrgz8a-1
X-QQ-XMAILINFO: MQ+wLuVvI2LQOZ9QeG4y37PNaliQEyrRjliHmYcT3BU+j2tcmvTEAplo
	fRRnIWzjCFPAwSv457qwh3Z+vgXaAFKCKgf25qJN+3Gxfv40zBo6F8dARNo65ofs66LIYaW
	uoPQIAamiZfPcILeSvcwQHuWHT3VnaK6ZKKPruIAsafgrFzbcCc5uLNfx9QF82dVesLjZVq
	lEof9leCmh0kk917C2inE1W07eMkx5PFq+FlIKp1lnUrJkC8U9ENgrMiEqEMb3IP/nLV5ft
	Z6jQ0mVYkMWWdzMoBlodJx7VTIUAl0tnoajNFRyqcKmJG9+1hgPOxf0Vxj8oXvrNLJ2C2u5
	3jcrsBkhhzUuweQodsbU5pVx+DbREOn5uLY83WH71anOpbAzoGyIPVrTFDNp60l75oWf3MP
	mKbA4Ccy6YAPHUvwqjyv510ycn8VfZdofhQZKcnzxD3vzBLEFx9THpWcNaWULnD5AcqO3PW
	YOB+MPLHfdeHws/aBy/NIvsnsC6K7vGxQvfJ4jGquGYKuCflVTBdHWTVGr8GdzmUo7FlXrS
	gU3LUf8cStH+HmCmGlK456tIdI3KVB+5quH/E6G3i2x2mB7xW7yqGNpWpiH+5qOhjaj2Q6I
	BVTYBjXqvWaSUoEtUc1vs46NhJPewgii6jdfBnSY89zIEy44w+FuRqAwHSVs6s8MGr5M6iE
	z8aUVaRN+xVMMfsekLLGu3yCXqqmUed+hApQyb+wfC+QVdqNr3q4fZqjvxiYruGWx2sgN9X
	OfwuGYVhCP5oH7SGeCnaOhr+qcAMqobA4UsZVtMcOkcEqvQ+Jd0KhVsAAFuelis5UwQ4a5P
	RQG1tS0NYqeEXTK6vATN7IouVx2kUcn88JYyKqBTWV+kh84oEZOIs8WjGa78LIUuRsvOvmR
	OAwkqQp9QndgFstPJJrbTMifTIvscFKrDqLQ//XrRDXkzaUgB2Xc4qaXP2bVuYpG8ftqin8
	/ByG6yWp24Nh7mu0USrZQhrS1mPv6M9tDrS49PfWNopjOQ4HfmSeizdJQx2tv1kaThQDvsK
	HwtzrG5CDRfa5Lxe+E
X-QQ-XMRINFO: NI4Ajvh11aEj8Xl/2s1/T8w=
X-QQ-RECHKSPAM: 0

The dwarf.h header, which is included by
scripts/gendwarfksyms/gendwarfksyms.h, resides within the libdw-dev
package.

This portion of the code is compiled under the condition that
CONFIG_GENDWARFKSYMS is enabled.

Consequently, add elfutils-devel to BuildRequires to prevent
unforeseen compilation failures.

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


