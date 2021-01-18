Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E87F22FA67F
	for <lists+linux-kbuild@lfdr.de>; Mon, 18 Jan 2021 17:43:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405830AbhARP4c (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 18 Jan 2021 10:56:32 -0500
Received: from mail.kernel.org ([198.145.29.99]:57152 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2405809AbhARPcW (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 18 Jan 2021 10:32:22 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id E32CC22285;
        Mon, 18 Jan 2021 15:31:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1610983897;
        bh=EeJ+3Jco+lNKpr9hXwjA6rDdhWpj9jUW25+zaQVf7+I=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=kKV0t6kteF/opVxelGpcl1v/ZaY3GHnF2PzmRP0LQ9Y7K0LIy14BHgvhg9pLfTbNx
         beqYvvrBU7yci2IpSpddUzGAeU9qrZfn5EfyqEHK0b08NXA3K6BB95YsJ0OHn9uehw
         A1eX0rejxG/yPfldnPjSRQ8S4GeBmWzQy7zNgL+a5UoVQ4eYdy/Sb+C6p2KyrzZthp
         dIB8AVTvlXKriKQPw+/Bh/eKKYuLtdwvgNCpWq2zb7UlAC8jCUnKWtm8Sg/SHFq2Fo
         U4Rez8JYJuBfbeMy2C2/WdZw/WOT4+d73Gr5LC8rm52rq+xmKsB0KGofwea+YvjO34
         Gw2xZVh2F6llQ==
Date:   Mon, 18 Jan 2021 10:31:35 -0500
From:   Sasha Levin <sashal@kernel.org>
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     masahiroy@kernel.org, michal.lkml@markovi.net,
        torvalds@linux-foundation.org, linux-kbuild@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@kernel.org
Subject: Re: [PATCH] kbuild: give SUBLEVEL more room in KERNEL_VERSION
Message-ID: <20210118153135.GA4035784@sasha-vm>
References: <20210118014951.250815-1-sashal@kernel.org>
 <YAVTDETPaJuaRPfc@kroah.com>
 <YAVT0XV7uX2NpIRe@kroah.com>
 <20210118133959.GZ4035784@sasha-vm>
 <YAWSgjWHCcJt6m0j@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <YAWSgjWHCcJt6m0j@kroah.com>
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Mon, Jan 18, 2021 at 02:52:02PM +0100, Greg KH wrote:
>On Mon, Jan 18, 2021 at 08:39:59AM -0500, Sasha Levin wrote:
>> I think it would also affect code that doesn't do things based on
>> SBULEVEL. Consider something like:
>>
>> 	if (LINUX_VERSION_CODE < KERNEL_VERSION(4,5,0))
>>
>> Which will cause 4.4.256 to now change the result of that comparison.
>
>Sure, but there are no in-kernel users like this, so my sympathy is
>quite low :)

Wouldn't it be an issue for the hacky in-kernel users too? For example,
right now the USB code does:

	#define KERNEL_REL      bin2bcd(((LINUX_VERSION_CODE >> 16) & 0x0ff))
	#define KERNEL_VER      bin2bcd(((LINUX_VERSION_CODE >> 8) & 0x0ff))

After 4.4.256, KERNEL_VER will be (5) rather than (4), indicating a
version of 4.5.

-- 
Thanks,
Sasha
