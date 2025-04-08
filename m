Return-Path: <linux-kbuild+bounces-6509-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AB5CA7F7B1
	for <lists+linux-kbuild@lfdr.de>; Tue,  8 Apr 2025 10:22:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E9A37189063D
	for <lists+linux-kbuild@lfdr.de>; Tue,  8 Apr 2025 08:21:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD872263C97;
	Tue,  8 Apr 2025 08:21:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b="Z+rahwGH"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtpbg154.qq.com (smtpbg154.qq.com [15.184.224.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCC0F2627F7;
	Tue,  8 Apr 2025 08:20:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=15.184.224.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744100466; cv=none; b=ku/3j8Vc0ExZNxQlAFVHt8Hc1uTbiowqfhzu2F08TmIbeky6biWoY3U6qPt7Xqp1PUoGPxTCLXfBudWIbDEX1w0NWNyv7tGfS4fkaKyylLLbD0QuMk+0MXabesIb24XH1YinBT0QRaPa7YqobTx46tNQINQLzglnj+YHnPgVPKs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744100466; c=relaxed/simple;
	bh=6ki7wwnbd0iJIqYsMQ720ooSclqxW4cwHDC/Qr/GbNQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fXIAvwA7MzER7LZdSXlb2fV+zWbdY+LUjF+z12owM7UcAstS1NKflPheO2aJzBucJebhNjvJsYnjB/yOb38c53KHoQlizwIqTEu0b+qBuabLRY03xXC47t+Y17M2g+L8BGF+jjbqnHWFhNpPHZLNjoYYCKVhVcfBWNK+wiTK+NE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b=Z+rahwGH; arc=none smtp.client-ip=15.184.224.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1744100410;
	bh=b6IWeKG1BkK4Y1s87lilRqJW63rz32/KnqydxcNNCEU=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=Z+rahwGH37/wSxxhMpj/AppGIm/+Yb/rDooUweTJH4AJQ0vdhAlXH7I0w38sQff1Q
	 RhIjVOmB29xFTUV2hHcSgItMJ9QoqbF4wjdbA1tStNpfr1ZHaWjFFWctzA3q0w9vSZ
	 pCPCnITJTXbX2tbhcD/zbns5EuJ71R6lLZek6g+A=
X-QQ-mid: bizesmtpip2t1744100367t2572ab
X-QQ-Originating-IP: ZDF2WWtYGPTNUlyWdYctajdkAvgL5Ku/jo8RLgt5jb0=
Received: from localhost.localdomain ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 08 Apr 2025 16:19:25 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 755028381633869798
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
Subject: [PATCH v2 1/2] kbuild: deb-pkg: Add libdw-dev:native to Build-Depends-Arch
Date: Tue,  8 Apr 2025 16:19:20 +0800
Message-ID: <F4939E0696099A5A+20250408081921.63040-1-wangyuli@uniontech.com>
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
X-QQ-XMAILINFO: OQX3ZGb4rLLOj2buYa5d+YtV5988SnwPEIEOxNjbdzJ2yOhzrPrQ9Kwb
	AZ+bynG9a/M6KUASPiC+p5+EtYv7phtD9s34y5VkcUHeNHH0s3/+VEU6ieSEOJ5CGjeytOl
	FAVWn9fxy8MkCOjCva220i95I74cD2SDhKk4g9FOYil1FpZ6hNbu8nWPnlvO2GFiNEuvQpE
	au7U+gnfIxu5M0vLwhSZLKcRJBK+YQ6JROJ5Lcqff+6/5NpCgtnAPxZl1TPgB2CBcFXs9xi
	Qu3wxHjnKypXgxuU1wtJnpPvIOiIoUP4FAIZhpYi3fnUdgYisETo7BFQy5vdWFkp1Bttod3
	anOKzpN1x79yx6wX3WMqnRwHe366EmCvkRcPo1ft5jpOvB0ObxFF/X/tbMgtMfufvW8RwA0
	q7V6g5Qxn5UErmwXmS7Q3yngIF1EESpNwnkE+/weToVITKYsmWZLzu3AjL4rpmeblSjpJ1O
	NdQQyQPVwNB21m5h9VWmNvSrlvskN2ZL+cHjwDUox3Fs8zDxd2NzWHclOO/XLg46XDCigTJ
	xCBj2YK4SDKB8SRVnvYVaiXdwMJaL9aQaqQJfoHP8KfOIN/mztPpg28Cf//FXubEBmIA4tR
	3K72I74QcuOuBJ6rK/nr8mhsD8DgT83XPeVbv/ZHpypDGVslDwqGYGHYZw2L/Js9Lu4Unv9
	KFl+/W/CtV09+U1MNQFAA2Cv3n1Zize5c5Y3gYZjySWdR3MaMqRYdWyUpfBTmq0EQvS4WZn
	/nKs+e3L+F33UTs+dsTHqfG/KuAvALCbBeh0Gk5fNCvADAW3lCk/pMAr3Ney1UqxhNJM8Sx
	iCqpKt9m5CLFWzecHpJB6m+CYYPEAooo/Zg278QuZKWhJ7/CIPptfNtKThlBJjQb2hD7RPG
	xPWPGMcZg6rKnoSXLoh73gCSHE1+aea9Iok2K8lgNm0aAFmScK36UoGx+zi1wSQMfvnVlMu
	R/AjDAuHZ/EvNhtIeS8kt7Y7+f+T/RV5hXYxL/ojvMYqZs191FV5EiuPInKMKn0uuDgc=
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
  In file included from scripts/gendwarfksyms/symbols.c:6:
  scripts/gendwarfksyms/gendwarfksyms.h:6:10: fatal error: 'dwarf.h' file not found
      6 | #include <dwarf.h>
        |          ^~~~~~~~~

Fixes: f28568841ae0 ("tools: Add gendwarfksyms")
Reviewed-by: Sami Tolvanen <samitolvanen@google.com>
Signed-off-by: WangYuli <wangyuli@uniontech.com>
---
Changelog:
 *v1 -> v2:
    1. Correct the commit log.
    2. Add Sami Tolvanen's "Reviewed-by" tag.
---
 scripts/package/mkdebian | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/package/mkdebian b/scripts/package/mkdebian
index 744ddba01d93..d4b007b38a47 100755
--- a/scripts/package/mkdebian
+++ b/scripts/package/mkdebian
@@ -210,7 +210,7 @@ Rules-Requires-Root: no
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


