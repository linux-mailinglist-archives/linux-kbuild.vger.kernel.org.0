Return-Path: <linux-kbuild+bounces-7803-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 19B96AEEB02
	for <lists+linux-kbuild@lfdr.de>; Tue,  1 Jul 2025 01:43:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3750F440691
	for <lists+linux-kbuild@lfdr.de>; Mon, 30 Jun 2025 23:43:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A3A732586EB;
	Mon, 30 Jun 2025 23:43:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="TJtqDsDT"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A25D64A23;
	Mon, 30 Jun 2025 23:43:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751327019; cv=none; b=lykX7CmYps0kciTtJKm/sCYaj3B2EqVjahCBl2mlL0lj0ezqCjuokE5+qaBHu134JeYMAriB4LajgKpE9sS3SCMZlwK2uNjskXvspJdDMZoJk43Qn97/prXiznTBa1ykOuGGuYTbTMEfKetz2LVA4xM0SGvDkY+RVD6Yq5A/070=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751327019; c=relaxed/simple;
	bh=aco2DdN75H51T0MMThpwMbD8vBYv7H1OQdM3HV4fHBk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kLeD4kvtbmp+xj5R9OQwchlu/Haf/uKWoWmcH58vxJnh+nUWOgUpq50arcNmqP+8Xn6vT6E/wXuC73AP0PH5qvVxuAZRmecooMLN/bQ62hw2IATAHoanW+bj8jsHeQVQcR67OZctlEsz4ZarPvFbXYRhTU5pok4DfqfdeFCnQ8Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=TJtqDsDT; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=u10gs0DubzdW/5hXp3hBwVPoHLZPvTUQwaeUKc7D4sA=; b=TJtqDsDTRLpuqtCZVqr/vfiYab
	NA1zi2pD9/cL3K0SEezkz4hlYRj5FQVGujdaR8xP2jl8JR7EqpWju6Mj8Hq7YCaInXSLlB1rzRrUB
	Z2GfJYEl7M6r7CSyZIO18fz/NKlWG1DzAJwkE2owz/RZsaFUxJtlqssXCVV67o3mVTVCJkqyCkhqk
	Rk8whJ1GmFZ3a8BlQuONonviC0ujJehTV0E1dqu4x1KH2JjIsTpuLxLDYRE6MulTpC3L7oi+uWj12
	zWdah7aWyfsI++hhE4NkGm+kshQyvkdhP7QdrTQh0bf/xObKF83VNGtLq4P+hGPfBLHRssctht7Dm
	rG+ADK+w==;
Received: from [50.53.25.54] (helo=[192.168.254.17])
	by desiato.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWO9t-00000006uCf-0J7F;
	Mon, 30 Jun 2025 23:43:33 +0000
Message-ID: <52563c74-9644-4616-ab95-f899f1c881f5@infradead.org>
Date: Mon, 30 Jun 2025 16:43:31 -0700
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/66] kconfig: improve xconfig and gconfig
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250624150645.1107002-1-masahiroy@kernel.org>
 <cb9bd1e4-9424-4ed2-bdfa-49c883c60a66@infradead.org>
 <CAK7LNARnYi7-aL1NYj3s5udeBMjNEurHx0cDwbU14Uks6FXa9Q@mail.gmail.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <CAK7LNARnYi7-aL1NYj3s5udeBMjNEurHx0cDwbU14Uks6FXa9Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 6/30/25 8:48 AM, Masahiro Yamada wrote:
> On Mon, Jun 30, 2025 at 3:55 PM Randy Dunlap <rdunlap@infradead.org> wrote:
>>
>>
>>
>> On 6/24/25 8:04 AM, Masahiro Yamada wrote:
>>> [xconfig]
>>>
>>>  - small improvement for choice
>>>
>>> [gconfig]
>>>
>>>  - Fix memory leak
>>>  - Lots of refactoring
>>>  - Migrate GTK 2 to GTK 3
>>>  - Fix all compile warnings
>>>  - Improve usability (grey out buttons, keep the item selection, etc.)
>>>
>>>
>>
>> Hi,
>> I have tested all 65 patches here (omitting 52).
>> They worked well. Good job.
>> I will test your git tree/branch Monday/Tuesday.
>>
>> I did notice one visual difference. The GTK+2 version of
>> gconfig (before the patches) uses an alternating white/light gray
>> background for the menu items while the GTK+3 version (after the
>> patches) uses an all white background.
>>
>> I prefer the alternating but it may be just some collateral damage
>> in the name of progress.  Or could be something else entirely!
> 
> 
> I think
> [PATCH 15/66] kconfig: gconf: remove gtk_tree_view_set_rules_hint() calls
> affected this.
> 

Yes, that likely did it.

> gtk_tree_view_set_rules_hint() is deprecated.
> 
> 
> The comment says "just do it in a theme"
>  https://gitlab.gnome.org/GNOME/gtk/-/blob/3.14.0/gtk/gtktreeview.c#L11875
> 
> But, I do not know which theme should be applied.

Agreed. I didn't find any help on that subject either.

Thanks.


-- 
~Randy


