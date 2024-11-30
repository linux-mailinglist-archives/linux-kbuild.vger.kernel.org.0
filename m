Return-Path: <linux-kbuild+bounces-4915-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E755B9DF36D
	for <lists+linux-kbuild@lfdr.de>; Sat, 30 Nov 2024 22:57:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A525A162D01
	for <lists+linux-kbuild@lfdr.de>; Sat, 30 Nov 2024 21:57:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0CB4D1AB51B;
	Sat, 30 Nov 2024 21:57:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QWbDcF63"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5491678289;
	Sat, 30 Nov 2024 21:57:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733003846; cv=none; b=dZIVsWROdnjzwmu/aPUFYSDeoI2+Z0qs7LGh/eSYyPP/NZ3rNdWKib8S1lEpmL9e0kt2TrjoVUxQS2TlyTMfmCC/O67eSjW/OU0Bue9JOXw/8btzz98Id6aNuojBFlI/H2IypXaRdc6WMSFD6Imw3SKgLWGzKrW6rJzR26T1yik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733003846; c=relaxed/simple;
	bh=8d9+ZC2UNgmW7pF/OzF/cLqFMrxEEFUs3K4MZtQs+mU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EmCjkHOhJ8uwBWQ93+OcZBG4u0XpWqYdhEpJy4OikNFm/AIz8KAoM5eqPTgUZCEMTPCN+txm28Gsf5G+tFyeLjVWK4bW2dM73SRhRVADZ8BG4/gVbq6h1twFVKHNvVU8A9Pc8EHaj2Sz6T3zlvKaruUg1NLRNLzdyUv3lg5F2cs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QWbDcF63; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-2ffd6b7d77aso35123531fa.0;
        Sat, 30 Nov 2024 13:57:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733003843; x=1733608643; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=uGEPgK23Bdrwl2JsSWhYpHiR3o7eS7/Jj/14r1qDnGo=;
        b=QWbDcF636QaOitGXK00p//+M/Ul/gmvimCvF2WahmMZ8IbzJhEkVQwh6rqwVXctVNF
         +AkSJ65uNEN4FvNdaPSsoTtoWJ86kbxOZ2CevybSPsPyninwRhqYIEWZS3UEKXH0gyzZ
         dINopbNumy2SCjVB6cINyldDYzGsd5RMxLINhFRVC2I0i1/E6F5jRgZDUYagCHm/rLdH
         6nmoR+Eu6hhV/sVk7llj3neZjzxWhLTCMIfvZFu0VkMmJD58oTv/xqeGM4yqHeuDQcDm
         B4UcMXcsl9FsLtb6STWLMQNptBomlk5SrCsrLTVFYxT2JW4FIKqjxfG7DfwqGfcB8PCv
         BiNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733003843; x=1733608643;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uGEPgK23Bdrwl2JsSWhYpHiR3o7eS7/Jj/14r1qDnGo=;
        b=ubSNrx4oAE4ymse9EN/nOuOtlOprRV22K2qsQQSB35jHbCRxJNSVzuGKuQQ/Rrcwyz
         GJE73jtd/Ydmll2pC7lVLIim2BQp/vz7hoK8ehF9jbjzYl2AqZtBcqMZr5i/crxW9pZZ
         uLZHnComKytY/dzXVRnh/FcwMDzQv7lzK0BVglCajI1WtUNBdLOZD+UzeBUmScPLq5l5
         KfAmNjnY5dnU0pQjXivhmGfU336AHZiVG9gNk9q5ml3xVNkFYJme1eompoqYtaZTT55N
         /PPMjCOuabsO2qv1ovE839WaQ/smlg1OQd0EVRANJqAEnjs2eutJ9ztJoursTSRiCq8D
         38sA==
X-Forwarded-Encrypted: i=1; AJvYcCUGji6UtrUjySr+llNfbxUQ1YMwDp7lQfP1JqdNwx1+s8Dn0c99issOgtGn5wPOZpRkQvBsTI8KtSK9MZwe@vger.kernel.org, AJvYcCUbNttuvFw/U/wF1NWXGnFxMh+2BkhGS+B3QvGvyHm7aehwOcVnmPY8tQyl3WsIs+D2qBqw+dJbCm1lY/A=@vger.kernel.org
X-Gm-Message-State: AOJu0YwWukfEKC3sf05hBlV8P7JvCb8AsRa7bwPwduQhB+RfEFoSK4cJ
	trjAxGRnvvdE3YMaDnKRdTFh+1QRJBsMxtqR0QTzgyzJCznnpEHhdCZ1nWVobeaZemOlsjFC/t7
	Nit8sF38J+JV79BPPwmUTGUYGrkjRPTGB
X-Gm-Gg: ASbGncu8cHC80ANg2jGC7Q0qc9CeMJUzrGYCFDEojShKAEGspuYjl9gjZMIJyI7iBin
	fbA7zcFclOO7SHhIWNHBseXnq7mu3eBC2K0vnsIX968X8IqPe7rVg9rQD9ZYq
X-Google-Smtp-Source: AGHT+IFXy9Yqe/aqOfArMxWakexmUIox/kZJbqPNLfYdL18sM3qZP84f2dUg6XEwef13AsIFFGVNAh5VCr0lsdTkW9s=
X-Received: by 2002:a05:651c:508:b0:2fb:3bc0:9c7c with SMTP id
 38308e7fff4ca-2ffd60e1774mr104700831fa.25.1733003843152; Sat, 30 Nov 2024
 13:57:23 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAK7LNAShSZrZh_-0wpUA2=FpnomQTBzhxY2bJbGwkYf+kyTzLg@mail.gmail.com>
In-Reply-To: <CAK7LNAShSZrZh_-0wpUA2=FpnomQTBzhxY2bJbGwkYf+kyTzLg@mail.gmail.com>
Reply-To: sedat.dilek@gmail.com
From: Sedat Dilek <sedat.dilek@gmail.com>
Date: Sat, 30 Nov 2024 22:56:46 +0100
Message-ID: <CA+icZUWfmiYZjLRsGC1JoOSyuAzDLBVT+wujqESYoQVA_QZcrw@mail.gmail.com>
Subject: Re: [GIT PULL] Kbuild updates for v6.13-rc1
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 29, 2024 at 9:22=E2=80=AFPM Masahiro Yamada <masahiroy@kernel.o=
rg> wrote:
>
> Hello Linus,
>
>
> Please pull Kbuild updates for v6.13-rc1.
>
> You will see conflicts in two files.
>
> [1] arch/powerpc/Makefile
>
> This is caused by:
>  214c0eea43b2 ("kbuild: add $(objtree)/ prefix to some in-kernel build
> artifacts")
>
> The resolution is provided by:
> https://lore.kernel.org/all/20241113095228.4ac96776@canb.auug.org.au/
>
>
> [2] tools/objtool/check.c
>
> This is caused by:
>  315ad8780a12 ("kbuild: Add AutoFDO support for Clang build")
>  d5dc95836147 ("kbuild: Add Propeller configuration for kernel build")
>
> The resolution is provided by:
> https://lore.kernel.org/all/20241112130136.52ffc457@canb.auug.org.au/
>
>
>
> Thank you.
>

Hope this pull-request will find its way to Linux v6.13-rc1.

Best regards,
-Sedat-

