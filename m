Return-Path: <linux-kbuild+bounces-5333-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D42D4A005CD
	for <lists+linux-kbuild@lfdr.de>; Fri,  3 Jan 2025 09:34:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AE849162E76
	for <lists+linux-kbuild@lfdr.de>; Fri,  3 Jan 2025 08:34:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4BB8F18E361;
	Fri,  3 Jan 2025 08:34:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eHoeJWCJ"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8658F17BA3;
	Fri,  3 Jan 2025 08:34:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735893281; cv=none; b=MTPr7frvDrIzjUnzYYrIIbavw66zL7F5PXuwynuAHsH1hheGZHNriUecQzOwpyOh+r2TwB/38EdlYvBD9TR9FfQPSRWtFNKkR+v1lNMFY7AcvbjHFFvxQDKugYFgEWkiEfIaqEQhRbyVP9pMasWOo6YTM8U+l96pZqYsNyy/j5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735893281; c=relaxed/simple;
	bh=HXLXr0Zi6tqsPZHbAV9keYyA9cCLiDg8INk1nrOkL1I=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HovDwtpqEYKFCXidG/k9PMoEN6d+yxJsC10SRif43dcsVlQEpXdcAY2vQLJlaBP2LgJXZ/RmPW3Aff4sU+XVlf+MbkJNEXVLMPfpnIpqjS1qE1RFNwLXqBfhNglsTvnpmS7inCUjByE2er8J2tq09bxu3aFJQJ8HfLju9SgnbTk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eHoeJWCJ; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-436249df846so83218455e9.3;
        Fri, 03 Jan 2025 00:34:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735893278; x=1736498078; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gIc+W09onoMHz1IGQMDTgvqrKgReJ0Ar91k+Z6S5yrI=;
        b=eHoeJWCJlWU8VUZK5ShjGsmkStQtqpAg2ROdT9vuxxcAIskCNPrC8ZfXBWxb9snsIj
         LA8IeEsnWwzW9W2kOWn4G62rTpY/WEkbMs8KLM6hL07lwqXlSofnybWwTsWWfsCyqkoX
         3K1N/k79fQfPlNuwEZF8A/RThGeuQkRCOukg4nI46/BmqFxq6XjG4q9XwTCnQmp+OXEj
         D8XrmLC+G4sn/mGiMO6BjIwhnhE6s7Z3OVZrteIFLzEOEjWVxdiSalX5Q9ocbkppDWjF
         mP4LrgyRuJVoN/pEuQcLVc6lAemXdO2XD91AOqhn5lhCbZG20GQaCR64GNTM3syA0BPI
         jiag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735893278; x=1736498078;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gIc+W09onoMHz1IGQMDTgvqrKgReJ0Ar91k+Z6S5yrI=;
        b=s3UaDB7WrwIvfzGuiTsbZMob2KJh1F+IowrfooVTqjKcloqeGj0f8YNdtNLDE7sUPv
         1Rs5DoRNkSiVV0xVYdDo1qO2cephwGnDPq1RAU9xw1qONKhZj5AEA5GosoRhtW1TVubh
         8fHmYPtmwry4VnYm2agjrzGcdiFKzx1yp76wF3wgE/DmfR5PDrG71wd3Igl74gR6/Wof
         eokBSa7FpIK00Uuz5azdldd9yyF9czEkJGuuCrx8WBsKIhOHrhoPDdfzo6W4iYKf73Po
         coZCrU1gfhze5c8Da/UOW7D44sBnafHWyHzzt/Le+LHNGKRRSWbbipy/AxLJ3rCnzGUU
         QXkQ==
X-Forwarded-Encrypted: i=1; AJvYcCV/YnAI9lNFEh8Lozeyuub9ifk6FidZ5B8c7tEZHnjXBk8ONuHql7F+u8qbzbiVjxZRRTJtuMi9GoRD4j8=@vger.kernel.org
X-Gm-Message-State: AOJu0YzEraawxGsrbxx66bzKCbkMuq/2NdGirhVvt0KAV3elCJ2BSClM
	PK4VMWHTQ7f3mKQiegdH5WQOAZjj2S/lAvgNpEATlZIjvRyIakbQ
X-Gm-Gg: ASbGncthop6DIVGaRqEEFwuWfNzPZ54IubVr8cTIKINHt4UsDVRR0Ulm2rrg4Tid3kk
	+XhMCimVo8yRy2H4ELC2O9HQNDAkzIhmadfAu1QtvxLKUMt/swa5RWtz5LsRENZE50Kk9i6wBp4
	0JYycbSxx0ypEN3cz+U0cFeKGjcon7NjsppMuei0DP21+jD2WE9O7VAm6I8De8+3+izzvAize1H
	RuG/+ecLAOB0h6OLcg+22XJ1QLaekdVa3c+BEP+kys0eGzlN1aTWYRrN6tyYTtKncn9L7zs9Tbc
	NZNqmjP1IckXgttwjeI=
X-Google-Smtp-Source: AGHT+IHI8MQmRK3V0JRi7uVTtHdUbQCClzb/MXWCcHi6xYg8KwFuydgk/w6vN9Fy5SeQtTN3DeP9yg==
X-Received: by 2002:a05:600c:3554:b0:434:a923:9310 with SMTP id 5b1f17b1804b1-43668646103mr440292835e9.15.1735893276650;
        Fri, 03 Jan 2025 00:34:36 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a1c8b874asm40113697f8f.109.2025.01.03.00.34.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jan 2025 00:34:36 -0800 (PST)
Date: Fri, 3 Jan 2025 08:34:35 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 6/6] genksyms: use uint32_t instead of unsigned long for
 calculating CRC
Message-ID: <20250103083435.1785f86e@pumpkin>
In-Reply-To: <20250103073046.2609911-6-masahiroy@kernel.org>
References: <20250103073046.2609911-1-masahiroy@kernel.org>
	<20250103073046.2609911-6-masahiroy@kernel.org>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri,  3 Jan 2025 16:30:43 +0900
Masahiro Yamada <masahiroy@kernel.org> wrote:

> Currently, 'unsigned long' is used for intermediate variables when
> calculating CRCs.
> 
> The size of 'long' differs depending on the architecture: it is 32 bits
> on 32-bit architectures and 64 bits on 64-bit architectures.
> 
> The CRC values generated by genksyms represent the compatibility of
> exported symbols. Therefore, reproducibility is important. In other
> words, we need to ensure that the output is the same when the kernel
> source is identical, regardless of whether genksyms is running on a
> 32-bit or 64-bit build machine.
> 
> Fortunately, the output from genksyms is not affected by the build
> machine's architecture because only the lower 32 bits of the
> 'unsigned long' variables are used.
> 
> To make it even clearer that the CRC calculation is independent of
> the build machine's architecture, this commit explicitly uses the
> fixed-width type, uint32_t.
> 
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---
> 
>  scripts/genksyms/genksyms.c | 15 ++++++++-------
>  1 file changed, 8 insertions(+), 7 deletions(-)
> 
> diff --git a/scripts/genksyms/genksyms.c b/scripts/genksyms/genksyms.c
> index e2cd3dcb469f..8b0d7ac73dbb 100644
> --- a/scripts/genksyms/genksyms.c
> +++ b/scripts/genksyms/genksyms.c
>...
> -	printf("#SYMVER %s 0x%08lx\n", name, crc);
> +	printf("#SYMVER %s 0x%08lx\n", name, (unsigned long)crc);

That should use PRIu32, but the whole patch could just use 'unsigned int'.
No one is going to try to build this where 'int' is 16bit.
All the hex constants assume that int is 32bits as well.

	David

