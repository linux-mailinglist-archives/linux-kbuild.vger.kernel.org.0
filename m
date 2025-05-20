Return-Path: <linux-kbuild+bounces-7169-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D5B3ABD974
	for <lists+linux-kbuild@lfdr.de>; Tue, 20 May 2025 15:33:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2158218870B1
	for <lists+linux-kbuild@lfdr.de>; Tue, 20 May 2025 13:33:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B8BE242922;
	Tue, 20 May 2025 13:33:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="f2uKt0Tc"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B60E22D794;
	Tue, 20 May 2025 13:33:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747748003; cv=none; b=NC1S/evKTTqkAW8wBxsHa6dnLCBzrKAcUg/d5qsJv9STFj7YmnqwdkOq8FEOvLb0eddgiDnX1rgb8GUfCJBLwuHFFHY8UmHzFuT3/sTId9CK0HPrViPuNXCX+afa8peFGvJdWZbtm7jNNpVpKFYnTvXFgNdcQ7ceiRKjOOsci00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747748003; c=relaxed/simple;
	bh=4nApEr5ie+wHKfoUKfSRSdRlkw1Tcp1VpPHE1i2VbGw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VxilFaRNJ4vbipLrLJUsXfPPpmKs15rXzE0u3hVqf3vv/Gk9fjdx4ld4w/paF4/66r6xZ261iTkmOI5+TNBjTB4v/0kSG29mpOJQhIWAuKK0JIm/0ohCxdfHJRVCu4XIfizjD4QR3n9OFC0kJ4FYlyfOd2Rtct84rBYBUZCL9F0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=f2uKt0Tc; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BAF80C4AF09;
	Tue, 20 May 2025 13:33:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747748002;
	bh=4nApEr5ie+wHKfoUKfSRSdRlkw1Tcp1VpPHE1i2VbGw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=f2uKt0Tc7HkAwBGRFz00KE+i3IjbxvdvWOPIMXUP1hRRDAndpRBQH2tDtPbpHEKpt
	 9GbcInaMUzyWAp5LjqeslxYJe+cH40kt5GSmU1JyYXMD4Qu4q1Lkj3nTc84taNnGUk
	 mvcOzTZEHniQgdEVB+a9IWKuR6kIQ5FHQGc0EETQ06VmmTetdxwNSfvzU6jPlJg4zH
	 kGNxlC96yQ59nfw0BVqEf1WyJo1e8GMfFCFDtYoBR2gJGRWSy0/WN+7TyrzdYpcTmw
	 I3QwJLQjeQtNqvMpo9mbnWAF01yVsgGc9SmWiDhT+oMIwRJvvmFcVAQtxroRvWM+P6
	 1ymeH34K0dK4g==
Received: from mchehab by mail.kernel.org with local (Exim 4.98.2)
	(envelope-from <mchehab@kernel.org>)
	id 1uHN5r-00000006n8L-1LgH;
	Tue, 20 May 2025 15:33:19 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: "Jonathan Corbet" <corbet@lwn.net>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	"Akira Yokosawa" <akiyks@gmail.com>,
	"Andy Shevchenko" <andriy.shevchenko@linux.intel.com>,
	"Nicolas Schier" <nicolas.schier@linux.dev>,
	"Randy Dunlap" <rdunlap@infradead.org>,
	"Stephen Rothwell" <sfr@canb.auug.org.au>,
	Kees Cook <kees@kernel.org>,
	linux-doc@vger.kernel.org,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/4] docs: kerneldoc.py: don't use Sphinx logger
Date: Tue, 20 May 2025 15:33:06 +0200
Message-ID: <b5c5fa41278bc0317461a5074d5229883c5753ef.1747747695.git.mchehab+huawei@kernel.org>
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


