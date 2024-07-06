Return-Path: <linux-kbuild+bounces-2408-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 724FF92913B
	for <lists+linux-kbuild@lfdr.de>; Sat,  6 Jul 2024 08:12:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E6B201F2192C
	for <lists+linux-kbuild@lfdr.de>; Sat,  6 Jul 2024 06:12:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 024AB17C95;
	Sat,  6 Jul 2024 06:12:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TAriyQnG"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D729179BD;
	Sat,  6 Jul 2024 06:12:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720246360; cv=none; b=hhxlRoWDRDF/w67e2eK3/+xiSqF7EAMbiRw7FZEL0s0WUV4ymnJI17MUbaDOCx+lbZxwrQVkgVMOwcDS2GcgWwgdrGra+2ALwVNid6lry5M+F5eCMO5L9bvQdfokytJO3GHnHp1YAU1N3J/x41V9ibw38wRxZalvbP/TVEVYT2c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720246360; c=relaxed/simple;
	bh=2Fks1yXJtlGGjIbK5eKtS5Vm+73eQlEo1L2qioOC/fY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oYTSrhiMCtN4RrlDlNpuehhL96ysc//NPMqcIoHfNDoKExPykQbtX4VBQK5X3feONnWiGvSsswNxtt3EesPrKYFklB/W4vi/c2o4wpeTC38M7XWO/nD0YtrFnF8dMSGhQPGOutqohMCmW8i+Oy2G/w3LAo3JG9HJ+sdgiuHhYTE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TAriyQnG; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-a77e392f59fso28626866b.1;
        Fri, 05 Jul 2024 23:12:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720246357; x=1720851157; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:mime-version:references:reply-to:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=FDbSGOTT29nUQuDrfA04vbxY/zhE1PwPtnbE9KH53Hw=;
        b=TAriyQnGPzmsbdTlygUHRrLhe0UtDgnJrhChgxngpeltvhwPVp7umXWUTaKXyIowUt
         r1HD//SPqBdjkbYAAp8JB/GLEv4KqKWOTcgouJ1B2F3i/8ly1TdyAabJwg0CXhc0a2hK
         /jqH6HtT1CFB470HELQVa4tSwqDYjVyQIrXW+R2rclkilWaBlv4kNNvibYnSHgCn2qQk
         JZRfrtA+ajKomkcm52BJ4xGqqB1+sl3JUOdd3uLWOd8GPmsNuymoSkJ5Eh6lw94vQ/ni
         65y+dAj9X1isiqvEEifaCK2UcSQl89Fkuip7LxhXXxupTcn2KQ15pgmwwghR9LzIvJvJ
         KkrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720246357; x=1720851157;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:mime-version:references:reply-to:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FDbSGOTT29nUQuDrfA04vbxY/zhE1PwPtnbE9KH53Hw=;
        b=Y4RvmHw3z0M9GRe2BV+cHH7TmGJkh822umUTz6O+fb2RHcmO+jKJaLqAkIVMlQnUXw
         yQbSdr+mrERYtICznLXf13q17x5HAXHyln6MC5ThBz02Yw0rbY4A3ftYBMNzhNy4f/2B
         8/+G0pLWQMI5DYT7SSGwEyK21IXKEkTiM3CMKYurDOaG/oT8xMmluiVZpmX+mT+QszJ5
         bJTMbRAUMHRIVR6I9VVr9a6NnGn4DaxGS7YcvOmSFs+kP/Xpn2UycSEIZo88wYWnIPJe
         Fud04LpZvTMz2AbwwI3O9ZpQDZhn02y1bcGLskQHxYChLr1JVEFz68mK6Ya342UgZj5i
         TE8g==
X-Forwarded-Encrypted: i=1; AJvYcCUyoiHMbWcU0Z3+ht4TxXUN40H4I4nTyxMenRvCdcmRhCNn+e+UE1cuvBBjyU8fzaVvecFMsu4NzgZzmP3VkML1qPLJUfiNtuIQsRhZXjqhTDvGY0oQsoTIgZ4aWzgAX3q1hd75meXUu9Hn
X-Gm-Message-State: AOJu0YzykQL1KoI5lbU3GsBVTsYIeQGc7jEi7iLtuDVDG25H0R3tb+qz
	WOlx0Lt0GmZMynqzsOiu+A6FOCMZtfgxIR3qF4LZG+4NVnYddFZr
X-Google-Smtp-Source: AGHT+IFQGo+Vs5pdkor1uOiOtgu7cQVjKdGdWWlD+aVNznwVI9BiGzRyrVGIoVnnnwlHjSZMnv1bOw==
X-Received: by 2002:a17:907:7da0:b0:a77:cf9d:f496 with SMTP id a640c23a62f3a-a77cf9df66bmr257510066b.39.1720246357279;
        Fri, 05 Jul 2024 23:12:37 -0700 (PDT)
Received: from localhost ([185.92.221.13])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a77b6f7649bsm196884466b.193.2024.07.05.23.12.36
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 05 Jul 2024 23:12:36 -0700 (PDT)
Date: Sat, 6 Jul 2024 06:12:36 +0000
From: Wei Yang <richard.weiyang@gmail.com>
To: Wei Yang <richard.weiyang@gmail.com>
Cc: Masahiro Yamada <masahiroy@kernel.org>, akpm@linux-foundation.org,
	nathan@kernel.org, nicolas@fjasle.eu, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
	Mike Rapoport <rppt@kernel.org>
Subject: Re: [PATCH 2/3] modpost: .meminit.* is not in init section when
 CONFIG_MEMORY_HOTPLUG set
Message-ID: <20240706061236.snp4r2tixx3h7hfe@master>
Reply-To: Wei Yang <richard.weiyang@gmail.com>
References: <20240702234008.19101-1-richard.weiyang@gmail.com>
 <20240702234008.19101-2-richard.weiyang@gmail.com>
 <CAK7LNAR08Nx3-8XYe4qmUegDFo2zLUvkVdA1t51g1Bamh5Tteg@mail.gmail.com>
 <20240705065456.dogycpd37jun44p5@master>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240705065456.dogycpd37jun44p5@master>
User-Agent: NeoMutt/20170113 (1.7.2)

On Fri, Jul 05, 2024 at 06:54:56AM +0000, Wei Yang wrote:
>On Wed, Jul 03, 2024 at 11:44:38PM +0900, Masahiro Yamada wrote:
>>On Wed, Jul 3, 2024 at 8:40 AM Wei Yang <richard.weiyang@gmail.com> wrote:
>>>
>>> .meminit.* is not put into init section when CONFIG_MEMORY_HOTPLUG is
>>> set, since we define MEM_KEEP()/MEM_DISCARD() according to
>>> CONFIG_MEMORY_HOTPLUG.
>>>
>>> Signed-off-by: Wei Yang <richard.weiyang@gmail.com>
>>> CC: Mike Rapoport (IBM) <rppt@kernel.org>
>>> ---
>>>  scripts/mod/modpost.c | 10 ++++++++++
>>>  1 file changed, 10 insertions(+)
>>
>>
>>
>>NACK.
>>
>>
>>The section mismatch is performed _unconditionally_.
>>
>>
>>
>>In the old days, we did this depending on relevant CONFIG options.
>>It was more than 15 years ago that we stopped doing that.
>>
>>
>>See this:
>>
>>
>>commit eb8f689046b857874e964463619f09df06d59fad
>>Author: Sam Ravnborg <sam@ravnborg.org>
>>Date:   Sun Jan 20 20:07:28 2008 +0100
>>
>>    Use separate sections for __dev/__cpu/__mem code/data
>>
>>
>>
>>
>>So, if you wanted to check this only when CONFIG_MEMORY_HOTPLUG=n,
>>you would need to add #ifdef CONFIG_MEMORY_HOTPLUG to include/linux/init.h
>>
>>That is what we did in the Linux 2.6.* era, which had much worse
>>section mismatch coverage.
>>
>
>Masahiro 
>
>If you would give me some suggestions, I'd appreciate it a lot.
>
>The original thing I want to do is to put function __free_pages_core() in
>__meminit section, since this function is only used by __init functions and
>in memory_hotplug.c.  This means it is save to release it if
>CONFIG_MEMORY_HOTPLUG is set.
>
>Then I add __meminit to function __free_pages_core() and face the warning from
>modpost.
>
>  WARNING: modpost: vmlinux: section mismatch in reference: generic_online_page+0xa (section: .text) -> __free_pages_core (section: .meminit.text)
>
>A .text function calls init code is not proper. Then I add __meminit to
>generic_online_page too. Then I face this warning from modpost.
>
>  WARNING: modpost: vmlinux: generic_online_page: EXPORT_SYMBOL used for init symbol. Remove __init or EXPORT_SYMBOL.
>

I guess I found the correct way.

Add __ref to generic_online_page to not issue a warning.

>Function generic_online_page() is exported and be used in some modules. And is
>not allowed to use init tag.
>
>When looking into the code, this warning is printed by this code:
>
>   #define ALL_INIT_SECTIONS INIT_SECTIONS, ALL_XXXINIT_SECTIONS
>   
>   if (match(secname, PATTERNS(ALL_INIT_SECTIONS)))
>   	warn("%s: %s: EXPORT_SYMBOL used for init symbol. Remove __init or EXPORT_SYMBOL.\n",
>   	     mod->name, name);
>
>If my understanding is correct, the code means we can't use a function in init
>section, since the code will be released after bootup.
>
>But for this case, when CONFIG_MEMORY_HOTPLUG is set, the section .meminit.*
>is not put into the real init sections. So the functions are not released and
>could be used by modules. This behavior is introduced in commit
>eb8f689046b8(the one you mentioned above).
>
>So the check here is not proper to me. We should exclude .meminit.* from
>ALL_INIT_SECTIONS.
>
>Looking forward your suggestion and a proper way to handle this.
>
>-- 
>Wei Yang
>Help you, Help me

-- 
Wei Yang
Help you, Help me

