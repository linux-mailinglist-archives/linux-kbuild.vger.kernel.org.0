Return-Path: <linux-kbuild+bounces-8200-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E3EEBB12B7E
	for <lists+linux-kbuild@lfdr.de>; Sat, 26 Jul 2025 18:43:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8A4F84E5D42
	for <lists+linux-kbuild@lfdr.de>; Sat, 26 Jul 2025 16:42:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 416CC1D5AD4;
	Sat, 26 Jul 2025 16:43:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="MZo2JCrn"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97D329460
	for <linux-kbuild@vger.kernel.org>; Sat, 26 Jul 2025 16:43:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753548204; cv=none; b=UATGGIqkqxQOpl+ZsJxG/MKrqajlOoH8ql1Agmk2CQSk484LwiJTNG95QTZKdQK7Pep/53mq+4MLe0ruRMcez6OXmaA9flYPqoU3aRw69/iWQdAugcEHCRlE7HV51L3X03sGzxm0rRIae/w5sdDYpn6uEk3s82h5Dv4xHSqw7kQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753548204; c=relaxed/simple;
	bh=erw/HtwA9bLZMX4CmhB5LAZkYxiXK5yPjOx3cxb54o8=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=OJjxEpnoZXCq/fO59Ruv4h1ZYYtePwO5rCToX6dUVi011O6gMntaP9QZyMKmPJ3yHXbS27Qf05seH2enjuMvMcceJ9K4VgGJsmGuuJTrFsWgG0PbdBJA1uY5iFHGpvegEQ7tRTIPdd36x7es41OWeAJd1nBf0bURpjr0/j0ck9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=MZo2JCrn; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:Subject:From:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=q/EXhuLjFxqtl/Ms32bSa0T0RDcXHRXeIrb9kZcR8jc=; b=MZo2JCrnyn7oivpxI+ufpmd6M6
	a/968iWYw/eXVItLpHxwsrXC1JxvxVqzBvl658AHBBifglhmdQpNEppTHl98BSiJBmfKOSzwlgrKV
	d86WQdDtB3KaNvDIEjC+26L34udwZPDD8dIB1BodrnIIz0drDnW/VetDGrII7CflvDyEZuImDjp+8
	HJd4wX3dtCD1017W+B4yLneUuckcxP/NUIMLNsv2Q5Nc7Vi50Zo3WJcXwvA44BUDrL3NClvgdtFGj
	Dw0gVzfy7fO0vB25aQ7Xx1RG46m0lLUVHDJsXqulI2jQvUFG+gwExmetRBu2/JgXlFPH/IXVLMzty
	AVVt5X9g==;
Received: from [50.53.25.54] (helo=[192.168.254.17])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufhzW-0000000Bf8C-0X7N;
	Sat, 26 Jul 2025 16:43:22 +0000
Message-ID: <90b3dbc2-3a68-400f-a779-539f888ed4c2@infradead.org>
Date: Sat, 26 Jul 2025 09:43:21 -0700
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: xconfig problem with 'comment'
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
References: <211effdc-774b-4c59-9643-c43b058350cc@infradead.org>
 <CAK7LNAQOejmh+mrfV7eMEZVjdZu-qWyB_jy9btTzPu2=mTeTfA@mail.gmail.com>
Content-Language: en-US
In-Reply-To: <CAK7LNAQOejmh+mrfV7eMEZVjdZu-qWyB_jy9btTzPu2=mTeTfA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

On 7/26/25 2:56 AM, Masahiro Yamada wrote:
> On Fri, Jul 25, 2025 at 9:59 AM Randy Dunlap <rdunlap@infradead.org> wrote:
>>
>> Hi,
>>
>> to recreate:
>>
>>         make O=bld alldefconfig
>>         # enable CONFIG_NET, CONFIG_WIRELESS, CONFIG_RFKILL, CONFIG_CFG80211
>>         # with any kconfig tool or $EDITOR
>>         make O=bld xconfig &
>>
>>
>> I get both the prompt for MAC80211 (depends on CFG80211)
>> and the comment: "CFG80211 needs to be enabled for MAC80211"
>>         depends on CFG80211=n
>>
>> Other config tools (menu/n/gconfig) don't have this problem.
> 
> Perhaps, did you choose
>    "Option" -> "Show All Options"
> ?
> 
> This option shows all options and comments,
> including hidden ones.
> 
> 
> 
> Please try
>   "Option" -> "Show Normal Options"
> 
> This will show only active options.

Yes, "Show Normal Options" removes the comment.

I guess it bothers me that (a) xconfig seems to remember the
"Show ___ Options" settings from a previous invocation (where I had
indeed used "Show Prompt Options")
but (b) the "Option" menu does not indicate any of those
"Show ___ Options" as being set. ISTM that if it is going to use
an option setting from a previous invocation that it should also
let the user know about that Show/Options setting.


Ah, I see. In ~/.config/kernel.org/qconf.conf:
Show Normal Options is
qconf\config\optionMode=0

Show All Options is
qconf\config\optionMode=1

Show Prompt Options is
qconf\config\optionMode=2


>>
>> I'm testing on linux-next 20250724 but I don't think this is a
>> recent change.

Thanks for looking. Sorry for the noise.

-- 
~Randy


