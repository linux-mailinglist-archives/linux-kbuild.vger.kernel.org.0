Return-Path: <linux-kbuild+bounces-6513-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D1B6AA7F810
	for <lists+linux-kbuild@lfdr.de>; Tue,  8 Apr 2025 10:38:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2657D3A1D1B
	for <lists+linux-kbuild@lfdr.de>; Tue,  8 Apr 2025 08:37:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E3842641C6;
	Tue,  8 Apr 2025 08:37:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b="G1U5Xdxl"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtpbg154.qq.com (smtpbg154.qq.com [15.184.224.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB81620B7EF;
	Tue,  8 Apr 2025 08:37:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=15.184.224.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744101457; cv=none; b=e1GcLF3+bvoSwPnkfh2FggT+q/2vvqd1QeDDDO6pa7CmEGjUVsk75D+S1+9wwbtJsk4G6DRjwL0BEkB5DvU4x3q+DwULEmq93xVW/m5CrFOIPtO5LOebOYuK+99/Dj0KBnwGms8jkri4A1k4R+LuwHgwjew3r5GPc+2ZqjNrxWI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744101457; c=relaxed/simple;
	bh=zYwN5AXNDb9BX5Xil/czoYAh3N+dUlbKkka0+Eyt2hg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uWkWyPp1FcdmsZELRygNpiUJhTITKUx7t/xLmE8nn6zhKGqPQhH3Y93O9zlzaNaaQy4yxlTA4xOglT29aIVLIpweaU625R+ePU2T1RopK+AT69gvqZYMzGjabt7psG7d7PLlw+2VPvyRzHGL0ZqBloOIqA3kyHdPicem6obXKJ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b=G1U5Xdxl; arc=none smtp.client-ip=15.184.224.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1744101413;
	bh=oCA2zRVnBob9l6TGh97Bpu7K3K5rJPTxMgimLHEAx7Y=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=G1U5Xdxllz4cCuWgOiaht8dO3wA8zb/VEz1xFXSb1OuSAj73s6lP04qpdF86bKAV6
	 JN+yNnFrGcYfbbjoMciN0ZEz8CTUFshPBcM8HJ/T2Ak4MsyZ3UT+zoNkg5gPsmWUQO
	 kmnvUYniyyPr15PEYELFP/KI2FJLmRz9ddJidFk0=
X-QQ-mid: bizesmtpip4t1744101365tea48f4
X-QQ-Originating-IP: SYyhI77PtA9jQTEoZCNoOyln5/n1sEdZfmwMWVdWlX4=
Received: from localhost.localdomain ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 08 Apr 2025 16:36:03 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 10433558673128327035
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
Subject: [PATCH v3] kbuild: rpm-pkg: Add (elfutils-devel or libdw-devel) to BuildRequires
Date: Tue,  8 Apr 2025 16:35:58 +0800
Message-ID: <8F253522AA2663E6+20250408083558.66575-1-wangyuli@uniontech.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <964B3FC2F607F2F4+20250408081921.63040-2-wangyuli@uniontech.com>
References: <964B3FC2F607F2F4+20250408081921.63040-2-wangyuli@uniontech.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtpip:uniontech.com:qybglogicsvrgz:qybglogicsvrgz8a-1
X-QQ-XMAILINFO: MAV4M+M/KN87dR5mjMdEn2fCex3vV0EF5iKl+tNfgcP/+Rtzkro1GzKK
	p0jCHT+uYXuajLKZ/94UnwmLtTOAV2ISsWMmwB3jCK/+EYr+fFWpDzbVsxyVJY3XD4iLHTw
	WCTRVCOpDDoJsAidpLOPbWcwbA4xyVrkj4KPOs4Y2o9wuSCPo1Fe6jzvfvlUL4Ysr/iUfl0
	hXzQRkHgWewsfQAFjfZFhETZLSvrvGKvCzlXIAevISXTx7kl+fprKZ97SsG52xoshOjBU3a
	IDTfPyorJ5tF9xkTltkVsl+Ja4rCGbDgoopZpxHEXaqXswOweHTvnL/cCR2xtKxI/o4dMcy
	zn1PguAiaZ52stf/FFOzLN9loC6QvAtN2cBGEKWhpPS9kFR7rZ99w0865d0JeAh3WF8Lgg/
	miUwI/u4lYvf+CpPStqwD9I477SpABAD4UuWAtb7RJqEcBmcPg8RpnHd4uJjONbykPER/vQ
	nBxzq8kRhWcj2akpCbLZdoH7sAYLQRCBzEuU00iGno9cfSg/mE0xc+nmCq78JIbQBgmTIM7
	jo4jWf9cBgk1o68hs+uRqb0hn9NTnBRjZVg5A+rJmPyUyPsQNyQlJIBlqJglEz2U78pEZ41
	H2wlsBYkfufcRkvuo5WiXbQKkWqF/d8EugW5bxUWGsPEev4IaeoiNm+Rdnqdd7fMGxMpGCl
	j8m2KBaD6X+qG7x8vRnYXCq3ajjkwyGqzNzRLPy3OrDn+3oh2w7+dnJ2WcmQPLZfZaacUNs
	3WAsXbZ8cR2I0n4q8bnduuR45jKlIgDq7i+OpsJc6Nlb7lavPRAToLFmeMnL1U1aq3hBSa8
	I23+bjYYrjDEERb7odYMy0QTtxGRJv/Ej1LTRn/zTWvi3Z3v1ab8/9TsyMw8kzk+7zIKnrc
	cA8NQWnTlXGgUIiHcuLvGjUJdjDFmr2Xco3fiHGFVILZhLeykFJW1vHbHZvng09Naq+1nE5
	HzhzMYVfmh4WTdQgZqZwge8tEIPCUW4nwoqag1ZYZFD3K2fBT6lH+0pverB8R6MrZZ7GL0n
	QUPLVf7w==
X-QQ-XMRINFO: NI4Ajvh11aEj8Xl/2s1/T8w=
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
Changelog:
 *v3: Fix commit message.
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


