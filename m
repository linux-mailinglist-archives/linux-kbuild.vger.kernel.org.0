Return-Path: <linux-kbuild+bounces-1302-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 26C1C8878C5
	for <lists+linux-kbuild@lfdr.de>; Sat, 23 Mar 2024 14:14:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4C6D71C22421
	for <lists+linux-kbuild@lfdr.de>; Sat, 23 Mar 2024 13:14:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 84678C2D0;
	Sat, 23 Mar 2024 13:14:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ravnborg.org header.i=@ravnborg.org header.b="utPdh01r";
	dkim=permerror (0-bit key) header.d=ravnborg.org header.i=@ravnborg.org header.b="NWKf+8vW"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mailrelay4-1.pub.mailoutpod2-cph3.one.com (mailrelay4-1.pub.mailoutpod2-cph3.one.com [46.30.211.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E31A1A38F6
	for <linux-kbuild@vger.kernel.org>; Sat, 23 Mar 2024 13:14:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.30.211.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711199659; cv=none; b=i5QZKMOBKwnCKotmiVo2BF5WLA4J5Rml0cn+6jE0SXhq97bytdJ3uyaiN6UqPZW6O0ePvXoRBKuifWV1rIn6Y7HDYKZnWdDhnk8MGvM/8qpTtm6GVc8WIJRomtCdcNr1FpAj8kh9gD8MvHfDNMmCdTDKiZzTG+XWzhQovE0QGGo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711199659; c=relaxed/simple;
	bh=NcbbxeNod8fLPS/d2MXni+81pzt4HJKLagkT90U01OU=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=X5OYgWljw+DZIsE2c18Ljxa8CL9ck5XueIufj4BfePw1378ak+87Wd5cD0DCTEXVnhc0qnZ7GV1IgWLrfCfE4/dFSUA4NqGzbpYm0xWN0QCF5czNtT6d96Ly2jptSHoJPueCknRacjHG5STogQOctJYKzFWjQXKEk5DAh+bRoN4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ravnborg.org; spf=none smtp.mailfrom=ravnborg.org; dkim=pass (2048-bit key) header.d=ravnborg.org header.i=@ravnborg.org header.b=utPdh01r; dkim=permerror (0-bit key) header.d=ravnborg.org header.i=@ravnborg.org header.b=NWKf+8vW; arc=none smtp.client-ip=46.30.211.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ravnborg.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ravnborg.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ravnborg.org; s=rsa2;
	h=content-type:mime-version:message-id:subject:to:from:date:from;
	bh=4atGdwhCI1juRHZLtaiyx70EQZp1LwaobLuN5lCaaVQ=;
	b=utPdh01rUXDmKO7k7V3kcLnOlWJzMpN0z43XUQlc/aISmg1Rn3CSl4bwwDRmhR75OzMHLJP8rX61i
	 MCqTDbK38n8qOoHvqK9FoIvLQUYV2Vanzw74HCrz4MBEoHnIL8cjT8QxdBaeWhOA9DjMIwvwrC9Res
	 3aeH25KnzK9kel98q4XJ9GqPf0VbB43D6XRwaT5gYxp9ML8zlj71sYYhm1ZRRYI2cA7Nokahcac5l6
	 kNGEFShEzCo4objVKtVRVQUdrPi3ZEW9B1QSZtcUulI61DYW2BWAITToLrDdCv8h0tfO3/G5Enb7M1
	 KcgO1Jzv5viAgL0f3bMFMkxG8QtJEhQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
	d=ravnborg.org; s=ed2;
	h=content-type:mime-version:message-id:subject:to:from:date:from;
	bh=4atGdwhCI1juRHZLtaiyx70EQZp1LwaobLuN5lCaaVQ=;
	b=NWKf+8vWKh6mQzhFm6YaH59cdzWlNuU9gcePN817Atq71cLBERGXW+/NhLTKgqGEOz1PZhABBv6Ce
	 ri1Q/FACw==
X-HalOne-ID: 3a8f858d-e917-11ee-9b5d-31e85a7fa845
Received: from ravnborg.org (2-105-2-98-cable.dk.customer.tdc.net [2.105.2.98])
	by mailrelay4.pub.mailoutpod2-cph3.one.com (Halon) with ESMTPSA
	id 3a8f858d-e917-11ee-9b5d-31e85a7fa845;
	Sat, 23 Mar 2024 13:14:09 +0000 (UTC)
Date: Sat, 23 Mar 2024 14:14:07 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: linux-kbuild@vger.kernel.org
Subject: How to avoid "version generation failed" warning?
Message-ID: <20240323131407.GA897267@ravnborg.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all.

When building sparc32 allmodconfig I see a lot of warnings like these:

WARNING: modpost: EXPORT symbol "empty_zero_page" [vmlinux] version generation failed, symbol will not be versioned.
Is "empty_zero_page" prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: EXPORT symbol "__udelay" [vmlinux] version generation failed, symbol will not be versioned.
Is "__udelay" prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: EXPORT symbol "__ndelay" [vmlinux] version generation failed, symbol will not be versioned.
Is "__ndelay" prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: EXPORT symbol "__ashldi3" [vmlinux] version generation failed, symbol will not be versioned.
Is "__ashldi3" prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: EXPORT symbol "__ashrdi3" [vmlinux] version generation failed, symbol will not be versioned.
Is "__ashrdi3" prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: EXPORT symbol "__lshrdi3" [vmlinux] version generation failed, symbol will not be versioned.
Is "__lshrdi3" prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: "__udelay" [kernel/locking/locktorture.ko] has no CRC!
WARNING: modpost: "__udelay" [kernel/rcu/rcutorture.ko] has no CRC!
WARNING: modpost: "__udelay" [kernel/rcu/rcuscale.ko] has no CRC!
WARNING: modpost: "__udelay" [kernel/rcu/refscale.ko] has no CRC!
WARNING: modpost: "__ndelay" [kernel/rcu/refscale.ko] has no CRC!
WARNING: modpost: "__udelay" [kernel/time/test_udelay.ko] has no CRC!
WARNING: modpost: "__udelay" [kernel/scftorture.ko] has no CRC!
WARNING: modpost: "__ashrdi3" [fs/quota/quota_tree.ko] has no CRC!
WARNING: modpost: "__ashldi3" [fs/ext4/ext4.ko] has no CRC!
...

I already tried to add the prototypes to asm/asm-prototypes.h - but this
did not have any effect.


Module.symvers extract:
0x00000000      empty_zero_page vmlinux EXPORT_SYMBOL
0xf7370f56      system_state    vmlinux EXPORT_SYMBOL
0xbea5ff1e      static_key_initialized  vmlinux EXPORT_SYMBOL_GPL
0xc2e587d1      reset_devices   vmlinux EXPORT_SYMBOL
0xba497f13      loops_per_jiffy vmlinux EXPORT_SYMBOL
0x05cb9b5c      init_uts_ns     vmlinux EXPORT_SYMBOL_GPL
0xa2b7a1de      init_task       vmlinux EXPORT_SYMBOL
0x00000000      __udelay        vmlinux EXPORT_SYMBOL
0x00000000      __ndelay        vmlinux EXPORT_SYMBOL

Any hints what to do to fix these warnings would be appreciated.

My motivation to fix them is to get rid of the noise while doing
allmodconfig builds.

	Sam

