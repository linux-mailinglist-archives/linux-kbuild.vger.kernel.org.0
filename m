Return-Path: <linux-kbuild+bounces-8215-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FC73B13157
	for <lists+linux-kbuild@lfdr.de>; Sun, 27 Jul 2025 20:38:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id ED580178C64
	for <lists+linux-kbuild@lfdr.de>; Sun, 27 Jul 2025 18:38:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9838DEEC0;
	Sun, 27 Jul 2025 18:38:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="o9F7tZAW"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39B6521C160;
	Sun, 27 Jul 2025 18:38:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753641512; cv=none; b=NUTZU4Kb1Dxja8E439WSxIr4EB+L3mTuI/EK5efXUF5ETXlSkIW0/OgMToWYvu4zPsklfRG2l3YTdzt8G6yX7ztr2cK2YqG+6Y2mBsx/hbtqsFhnsu5fTwPQfcwQ9VkpNQrgMKGkt+Z8A1EkiFicNjF0fjciIFD/vX5nfb5gEjg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753641512; c=relaxed/simple;
	bh=N5QnCTn2k5dYtc9Y14qjnd5qNXWc4OS/ORJ3KXvybik=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eYaK+WBpSJ1kLtSCtrOnU3UHUihqM073aL6/zHbFgwJfipvqBr/sPyEMjX8TR189WVQnFs9dJAb0BwrofLL1c9MchDwZFRxY1XnZgGW6+bpJGSbpHzBOW9N61pvlbHp+W+7WCzLu/g2bzrQxkOOQVmK9GFAybqnOPIyzb8htAbo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=o9F7tZAW; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=XJTh58MDF29mDV2ZQ00XGzBYEBWVciegKPxWDpLZSPw=; b=o9F7tZAWOCQzLenxbif8UETa7V
	TQFki1SOVjoeNYQbxL+FyZgDb/JpJVU6DvazQQLKtyeXNFjg1ljKf+3m2iC3KdTZAUD7Y/ViX83w2
	xVl1Vow3PXsKh7CqBUOjb906yWTMWRnk3tvn0a4vxabcb2w6n6xM6pXn4I9/fg/+KqSqWCDIFHFVn
	Env3+cjNZ7mbzaG7ckOuwMAXi+88VGwOknv097wJswgBRoBlpFP20J3+pbDQWcd793RJuRkSSkqqW
	t+9dc7hkkvjO2iBx+FBPxD2nYU5SKc/LwTkTnmswwrWjRkuJyB95++XrTQiCxsaK+eB6nRAkVTFaH
	3deAn8Zg==;
Received: from [50.53.25.54] (helo=[192.168.254.17])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ug6GS-0000000D5RC-16mt;
	Sun, 27 Jul 2025 18:38:28 +0000
Message-ID: <249abbe2-0f2a-4e58-b7f2-bb286c0a4f8f@infradead.org>
Date: Sun, 27 Jul 2025 11:38:27 -0700
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] scripts: add kconfig lookup script
To: Masahiro Yamada <masahiroy@kernel.org>, Brian Masney <bmasney@redhat.com>
Cc: linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org
References: <20230801174922.333700-1-bmasney@redhat.com>
 <20230801174922.333700-3-bmasney@redhat.com>
 <CAK7LNAQ-nhy1_xFYiwuvOKvfUVSjvnEb4ZnJ8EMWo7uJun89Zg@mail.gmail.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <CAK7LNAQ-nhy1_xFYiwuvOKvfUVSjvnEb4ZnJ8EMWo7uJun89Zg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,
Sorry about the very late feedback.


On 8/2/23 11:23 PM, Masahiro Yamada wrote:
> On Wed, Aug 2, 2023 at 2:49 AM Brian Masney <bmasney@redhat.com> wrote:
>>
>> Add a script that allows looking up the full Kconfig entry based on
>> the symbol name. Documentation and example usage is found at the top
>> of the script itself.
>>
>> Signed-off-by: Brian Masney <bmasney@redhat.com>
>> ---
>>  scripts/kconfig/lookup.sh | 77 +++++++++++++++++++++++++++++++++++++++
>>  1 file changed, 77 insertions(+)
>>  create mode 100755 scripts/kconfig/lookup.sh
> 
> 
> 
> Everyone tends to have their own utility scripts
> on their machines.
> 
> I think this patch set falls into that category
> as "create a wrapper script of grep" is what everyone
> does to reduce typing.
> 
> 
> 
> 
> FWIW, I have the following scripts in my ~/bin directory.
> 
> 
> 
> $ cat ~/bin/kgrep
> #!/bin/sh
> 
> exec find . -name .repo -prune -o -name .git -prune -o -type f \
> \( -name 'Kconfig*' -o -name 'Config.in' \) \
> -print0 | xargs -0 grep --color -n "$@"
> 

Sometimes I just want to see a symbol's definition. So using
$ kgrep -A8 config.TSL2772
finds only the config|menuconfig definition for the symbol
without printing other mentions of it (in selects or depends on
or help text or comments etc.).

> 
> $ cat ~/bin/mgrep
> #!/bin/sh
> 
> exec find . -name .repo -prune -o -name .git -prune -o -type f \
> \( -name 'Makefile*' -o -name 'Kbuild*' -o -name "*.mk" \) \
> -print0 | xargs -0 grep --color -n "$@"
> 
> 

Using
$ mgrep floppy.o
shows me nothing. It never completes, just hangs (OK, I killed it
after 30 seconds). Any ideas?

Thanks for the tooling.

> 
> 
> masahiro@zoe:~/ref/linux(master)$ kgrep -A5 TSL2772
> ./drivers/iio/light/Kconfig:564:config TSL2772
> ./drivers/iio/light/Kconfig-565- tristate "TAOS TSL/TMD2x71 and
> TSL/TMD2x72 Family of light and proximity sensors"
> ./drivers/iio/light/Kconfig-566- depends on I2C
> ./drivers/iio/light/Kconfig-567- help
> ./drivers/iio/light/Kconfig-568-   Support for: tsl2571, tsl2671,
> tmd2671, tsl2771, tmd2771, tsl2572, tsl2672,
> ./drivers/iio/light/Kconfig-569-   tmd2672, tsl2772, tmd2772 devices.
> 
> masahiro@zoe:~/ref/linux(master)$ mgrep efivarfs.o
> ./fs/efivarfs/Makefile:6:obj-$(CONFIG_EFIVAR_FS) += efivarfs.o
> ./fs/efivarfs/Makefile:8:efivarfs-objs := inode.o file.o super.o vars.o
> 
> 
> 
> That's my local way to satisfy my demand.
> I do not intend to force my way or merge it in the upstream.


-- 
~Randy


