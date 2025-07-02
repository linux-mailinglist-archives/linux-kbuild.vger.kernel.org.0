Return-Path: <linux-kbuild+bounces-7849-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DA718AF64C0
	for <lists+linux-kbuild@lfdr.de>; Thu,  3 Jul 2025 00:03:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 391B21C41E43
	for <lists+linux-kbuild@lfdr.de>; Wed,  2 Jul 2025 22:03:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F140723497B;
	Wed,  2 Jul 2025 22:03:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="XtoQgSV1"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAA8D23ABB2;
	Wed,  2 Jul 2025 22:03:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751493784; cv=none; b=FrclYYiQZNrt6/2U644vOAK6gEMQCp7OX2FlByWPqJHQOd/C9v+ZWdK4V76qJKqMJLIGff2tVMEJHyrmJs1r5X253jFVv9TvQbh1DTtk2Gw6vyuwdXQ9kDYQIX7ZXlHEDl5PPTfyygdrKRDTfEmqa1OX7V3W/R9xlLeM3+KbrP4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751493784; c=relaxed/simple;
	bh=x7HupsqVs1LEjBDNAVRHFYN4PZfHHIoeYWbXcaftJ8Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mfLpg7I0f/kTgJL87mFRXQOswYk18WvAZye0b5h5DibokmDi3+12WisIYF7m4t/MIbhiVwtLht7v+2sAMQjP8+k5U6Mc4vzVpZlYU1zpykPhnWsspKO+tUjz7UKk4sXdndlEYNIvTI3n+Wvze/yYAtNao0IgSGHuYhlh+iuWYXs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=XtoQgSV1; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=cUNAuvI3kzAcweaN1llgP41f7lMAeSiXPWgf5Wf7q+E=; b=XtoQgSV1Mvi9QeeI1aiYIHCm7F
	gTVLqUIrrx/x1t5ItB7K1+b6bwFeuAPfiNANYvPr4jp84+lDdd+JWUgF7S2BKSA5cROwVhz3ddhvp
	lAD0sSKzYdyD2o4NUolNcysUlfWT74twfM3Z354ToQmePp9FxJBg/c4S3MJ/f7lJfYmwMtCjUjAv4
	kn6Be8Flc2w60BVChfMX7U5Po6CEmxyIokt9hr9OhlfLGSNSPeEns53+VWYawEtPGx2K9Fgc/+eXU
	yz6HksLg1DZ4otJrQhgI9XAknC9mU5y0DGI/6AFRZojOAO35CvMio3HPU/dXE2kajjOq8/JmtGHPW
	U4qGaN2w==;
Received: from [50.53.25.54] (helo=[192.168.254.17])
	by desiato.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uX5Xg-00000007Zcd-1pZ7;
	Wed, 02 Jul 2025 22:03:00 +0000
Message-ID: <46b059f4-2f93-44e0-9a7b-78acb2c02719@infradead.org>
Date: Wed, 2 Jul 2025 15:02:58 -0700
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/66] kconfig: set MENU_CHANGED to choice when the
 selected member is changed
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250624150645.1107002-1-masahiroy@kernel.org>
 <20250624150645.1107002-2-masahiroy@kernel.org>
 <85d530f3-0c27-48e0-b09b-470c16e08004@infradead.org>
 <CAK7LNASsM-1Gsw85=G3KU7x6hBAmBSn4vSHcMdoEVaaFymVeyw@mail.gmail.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <CAK7LNASsM-1Gsw85=G3KU7x6hBAmBSn4vSHcMdoEVaaFymVeyw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 7/2/25 6:23 AM, Masahiro Yamada wrote:
> On Mon, Jun 30, 2025 at 3:34 PM Randy Dunlap <rdunlap@infradead.org> wrote:
>>
>>
>>
>> On 6/24/25 8:04 AM, Masahiro Yamada wrote:
>>> In gconf, choice entries display the selected symbol in the 'Value'
>>> column, but it is not updated when the selected symbol is changed.
>>>
>>> Set the MENU_CHANGED flag, so it is updated.
>>>
>>> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
>>
>> Probably not related to this change (AFAICT), but I was trying to
>> reproduce this problem and I cannot do it.
> 
> You can try this simple test code.
> 
> choice
>         prompt "choose"
> 
> config A
>         bool "A"
> 
> config B
>         bool "B"
> 
> endchoice
> 
> In Full mode, open the tree and double-clock the two
> radio buttons alternatively. (select A or B back-and-forth)
> In the main line code, the Value column of "choose" remains "B".
> 
> After this commit, it starts to react to the change, but the fix is not perfect.
> 
> In the gconfig-v3 branch, this should work perfectly.
> 

OK, confirmed in gconfig-v2 branch.

Tested-by: Randy Dunlap <rdunlap@infradead.org>


One other thing:  if I Quit in today's linux-next (probably similar
to mainline), if the .config file has changed, the Warning box
choices (Yes, No, Cancel) have their first letters underlined and
the Cancel block (just the rectangle itself) is bold, more distinct
than the others, so it must be the default if Enter is pressed.

In the gconfig-v2 branch, the Warning block choices are neither
underlined in their first letter (for us keyboard users) nor is
any one of them Bold (default).  It is a much better UX in the
linux-next/mainline than gconfig-v2.

Is this a change from GTK2 to GTK3?  Unintended?  Fixable?

thanks.

-- 
~Randy

