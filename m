Return-Path: <linux-kbuild+bounces-4855-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 05D1A9D8B56
	for <lists+linux-kbuild@lfdr.de>; Mon, 25 Nov 2024 18:32:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 974B1B292CF
	for <lists+linux-kbuild@lfdr.de>; Mon, 25 Nov 2024 17:18:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3AD11192D6C;
	Mon, 25 Nov 2024 17:18:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cold-front.org header.i=@cold-front.org header.b="hXmvcHSN";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="e8YLa30K"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from fhigh-b1-smtp.messagingengine.com (fhigh-b1-smtp.messagingengine.com [202.12.124.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6949D191F91
	for <linux-kbuild@vger.kernel.org>; Mon, 25 Nov 2024 17:18:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732555098; cv=none; b=rM6Vn1uZK6z2ZDXVLqzABrBkcejGSf6Mn4HRB2DKw8uKyD5LyDo45Ieit03hd3hmarlkwEnDf/gEO6m4Gr/VqAofz7umippPdM5Lt6Y6lweLWVltHwEdD2Wq3xEfzoka7RP+xYRj1CFXKGX6MgZvOXu1KkzqJsWUZ0OaPJVBGGE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732555098; c=relaxed/simple;
	bh=xU5Q/S80eZg6fe5jVAqC4hxrxb+qrhyPlh0hwPDLMhI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=uDikvck5R0qG8JVRo6EWZmUjLi0u2Mybswyow23tK8IFChZEEDRiILWsIbXO72eUQMHfJ98GJ1V08OXll7oLGwagdxOedr894/mXAJI95zTqwSufldMG6MIxm27DTl9URN0lDy1lkA9yK+Gw7XYZwhlP5Gnh3Znsivo5Hu5eSUk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cold-front.org; spf=pass smtp.mailfrom=cold-front.org; dkim=pass (2048-bit key) header.d=cold-front.org header.i=@cold-front.org header.b=hXmvcHSN; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=e8YLa30K; arc=none smtp.client-ip=202.12.124.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cold-front.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cold-front.org
Received: from phl-compute-04.internal (phl-compute-04.phl.internal [10.202.2.44])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 8400125400CE;
	Mon, 25 Nov 2024 12:18:13 -0500 (EST)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-04.internal (MEProxy); Mon, 25 Nov 2024 12:18:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cold-front.org;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to; s=fm2; t=1732555093; x=1732641493; bh=rwJLdPFi0X
	iiQWcBWzsyk/2c0O0lQ21HDieMea7/vgQ=; b=hXmvcHSN5AEd/R4qblwdhBpp5e
	FtOtzyGv0SDiRBOBlHA84sLLExkdmfkfYMqfpmP8WHpVgwGdyP9L8SWUDnia95Fo
	aIFpmxmFQrMi1+RhxlUOhM/bKMC1dr3LCWH81V7jW7AOripDiPj+GIRl1rpQpxqM
	d0g+uEBhM052Oh1sFQRjhjYX8b06Pz6feKJHpDQQJG6nRH66dA1ksHwba8afFMHd
	9LZvrLzY1m8V3P6ReSS48T7QoAQ1aISZcXQtlcUYrggTPtKcRgTYGtpC3hjcjG/9
	xdGA9MCy4MtkWW8aBmNybZ8AIgijn6xgpuuYtDXv5AhzbaVoiuUIJNr87ZZw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1732555093; x=1732641493; bh=rwJLdPFi0XiiQWcBWzsyk/2c0O0lQ21HDie
	Mea7/vgQ=; b=e8YLa30K9gkOtzRlGqMfIzkojcx3qxJBxvXHT02id63K+RzhtFi
	Vnx9AU4en4k87zMdt5zbCY1SNcoNN6pkrNXztd7Rk4F7a2ubAoQLzp76ZBZJ1Kkf
	O9pVs+fhxdNLBJbYr32W1RWoYRdYxe9uS1rQvH7ifgumzeaTKmbWYxHWYGaq+skh
	KQXgPzmoGLbX1EvPnBXqgXbohYC/Jzk4/NhjovqywzTply6nF8HApTCeJkt4Xfvg
	5R18RMrBKU3Fh7r4HeGFaQnownLJNhUZbLeQqRQGggRigKTpV+378lHbO6o9OmRf
	VJOsrtjtR32IUZd90YgGUcUmHsvmoZSpgcQ==
X-ME-Sender: <xms:VbFEZ7aXLhJOLu6p33KYfy78856O2mkXbZbcZ2oljiMq9P-S7BWwbw>
    <xme:VbFEZ6Y44pESarXznXhc1J0ygVMW6AN0G3QmHyPwZ_vUIsi9E1x4LCP9Tdb60_Eei
    BvHxlfnBg3ABCesJQ>
X-ME-Received: <xmr:VbFEZ9-an4CwnW6q4yowi9d-BazH7TRqj4zBRjmgXyELF4V1W5Vwz2Mc0YAwxJaX4NaJqApp3uWbOC9zPyOqbRM1t4-JmoGmRexrNtDxMg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrgeehgdeliecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdpuffr
    tefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecunecujfgurhephffvvefuff
    fkofgggfestdekredtredttdenucfhrhhomheplfhushhtihhnuceurhhonhguvghruceo
    jhhssghrohhnuggvrhestgholhguqdhfrhhonhhtrdhorhhgqeenucggtffrrghtthgvrh
    hnpeffudfgffefuedvuddttdfgfeehgfeikeffudfhgfehieefteefgedvieehvdegvden
    ucffohhmrghinhepghhithhhuhgsrdgtohhmnecuvehluhhsthgvrhfuihiivgeptdenuc
    frrghrrghmpehmrghilhhfrhhomhepjhhssghrohhnuggvrhestgholhguqdhfrhhonhht
    rdhorhhgpdhnsggprhgtphhtthhopedvpdhmohguvgepshhmthhpohhuthdprhgtphhtth
    hopehlihhnuhigqdhksghuihhlugesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphht
    thhopehjshgsrhhonhguvghrsegtohhlugdqfhhrohhnthdrohhrgh
X-ME-Proxy: <xmx:VbFEZxq3kJWiFT5majG0o1nMKso5JNM9dstgg-CTB3ynoyDmo7Disg>
    <xmx:VbFEZ2oWW0cOCGjVdNiqdZj1RDzkp2FF3D3Ta0IHwIKuWIkj60dU8w>
    <xmx:VbFEZ3Rjik5xs9pfC3uMkjAUdB3PSwGceizcisiGDppP8RC7WqDCAQ>
    <xmx:VbFEZ-oh1H-7fzxQiZoz7MMmDNzLnWSBtHC45CEq-msN9BL7LK3exQ>
    <xmx:VbFEZ93GxpWKmZOEgUeYQsi9qLz-mK7ool_yAutG07etiJ0iAyiHwg3s>
Feedback-ID: iea0042cb:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 25 Nov 2024 12:18:12 -0500 (EST)
From: Justin Bronder <jsbronder@cold-front.org>
To: linux-kbuild@vger.kernel.org
Cc: Justin Bronder <jsbronder@cold-front.org>
Subject: [PATCH] kbuild: use lz4 instead of lz4c
Date: Mon, 25 Nov 2024 12:18:00 -0500
Message-ID: <20241125171800.1131761-1-jsbronder@cold-front.org>
X-Mailer: git-send-email 2.47.0
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

lz4c has been considered deprecated by upstream since at least 2018 [1]
and has been disabled by default recently [2].  openSUSE Tumbleweed is
no longer packaging the deprecated version and others will likely
follow.

Going back as far as Ubuntu 16.04/Fedora 25, both lz4 and lz4c are
installed as part of the same package and both accept -9 to enable high
compression so switching should be safe.

1. https://github.com/lz4/lz4/pull/553
2. https://github.com/lz4/lz4/pull/1479

Signed-off-by: Justin Bronder <jsbronder@cold-front.org>
---
 Makefile             | 2 +-
 scripts/Makefile.lib | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/Makefile b/Makefile
index 68a8faff2543..ded07aca0d2a 100644
--- a/Makefile
+++ b/Makefile
@@ -508,7 +508,7 @@ KGZIP		= gzip
 KBZIP2		= bzip2
 KLZOP		= lzop
 LZMA		= lzma
-LZ4		= lz4c
+LZ4		= lz4
 XZ		= xz
 ZSTD		= zstd
 
diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
index 01a9f567d5af..b73950bfee34 100644
--- a/scripts/Makefile.lib
+++ b/scripts/Makefile.lib
@@ -371,10 +371,10 @@ quiet_cmd_lzo_with_size = LZO     $@
       cmd_lzo_with_size = { cat $(real-prereqs) | $(KLZOP) -9; $(size_append); } > $@
 
 quiet_cmd_lz4 = LZ4     $@
-      cmd_lz4 = cat $(real-prereqs) | $(LZ4) -l -c1 stdin stdout > $@
+      cmd_lz4 = cat $(real-prereqs) | $(LZ4) -l -9 stdin stdout > $@
 
 quiet_cmd_lz4_with_size = LZ4     $@
-      cmd_lz4_with_size = { cat $(real-prereqs) | $(LZ4) -l -c1 stdin stdout; \
+      cmd_lz4_with_size = { cat $(real-prereqs) | $(LZ4) -l -9 stdin stdout; \
                   $(size_append); } > $@
 
 # U-Boot mkimage
-- 
2.47.0


