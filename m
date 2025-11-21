Return-Path: <linux-kbuild+bounces-9756-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 10275C787E7
	for <lists+linux-kbuild@lfdr.de>; Fri, 21 Nov 2025 11:24:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.lore.kernel.org (Postfix) with ESMTPS id 8F1D536E96
	for <lists+linux-kbuild@lfdr.de>; Fri, 21 Nov 2025 10:10:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B66B3451C6;
	Fri, 21 Nov 2025 10:07:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="PXKiQ5ES";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="hVIKI4iu"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 766EA340D9D
	for <linux-kbuild@vger.kernel.org>; Fri, 21 Nov 2025 10:07:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763719642; cv=none; b=ZVq4s/ypmIBQqZ30cjoOrsDm4BYcNVnXBsdUZEj8YAvssikIoUQivrhkMdfrSkDxyK3uqYZGq2jD9NG4Y8cKk62Bvccbz3XffZ2LNUS/DhTjtf+OyxI7xKMX+oIsIaxdKBXcUHeimE7YMwgWh77IraGLzZJIm1xTHMagNONBeIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763719642; c=relaxed/simple;
	bh=WphRJGGfukQrYBcMZ5MWr7QgRRKzcp/3Uhc7FhEdO5c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gQnInBXcNMT2q6xGKRVJSXzOQVEHQTMZcy7bxH9bUs4IOeIJr73n6phUl1FpOIIAbxjVKpcw9S/rjE56LP2S6xmWkNLTjZcpLInl81ShCfh4TkgXwEIP2Oy+V+TvhlhwyP2qn3nngKQfuiRJaLNFBA/ufgqSpoZNEAdGAL5uTnQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=PXKiQ5ES; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=hVIKI4iu; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1763719639;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=SwO77VZOzFTjZAvBz0g5FmwChhtiApIbRQIotLVXRho=;
	b=PXKiQ5ES3hzXg7ay0m8gBlaqHkvbWpp97FHpavTi6cd5fCaV8OryWWvJw8eduFIxaMr5O1
	YabP1OEgnrUOk3zIVGjEHtVRt9bCotpxxvSQB47G/uveI/L349PXxiNn61FTrnYeLrFzpG
	tMrMfYV/D5r1ITG4G9X9tNH4IPBj5Ws=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-575-XFB8BmpHNlWygrHN3K5DYA-1; Fri, 21 Nov 2025 05:07:16 -0500
X-MC-Unique: XFB8BmpHNlWygrHN3K5DYA-1
X-Mimecast-MFC-AGG-ID: XFB8BmpHNlWygrHN3K5DYA_1763719635
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-47775585257so15048995e9.1
        for <linux-kbuild@vger.kernel.org>; Fri, 21 Nov 2025 02:07:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1763719635; x=1764324435; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=SwO77VZOzFTjZAvBz0g5FmwChhtiApIbRQIotLVXRho=;
        b=hVIKI4iuK5NWJCr9/kIV+fzptT4/Aps74k/m9+Azou06vV0isxURee2qIG85Ct6Emg
         J0G6Wb4DPs6S61KDbhXwMo4OPWlinfuRWbYMrlhfQpEfqinVLXc1eSW+XnJbrWv3Z2Ov
         2HVCq1KBthR3ghCACrNhesyJKu5NOS76oWn6YrgKMS8XcXxRpSaB1O1Q0upJu9fiyxiF
         JMJTy+HZVo0avowdsRhfNdHivII/Ay/z9Dzj+iljMzURFUoG6bwBFUbDFEnIOdgzkwyZ
         ByfysJ+5d18rrzjv5bud4k1lGWpftHa4sop5KfzvSb3eW6pFQWxtXffCvAqHj5elFmgZ
         0X/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763719635; x=1764324435;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SwO77VZOzFTjZAvBz0g5FmwChhtiApIbRQIotLVXRho=;
        b=hLoh5ZOmgOMVxf/6R9R1Gi8LuaUbSuWuQDBhnzWoFqyHwATnSTmsEtP3M/C4miIMf2
         apJ8zaqkVaWxInTO3A3Fr4ORBErJHKtX3IQQiabRKZXB6ZM0xPwwU7uXPlvj9ECwi0Oc
         HoGSB0Dmt+vgSjYDJN6io0b+tKj/1GG3mmT5Qk9LGCtdnRwKLCz1CTVMC2es19gnOvLG
         JMfE929u8Wsek656W9uDyOubvNxKZVBZqbao+tzfe8/Jr2H1fwGj5nLdgW9+maZngaaX
         3lnFBa+YcYuidCHNUKq1FjSoX44LqCBeuJR7qA4ktpeEnJzuPDjqMaWUh3h1XyBJi8SH
         YmEw==
X-Forwarded-Encrypted: i=1; AJvYcCUEuJMgg4rjEi4zUzqs6C2MFVM5jsqe4ZvVMMVu5wfF+jXRfObLVxx/j4wvKNgjcwhs5DwrSY4diBMHYAQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9Hx5T3L0sBY5CyWqlgnmUmaLfrMot4VFsQ4ysRctTIX05iZkC
	E+K0nodl+IgnzVYQf/07NoZ/d6OyKe+Jwx5ZKpjYV/z00yx2kSw5yt+IHOhWT9rxGqUI1ewlotH
	qhmFBt6ScXJrk2ztRi655rjkZmyc0SNyp618OGdiXuuvgGFI0lGCAz4fzfCnxeE2Z71nInyUU4w
	==
X-Gm-Gg: ASbGnctftxpNfwT1Xq/Y0dp65gyJ6aKnLpGwKcZVSbDTqiYw1KG2bGImmB5IM3adC9+
	cBERaX+JSy48mL6OPx3juh3UarMbXQ1NwD4moYKibUYwxmAy1Q4nMAU8IU/ynIb7PKtpWY1U0GP
	1GHc7i5rxKL7B7yv9M8Ja1OXDjHwDQY4g0ufLC6AG3i4vEYZkkUe2pDr42hbf/TMVCviEDnzfcr
	qWrX5+RlRnm1oHxwUdbm26fFoEEH7DksEGr7+NGvrwSDLla+XnA366uOPOzW4gMJ0e8tieYqMgR
	xDZcQx7Rjx5jfKGsapYmB7X/AgCkUxjH+TxJBkRUUkUPgD3halfhJrniMKOTjCSY8X31N4sGe9N
	jSCoPwA==
X-Received: by 2002:a05:600c:1d0d:b0:475:dd9a:f791 with SMTP id 5b1f17b1804b1-477c1126d1emr15010435e9.28.1763719635364;
        Fri, 21 Nov 2025 02:07:15 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFqoMD153kz/c03aS70gHVzf/BnaKJUbZBoP7k9YyW4edzStSR45m5QJCTapcyKzEEWA+6bGQ==
X-Received: by 2002:a05:600c:1d0d:b0:475:dd9a:f791 with SMTP id 5b1f17b1804b1-477c1126d1emr15010165e9.28.1763719634864;
        Fri, 21 Nov 2025 02:07:14 -0800 (PST)
Received: from [192.168.0.5] ([47.64.114.57])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-477a97213b8sm81828235e9.1.2025.11.21.02.07.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Nov 2025 02:07:14 -0800 (PST)
Message-ID: <ba1499c3-47ca-42ed-a0d7-74c5ee768132@redhat.com>
Date: Fri, 21 Nov 2025 11:07:13 +0100
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/9] treewide: Replace __ASSEMBLY__ with __ASSEMBLER__
 in header files
To: Arnd Bergmann <arnd@arndb.de>, linux-arch@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, linux-kbuild@vger.kernel.org
References: <20251121100044.282684-1-thuth@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Content-Language: en-US
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <20251121100044.282684-1-thuth@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 21/11/2025 11.00, Thomas Huth wrote:
>   Hi Arnd!
> 
> Could you please help to get the remaining patches of this macro
> renaming series merged? I already got most patches from the initial
> version merged through the architecture specific trees (thanks to every
> maintainer who helped me here!), but for alpha and arm 32-bit, I did
> not manage to get the attention of the maintainers. Hexagon got an
> Acked-by by Brian, but the patches did not get merged yet.

Sorry, forgot to mention: csky and arm64 are still in linux-next and not in 
Linus' master branch yet, so they need to get merged first.

  Thomas


> Anyway, original patch series description follows:
> 
> The kernel Makefiles define the __ASSEMBLY__ macro to provide
> a way to use headers in both, assembly and C source code.
> However, all the supported versions of the GCC and Clang compilers
> also define the macro __ASSEMBLER__ automatically already when compiling
> assembly code, so some kernel headers are using __ASSEMBLER__ instead.
> With regards to userspace code, this seems also to be constant source
> of confusion, see for example these links here:
> 
>   https://lore.kernel.org/kvm/20250222014526.2302653-1-seanjc@google.com/
>   https://stackoverflow.com/questions/28924355/gcc-assembler-preprocessor-not-compatible-with-standard-headers
>   https://forums.raspberrypi.com/viewtopic.php?p=1652944#p1653834
>   https://github.com/riscv-software-src/opensbi/issues/199
> 
> To avoid confusion in the future, it would make sense to standardize
> on the macro that gets defined by the compiler, so this patch series
> changes all occurances of __ASSEMBLY__ into __ASSEMBLER__ and
> finally removes the -D__ASSEMBLY__ from the Makefiles.
> 
> I split the patches per architecture to ease the review, and I also
> split the uapi headers from the normal ones in case we decide that
> uapi needs to be treated differently from the normal headers here.
> 
> v4:
> - Most patches from the original series got already merged via the
>    tree of the individual architectures, so the amount of patches here
>    has been greatly reduced
> - Rebased patches on top of linux-next, fixed conflicts and new
>    occurances
> 
> Thomas Huth (9):
>    alpha: Replace __ASSEMBLY__ with __ASSEMBLER__ in the alpha headers
>    arm: Replace __ASSEMBLY__ with __ASSEMBLER__ in uapi headers
>    arm: Replace __ASSEMBLY__ with __ASSEMBLER__ in non-uapi headers
>    hexagon: Replace __ASSEMBLY__ with __ASSEMBLER__ in uapi headers
>    hexagon: Replace __ASSEMBLY__ with __ASSEMBLER__ in non-uapi headers
>    uapi: Replace __ASSEMBLY__ with __ASSEMBLER__ in uapi headers
>    include: Replace __ASSEMBLY__ with __ASSEMBLER__ in non-uapi headers
>    x86/headers: Replace __ASSEMBLY__ stragglers with __ASSEMBLER__
>    treewide: Stop defining __ASSEMBLY__ for assembler files


