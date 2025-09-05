Return-Path: <linux-kbuild+bounces-8739-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C56AB45456
	for <lists+linux-kbuild@lfdr.de>; Fri,  5 Sep 2025 12:18:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EBDF6584C3A
	for <lists+linux-kbuild@lfdr.de>; Fri,  5 Sep 2025 10:18:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 149402D46AB;
	Fri,  5 Sep 2025 10:18:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pbarker.dev header.i=@pbarker.dev header.b="UUEmRczD";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="e9g7pzrX"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from fout-b1-smtp.messagingengine.com (fout-b1-smtp.messagingengine.com [202.12.124.144])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75A172D3EC7;
	Fri,  5 Sep 2025 10:18:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.144
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757067492; cv=none; b=CxI0cI0rDSL8q4JqUArkVWWVNY6GRSeD94baosi2tjFJG3kz9Zds1w+wWE1TBk/GEJL4Ul593iKOK1mZrr1r8ZvkghMUnS1bZbc7N+JCy/RszS6KG53ef4402eVgdis1M9pZEAYnR4K1xCiBD2UM4DB5C8QA/gNLdYLVv5JxQJk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757067492; c=relaxed/simple;
	bh=emHvs8PChoJnp11U7/UKLC2zPZlEDVXcKjnn+49ixOk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=XobilLfc5W6xNiFekVII0O+O+R62pDEgSBU/GHhM+3nFPuIbpBrswl1YP5GJEt7BrlWSrQ5QIlZfREN1t9mQsdhwXmjpE/I7UXzeP7zkE9j40we9jGaTLAbbm7LBkaRxbtM5rPsKsZSy8BkU2DXcacq97+5FtZ4efw+q744kuGM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pbarker.dev; spf=pass smtp.mailfrom=pbarker.dev; dkim=pass (2048-bit key) header.d=pbarker.dev header.i=@pbarker.dev header.b=UUEmRczD; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=e9g7pzrX; arc=none smtp.client-ip=202.12.124.144
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pbarker.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pbarker.dev
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfout.stl.internal (Postfix) with ESMTP id 511011D004B8;
	Fri,  5 Sep 2025 06:18:08 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-04.internal (MEProxy); Fri, 05 Sep 2025 06:18:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:subject:subject:to:to; s=fm2; t=1757067488; x=1757153888; bh=fM
	XJVooOpW41bTDdr+I6Jy+JqKCugaulTeCZsAFlNc0=; b=UUEmRczD5Ozg84lQ1W
	EqCGLDSYVIHBAdVBeSFEpbGNryqFHQl2J9htukADo7qOVlD3sohKKe3yzklB/nT6
	wvs/Sz0lA9yWQpsUJGgI8TLMtaiQYwq5EsPr4CkhHq6rPNt0A0JGO9uOolDeLh+R
	DlDyT/yob5AdPQyvu45yEyibckLQZ0hP+MzlILfIDedNUlfjPDjAAzyFhD2uf2dO
	13138w9UEKOTh0bgnrcofQEP3q76vj41xw+HJFXmVxo7koLlqgZxzvNSUXDSAjSC
	GEcp21wNWMtLo+IWKsb4NNVyvPLkN2P07hcYyWwvXrhcMPSfp/wfpmIN99JHaVpr
	HcfA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1757067488; x=1757153888; bh=fMXJVooOpW41bTDdr+I6Jy+JqKCu
	gaulTeCZsAFlNc0=; b=e9g7pzrXNru78YrVp3GxnuO5B37Vi/ZGns3/MjuV+wbi
	blx/gahk6b/zhKK4Zw8G5AC+gBljgNcIiN+cdoGpRqeBWcn5WPyyGEORkHkY68Ft
	0ajkmQ75DD1Iy5EeKZfJBBlyRPHyd2oMxNayFcL944Hw7HnaRb5ziTpARA0SMjDt
	9AnJqJ0b86mCUC4XLNw506oPR1UChXw0lXrJfy7M4nxVyYR+xi0lUFVi0+FQ1hcd
	hYu9YySpPmqE5u9rKsFVqauF7dRVx/Y/xEs0kwnrq0v/+aJ5o8MnEimegWl0NLnr
	DJC2rKfe/c+J9Sz50mMat9AztYdmAmKvHjQt2SB2vw==
X-ME-Sender: <xms:37i6aCPQbHtAd_NZYwcjeeFcMiwJ1FdcfxuSw05eU2065amo8nsKYg>
    <xme:37i6aCgNn1O_xGw5MrVVlPKPg2Ei-6kKxsMckQfspZimIfBP4yVLfKB5e-HEFnMbX
    Qhr2DL_ur70tV7a6FY>
X-ME-Received: <xmr:37i6aPlwNsm2-xVg4BSnDnCdyHvc3IPUCrIPqCpx4_p4Ulh0L4Y-wSvPfBDQe0rRjo7zHK7VAN8X_eNYrevNLq0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggdekieefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceurghi
    lhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurh
    ephfffufggtgfgkffvvefosehtjeertdertdejnecuhfhrohhmpefrrghulhcuuegrrhhk
    vghruceophgruhhlsehpsggrrhhkvghrrdguvghvqeenucggtffrrghtthgvrhhnpeejle
    etfeelteekudeufeetffegledtgeeugfevteetkeevteeikedtffettdekhfenucevlhhu
    shhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehprghulhesphgsrg
    hrkhgvrhdruggvvhdpnhgspghrtghpthhtohepledpmhhouggvpehsmhhtphhouhhtpdhr
    tghpthhtoheplhhlvhhmsehlihhsthhsrdhlihhnuhigrdguvghvpdhrtghpthhtohepjh
    hushhtihhnshhtihhtthesghhoohhglhgvrdgtohhmpdhrtghpthhtohepphgruhhlsehp
    sggrrhhkvghrrdguvghvpdhrtghpthhtohepnhgrthhhrghnsehkvghrnhgvlhdrohhrgh
    dprhgtphhtthhopehmohhrsghosehgohhoghhlvgdrtghomhdprhgtphhtthhopehnihgt
    ohhlrghsrdhstghhihgvrheslhhinhhugidruggvvhdprhgtphhtthhopehlihhnuhigqd
    hkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehnihgtkhdr
    uggvshgruhhlnhhivghrshdolhhkmhhlsehgmhgrihhlrdgtohhmpdhrtghpthhtoheplh
    hinhhugidqkhgsuhhilhgusehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:37i6aOgI4BwHDgoyU4ZoOzEcERPU17sFAJl-DN8hEkEziHxTgklRAw>
    <xmx:37i6aCE8uSkg31lp3z1JNNxfindbHNSDCfQ0LyboUkBaloNGnf8QIw>
    <xmx:37i6aAsYbphyOEA_eRFttDbqQTH2EeN8i0lDC9vvO637nA7uw2Jgug>
    <xmx:37i6aDeWoF0uyM7FeKN71UiFVB_AukmFq6jzAfFpDum-Kj0geek2rw>
    <xmx:4Li6aBpgbdrOO-kQ7FtOsHVJoYEaOZqfzJ7noQkI6VYiGTWP2_pO-PUN>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 5 Sep 2025 06:18:06 -0400 (EDT)
From: Paul Barker <paul@pbarker.dev>
Date: Fri, 05 Sep 2025 11:17:43 +0100
Subject: [PATCH] gen_compile_commands: Look in KBUILD_OUTPUT if set
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250905-gen_compile_commands-v1-1-9f5194542d4d@pbarker.dev>
X-B4-Tracking: v=1; b=H4sIAMa4umgC/x2MQQqAIBAAvyJ7TjDDg30lIkw3W0gLhQjEv2edh
 jnMFMiYCDOMrEDCmzKdsUnfMbC7iR45ueYghVRCC8U9xsWe4aIDPwYTXearGJy2Wg4bKmjplXC
 j599Oc60vnpqhFGYAAAA=
X-Change-ID: 20250905-gen_compile_commands-b03d9c923fe5
To: Nathan Chancellor <nathan@kernel.org>, 
 Nicolas Schier <nicolas.schier@linux.dev>, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>
Cc: llvm@lists.linux.dev, linux-kbuild@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Paul Barker <paul@pbarker.dev>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1484; i=paul@pbarker.dev;
 h=from:subject:message-id; bh=emHvs8PChoJnp11U7/UKLC2zPZlEDVXcKjnn+49ixOk=;
 b=owGbwMvMwCW2OjnkzdxdX/IYT6slMWTs2nFv2aYyPRcBj3NGZyoOf0tKueBwyHfdRY41nhPOO
 r0wfCBp3lHKwiDGxSArpsiyuefr/ae9jrwZIbcUYOawMoEMYeDiFICJ2P1h+CvePTMqI3lX8DNP
 o0lXC77mrbffU32l4fE3U86v9jkbnr5k+Kd8i5lvI8eJXyutuk0i/P58Sth3/bZsVtPbT9szyxO
 sMxgB
X-Developer-Key: i=paul@pbarker.dev; a=openpgp;
 fpr=98B2AAC100AC3F82BB5D546774975C81B7E66BAC

If someone is already using the KBUILD_OUTPUT environment variable to
specify the directory where object files are placed, they shouldn't need
to repeat the same information to gen_compile_commands.py.

Signed-off-by: Paul Barker <paul@pbarker.dev>
---
 scripts/clang-tools/gen_compile_commands.py | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/scripts/clang-tools/gen_compile_commands.py b/scripts/clang-tools/gen_compile_commands.py
index 96e6e46ad1a702cb0fad5d524a9a02d222b236ec..7b94a2ffba0b4d5f1290b51bd602fb3f33acce6a 100755
--- a/scripts/clang-tools/gen_compile_commands.py
+++ b/scripts/clang-tools/gen_compile_commands.py
@@ -39,8 +39,9 @@ def parse_arguments():
     parser = argparse.ArgumentParser(description=usage)
 
     directory_help = ('specify the output directory used for the kernel build '
-                      '(defaults to the working directory)')
-    parser.add_argument('-d', '--directory', type=str, default='.',
+                      '(defaults to $KBUILD_OUTPUT (if set) or the working directory)')
+    parser.add_argument('-d', '--directory', type=str,
+                        default=os.environ.get('KBUILD_OUTPUT', '.'),
                         help=directory_help)
 
     output_help = ('path to the output command database (defaults to ' +

---
base-commit: d69eb204c255c35abd9e8cb621484e8074c75eaa
change-id: 20250905-gen_compile_commands-b03d9c923fe5

Best regards,
-- 
Paul Barker


