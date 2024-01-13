Return-Path: <linux-kbuild+bounces-536-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4722482C838
	for <lists+linux-kbuild@lfdr.de>; Sat, 13 Jan 2024 01:12:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6D1AD1C2190B
	for <lists+linux-kbuild@lfdr.de>; Sat, 13 Jan 2024 00:12:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A6CF364;
	Sat, 13 Jan 2024 00:12:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=envs.net header.i=@envs.net header.b="ccJWUwn0"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail.envs.net (mail.envs.net [5.199.136.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A664195
	for <linux-kbuild@vger.kernel.org>; Sat, 13 Jan 2024 00:12:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=envs.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=envs.net
Received: from localhost (mail.envs.net [127.0.0.1])
	by mail.envs.net (Postfix) with ESMTP id 44E7A38A05A9;
	Sat, 13 Jan 2024 00:12:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=envs.net; s=modoboa;
	t=1705104720; bh=VeMldIr1QD5fR2+fHgbqjpu8x0dDE60iRWuEo9YOblc=;
	h=From:To:Cc:Subject:Date:From;
	b=ccJWUwn0PjpBkhqSzrmfTjDt59XDf+j3wQKGzoLSiMTBzXX8Dh5XmFqY/VfsCOkjI
	 NbVSfp7rlic6P2LqS51/fW3oK9i+gSiDjKKOPKTl3AVtIrsozfXYU2gNe8UA61FJnh
	 sGf88n0EalPZKnSZ88cyPR2ecIdRQY7iz0KV9McB/7k5h11c2aEt2hHZ2ziRtlUNLz
	 2RDI+ktQvILrOK/g016YL2xttaujMigav1Y7oUee9DOb3HZlgmX9iM4DmPpm4mP+lI
	 sz+DbvTKNVdy8pkFi4aEoUMaSyA7IjWdSJas9GEd6fX1jZAaPvGWHZ7ae04fj4H0Ly
	 LLZ2ICRDKo6SdUFI40/vbtmqmw7lWfH4bvYy2NKNdAzW64OWH+AytXK2jPUkT83JKf
	 C+TKuftaPR5SgwUesWyALXiOkb0nBJm2IdarjP+g2cyr1f91WuWPv4NmJOM7YZXO1l
	 HS34xFIiq0MWRpUtvreYbEMpql3fIosFx6JwTbFtwnseVW6Vz7D66A0RbVH8QY3XeH
	 RSCdE0djX3oesiyABVeHYE8oeMdhv8cVtqHhE/qA8Ny5uSAWFOgvFCHh/9bpQ1ElZC
	 d9zOA1y4fM/smRPhnW03u+K9vU+wf18QsAY3F9Am6/GkQTdWdzTxSeYwZE5EaggnwC
	 +kkKz9AUrhse50dhl2hs38fY=
X-Virus-Scanned: Debian amavisd-new at mail.envs.net
Received: from mail.envs.net ([127.0.0.1])
	by localhost (mail.envs.net [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id LNpO4MzNEzwY; Sat, 13 Jan 2024 00:11:58 +0000 (UTC)
Received: from xtexx.eu.org (unknown [120.230.214.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.envs.net (Postfix) with ESMTPSA;
	Sat, 13 Jan 2024 00:11:58 +0000 (UTC)
From: Zhang Bingwu <xtex@envs.net>
To: linux-kbuild@vger.kernel.org
Cc: Zhang Bingwu <xtexchooser@duck.com>
Subject: [PATCH 0/1] kbuild: find kernel/configs for fragments in fragment merging
Date: Sat, 13 Jan 2024 08:11:34 +0800
Message-ID: <20240113001135.7781-1-xtex@envs.net>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Zhang Bingwu <xtexchooser@duck.com>

Function merge_into_defconfig and merge_into_defconfig_override merge
 a defconfig with several fragments, which should also be searched for
 in kernel/configs/*.config.
When using 'make xxx_defconfig xxx.config' to merge fragments,
 scripts/kconfig/Makefile also searches kernel/configs/*.config
 for fragments.

This patch also switched usages of ARCH to SRCARCH.
For some ARCH values, such as i386 and x86_64, SRCARCH is different
 from ARCH and arch/$(ARCH) does not exist anymore.
If the two functions are used in these ARCHs which has
 a different SRCARCH, kbuild may fail to find fragments.

Zhang Bingwu (1):
  kbuild: find kernel/configs for fragments in fragment merging

 scripts/Makefile.defconf | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

-- 
2.43.0


