Return-Path: <linux-kbuild+bounces-4154-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A63F9A12C3
	for <lists+linux-kbuild@lfdr.de>; Wed, 16 Oct 2024 21:42:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D548D1F23424
	for <lists+linux-kbuild@lfdr.de>; Wed, 16 Oct 2024 19:42:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A28A8212EF9;
	Wed, 16 Oct 2024 19:42:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b="uSxMnabM"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz [202.36.163.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 031812144A9
	for <linux-kbuild@vger.kernel.org>; Wed, 16 Oct 2024 19:41:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.36.163.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729107720; cv=none; b=Jci1GHUDFm/bLBNixGLXA5aEOLCMoBj9tRksrzDJ6A04Wi+H5HuQKQtTy4tNMDmgp18kfDyPxbAgB0LXpJGVjjr0ENlPqKPQUcgCIiHi5cccZ5UFVrVbeQa1DkABQeN5SSGi7GkZR6IrfZJQzgauwbEtx67wD5OTHo46FkRXZD8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729107720; c=relaxed/simple;
	bh=F2Suugf57GPw3RqJq7bRvLar9lCs5cHH4M9EOSt6p1k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hxRNf9a9wLIPpOmG2BSOiESON0F1/ta0vFixUVi+RwkVWEjoepeCYGjn6/lozhvwDQ2HeD5rUQjNvvss/W7L42iPPRu+Bi3L71WFfxDJDEXL4EdmZ7O3vOIhSZBjHHgD86IP6ZPwIPApUv7DeedfF1nTWaOwyi/daBvoz8e68eI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz; spf=pass smtp.mailfrom=alliedtelesis.co.nz; dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b=uSxMnabM; arc=none smtp.client-ip=202.36.163.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alliedtelesis.co.nz
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 73A1D2C0436;
	Thu, 17 Oct 2024 08:41:55 +1300 (NZDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
	s=mail181024; t=1729107715;
	bh=zuhAErChXmTZvMoGaqhA8T5c9vvGGKPoIeF7VyoGiNY=;
	h=From:To:Cc:Subject:Date:From;
	b=uSxMnabM8svO3VExiUHPh8uF7M5CWm7RNSVRPg1XEufT1e6lqYQ3z4NYUOzEdK5IW
	 JnNwse1GJSORonBPvsLK+F+uyFQWDqUKDvd5bOTVL3D3mBEQW1MmEZPtDEbaD/Hy3H
	 u0CTsJk7dkLhNriWfn1Q/uqAEt6n7H6lBOu3+biHFoh84+pMpcfNXH9XFFpeSwEXd2
	 fdNfWyOnSKhEvONv2EnBqyXh5lAdUfE0JI7pClO1RMOarzU5A9uaGjI08ykxq8E7Dv
	 L3EWpLo6+/rtKaX5A8sqBqWS/MPLCxK3q9KvWLll3YbHfX3g0qQeXkSoapnlm3NC8Z
	 S4Vbn6U/LtrMQ==
Received: from pat.atlnz.lc (Not Verified[10.32.16.33]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
	id <B671017030000>; Thu, 17 Oct 2024 08:41:55 +1300
Received: from chrisp-dl.ws.atlnz.lc (chrisp-dl.ws.atlnz.lc [10.33.22.30])
	by pat.atlnz.lc (Postfix) with ESMTP id 2CA2713EE32;
	Thu, 17 Oct 2024 08:41:55 +1300 (NZDT)
Received: by chrisp-dl.ws.atlnz.lc (Postfix, from userid 1030)
	id 28DC6280482; Thu, 17 Oct 2024 08:41:55 +1300 (NZDT)
From: Chris Packham <chris.packham@alliedtelesis.co.nz>
To: masahiroy@kernel.org,
	nathan@kernel.org,
	nicolas@fjasle.eu
Cc: linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Chris Packham <chris.packham@alliedtelesis.co.nz>
Subject: [PATCH v2] kbuild: Restore the ability to build out of tree dtbs
Date: Thu, 17 Oct 2024 08:41:49 +1300
Message-ID: <20241016194149.4178898-1-chris.packham@alliedtelesis.co.nz>
X-Mailer: git-send-email 2.47.0
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-SEG-SpamProfiler-Analysis: v=2.4 cv=ca1xrWDM c=1 sm=1 tr=0 ts=67101703 a=KLBiSEs5mFS1a/PbTCJxuA==:117 a=nLVBVlUmovVwbiQ-:21 a=DAUX931o1VcA:10 a=N9YJ-UhC3puMJLZ-EMAA:9 a=3ZKOabzyN94A:10
X-SEG-SpamProfiler-Score: 0
x-atlnz-ls: pat

A build pattern to handle out of tree dtbs is to copy the .dts file into
the kernel source tree and run `make myboard.dtb`. This is supported by
the wildcard %.dtb rule in the Makefile but recent changes to split the
dtb handling out of scripts/Makefile.build stopped this from working.
Restore this functionality by looking for .dtb in $(MAKECMDGOALS) as
well as $(targets).

Fixes: e7e2941300d2 ("kbuild: split device tree build rules into scripts/=
Makefile.dtbs")
Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
---

Notes:
    Changes in v2:
    - keep $(target) and search for .dtb in $(MAKECMDGOALS)

 scripts/Makefile.build | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/Makefile.build b/scripts/Makefile.build
index 8f423a1faf50..78763a4bc58a 100644
--- a/scripts/Makefile.build
+++ b/scripts/Makefile.build
@@ -449,7 +449,7 @@ ifneq ($(userprogs),)
 include $(srctree)/scripts/Makefile.userprogs
 endif
=20
-ifneq ($(need-dtbslist)$(dtb-y)$(dtb-)$(filter %.dtb %.dtb.o %.dtbo.o,$(=
targets)),)
+ifneq ($(need-dtbslist)$(dtb-y)$(dtb-)$(filter %.dtb %.dtb.o %.dtbo.o,$(=
targets))$(filter %.dtb,$(MAKECMDGOALS)),)
 include $(srctree)/scripts/Makefile.dtbs
 endif
=20
--=20
2.47.0


