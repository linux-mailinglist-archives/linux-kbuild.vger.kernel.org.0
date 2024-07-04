Return-Path: <linux-kbuild+bounces-2338-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D516926D6A
	for <lists+linux-kbuild@lfdr.de>; Thu,  4 Jul 2024 04:28:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2D53C1F22A03
	for <lists+linux-kbuild@lfdr.de>; Thu,  4 Jul 2024 02:28:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE3359457;
	Thu,  4 Jul 2024 02:28:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WmYhvsml"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECB9D12B73;
	Thu,  4 Jul 2024 02:27:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720060081; cv=none; b=Oxm9O/HC6ttO0p6IOc2rfo/3xerdeTIwxkJ+mWr29EsK9VvZJIkI2yf6zLDZXsRmMpemzWtCVIZ2P09+DKO25JxP9S9c2dbSPOngJFuMJUVQjFUdN9+rnx9r3hzJhfMx4KA9HqQ/h/xbiS1Oq8Dw2tEionIVymhlpOkgZBC+oXA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720060081; c=relaxed/simple;
	bh=cEKlbe9Kz5kYWe995sknXJM0g2fKPsJxvFjal74J62k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ur+C5pa93MbfVNUg+STaGv1mixH8Nxf7K+kAXvrs8Eqob+dC6/cD/0cSIWZTjq5JtU+aHlP4ie4EfGOUvu0WvuqrFO3cblBRvCScCqMm+QXSMGSGinIyjdnFlucKnqsnOhMPLZTsCCISBTclc3EiYZBSxuWA/o7E+Fg7UBCJ7bA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WmYhvsml; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-57cbc66a0a6so284934a12.1;
        Wed, 03 Jul 2024 19:27:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720060078; x=1720664878; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:mime-version:references:reply-to:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1W34Z3nXW+MCwIvZyWJfAuvbVufFerSj2UpL022AfpA=;
        b=WmYhvsmlf9a8+0KaU5pdNAFtnZ+sSx+VDhnZYF+JRt+dCcT8d/nXIBjhz/A1n3YqgG
         5K5KQvAsbMhgaE2dM9pbe9EHfn/326zGpEzNMJfHVIYUk5kWed/ZSAkqfHQYSFcj7hSa
         T5G3qjTo4VAgGJQ5+EZrbw8L4piN/M83xiRA6FaRbwvcWEFJiGpsjtsX+l8OY9vmXrcJ
         HOR5MIWfNPzcr56pUZCS0QTbeJF+y/SNPMUK+0f79Fgry4SnWn/E1htEWY3GBDZMgnef
         99KyvdAfDmSrbdhl3MEleV3HqnylO+LbwIy6kpBoL6vQ0mRttXZvuLDQdVGJFplblvgv
         poyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720060078; x=1720664878;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:mime-version:references:reply-to:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1W34Z3nXW+MCwIvZyWJfAuvbVufFerSj2UpL022AfpA=;
        b=Ii88no4/4CPBfSGx++0XMDwgqPB7ww7jKhpWR2ndVyx/uK5G3F2NPPEKBqxO5EAXgp
         TLhlkmccCx1eYkf7p8HjSFZu1R20m7kSpw8bqlYqtALiFsoNlO0Sl5hY/+EfjSof/4kJ
         40IhVS+yatlkMaNiqTtMC6M71LkoIiyJUfRG6yZK23y+EYBHrS1qYkatRaD0QyvR4bxI
         o6cz3GQEOv2cIpzTrOuP3BJLG4Doy4P9NKFdmyosxg1Vo+5c2Huq7XglxIwrSpUDtTZB
         Ia5qrMr8ZJTk2g3qX6DNjD1vrGVi/OMfDBTC/Ry0DDyqsb95ki1NInAKLolqD7yfoz+f
         pNJQ==
X-Forwarded-Encrypted: i=1; AJvYcCXqkd7Zvcg5Jvx8GhNvqDgYjHzqsHHg6fkVMFkGdKEAaMfKH+EvcA50O9LoTVtFQ5WwURLAMO4HvxnCSaQW6uGaEqhFmZ1xrqGcP6wVaTZ1K4tAB6npM0mv+tc2/v6KZnfNmyR12+HODwVv
X-Gm-Message-State: AOJu0Yx2d8neXItthJJp5S1NoywTYqBH+ZI7E9ZfH/Ql/r/JPp1RJ/HR
	5bImKKZVEH93XVCIrDrb66nfaSu5u1cl9avPRaiyPGKQqYdo+dq1
X-Google-Smtp-Source: AGHT+IFQ1rQlYRVYGWOQL+TFM7EZFIuOaPfvUlZLEvmmzwgy+tadg8ktg67t+dr9NGUlhEk4p291qw==
X-Received: by 2002:a05:6402:3552:b0:584:21eb:7688 with SMTP id 4fb4d7f45d1cf-58e7c29bed8mr57018a12.14.1720060078029;
        Wed, 03 Jul 2024 19:27:58 -0700 (PDT)
Received: from localhost ([185.92.221.13])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5861324ec3dsm7986421a12.38.2024.07.03.19.27.57
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 03 Jul 2024 19:27:57 -0700 (PDT)
Date: Thu, 4 Jul 2024 02:27:57 +0000
From: Wei Yang <richard.weiyang@gmail.com>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Wei Yang <richard.weiyang@gmail.com>, akpm@linux-foundation.org,
	nathan@kernel.org, nicolas@fjasle.eu, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
	Mike Rapoport <rppt@kernel.org>
Subject: Re: [PATCH 2/3] modpost: .meminit.* is not in init section when
 CONFIG_MEMORY_HOTPLUG set
Message-ID: <20240704022757.fq62i4nhb5eignvf@master>
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

You mean something like this?

diff --git a/include/linux/init.h b/include/linux/init.h
index 58cef4c2e59a..388f0a4c34e9 100644
--- a/include/linux/init.h
+++ b/include/linux/init.h
@@ -85,10 +85,12 @@
 #define __exit          __section(".exit.text") __exitused __cold notrace
 
 /* Used for MEMORY_HOTPLUG */
+#ifndef CONFIG_MEMORY_HOTPLUG
 #define __meminit        __section(".meminit.text") __cold notrace \
 						  __latent_entropy
 #define __meminitdata    __section(".meminit.data")
 #define __meminitconst   __section(".meminit.rodata")
+#endif
 
 /* For assembly routines */
 #define __HEAD		.section	".head.text","ax"

>That is what we did in the Linux 2.6.* era, which had much worse
>section mismatch coverage.
>

I guess you mean this is not a good practice.

Then I am confused how we do the mismatch check unconditionally?

After commit 

commit eb8f689046b857874e964463619f09df06d59fad
Author: Sam Ravnborg <sam@ravnborg.org>
Date:   Sun Jan 20 20:07:28 2008 +0100

    Use separate sections for __dev/__cpu/__mem code/data

Sections .meminit.* will be put into INIT_SECTION conditionally, but we always
do the mismatch check unconditionally. It will report mismatch when .meminit.*
is not in INIT_SECTION. It looks not correct to me.

Maybe I am not fully understand your message. Would you mind explaining more
on what is the correct way to do?

-- 
Wei Yang
Help you, Help me

