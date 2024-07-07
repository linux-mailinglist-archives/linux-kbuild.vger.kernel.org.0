Return-Path: <linux-kbuild+bounces-2417-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E95C92960B
	for <lists+linux-kbuild@lfdr.de>; Sun,  7 Jul 2024 02:04:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C35E0281D6D
	for <lists+linux-kbuild@lfdr.de>; Sun,  7 Jul 2024 00:04:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70467193;
	Sun,  7 Jul 2024 00:04:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FeWxLg96"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D2B8181;
	Sun,  7 Jul 2024 00:04:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720310648; cv=none; b=FtLHOMF/SW2JaBg8GwTuWZqwW8PgMzFAXgcNiCf7QWh+uIkhVNTtGY+6SPVzyxdh0F94dv0kxO+lutavfn8thgfdw/iIxNmJ8miovXY0l7V0yUcUOQ6+4ISZ1W/b/vhkdRraBKvV+4DS3VUd59VJz2flZoNP4KnydlqeV4PIZO0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720310648; c=relaxed/simple;
	bh=EN8xWQ8I4hHzTIQl0ax0U9fbl8La86KwDFDt1yGQk84=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tsB3tE7L8RfRyi6z3BQeJkbGhUukA0wW1nkZdfdwnbMZ3LfoSk91xb7kBZccwf/AqRv+oUZtK+TJzVa58R/CYJ17twWuzDaqSznLJKq0guEspoHvi7l+hUdB+IFKURL09iajdOP/KqGPGZg4tRmEKYI5JV3injjWlBT1fBN2fWY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FeWxLg96; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-a77e5929033so68860466b.0;
        Sat, 06 Jul 2024 17:04:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720310645; x=1720915445; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:mime-version:references:reply-to:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=RWKqO2BWwvKMkfcddteTT/xU6+nFQEAn8H1kp+9IBak=;
        b=FeWxLg96cSgCEYnsl4g2dvDS/KBg+g8CdxYPVluFBNdZL7Ck0Qf2ySQMTHcFzafJSH
         PwqCCJ8zylzAAiXwns12G1naGeHu1cZ6L+3IJrHHP2Qb2spIFlWMc5Ygx9zH84EkjEmu
         CZvCuBtVx3V9yI/c1e1izRGtm6yMnb+VXXmcHVzkn4gM54RCODodCwfkT2ErypR+klP9
         ePNQ71WzozmLVDcKZYIh4ZjNICO5XXiaXgDg+eQs13x9orMqqeCXiaM/8jMp2WnduXeE
         sTdPm7QniDIqQHxKJfcC2m2VcA1mCN2gpzZM5nV57mATXcgFyYdrfHCnLH9nl3WNip2M
         2IOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720310645; x=1720915445;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:mime-version:references:reply-to:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RWKqO2BWwvKMkfcddteTT/xU6+nFQEAn8H1kp+9IBak=;
        b=qFGaf+eI5AHZkqzB9UIFeEIWc+NdGUEw+nDU6COVec3B1yyxFlTxeLYK/rLgECb+C+
         isSm27O0JdilcSjKYLJGJhRKYAKzY7V3Zd7XyRKqq6fs1hIlCRbqzMc1oiOAUDiMCq3F
         T1SGpgFXR4shLHFvY6mmAyIQm03HKarhXZ6yMP+SY0hMafAqOkqS+bb+jvwPS4YDM16w
         WpvG9/waRMxULSZJ/xrbhq5V64PYrEMSdEI1jwZ/VibU2bliVihVnOHBNDjsTatmU5HD
         P98Rt0wtjp1Vch35t7fDnLvRHzPhIzVgsXMG87cXGqMutHfa/5Nv/bA/mOU/+p98GLa/
         kR+g==
X-Forwarded-Encrypted: i=1; AJvYcCWnumEnPnpKcN3Gbtq+kwl4tPCypW/km5yGQumgK9LP89qJOOr3j47V0aORnFkCerHqJTAmjnOfB0dCZdxAE9abvUOEeQM4x0eKEAGvC5m3O4EUKfukJKzC9wS0eHMQ9O/kCCfaQIwYH65r
X-Gm-Message-State: AOJu0Yz63x50jPiG9mdjxd4LESs6PPb9Sveh0RGBc8L7+BxG4oaO2LLK
	kMUhEDY+TJBaCyDDe55OA69eMGMcigNb+tfxAbdc6Oea/piHmbPs
X-Google-Smtp-Source: AGHT+IGCj+7/ZhKNfQy2zOxzUfK6ed8+jvH0WVkR8cR9x01L3VOWGrROanABN7ciMy44Y3929ceDNw==
X-Received: by 2002:a17:906:a08:b0:a77:c525:5c64 with SMTP id a640c23a62f3a-a77c52571e8mr435239066b.39.1720310644866;
        Sat, 06 Jul 2024 17:04:04 -0700 (PDT)
Received: from localhost ([185.92.221.13])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a77c127bc6asm232410866b.116.2024.07.06.17.04.04
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 06 Jul 2024 17:04:04 -0700 (PDT)
Date: Sun, 7 Jul 2024 00:04:03 +0000
From: Wei Yang <richard.weiyang@gmail.com>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Wei Yang <richard.weiyang@gmail.com>, akpm@linux-foundation.org,
	nathan@kernel.org, nicolas@fjasle.eu, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
	Mike Rapoport <rppt@kernel.org>
Subject: Re: [PATCH 2/3] modpost: .meminit.* is not in init section when
 CONFIG_MEMORY_HOTPLUG set
Message-ID: <20240707000403.b4gtuqiwpx3rp766@master>
Reply-To: Wei Yang <richard.weiyang@gmail.com>
References: <20240702234008.19101-1-richard.weiyang@gmail.com>
 <20240702234008.19101-2-richard.weiyang@gmail.com>
 <CAK7LNAR08Nx3-8XYe4qmUegDFo2zLUvkVdA1t51g1Bamh5Tteg@mail.gmail.com>
 <20240705065456.dogycpd37jun44p5@master>
 <20240706061236.snp4r2tixx3h7hfe@master>
 <CAK7LNARX+qxzD-6ip9Q64Bvju3ACQ0uFPThkLgRqvmem-LQ9uw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAK7LNARX+qxzD-6ip9Q64Bvju3ACQ0uFPThkLgRqvmem-LQ9uw@mail.gmail.com>
User-Agent: NeoMutt/20170113 (1.7.2)

On Sat, Jul 06, 2024 at 10:50:25PM +0900, Masahiro Yamada wrote:
>On Sat, Jul 6, 2024 at 3:12 PM Wei Yang <richard.weiyang@gmail.com> wrote:
>>
>> On Fri, Jul 05, 2024 at 06:54:56AM +0000, Wei Yang wrote:
>> >On Wed, Jul 03, 2024 at 11:44:38PM +0900, Masahiro Yamada wrote:
>> >>On Wed, Jul 3, 2024 at 8:40 AM Wei Yang <richard.weiyang@gmail.com> wrote:
>> >>>
>> >>> .meminit.* is not put into init section when CONFIG_MEMORY_HOTPLUG is
>> >>> set, since we define MEM_KEEP()/MEM_DISCARD() according to
>> >>> CONFIG_MEMORY_HOTPLUG.
>> >>>
>> >>> Signed-off-by: Wei Yang <richard.weiyang@gmail.com>
>> >>> CC: Mike Rapoport (IBM) <rppt@kernel.org>
>> >>> ---
>> >>>  scripts/mod/modpost.c | 10 ++++++++++
>> >>>  1 file changed, 10 insertions(+)
>> >>
>> >>
>> >>
>> >>NACK.
>> >>
>> >>
>> >>The section mismatch is performed _unconditionally_.
>> >>
>> >>
>> >>
>> >>In the old days, we did this depending on relevant CONFIG options.
>> >>It was more than 15 years ago that we stopped doing that.
>> >>
>> >>
>> >>See this:
>> >>
>> >>
>> >>commit eb8f689046b857874e964463619f09df06d59fad
>> >>Author: Sam Ravnborg <sam@ravnborg.org>
>> >>Date:   Sun Jan 20 20:07:28 2008 +0100
>> >>
>> >>    Use separate sections for __dev/__cpu/__mem code/data
>> >>
>> >>
>> >>
>> >>
>> >>So, if you wanted to check this only when CONFIG_MEMORY_HOTPLUG=n,
>> >>you would need to add #ifdef CONFIG_MEMORY_HOTPLUG to include/linux/init.h
>> >>
>> >>That is what we did in the Linux 2.6.* era, which had much worse
>> >>section mismatch coverage.
>> >>
>> >
>> >Masahiro
>> >
>> >If you would give me some suggestions, I'd appreciate it a lot.
>> >
>> >The original thing I want to do is to put function __free_pages_core() in
>> >__meminit section, since this function is only used by __init functions and
>> >in memory_hotplug.c.  This means it is save to release it if
>> >CONFIG_MEMORY_HOTPLUG is set.
>> >
>> >Then I add __meminit to function __free_pages_core() and face the warning from
>> >modpost.
>> >
>> >  WARNING: modpost: vmlinux: section mismatch in reference: generic_online_page+0xa (section: .text) -> __free_pages_core (section: .meminit.text)
>> >
>> >A .text function calls init code is not proper. Then I add __meminit to
>> >generic_online_page too. Then I face this warning from modpost.
>> >
>> >  WARNING: modpost: vmlinux: generic_online_page: EXPORT_SYMBOL used for init symbol. Remove __init or EXPORT_SYMBOL.
>> >
>>
>> I guess I found the correct way.
>>
>> Add __ref to generic_online_page to not issue a warning.
>
>
>
>Yes, __ref is used to bypass the section mismatch check.
>

I am think whether __ref is providing a gate to escape the check of modpost?

>Some functions in mm/memory_hotplug.c are annotated as __ref
>to reference __meminit functions.
>
>Adding __ref is the easy solution.
>
>
>
>Having said that, I started to think
>eb8f689046b857874e964463619f09df06d59fad was the wrong decision.
>I will revert it.
>

Oh, I finally understand it... didn't think that was a wrong decision :-(

>
>
>
>
>
>
>
>
>
>
>-- 
>Best Regards
>Masahiro Yamada

-- 
Wei Yang
Help you, Help me

