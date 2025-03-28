Return-Path: <linux-kbuild+bounces-6366-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C80CA7480E
	for <lists+linux-kbuild@lfdr.de>; Fri, 28 Mar 2025 11:19:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D9D73188D85C
	for <lists+linux-kbuild@lfdr.de>; Fri, 28 Mar 2025 10:19:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0DC291D7E21;
	Fri, 28 Mar 2025 10:19:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="E8GF7uWT"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBC3E213E66
	for <linux-kbuild@vger.kernel.org>; Fri, 28 Mar 2025 10:19:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743157161; cv=none; b=OyEowJ4PMi3orelnmHFq4yG49uGLCkgK4ZlGIkJP4gWXbgbJenYAFmORhZrIibQ8GLRJCtMuFjVdYL1lRGy6/ajumiKf35/ohHK34NrUvc798SfnJSGcwcPkJIJ1S0LtDCoEKkKsg0SJxKA50G9J7LabyULugvR+PSkhH4G9s7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743157161; c=relaxed/simple;
	bh=jz3aY36o7j1FfklzKk7CT65RWrvPbaWXJsL0lBphTq8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tWFwTuHlhJHaWbX8qV5Sr7p0Y34x8q+LqMkBC+k4mMve7U11bWatKiYR5ovFeP7HEkdEwohJxaTP+5jiiHGb4r0nDuDMzHkkSjqrpwejukfAqSKwY+n75899GvMRDvWtn9mt8kbAHkLLyzNAezf75eC9TU3i5BySag2Jq7XCg9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=E8GF7uWT; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-39c0dfad22aso218920f8f.2
        for <linux-kbuild@vger.kernel.org>; Fri, 28 Mar 2025 03:19:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1743157158; x=1743761958; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=N9MH3GUSx2ijDFw2/8FoaPDcqum1gfQzhI04q7LblUM=;
        b=E8GF7uWTGxqUjEWMfSmDSS3rJjt3jyH93E+/BM6TVih7IUflhe4ze+rs8vKhgnlnRT
         QhQ+smgfFQhIbfcdb6bORnzPMQ/wnjHrgkeSILfS+8PGYKUzaREZR0XN9XzHeznFFJxj
         C/2ASr4umOr6wANC3tFm68v+scibSL/gU3HCAfgcN01iYHIYHfkIqWdnytjzaOwJKy6D
         ZPXlBoCqwJ27fuxxoC0EWXw1aBEZoBdP2xsXY74rNH95n3LUo7DBunD+VrVioqhILLaM
         Uisc4A5rSuyE1jUomoo30GN2pJVuU1ctJVATLQEoBacdwDbZiYAVRIHNJZYXD5IvfZud
         bSIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743157158; x=1743761958;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=N9MH3GUSx2ijDFw2/8FoaPDcqum1gfQzhI04q7LblUM=;
        b=BiOaTmiQcJJmuuQ81XvoTpZ+/gP4k+HCgbJM17wHl26pPzg/Wyx1bGcFNBshVqaVyJ
         f475Q8A8PNg1dmR4KUsBaC3CuNmagBgbgrEnBYDiYzaEDtGQFhshYzyzOtHZXbQKPhPP
         7v/hk82K42i+oN+8HQXr+wQv2CBQ8CQM6ck+1Bm/S4KYybVVcHv/2RBr4bD68R3Jze+j
         C6jSFfQqKnWf5IuYWFrC6hB056HS8VluQP2JJRkfh0CpRmypzwIAlK1HNWwW6mAshl2n
         rFwOge+wJwZ8eWP5kYIWL0143zWMjVeR07Xn6wis8IURJM5Xo5aUAQYqg/WFnbSiO0kO
         WQMQ==
X-Forwarded-Encrypted: i=1; AJvYcCUexNbWZ0ihJ5CsRWnU9AyoSvpfaIlvNTTZtw0Dr9O5QUWuZ7+appU9c8t+wqbLpRF4WEX539KasUbEGT4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxa2LBdfV+mlUoRpHpU98EifemkiENbWiX2Wkx03QsD2KRut1iC
	R7+JKmb1G8QxI4T08dnJdlsmlcZqTtBgbJLHIAoODiJjb9lz2jYrHO2vFkSRDfk=
X-Gm-Gg: ASbGncuEDDK7ikNkFHTMvk/pEI687ckKiDmNTHMJ6rUoO58bmU4okSCYEJ+JddQmHKS
	geYuEPK117e8Co0UgZK2K4DLnB+/5RH5wLLeBbDWGYh+UjXQ9CUu+93RFhXsst74z5TzTBtsSL8
	LwtHXTmqgTRa7rifnsp1iFvJYBcH/8NrQljKWv+bNla2h++VqUkmfTlF7yPROLu4GvyAPoC7lau
	V3dlWh9mpmrCuYCQtsa7PIbaKZHLxgzzFCH172rTIQU773rMyHYkE2NfEEa+YeRuNLD661TX+xm
	ZbPAJu2s4yvfIWIzJR++BGZyCZL9baPdcz08JQY8lfAAvAw7aSkDsELniFA=
X-Google-Smtp-Source: AGHT+IGJKr46cfNOSniY/dCUZeCweOop1DoiisSS7BUAqfPuL9uBmcKmHfMWxpVOpa84DymztwUNqg==
X-Received: by 2002:a5d:59a8:0:b0:391:22a9:4408 with SMTP id ffacd0b85a97d-39ad1749fdfmr7315210f8f.16.1743157158044;
        Fri, 28 Mar 2025 03:19:18 -0700 (PDT)
Received: from [10.100.51.161] ([193.86.92.181])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d82efe389sm65412055e9.19.2025.03.28.03.19.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Mar 2025 03:19:17 -0700 (PDT)
Message-ID: <3e52d80d-0c60-4df5-8cb5-21d4b1fce7b7@suse.com>
Date: Fri, 28 Mar 2025 11:19:16 +0100
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] kbuild: deb-pkg: Add libdw-dev:native to
 Build-Depends-Arch
To: WangYuli <wangyuli@uniontech.com>
Cc: masahiroy@kernel.org, nathan@kernel.org, nicolas@fjasle.eu,
 linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
 samitolvanen@google.com, zhanjun@uniontech.com, niecheng1@uniontech.com,
 guanwentao@uniontech.com
References: <39FF69551D01924F+20250326174156.390126-1-wangyuli@uniontech.com>
Content-Language: en-US
From: Petr Pavlu <petr.pavlu@suse.com>
In-Reply-To: <39FF69551D01924F+20250326174156.390126-1-wangyuli@uniontech.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 3/26/25 18:41, WangYuli wrote:
> The dwarf.h header, which is included by
> scripts/gendwarfksyms/gendwarfksyms.h, resides within the libdw-dev
> package.
> 
> This portion of the code is compiled under the condition that
> CONFIG_GENDWARFKSYMS is enabled.
> 
> Consequently, add libdw-dev to Build-Depends-Arch to prevent
> unforeseen compilation failures.
> 
> Fix follow possible error:
>   In file included from scripts/gendwarfksyms/cache.c:6:
>   scripts/gendwarfksyms/gendwarfksyms.h:6:10: fatal error: 'dwarf.h' file not found
>       6 | #iIn file included from nscripts/gendwarfksyms/symbols.cc:lude6 :
>   <dwarf.hscripts/gendwarfksyms/gendwarfksyms.h>:6
>   :      10| :          ^~~~~~~~~
>   fatal error: 'dwarf.h' file not found
>     6 | #include <dwarf.h>
>       |          ^~~~~~~~~
> 
> Fixes: f28568841ae0 ("tools: Add gendwarfksyms")
> Signed-off-by: WangYuli <wangyuli@uniontech.com>
> ---
>  scripts/package/mkdebian | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/scripts/package/mkdebian b/scripts/package/mkdebian
> index 0178000197fe..25edee97fff7 100755
> --- a/scripts/package/mkdebian
> +++ b/scripts/package/mkdebian
> @@ -209,7 +209,7 @@ Rules-Requires-Root: no
>  Build-Depends: debhelper-compat (= 12)
>  Build-Depends-Arch: bc, bison, flex,
>   gcc-${host_gnu} <!pkg.${sourcename}.nokernelheaders>,
> - kmod, libelf-dev:native,
> + kmod, libdw-dev:native, libelf-dev:native,
>   libssl-dev:native, libssl-dev <!pkg.${sourcename}.nokernelheaders>,
>   python3:native, rsync
>  Homepage: https://www.kernel.org/

If scripts/package/mkdebian is updated in this way then I think
scripts/package/mkspec -> scripts/package/kernel.spec should be adjusted
as well for consistency.

File scripts/package/kernel.spec contains:
BuildRequires: (elfutils-libelf-devel or libelf-devel) flex

elfutils-libelf-devel is for Fedora/RH distros, libelf-devel is for
(open)SUSE.

If I'm looking correctly, a new dependency to make dwarf.h available for
both would be:
BuildRequires: elfutils-devel or libdw-devel

-- 
Thanks,
Petr

