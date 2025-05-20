Return-Path: <linux-kbuild+bounces-7160-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 921C2ABCEBE
	for <lists+linux-kbuild@lfdr.de>; Tue, 20 May 2025 07:48:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BED901893400
	for <lists+linux-kbuild@lfdr.de>; Tue, 20 May 2025 05:48:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 97BED25A324;
	Tue, 20 May 2025 05:47:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CH7j2OXi"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 680431A841A;
	Tue, 20 May 2025 05:47:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747720076; cv=none; b=kXrm4YfrenuaogXhZZ0eVwwle/eFHBiz4z2JALg3J4p9URnq6sGRV6PJE+yyl0GrtAqjxZ9LXp2ZV5WSIT5DqjCjGaljCaH+U9idH4ayxoEGeXrhOstKlZd5EP9WQ7yYAmEpvg39MSFLMxg02ZZn+KohgzltosB/9QQBlvDg58Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747720076; c=relaxed/simple;
	bh=4nApEr5ie+wHKfoUKfSRSdRlkw1Tcp1VpPHE1i2VbGw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TEAL2dP7fgwDpITfSn8YCM8vnkGm7TNNfhjsBBuZoim/3SdkUf7u4lrLGXDGrntn2sgvJPVAzAygHi/JBYejruzVc8mR104XuA+Vys5yzMuRrgaNcYjqYC2/3c0bdG6gxPareH+fR2sXc35TW6ZIhW8LkizVGed3L3JJuIj7fQ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CH7j2OXi; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD1B7C4CEE9;
	Tue, 20 May 2025 05:47:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747720075;
	bh=4nApEr5ie+wHKfoUKfSRSdRlkw1Tcp1VpPHE1i2VbGw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=CH7j2OXitbI+8l4HsGU9jzBnGV8jZg2IQa1kHxIt5dPLPBCiLl94TioRbJME6PYV+
	 OJW0Xakf1sSJZmoR+MUF/86OhDOJbUwlgYOBV5etB2wYJ+GqnCAUuX24XCesLlfnF9
	 ZTQwS+qbfKMW69CXMw/ukWBIZgB7rq1yUFUl+BdYw114mAe6INy9lGQ6r7wny2CEl1
	 M9j0prAS7RDbAzut7870BXq3E5BN8hwE5xXRj3FwvO3cX4f7sESXHcy/KiyMXRytO9
	 MqD0/ahXBsrqPrn6zCmEVWhJET2enWtPtM4pS+IJ7M/UOzYmD1KFizZEzOJbbF3JKY
	 aktee1SqwdB3Q==
Received: from mchehab by mail.kernel.org with local (Exim 4.98.2)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1uHFpS-000000056If-0CT5;
	Tue, 20 May 2025 07:47:54 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	"Akira Yokosawa" <akiyks@gmail.com>,
	"Andy Shevchenko" <andriy.shevchenko@linux.intel.com>,
	"Masahiro Yamada" <mchehab+huawei@kernel.org>,
	"Nathan Chancellor" <mchehab+huawei@kernel.org>,
	"Nicolas Schier" <nicolas.schier@linux.dev>,
	"Randy Dunlap" <rdunlap@infradead.org>,
	"Stephen Rothwell" <sfr@canb.auug.org.au>,
	Kees Cook <mchehab+huawei@kernel.org>,
	linux-doc@vger.kernel.org,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/1] docs: kerneldoc.py: don't use Sphinx logger
Date: Tue, 20 May 2025 07:47:45 +0200
Message-ID: <6b81b1aaa8446b4d850064dd38ffffa1a1cb6254.1747719873.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1747719873.git.mchehab+huawei@kernel.org>
References: <cover.1747719873.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

Unfortunately, currently Sphinx logger is suppressing too much, not
allowing warnings to be displayed. Disable it.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 Documentation/sphinx/kerneldoc.py | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/Documentation/sphinx/kerneldoc.py b/Documentation/sphinx/kerneldoc.py
index b713a2c4a615..314479718a01 100644
--- a/Documentation/sphinx/kerneldoc.py
+++ b/Documentation/sphinx/kerneldoc.py
@@ -311,7 +311,11 @@ def setup_kfiles(app):
     if kerneldoc_bin and kerneldoc_bin.endswith("kernel-doc.py"):
         print("Using Python kernel-doc")
         out_style = RestFormat()
-        kfiles = KernelFiles(out_style=out_style, logger=logger)
+
+        # Ideally, we should be using Sphinx logger here, but its filtering
+        # rules ending filtering out warnings and errors. So, let's use
+        # Python default logger instead.
+        kfiles = KernelFiles(out_style=out_style)
     else:
         print(f"Using {kerneldoc_bin}")
 
-- 
2.49.0


