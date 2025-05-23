Return-Path: <linux-kbuild+bounces-7249-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 020E2AC2C83
	for <lists+linux-kbuild@lfdr.de>; Sat, 24 May 2025 01:48:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 06DF5A247E5
	for <lists+linux-kbuild@lfdr.de>; Fri, 23 May 2025 23:47:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F0FE1EBA1E;
	Fri, 23 May 2025 23:48:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="eU8E0csM"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 585E61D5ACF;
	Fri, 23 May 2025 23:48:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748044085; cv=none; b=Y+b9IxJ3UJywSbA+hNmrvTDdi1MYwK2cp52bmpqXU2yOKH8K+KHLpNnv/YbqZ1yIop/7UPg8ZHvSiWbK7rXo8i/5roy7mS6JhSiIJwLQrv438RS6IL+vaPuTp16ORk2Duk8c2KGbCRjR24quiQN4B+jYVeaKfVOl7+gMagpJSXs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748044085; c=relaxed/simple;
	bh=lHaP83suIFYyQ1ig1OtTgzH1yujgMPzW7GPw+NcqmS0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YSUWYsmLDrpwsrVaxYFqvfaJ9xqiLpAgkqgkKnOUfkEsv5BOXFeWsfA6PQfRP7r4SA/pVRXeQFTkvhe2TIZI8eyQYV8qDoLYV0yveSiGjhWGdut1ATI8K4zJBniUV7zGmnoGxvgVaT3BALtk+Aft79Pvh1Q4unE1z9aohRqvkw8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=eU8E0csM; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=byV3YVghOZ9bzSjQPVyhFRoEpn0ha/aLdxlgBQZeuCc=; b=eU8E0csMefFMP2za5MQLop+U6I
	HFiIi5ulGtFFkENytoFCWYNPFtdLX4AvQ3JYdc2kGQsW1ZPN6p30UCymoM/D+JS3J4c9B5MDuH2ec
	gejZ8mY+558j2CSbFieWYtiFXwP0QoesYEfLP8Ar6c+5cbXaHzFt2d+BGS20OeOz9yUWgmarJyEv9
	Yw9VuNg/Smj5b7cf4igmjLg5LaUB5ITfCPzXmuYp5F1ygwVC0+gypZb211fdUDldj+Tyhd1EAuXEp
	F1OG8mxuJ5r+LFtNznNHRCvhiqg+Ho4BsuqWh9F8cyVlxXegHD43dUt0BbT/jTLLUHXmqracJZ3Q8
	t2A2kItw==;
Received: from [50.53.25.54] (helo=[192.168.254.17])
	by desiato.infradead.org with esmtpsa (Exim 4.98.1 #2 (Red Hat Linux))
	id 1uIc7L-00000001OGP-49AO;
	Fri, 23 May 2025 23:48:00 +0000
Message-ID: <998f5987-12ea-4bdc-b86a-35b904a34acf@infradead.org>
Date: Fri, 23 May 2025 16:47:52 -0700
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] kconfig: check for a NULL pointer before access
To: Bill Wendling <morbo@google.com>
Cc: Masahiro Yamada <masahiroy@kernel.org>,
 Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
 LKML <linux-kernel@vger.kernel.org>
References: <CAGG=3QU5Yi2AfHS_poi8SgmatedRg-X8Ct74FOCJUc9iJNPnhg@mail.gmail.com>
 <2f6201d1-4e18-43ab-aadd-27643d57dab6@infradead.org>
 <CAGG=3QXQkJ6n0J1gZcgxfEb68NWN2y200ZCuxxDtqPRgWPci=A@mail.gmail.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <CAGG=3QXQkJ6n0J1gZcgxfEb68NWN2y200ZCuxxDtqPRgWPci=A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 5/23/25 3:56 PM, Bill Wendling wrote:
> On Thu, May 22, 2025 at 5:16 PM Randy Dunlap <rdunlap@infradead.org> wrote:
>>
>> Hi,
>>
>> On 5/22/25 5:07 PM, Bill Wendling wrote:
>>> The call to 'prop_get_symbol' may return NULL in some cases. The if-then
>>> statement accesses the returned value without checking if it's
>>> non-NULL. After inlining, the compiler may treat the conditional as
>>> 'undefined behavior', which the compiler may take the opportunity to do
>>> whatever it wants with the UB path. This patch simply adds a check to
>>> ensure that 'def_sym' is non-NULL to avoid this behavior.
>>>
>>> Signed-off-by: Bill Wendling <morbo@google.com>
>>> ---
>>> Cc: Masahiro Yamada <masahiroy@kernel.org>
>>> Cc: linux-kbuild@vger.kernel.org
>>> Cc: linux-kernel@vger.kernel.org
>>> ---
>>>  scripts/kconfig/symbol.c | 2 +-
>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/scripts/kconfig/symbol.c b/scripts/kconfig/symbol.c
>>> index d57f8cbba291..9c5068225328 100644
>>> --- a/scripts/kconfig/symbol.c
>>> +++ b/scripts/kconfig/symbol.c
>>> @@ -272,7 +272,7 @@ struct symbol *sym_choice_default(struct menu *choice)
>>>   if (prop->visible.tri == no)
>>>   continue;
>>>   def_sym = prop_get_symbol(prop);
>>> - if (def_sym->visible != no)
>>> + if (def_sym && def_sym->visible != no)
>>>   return def_sym;
>>>   }
>>>
>>
>> The patch is missing the source file's indentation.
>> (spaces/tabs are lost)
>>
> Crud! My mailer borked. I sent v2 and it looks to have kept the whitespaces.

I don't think v2 worked either.
See  https://lore.kernel.org/linux-kbuild/CAGG=3QXQkJ6n0J1gZcgxfEb68NWN2y200ZCuxxDtqPRgWPci=A@mail.gmail.com/T/#mf64c7afd19235d3dee4e572f96ff76936f921c6e

-- 
~Randy


