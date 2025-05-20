Return-Path: <linux-kbuild+bounces-7171-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 96620ABD979
	for <lists+linux-kbuild@lfdr.de>; Tue, 20 May 2025 15:33:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 34C733BFA20
	for <lists+linux-kbuild@lfdr.de>; Tue, 20 May 2025 13:33:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70919242D60;
	Tue, 20 May 2025 13:33:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kKWJAaAo"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E95A22DA16;
	Tue, 20 May 2025 13:33:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747748003; cv=none; b=ZYVIuxUt2v09u5EUI9g3teJUtXvGpp12/XCOj552IixNGPzbWKJnTT44jOlGwj4Ul1t4+uVKCWwFj5gyfa3rTiZ4KO5Dwey5bXUD3HmqUgAPL+z1XTrkA13xzL/jvjv556dIP9wtC8MsQuyz/45PHOWGBx6Ow+JLk0SKR0CpiF8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747748003; c=relaxed/simple;
	bh=fEgVgn8ddmuG94XtJzRW64JNMVcuU+HToQCr20S4KM0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tt5DvPSUwM4FC/UgIwwC0Z2vsGBRSdgOdCrPajMvjP6SSo+KRFzynAHM9z1CMyj3SkdTcCwvzLYptF1UxV2FgB3kgubMGjcWUtHR+w73bXKg9eI3HlxeTpr/tIxCNcIPXiHJkzH7xfpjbLy88cCb7EmGRTLVEI6UFp0xSG0oAFs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kKWJAaAo; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7F2CC4CEE9;
	Tue, 20 May 2025 13:33:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747748002;
	bh=fEgVgn8ddmuG94XtJzRW64JNMVcuU+HToQCr20S4KM0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=kKWJAaAob7o5E4J6lRb1qIeP3I9g6Sq+eN3TEt43Kl8XAFUWF5BHA7P/3/7ooKv6V
	 7uIv2FbP3lta2DxTC0Nn9w8MU4fPUTmuCQKITHBGp8QyNCYxsrIMMY84q3AHPjKAPq
	 0wJxHffs/5Q6PWAqpFWNJhiPbWzhc6JDlwKQFd4+1nWiKsmKEmHG3qvlyJ1TQSvHsw
	 J/SVzrFqf92+Yz6UYgU/7Clk7YsLTOV2e7XvSgD7kKa9QDIKVhpQZM6qZCSBmTxdLJ
	 XreisQrHCDZpSeebobtLnYrEb1oJjGgHI+luXNc2w42DYxezlwt2vdlo11AxAr+6d5
	 EOAFFdIIeK7Fg==
Received: from mchehab by mail.kernel.org with local (Exim 4.98.2)
	(envelope-from <mchehab@kernel.org>)
	id 1uHN5r-00000006n8U-1bhS;
	Tue, 20 May 2025 15:33:19 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: "Jonathan Corbet" <corbet@lwn.net>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	"Akira Yokosawa" <akiyks@gmail.com>,
	"Andy Shevchenko" <andriy.shevchenko@linux.intel.com>,
	"Nicolas Schier" <nicolas.schier@linux.dev>,
	"Randy Dunlap" <rdunlap@infradead.org>,
	"Stephen Rothwell" <sfr@canb.auug.org.au>,
	linux-doc@vger.kernel.org,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 4/4] MAINTAINERS: update linux-doc entry to cover new Python scripts
Date: Tue, 20 May 2025 15:33:09 +0200
Message-ID: <8eb4f06214e1eadc8aff43d7264814bf0264c80d.1747747695.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1747747695.git.mchehab+huawei@kernel.org>
References: <cover.1747747695.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>

Changes to ABI and kernel-doc need to be c/c linux-doc. Update
the maintainer's entry to cover those files.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 MAINTAINERS | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 20e07e61a148..a668808769b6 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -7173,7 +7173,10 @@ T:	git git://git.lwn.net/linux.git docs-next
 F:	Documentation/
 F:	scripts/check-variable-fonts.sh
 F:	scripts/documentation-file-ref-check
-F:	scripts/kernel-doc
+F:	scripts/get_abi.py
+F:	scripts/kernel-doc*
+F	scripts/lib/abi/*
+F	scripts/lib/kdoc/*
 F:	scripts/sphinx-pre-install
 X:	Documentation/ABI/
 X:	Documentation/admin-guide/media/
-- 
2.49.0


