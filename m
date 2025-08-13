Return-Path: <linux-kbuild+bounces-8420-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id C5472B2407A
	for <lists+linux-kbuild@lfdr.de>; Wed, 13 Aug 2025 07:43:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9D73F7ABF97
	for <lists+linux-kbuild@lfdr.de>; Wed, 13 Aug 2025 05:42:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B7F4928EA72;
	Wed, 13 Aug 2025 05:43:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="tSGHcyFT";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="/vU45OAt"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BB5B28C871;
	Wed, 13 Aug 2025 05:43:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755063827; cv=none; b=Aj2p4HICkCLxJ0vMBbm8Y1k+pUUsrkPnq5V2oSc7l7TGQqvoAlZbRVe6t3MoxtkvJO/SZ2hsnomUQ6OcsOXaMTKSCOYOvnT0J99irctn3ZhmoYeEZNocTz1iDr3hpXeJx7Hv9D5yDHwv+GQW/p8NhiyhrWnnRteJr87DmT3wm8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755063827; c=relaxed/simple;
	bh=hbMzjQF4eyFEOywsmKomrgC7qctlZA1xrh73ObWnd6w=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=b6FeB2oEPU7sjVYRA3nQM+NK56JFi5H0oNQ8rhH8LgsIpUFVSXJYikoWHiQ894NmINL3arN7EDRa73lL3U3rfwPvNeBPfvWw8QzJuqz9kO/lUPzbPyrCPxWMtz9wcxTE6cAYotlQIYtfsdOo0vnjfTx+b3C7Gt52H3Ri2YMCj60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=tSGHcyFT; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=/vU45OAt; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1755063824;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=te7JJ3JXptePGuPro3rLWNslKEIg4LKGTk2kekG3xCA=;
	b=tSGHcyFTmh0DFBUfinqNWscx0jSlyOIKd7HRkz/lj64iwQyjLtTYO/97bCYeftxPedOjbv
	ORDf6sT4ykjBUZkp94yMPdIvGZn0hrGxzTRuM8/CYxlmrQrfQTovxjnLYPZeBK4WE1hwPv
	NSkuJJyEQOE4N7YyMVcLI3k6tlJZeRJ03aNNNVVdipCWKJPMMIuysSYwnTjhv6BkaGoZ5E
	MUemQoBjzfTDsY8UwtIxZOeKUtRETCigTqO6Tncfw7QN9PlvgWSVa4RjkdfSy4wP2LrR6N
	vZTZvX51H7T/LiN3OW+0DWLef+AFj3hIDlrUaTxNmnZh5N/uS0Q+bjf1rjtzsg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1755063824;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=te7JJ3JXptePGuPro3rLWNslKEIg4LKGTk2kekG3xCA=;
	b=/vU45OAt4lAefgKAdyygNHawnt8eb7tXsasVr/N97sfcln+wxVbZB1fNxJx8xX8dYLuDPt
	QTbf7S6ZEMNV0aDA==
Subject: [PATCH 0/2] kbuild: userprogs: also inherit byte order and ABI
 from kernel
Date: Wed, 13 Aug 2025 07:43:39 +0200
Message-Id: <20250813-kbuild-userprogs-bits-v1-0-2d9f7f411083@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAwmnGgC/x3MQQ5AMBBA0avIrE3SKiGuIha0gwlppYNIxN01l
 n/x/gNCkUmgzR6IdLFw8Cl0noFdBj8TsksNhSoq1WiD63jy5vBMbo9hFhz5EFTGal27oXSVgmT
 3SBPf/7fr3/cDdcnHcWcAAAA=
X-Change-ID: 20250813-kbuild-userprogs-bits-03c117da4d50
To: Nathan Chancellor <nathan@kernel.org>, 
 Nicolas Schier <nicolas.schier@linux.dev>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Masahiro Yamada <masahiroy@kernel.org>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>, 
 Nicolas Schier <nicolas.schier@linux.dev>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755063823; l=974;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=hbMzjQF4eyFEOywsmKomrgC7qctlZA1xrh73ObWnd6w=;
 b=sliQij5HaAmtchGke6NsFy1oNHJ/SiA0A4czKwUTJbKec2QxgMfZgZO4Bki6mIV2bIsfdmYXI
 Mfs7TdfRYbHALIddN9lMYc/6pkVZ21mS+qJRXGHAWyez5dWg3mv/eE4
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=

Make sure the byte order and ABI of the userprogs matches the one of the
kernel, similar to how the bit size is handled.
Otherwise the userprogs may not be executable.
This happens for example on powerpc little endian, or riscv32.

These patches where originally part of my series "kunit: Introduce UAPI
testing framework" [0], but that isn't going anywhere right now and the
patches are useful on their own.

[0] kunit: Introduce UAPI testing framework

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
Thomas Weißschuh (2):
      kbuild: userprogs: avoid duplication of flags inherited from kernel
      kbuild: userprogs: also inherit byte order and ABI from kernel

 Makefile | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)
---
base-commit: 8f5ae30d69d7543eee0d70083daf4de8fe15d585
change-id: 20250813-kbuild-userprogs-bits-03c117da4d50

Best regards,
-- 
Thomas Weißschuh <thomas.weissschuh@linutronix.de>


