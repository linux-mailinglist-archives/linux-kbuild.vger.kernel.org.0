Return-Path: <linux-kbuild+bounces-10684-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id EA470D3A7F7
	for <lists+linux-kbuild@lfdr.de>; Mon, 19 Jan 2026 13:07:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1A936306AE5B
	for <lists+linux-kbuild@lfdr.de>; Mon, 19 Jan 2026 12:05:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A19D359F9F;
	Mon, 19 Jan 2026 12:05:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pU0+yURc"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B5EB359712;
	Mon, 19 Jan 2026 12:05:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768824317; cv=none; b=es6deBDpEGVKJakFL2L1Hk9O03xeTR/wjSLbaupYNX9scJl+vclWD53Y+bXYLcEE+PeriGqojxG/jUieldSOuo7ATBsXptOV5EPVXZi04AadHrp9JSAyxSKR9MdLKaFGmhEBdt8FpziJvGsuZhUMVlE/ONXjUMjtP88QSEidVVM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768824317; c=relaxed/simple;
	bh=kGt9gNhMuRj9+jM9PcGfmUvM8H3qve1/pTvOonlpy+g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DFU50qQ8fxq1RWwReUws71BEURVyjZZML3qrQMO60cHL2ASRzqwVOhzWHetSvvuLz2gO8sr1GEkgKhlCzKy+MXJJMmdtU3rUBa6+tABrJydeACM4hhlPzEzJtSYl3m32VH1WysyPZqptLmUNR/p4qX6VmMDnxDGDywtZfLGBrnA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pU0+yURc; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2953C2BCAF;
	Mon, 19 Jan 2026 12:05:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768824316;
	bh=kGt9gNhMuRj9+jM9PcGfmUvM8H3qve1/pTvOonlpy+g=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=pU0+yURc1Q45u8r1PvFHHPODmTRWMuC9YrkASEB967Elx3REu6QhasyY+7FBLquMj
	 SGUO+N+BnEdM7QH4q7SzrZuijRYoPNaX3zw5p56FJQ2ylQXCTLJKvfHpm+zYSZu7gG
	 /hpSC9wYb6vV6NfQ02yuPdVFxTKrFGqVqLMpnuXqODZA5xGm0u0GVVEzE08kdmPh8L
	 6/ar92+aciGUNsWmT1d+qnov7ZCrkkbc8bdgC2pHe2Wq7pmGLfDJVCKm41jGZNzPEm
	 iu60r+QYUlbLB34qzOZ5BJ6HIhw4s1HckZur1X8zUVZrrVXLR5/IGY/XiqXpM6xzIY
	 I1F4kXhuFzG6Q==
Received: from mchehab by mail.kernel.org with local (Exim 4.99)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1vho0Q-00000001ZjY-3uFL;
	Mon, 19 Jan 2026 13:05:14 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>,
	Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	dri-devel@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	workflows@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Shuah Khan <skhan@linuxfoundation.org>
Subject: [PATCH 7/9] docs: kdoc: move the return values to the helper message
Date: Mon, 19 Jan 2026 13:05:02 +0100
Message-ID: <3bcfa48016770929fcd073376515e3ff0b777ea8.1768823489.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <cover.1768823489.git.mchehab+huawei@kernel.org>
References: <cover.1768823489.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

It makes sense to describe what kernel-doc is expected to return
on its help message. Move such messages to argparse epilog.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 tools/docs/kernel-doc | 27 +++++++++++++++------------
 1 file changed, 15 insertions(+), 12 deletions(-)

diff --git a/tools/docs/kernel-doc b/tools/docs/kernel-doc
index a19a92566780..902397804e80 100755
--- a/tools/docs/kernel-doc
+++ b/tools/docs/kernel-doc
@@ -166,6 +166,20 @@ This option is kept just for backward-compatibility, but it does nothing,
 neither here nor at the original Perl script.
 """
 
+EPILOG = """
+The return value is:
+
+- 0: success or Python version is not compatible with
+kernel-doc.  If -Werror is not used, it will also
+return 0 if there are issues at kernel-doc markups;
+
+- 1: an abnormal condition happened;
+
+- 2: argparse issued an error;
+
+- 3: When -Werror is used, it means that one or more unfiltered parse
+     warnings happened.
+"""
 
 class MsgFormatter(logging.Formatter):
     """Helper class to format warnings in a similar way to kernel-doc.pl."""
@@ -178,21 +192,10 @@ def main():
     """
     Main program.
 
-    By default, the return value is:
-
-    - 0: success or Python version is not compatible with
-      kernel-doc.  If -Werror is not used, it will also
-      return 0 if there are issues at kernel-doc markups;
-
-    - 1: an abnormal condition happened;
-
-    - 2: argparse issued an error;
-
-    - 3: -Werror is used, and one or more unfiltered parse warnings happened.
     """
 
     parser = argparse.ArgumentParser(formatter_class=argparse.RawTextHelpFormatter,
-                                     description=DESC)
+                                     description=DESC, epilog=EPILOG)
 
     #
     # Normal arguments
-- 
2.52.0


