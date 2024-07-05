Return-Path: <linux-kbuild+bounces-2388-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C4A3928259
	for <lists+linux-kbuild@lfdr.de>; Fri,  5 Jul 2024 08:55:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 49A08283BC1
	for <lists+linux-kbuild@lfdr.de>; Fri,  5 Jul 2024 06:55:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 18E6C1311A3;
	Fri,  5 Jul 2024 06:55:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="avj8GDOc"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CD7A482EF;
	Fri,  5 Jul 2024 06:55:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720162502; cv=none; b=RWNQXyxaLNhv+6N2P4fibK5oqTt2ArBNoaqdTxjshDNULJ4/Sl/7xow5avlsKsbmlw4URQ0MvL0qzwXRwFIfwvkhzE9pEUo6/SNF0+rkISUF8J1biL2H8cOvvVhhjlVAWV5PmPOj26h2TqG6k7kNKWDgYRAHiESSHpo29raxzO8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720162502; c=relaxed/simple;
	bh=+TF4/Nrsi1OprYomlmzLGA79NTXNcSNLCUhYkmi24qI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qfoI5xPXRZAj7OiKdyx3m0AtDblPt/WK39O8tSsDPHJ8wVm5Z6hPXFgH6sSnosTNwjlSC0oV9ghwCeITmCyNEmPg1SSgmhCA2tuQvOdRYOGaHR/XStcAPmFIzk4uakPpgzu42tfCLup2mbldn3YT6l0KTJO7op9uOlVSYJbP0Wg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=avj8GDOc; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-a7541fad560so146610466b.0;
        Thu, 04 Jul 2024 23:55:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720162498; x=1720767298; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:mime-version:references:reply-to:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=KtbWFhxeEymIWS8tWUCbo8i07LprGpYbyo4f1G00ZP0=;
        b=avj8GDOcYFbmV18FiXlhhf6KqIzYlgR3/OPR0+A0Zm/MSxKcygOFXSRY9sULq5nLdE
         LKY6Q33kzT4XPIIczuWYd1PGmtKxifzcTbNd9tuSL88sXjBVpNFQ+6jUfiFCwCvSVEvh
         nvEi+5RahX2ftgYlqL+gDJTT2BH9VIpeqlqh4ifLKDAEm+YEihoamHeKMSS5JoshmfvG
         bNYDV7dfF7OnKetk1ATku26K5ORuQ1CxEWrh6yu3V4L/pMFyp40pbzKXe8q4+nSg+KAZ
         4lGnGDyIPENY6ypqYSgwjS0FypNVoOsoc8RhLrR41gLZ8yKYjU3QcZDploFeXpACxt1b
         5QGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720162498; x=1720767298;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:mime-version:references:reply-to:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KtbWFhxeEymIWS8tWUCbo8i07LprGpYbyo4f1G00ZP0=;
        b=aNIjP8oCY/hGy8vuYc5nMRGN/QkdhU8YzundI245DnQULBctyvhEgeJu7TdKHr+FOn
         afY40ruKnM/wu5zvylconOkfa8mtAoWVtS4jLxcaqiDcUAkhnjzevPHpOb87YHS+iT7b
         RP9zdRDLuyOfyToEWtNsOqwPLM1bHJhkBnNaK7ItYEvSeFvqV1u2KOlilgOraJLuxR0V
         UrSirr+K37cGB7kwn1rggzJCWoMTh50X+7HXnUvWEUlTuC17YkbUf62dz03grYpTex0H
         vMKiw/5kbSd6697lYu3auYKUkXfFUapU9XAzaR9Ob2D/I9duHWwDT+DOvYghwHIa3+8H
         8+vA==
X-Forwarded-Encrypted: i=1; AJvYcCXf1+cfT0llrNn3g7dGD9AWLsyqCwJK+BnykKPGxKAEQjghe1UvNabCBRBi420zAzGGhui3XcqmZvfaRoAeQ2nTOoI56E9YiniU5i39S+gjJT3TrPex0qvdmiWYvIHTMRSdALeodrfOV5Sk
X-Gm-Message-State: AOJu0YxDwpfNX7lkTZ3HALtUWUXHAQ73DXffWOcmAesUjuMit+ZSKP/B
	fbweKH4yX1/07/PIFIO0wMeKtRke4h8t3BbpltCpWED5446LWXHWFesqGsL7
X-Google-Smtp-Source: AGHT+IGHx/Vjks1k64fIQj9z77lOxI2plruUsuqWWDgID6a1HNNAIahUxcjbzgjGloIRV61vxwGAGQ==
X-Received: by 2002:a17:906:834c:b0:a6f:392d:51a9 with SMTP id a640c23a62f3a-a77ba6dc0ccmr260806866b.14.1720162498306;
        Thu, 04 Jul 2024 23:54:58 -0700 (PDT)
Received: from localhost ([185.92.221.13])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a77c3772ad5sm74840666b.173.2024.07.04.23.54.57
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 04 Jul 2024 23:54:57 -0700 (PDT)
Date: Fri, 5 Jul 2024 06:54:56 +0000
From: Wei Yang <richard.weiyang@gmail.com>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Wei Yang <richard.weiyang@gmail.com>, akpm@linux-foundation.org,
	nathan@kernel.org, nicolas@fjasle.eu, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
	Mike Rapoport <rppt@kernel.org>
Subject: Re: [PATCH 2/3] modpost: .meminit.* is not in init section when
 CONFIG_MEMORY_HOTPLUG set
Message-ID: <20240705065456.dogycpd37jun44p5@master>
Reply-To: Wei Yang <richard.weiyang@gmail.com>
References: <20240702234008.19101-1-richard.weiyang@gmail.com>
 <20240702234008.19101-2-richard.weiyang@gmail.com>
 <CAK7LNAR08Nx3-8XYe4qmUegDFo2zLUvkVdA1t51g1Bamh5Tteg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAK7LNAR08Nx3-8XYe4qmUegDFo2zLUvkVdA1t51g1Bamh5Tteg@mail.gmail.com>
User-Agent: NeoMutt/20170113 (1.7.2)

On Wed, Jul 03, 2024 at 11:44:38PM +0900, Masahiro Yamada wrote:
>On Wed, Jul 3, 2024 at 8:40 AM Wei Yang <richard.weiyang@gmail.com> wrote:
>>
>> .meminit.* is not put into init section when CONFIG_MEMORY_HOTPLUG is
>> set, since we define MEM_KEEP()/MEM_DISCARD() according to
>> CONFIG_MEMORY_HOTPLUG.
>>
>> Signed-off-by: Wei Yang <richard.weiyang@gmail.com>
>> CC: Mike Rapoport (IBM) <rppt@kernel.org>
>> ---
>>  scripts/mod/modpost.c | 10 ++++++++++
>>  1 file changed, 10 insertions(+)
>
>
>
>NACK.
>
>
>The section mismatch is performed _unconditionally_.
>
>
>
>In the old days, we did this depending on relevant CONFIG options.
>It was more than 15 years ago that we stopped doing that.
>
>
>See this:
>
>
>commit eb8f689046b857874e964463619f09df06d59fad
>Author: Sam Ravnborg <sam@ravnborg.org>
>Date:   Sun Jan 20 20:07:28 2008 +0100
>
>    Use separate sections for __dev/__cpu/__mem code/data
>
>
>
>
>So, if you wanted to check this only when CONFIG_MEMORY_HOTPLUG=n,
>you would need to add #ifdef CONFIG_MEMORY_HOTPLUG to include/linux/init.h
>
>That is what we did in the Linux 2.6.* era, which had much worse
>section mismatch coverage.
>

Masahiro 

If you would give me some suggestions, I'd appreciate it a lot.

The original thing I want to do is to put function __free_pages_core() in
__meminit section, since this function is only used by __init functions and
in memory_hotplug.c.  This means it is save to release it if
CONFIG_MEMORY_HOTPLUG is set.

Then I add __meminit to function __free_pages_core() and face the warning from
modpost.

  WARNING: modpost: vmlinux: section mismatch in reference: generic_online_page+0xa (section: .text) -> __free_pages_core (section: .meminit.text)

A .text function calls init code is not proper. Then I add __meminit to
generic_online_page too. Then I face this warning from modpost.

  WARNING: modpost: vmlinux: generic_online_page: EXPORT_SYMBOL used for init symbol. Remove __init or EXPORT_SYMBOL.

Function generic_online_page() is exported and be used in some modules. And is
not allowed to use init tag.

When looking into the code, this warning is printed by this code:

   #define ALL_INIT_SECTIONS INIT_SECTIONS, ALL_XXXINIT_SECTIONS
   
   if (match(secname, PATTERNS(ALL_INIT_SECTIONS)))
   	warn("%s: %s: EXPORT_SYMBOL used for init symbol. Remove __init or EXPORT_SYMBOL.\n",
   	     mod->name, name);

If my understanding is correct, the code means we can't use a function in init
section, since the code will be released after bootup.

But for this case, when CONFIG_MEMORY_HOTPLUG is set, the section .meminit.*
is not put into the real init sections. So the functions are not released and
could be used by modules. This behavior is introduced in commit
eb8f689046b8(the one you mentioned above).

So the check here is not proper to me. We should exclude .meminit.* from
ALL_INIT_SECTIONS.

Looking forward your suggestion and a proper way to handle this.

-- 
Wei Yang
Help you, Help me

