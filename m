Return-Path: <linux-kbuild+bounces-4129-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4962999F915
	for <lists+linux-kbuild@lfdr.de>; Tue, 15 Oct 2024 23:29:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E873B1F23C68
	for <lists+linux-kbuild@lfdr.de>; Tue, 15 Oct 2024 21:29:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA6D11FC7E6;
	Tue, 15 Oct 2024 21:28:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b="eNKXq7Zy"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz [202.36.163.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C6A61FBF7F
	for <linux-kbuild@vger.kernel.org>; Tue, 15 Oct 2024 21:28:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.36.163.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729027730; cv=none; b=qbxcOXBuZ2beVkKCC/zLBFQaQH+XtA06RstRRZw9VaX6o+mc/B286IFmLauB8jH7rUL/Juu1TyBLZxiDb7VN7RWDfEr/niUJZcgz3uq0IxFnfMz/NQ3QS/DSFtY6PsFKYtJyWRqc7rRtJFq0nkjW5ynn76YIP3BTTLHGH1bd80s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729027730; c=relaxed/simple;
	bh=Vd1iYPpSaUCZZBcD82WQIm4f4w9pYvDa1bH9TYatyDo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NrCOLC0v9bPufZ/tzbKzXVQ5DzcEKVzHLY825mRW9uVCeK4vD7Ajgv3ySrbNnFoK6DmyPBd4gnMyujht/C0+QFW9HIMG77fH01dixbQXYhgp0s3yo8CVmkSBgL62/YMlWU0rlxJswaDTGpWjWEMZJ3MgHkRooJMtKb6P4Fk2hp4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz; spf=pass smtp.mailfrom=alliedtelesis.co.nz; dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b=eNKXq7Zy; arc=none smtp.client-ip=202.36.163.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alliedtelesis.co.nz
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 03FA32C03CB;
	Wed, 16 Oct 2024 10:28:46 +1300 (NZDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
	s=mail181024; t=1729027726;
	bh=r4UwTF4syoyNr34v7/r4SVZPY7KUBI9UYEBiHEXWL2M=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=eNKXq7Zy4xIHVyINCYC+/mjntuadAs5je5S+9jYpmx8OmcnOHRyE6azyY8YnuCDbR
	 1gZ3qtOJlRFEpBmSzLQarzzUXXM3gVTmFIQfrZavwPxXCIWoBRzPen9EckST2c9okC
	 /8M07EnRclprhr53jqeUCLIp84LuiuM0xM6ZhKOzNeDIY8lflxJkMC58IpPzAdj38A
	 p6ajMZWPobEMz896MAnAH0N2yPvJKxzOJVJ5/B1d18dpM/gr+o+0QE7fnoFCIXKkZ2
	 sYlZH1XzKwSqbpcckIURl8h3+hOhM5sX1Mb81sgwmqYPMDLAf8bSeUeqjBsjMSIJ8H
	 1pBRvQFWajl5w==
Received: from pat.atlnz.lc (Not Verified[10.32.16.33]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
	id <B670ede8d0000>; Wed, 16 Oct 2024 10:28:45 +1300
Received: from chrisp-dl.ws.atlnz.lc (chrisp-dl.ws.atlnz.lc [10.33.22.30])
	by pat.atlnz.lc (Postfix) with ESMTP id D34E113ED7B;
	Wed, 16 Oct 2024 10:28:45 +1300 (NZDT)
Received: by chrisp-dl.ws.atlnz.lc (Postfix, from userid 1030)
	id CF3542807F0; Wed, 16 Oct 2024 10:28:45 +1300 (NZDT)
From: Chris Packham <chris.packham@alliedtelesis.co.nz>
To: masahiroy@kernel.org,
	nathan@kernel.org,
	nicolas@fjasle.eu
Cc: linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Chris Packham <chris.packham@alliedtelesis.co.nz>
Subject: [PATCH] kbuild: Restore the ability to build out of tree dtbs
Date: Wed, 16 Oct 2024 10:28:30 +1300
Message-ID: <20241015212830.3899891-1-chris.packham@alliedtelesis.co.nz>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <2a2be28c-fd5e-45b0-8834-611d35c5e6a6@alliedtelesis.co.nz>
References: <2a2be28c-fd5e-45b0-8834-611d35c5e6a6@alliedtelesis.co.nz>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-SEG-SpamProfiler-Analysis: v=2.4 cv=ca1xrWDM c=1 sm=1 tr=0 ts=670ede8d a=KLBiSEs5mFS1a/PbTCJxuA==:117 a=nLVBVlUmovVwbiQ-:21 a=DAUX931o1VcA:10 a=BIAS_OXL9HNCHBaA7CgA:9 a=3ZKOabzyN94A:10
X-SEG-SpamProfiler-Score: 0
x-atlnz-ls: pat

A build pattern to handle out of tree dtbs is to copy the .dts file into
the kernel source tree and run `make myboard.dtb`. This is supported by
the wildcard %.dtb rule in the Makefile but recent changes to split the
dtb handling out of scripts/Makefile.build stopped this from working.
Restore this functionality by looking for the relevant file extensions
in $(MAKECMDGOALS) instead of $(targets).

Fixes: e7e2941300d2 ("kbuild: split device tree build rules into scripts/=
Makefile.dtbs")
Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
---

Notes:
    This seems to address the problem building out of tree dtbs. I think =
it
    is correct because as far as I can tell nothing will pull .dtb and
    friends into $(targets) and we explicity check for a non-empty $(dtb-=
y).

 scripts/Makefile.build | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/Makefile.build b/scripts/Makefile.build
index 8f423a1faf50..58404c1c5eda 100644
--- a/scripts/Makefile.build
+++ b/scripts/Makefile.build
@@ -449,7 +449,7 @@ ifneq ($(userprogs),)
 include $(srctree)/scripts/Makefile.userprogs
 endif
=20
-ifneq ($(need-dtbslist)$(dtb-y)$(dtb-)$(filter %.dtb %.dtb.o %.dtbo.o,$(=
targets)),)
+ifneq ($(need-dtbslist)$(dtb-y)$(dtb-)$(filter %.dtb %.dtb.o %.dtbo.o,$(=
MAKECMDGOALS)),)
 include $(srctree)/scripts/Makefile.dtbs
 endif
=20
--=20
2.47.0


