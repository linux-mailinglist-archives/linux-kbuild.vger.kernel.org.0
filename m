Return-Path: <linux-kbuild+bounces-6352-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DD61A71DFE
	for <lists+linux-kbuild@lfdr.de>; Wed, 26 Mar 2025 19:06:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EC628175CC8
	for <lists+linux-kbuild@lfdr.de>; Wed, 26 Mar 2025 18:06:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6427724EF79;
	Wed, 26 Mar 2025 18:06:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b="NfQXfFxN"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtpbgsg2.qq.com (smtpbgsg2.qq.com [54.254.200.128])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C112624EF7D;
	Wed, 26 Mar 2025 18:06:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.254.200.128
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743012407; cv=none; b=ramQvHYWrllfkizPlmq77VDd40wu9mX9Y1yGlQxAv+fB0A8E16FyrR8gAzxi/RawHyIpal5RHrsInIdITWKEWm1uexXDOY/PpX+3qwrOCuZgjoDwOkINcQa1wbw4uu8Vj1lnZpZmSK41nwOPSftoQ/UhVrMZ6UwA9IJ4huEWjhM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743012407; c=relaxed/simple;
	bh=MSSjAmLOkE9JyRhSQ5swPcfZ2dZeTxEf9ibc8TYM/38=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Dqee0Dow7LgDf6Hf+f/iB2qwV0ZSPAUZLMppuQqhwP5JDDLJ3m5BZDLqtoidsdDEzcnmOBNoLXWRrMMz9HpD1Vil/z3C+2x1PDV0ggnrCARn0BIE4sfdv62CkyvelTiczKoF2UnS1Jbqt+uDKdXeVFtbAlpwD8nq259ZQ/R0tBI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b=NfQXfFxN; arc=none smtp.client-ip=54.254.200.128
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1743010976;
	bh=qN/Fi4R0Hpw1uQbJbeIB3oDRZ/puUHLgAA+ehJo29ls=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=NfQXfFxNl6auTeIMXTu42E302BnDcOrce7X+9NFSopxRy9LD7P4Op9yskIy/QYQeI
	 lCSMVnb02Qkx+dgA1JEn5cm7nrVzuajIKaHmaDSPkjDufrWxbWQf46KAMJfISSfHl9
	 4+OREgFguC2cqW6vMrbQp91Up6lvCGtMeAzKspxE=
X-QQ-mid: bizesmtpip4t1743010928txj9agk
X-QQ-Originating-IP: 9+IYxNSIzCojtcRcEE9Uzk+rNAnv9SS9KlFz7C1pX2s=
Received: from localhost.localdomain ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 27 Mar 2025 01:42:06 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 10032576578829145953
EX-QQ-RecipientCnt: 11
From: WangYuli <wangyuli@uniontech.com>
To: masahiroy@kernel.org,
	nathan@kernel.org,
	nicolas@fjasle.eu
Cc: linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	samitolvanen@google.com,
	petr.pavlu@suse.com,
	zhanjun@uniontech.com,
	niecheng1@uniontech.com,
	guanwentao@uniontech.com,
	WangYuli <wangyuli@uniontech.com>
Subject: [PATCH] kbuild: deb-pkg: Add libdw-dev:native to Build-Depends-Arch
Date: Thu, 27 Mar 2025 01:41:55 +0800
Message-ID: <39FF69551D01924F+20250326174156.390126-1-wangyuli@uniontech.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtpip:uniontech.com:qybglogicsvrgz:qybglogicsvrgz8a-1
X-QQ-XMAILINFO: NyA5aDdnpEEQLQ2HjA0XclJH7PX82FiC8bIdkcS+J7O0yXuQuAaRk1Yd
	lgz8myf7WDKaw2Zg6hS9oK+mRuJN/CMO1dYVDci0PnSNVxqu87GkxzENScTytmwgiFXyMNw
	bTSEaAH4skJDeds0XXHTAeBRVSXOtVmhBw/2kZrRSAiYF7dqVgCND+TiVKsF8Su3zmbhZQx
	9DxacdXGtXjLxClQ5fyEt+YxqbS2uvBYkpEFrjahPZJc2S02S4F8UwJfGS/ZzayQvDX+6Ci
	9zTPdv2L1hv9WZOTwreraWGD2dgbqts7pwtmXa1fNYV+SdT6qIHabq5q7D8euRzoEmkJ+PA
	K6bA+mBSbF4L9gQnaGWvUOQ3tiZCKXepga58kod0CQCpipE6xJYkxbj6YsdScnr+a66qX19
	mht8Y7mIC4uJ+aPBLj/xGXyO2vMUH/W+Z+uvUI7JVCCR/40otiR8JY44sWHV17ZwiNzF70E
	tdivZ20yHus430G2ZRBgzEZoPAjTMmziDmg/mHVqAg6NqN+jOskEiX1CUnKdUDIr3BLi278
	BfZD+vaohPd1RmaoCLJfE/bKvGqOJiAQCIFnCWIzUIHkuePf5qaYqcjzEZOMREGUr+0uyRN
	RSS6FmP2+Tefu3G03O3uXskaEl8NcoWrMmJhXWXsinM3URE3BFiYIlSOD+bnU+v2pnURrL/
	1XrmgE4ZqRUyYSPXExDmTq2wuBy1LWH3/PVYJt2+LSRuMEc+aUzOQhC9Sa7OjCjVCWPSOgF
	RWntBicPhfFQlme3ssEjNDejcsmUmox803Cu9wTQVDrH/TYhR0ufJSTlG8DvaJxSG2QGXK9
	DLTB/rohzqvi0YKZ3/vAeLmXwHsoRDzzqAOIGzCg15Gi6XDuPHrg7yw+TkKKBgHgdyRVC3g
	Yns9Icvi8WB+pxStZS7Fid5kVTwoXM4sK/qKtPbZ+Sv3hrn28+JwNP2jG3nNrXgCFuZXOCW
	SarMG+wbuJ95OsQTJAOEbJX8Vu89OgE0wMSve46W912Kb8/vDeKV5MYwE+ZxQiRA8JCO6h8
	3HWXhUN6M0gbCrwpbaiJ4Z5u+fLLx8oiA9dNO1QmDrDQSYgpPU
X-QQ-XMRINFO: OWPUhxQsoeAVDbp3OJHYyFg=
X-QQ-RECHKSPAM: 0

The dwarf.h header, which is included by
scripts/gendwarfksyms/gendwarfksyms.h, resides within the libdw-dev
package.

This portion of the code is compiled under the condition that
CONFIG_GENDWARFKSYMS is enabled.

Consequently, add libdw-dev to Build-Depends-Arch to prevent
unforeseen compilation failures.

Fix follow possible error:
  In file included from scripts/gendwarfksyms/cache.c:6:
  scripts/gendwarfksyms/gendwarfksyms.h:6:10: fatal error: 'dwarf.h' file not found
      6 | #iIn file included from nscripts/gendwarfksyms/symbols.cc:lude6 :
  <dwarf.hscripts/gendwarfksyms/gendwarfksyms.h>:6
  :      10| :          ^~~~~~~~~
  fatal error: 'dwarf.h' file not found
    6 | #include <dwarf.h>
      |          ^~~~~~~~~

Fixes: f28568841ae0 ("tools: Add gendwarfksyms")
Signed-off-by: WangYuli <wangyuli@uniontech.com>
---
 scripts/package/mkdebian | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/package/mkdebian b/scripts/package/mkdebian
index 0178000197fe..25edee97fff7 100755
--- a/scripts/package/mkdebian
+++ b/scripts/package/mkdebian
@@ -209,7 +209,7 @@ Rules-Requires-Root: no
 Build-Depends: debhelper-compat (= 12)
 Build-Depends-Arch: bc, bison, flex,
  gcc-${host_gnu} <!pkg.${sourcename}.nokernelheaders>,
- kmod, libelf-dev:native,
+ kmod, libdw-dev:native, libelf-dev:native,
  libssl-dev:native, libssl-dev <!pkg.${sourcename}.nokernelheaders>,
  python3:native, rsync
 Homepage: https://www.kernel.org/
-- 
2.49.0


