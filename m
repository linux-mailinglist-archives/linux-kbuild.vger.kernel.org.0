Return-Path: <linux-kbuild+bounces-10123-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 96D2ECC56C6
	for <lists+linux-kbuild@lfdr.de>; Wed, 17 Dec 2025 00:04:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 62CA53038985
	for <lists+linux-kbuild@lfdr.de>; Tue, 16 Dec 2025 23:04:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CFB622750E6;
	Tue, 16 Dec 2025 23:04:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="ZLAmhF5k"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5F7E23182D;
	Tue, 16 Dec 2025 23:04:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765926269; cv=none; b=kw/GchsP99XX+BJDX8gVqu+L+MeQFw0PSH8uJJ+33DvQkezR2vDCpjYZX5e/+gFnyN8rAOhhwxuGOSK3FLGvl4s4fhr2vMhzft/8tJfMEzG/WheJ3xvaAKstpcBgkw3agol1SZ6UuXLyNWkYyVBAW90638yjD8pjPfPU+rJdsW4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765926269; c=relaxed/simple;
	bh=XVvkwiBeO0LpEJLgRN9rlShhDNf2+VEW8CLg1utIFbw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EhUGnbg9tGsxNCCohm1FJnFOVgJ4rh/WLqmtJwR31TkiLkvTUEpgMpuTu6ZjSoeQP1N1kXIuatp4mlGke9RBC+DUJDOOIVUS7+Ffcx47NHk545jJTa6xYzoaSKqhj5ds8BdYY/I9qqrzMrKrGh3fD+EIhAoKkjdHrJOTySQGZQE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=ZLAmhF5k; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=IxsIQMZPVOr2OQwYbnGD7xHTcUhCEDoZKq4ymqdT2Ik=; b=ZLAmhF5kyklKKjUL6Yuvcw2HrM
	brU1efvjy21+vIKvDNf6Hr+Yb5PL77waOXrT7QQU/SWprZbVzYs9rzxi7yBJ0FIOaxURE/wMcy1sK
	Yvib4vLioccM9y1PBaA+xPDbYMKDwRifTjq4VpZz/35T8D+7NOw9/hC5P9Qoglc9oNA3Rz/EfuklO
	eABOBVudQ70DqV8at/i705Ng1ThJRtgDOVeAcg88QnP4HqDe9kCD8BdAx+XNqjHP6KHJe/GxKbGac
	zhNLGCWMnaR3Bc8FpOfu8z6+tRwPf46ozsrewSpszqDd3l9YFQ705O1G4rWC8c2Z/ueSLhTE/5s0u
	eCLGSWUQ==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVdhW-00000005uAI-3M0Y;
	Tue, 16 Dec 2025 22:39:26 +0000
Message-ID: <46a5f2d9-b118-4675-8372-40f9b2fc7bbe@infradead.org>
Date: Tue, 16 Dec 2025 14:39:20 -0800
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/1] kconfig: move XPM icons to separate files
To: Rostislav Krasny <rostiprodev@gmail.com>
Cc: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>,
 Masahiro Yamada <masahiroy@kernel.org>, linux-kbuild@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20251213140923.19710-1-rostiprodev@gmail.com>
 <20251213140923.19710-2-rostiprodev@gmail.com>
 <35baccd7-bcb6-4794-9b6e-ce5982bd2342@infradead.org>
 <CAKU3Xk6H0V2W2sEwfWZMrfJ11j5MvbhX34rpos1OfyA=zHoWfA@mail.gmail.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <CAKU3Xk6H0V2W2sEwfWZMrfJ11j5MvbhX34rpos1OfyA=zHoWfA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 12/16/25 12:38 PM, Rostislav Krasny wrote:
> On Tue, 16 Dec 2025 at 09:10, Randy Dunlap <rdunlap@infradead.org> wrote:
>> This worked well for me when I ran 'make gconfig'. However, when I tested
>> 'make xconfig', instead of having icons/symbols for
>>   Back, Open, Save, Single View, Split View, Full View
>> I have words as listed above.
> 
> I've double checked my patch again with the latest master branch of
> Linux and "make xconfig" works properly on my machine.
> Here you can see the screenshot: https://ibb.co/Q2jX9tQ
> 
> I use Fedora 43 with Cinnamon DE. The Qt development package that I
> installed is qt5-qtbase-devel version 5.15.18-1.fc43 plus its
> dependencies.
> What version of Qt do you use? Did "make xconfig" work properly before
> you applied my patch?
> 

Yes, "make xconfig" worked properly before applying this patch.

.qconf.cmd (generated by build) tells me I am using Qt6.
I don't see any build errors/warnings.

qt-core-devel & qt-base-common-devel are v6.10.1-1.2 from
openSUSE Tumbleweed.

> 
> BTW if I install qt6-qtbase-devel (currently version 6.10.1-2.fc43)
> instead of qt5-qtbase-devel it fails on compilation, but this is a
> completely different problem that existed even before my changes. I
> will try to fix it later, it seems like a wrong include path.
> 
> $ make xconfig
>   HOSTCXX scripts/kconfig/qconf.o
> scripts/kconfig/qconf.cc:7:10: fatal error: QAction: No such file or directory
>     7 | #include <QAction>
>       |          ^~~~~~~~~
> compilation terminated.
> make[2]: *** [scripts/Makefile.host:148: scripts/kconfig/qconf.o] Error 1
> make[1]: *** [/home/huligan/develop/linux/Makefile:742: xconfig] Error 2
> make: *** [Makefile:248: __sub-make] Error 2

-- 
~Randy


