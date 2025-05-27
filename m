Return-Path: <linux-kbuild+bounces-7297-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A2577AC5177
	for <lists+linux-kbuild@lfdr.de>; Tue, 27 May 2025 16:59:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 19AE43A129A
	for <lists+linux-kbuild@lfdr.de>; Tue, 27 May 2025 14:58:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5830E278E62;
	Tue, 27 May 2025 14:58:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="E0sBSGU7"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B63A919005E
	for <linux-kbuild@vger.kernel.org>; Tue, 27 May 2025 14:58:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748357933; cv=none; b=QDmhtVuLmPd9LjaR68+lWn0EU41qvY0fFCQPvgAY+aZgPY+eqyfJRhUlYT4iOcSeUGhAUiRmGY9j2dSjiYUe2yvlzAikSkB6AIXQpwhQm0j7QfSvZdBxQ4s/HM4hhCLVky9GLVzLKHGy1+7zGrpfUnM3S8NhjatrF/0Odq3I04U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748357933; c=relaxed/simple;
	bh=msfafbvKH8k+6WrHApRJMu1ZHQUoHobjRRMKVSbWuVM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GJxdUSmn9sxxtursse5xsHIxHeQky2G3EoWVYQwtoqULvstp1TMibP/whsX/fXDSJoFx8Pmbm4AuaF1uML2nuyDTMmyKMBzlbXGhIX0p8rJrZRg7qQ/O0zCl2BFk9J53/M/FG2nWj1BX0Tmz1kWo/QFq9kb1JWmc9laQygeUvKA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=E0sBSGU7; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-604bde84d0fso2961992a12.3
        for <linux-kbuild@vger.kernel.org>; Tue, 27 May 2025 07:58:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1748357929; x=1748962729; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Xn/HpegMj8KBA7WUvuVnYcNPpUCOy6S5/PQDziNope8=;
        b=E0sBSGU7cZdsRIMiHupdAEb7/+qLB3YoqYVSPfTJG17Ry0oj/fV58mTPzNPKhoxOin
         Dhqs7BZ+GnJHcTj7/F9C4iVZmaerMZpXyBZkkL6pVG1NEuDCoMxb41fWxpmqlQgegjqo
         YLRfKaVCNZkwrlNQ62YE1vbU2ZtgmLn58EwU8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748357929; x=1748962729;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Xn/HpegMj8KBA7WUvuVnYcNPpUCOy6S5/PQDziNope8=;
        b=Y9LDKAjX2sYE5tMYo8rECE2mYTclM3T6BHVvQb2uDwKH5HsngB+t2MD6MWWfDjQsRn
         Qp/9LpsqRjip4dCCOTaWNbUrbFCO+VQ8yS6CQdh472+d+FLMG6dnyxNlivbxd8n8YWkf
         PMbUmoecj1s9FrXgIwVej6dA0/QmsMNBm0cyd4+kaN0mBkc6XFntTPwysIs/fGrZsNBc
         0MJ8FvIhAFQ5kcwwy+FGCcH6/QVTElz2enAnx3SeoV6fZUwK+TJeDjqMzts/Ni9N3QDM
         j+oSY496CY96UHMb7k+z2M+KsSZWnyiR4mhAcP8vdUUS7bH2sJWgtSS7puRw83H1bdjS
         ttnw==
X-Forwarded-Encrypted: i=1; AJvYcCWHJla+7kFta/OClwyGE7zOI64rf8nD6UBQQTGbGxNu4RGiOk4Yp4x2b3R4i5YYK1IgbrsIzBzhU3yOceI=@vger.kernel.org
X-Gm-Message-State: AOJu0YyXS+wsps881qNuBxGWMqOdp8ezveO/tIjsWmWkUMGZDPkCVeUz
	r9OC/fqEzTLxFHRnQP2I9VRflgC8xQ7bL1KTq/IBrVVdEOKqO+iRoE9arzgkNMNz2NFUpNBlf32
	iyerQFnE=
X-Gm-Gg: ASbGncsmTPjM/cV56GrfZ+8rXHVFZG50luofYb1M95rEX1zIlwmakug6xyxCqEj6Bt6
	r/uZwl+HOB4ZJQhdMtzaU8Bn8X0AwU1lD1yDYPx4+1Nm2ZQ2DutXSjP81paE4s7yqI0VnjY7FNl
	BjZC+iacrUPZVam4FyB60w1QFbToq+qPAnsV2eNshFX9dwUysyMWdV6D1gQfgWo8VHYVjoiQngl
	H3O1Mb/1Cx0HLOIGWLTkPKRigyItgRDSU7QkBDR/9ckHO9chm8gEASR7CCoxWpinEui3/IxEspe
	/y1sh8xqhm4GfJr+jSCW0CMqeY7kZoxyiB8jmfeZYvBqYpvDDjoBu4KVEEb26F3nRaDAB6ECvko
	C7Yze/uMNmqHA60cLs5ZdafCtIg==
X-Google-Smtp-Source: AGHT+IGNeBOUHICgM+3+yedaJktrSZ8o+Cae/Ql6kHLRy/O+XxamB8mKaJjE3Wt1kCR9iuaELRwK6g==
X-Received: by 2002:a17:907:d644:b0:ace:d710:a8d1 with SMTP id a640c23a62f3a-ad85b14e20emr1139178166b.24.1748357928781;
        Tue, 27 May 2025 07:58:48 -0700 (PDT)
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com. [209.85.208.41])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad52d04e674sm1850386266b.24.2025.05.27.07.58.48
        for <linux-kbuild@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 May 2025 07:58:48 -0700 (PDT)
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-604b9c53f6fso4113954a12.2
        for <linux-kbuild@vger.kernel.org>; Tue, 27 May 2025 07:58:48 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXsVcUUcPfPjEUNvu9oC6mkZxtgVrY5A1VA0mke3n11K+uNQdpu5YkmXoqv6j7AmhMDrcqbT2XA5WaEBQM=@vger.kernel.org
X-Received: by 2002:a05:6402:350e:b0:601:89d4:969f with SMTP id
 4fb4d7f45d1cf-602db4b1b2cmr10652767a12.32.1748357927364; Tue, 27 May 2025
 07:58:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAK7LNAQezLBpYLqJ+=ONqoYKwdaw0_eywN9O26LTnifGq_g+tg@mail.gmail.com>
 <CAHk-=wg2YAc1TrqWB9HhKDWHGzrqeP9=uiW9hzU5p1oApcdAKA@mail.gmail.com> <CAK7LNARY48483tOLUf01-d_VnQh+K=-e+SLEeAqMaZfZC0YjLA@mail.gmail.com>
In-Reply-To: <CAK7LNARY48483tOLUf01-d_VnQh+K=-e+SLEeAqMaZfZC0YjLA@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 27 May 2025 07:58:31 -0700
X-Gmail-Original-Message-ID: <CAHk-=wiSDWVRT6A1cTkzVFaodhnVPmbtnDtaOe573y=HsDHkzg@mail.gmail.com>
X-Gm-Features: AX0GCFs_p7G6msogOW1YvWXgUShzebeCrbjAaYZ9oPQ1gVzmAtgd8KBOQ0T1aqs
Message-ID: <CAHk-=wiSDWVRT6A1cTkzVFaodhnVPmbtnDtaOe573y=HsDHkzg@mail.gmail.com>
Subject: Re: [GIT PULL] Kbuild fixes for v6.15-rc7
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, 26 May 2025 at 23:28, Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> However, building the kernel in Fedora 42 is 30% slower
> than in Fedora 41.
>
> So, maybe, this is because you recently upgraded your OS to Fedora 42.

Yeah, so that explains all - or at least most - of it.

There's probably a small amount of "the kernel keeps growing, so build
inevitably slow down anyway", but yeah, it's probably just the slower
compiler that is what I notice.

Thanks for checking for me,

               Linus

