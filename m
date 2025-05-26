Return-Path: <linux-kbuild+bounces-7261-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DD196AC3B28
	for <lists+linux-kbuild@lfdr.de>; Mon, 26 May 2025 10:08:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2E2B3174553
	for <lists+linux-kbuild@lfdr.de>; Mon, 26 May 2025 08:08:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B283B1E492D;
	Mon, 26 May 2025 08:08:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AZdUq+2D"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-oa1-f49.google.com (mail-oa1-f49.google.com [209.85.160.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E4DA1E1DE0;
	Mon, 26 May 2025 08:08:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748246901; cv=none; b=nT6yoinAgxOovoyBgaCWITLhNfPfkjRHNavHttTEZwb27aO+/+WEjEL1Y8vsRcH1Oi0q7oeodWhJ+ppZ7TPOuqmHNx7RRq/INjVADOlqGzBqg8I9fFLdmkJlQ1UTOLDoZzEtxn6NhSlqRE1mwf2++o4CZYpLYUFJRtmwrJi/JLc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748246901; c=relaxed/simple;
	bh=8Q0TqPpgyELDBtvVUMwLRgpXMyfs4Zf3sAWQ0I20ce4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fNYedgBtZLmiwkeZdc5hHnthoI2h8oksxwgRpb9m/76f70cYP6/qHWBzvj4hseHgILjBeYYGTNtrC3hHePBf60mzJwWNQY/GefD6NzMdyO1BcU9mYsWixnNgwwPR3ITeG3RDEMFBZmUjoJsbb7fsyzM91b/IxMc9ZCipLlnrEVU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AZdUq+2D; arc=none smtp.client-ip=209.85.160.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oa1-f49.google.com with SMTP id 586e51a60fabf-2dfe2913a4bso483543fac.1;
        Mon, 26 May 2025 01:08:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748246898; x=1748851698; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8Q0TqPpgyELDBtvVUMwLRgpXMyfs4Zf3sAWQ0I20ce4=;
        b=AZdUq+2DGx2DjWCYnI8AS7Nh7loMsjW6gwh5QXnQQvaguK3y5iLh4FPGOZAibBEVce
         zdk3069erDD06OG2Wk6qAlr+Cvh/vJxSthrFXJ02I0f6uj8BGBx0MoPvrsB8iaimx2bi
         1iNdJo7Lu9CcrbtpOOaK3/bpixqqNHlpBMRHXfLnek+LbN5tQGrp3emIJhkMZ+bdkTBR
         h1q1LeHG7VvzvSxhhIQ42wFYzAF/7HhVHRJlAVkcm/9Y9LHP5huzJsPVIFndcakWklKZ
         42jf+uLIjT2NJyKFD+cEKdTldzqX95X2CkdIM+Cpingt4MhP0/svzihKjMaKrFFaozQL
         5tuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748246898; x=1748851698;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8Q0TqPpgyELDBtvVUMwLRgpXMyfs4Zf3sAWQ0I20ce4=;
        b=ZKzpHQ7JLxChp/zJe2aRa4cLIQmzBPmqH10UOKcHJtvUrWltU1TUH/6AqZY3+F93M3
         1m86tyyhkSIBaRvAvwg+EhRFzihmR2Zvh3HeduCcq1bms1liHeQG+plVxevO7NoBfNNR
         B5yh3m38LCg/TCxmbxb+OBrCD8RJD0J0VhLAFGzISkM8VnlEvp8sE2EGQ+6YAC124dT9
         UW7eGqqXMES3TpY5t2T6j0HLSbquCLgvZpbRHB80FUuhKtZEfnmokms0zYKVjJSPlr3t
         w8myVrXulq53MsiiWARkPCpXA6tvzlhZtfvEpxBfVO2pIz2zJPaE3RNghD/6taRFemUB
         PIug==
X-Forwarded-Encrypted: i=1; AJvYcCWelnr+e+/hjKMkjndmk2VpS7qwmCOIPqyBFvAw9e6h59lwMDEs+tmYQb0QfsOmvI6CeS2GC7i8E3CUTTY=@vger.kernel.org, AJvYcCXvjrFHw8D1VRMu57BajZ7ZUQupfPC7cLrvpZO+qA4hwxEhBatxjlGLPuplqMU4j7Lfgk0qPNDMlN9tZnBe@vger.kernel.org
X-Gm-Message-State: AOJu0YwmOOo0Kk8A1VqKdkW0aD3sYEPjHLBEK8oiwiwH/8YXtwCAb1Um
	J94nY+CYwB2OZZCCkzZGjehupznLqfTHQG39/Kd7e7ysB5J/CqqfG7pW7IhcqjXOLou553nXnbt
	EPEGX3mKUMl8lT1g209+UawTV0qpfLj8=
X-Gm-Gg: ASbGncuLqMoF1XFE9UWR5gvotLz5R0mxK1Pi9ScPdOn8XnBbysfzDC9y69z++TB/1mW
	Wpv/6abPX9qBA5jG1vZ6aYymnnSys6yh1T84WdaMBhjSIZJAoSwY/Kt+eDiHIH8rhwyEfIYcYiY
	4TnchVI+d9TtfSqSXnpKmdojjfmJdHJ3M=
X-Google-Smtp-Source: AGHT+IGxNiJ2JN9yQaaNmhzBJ4exMZFiM1orR0HsJgV8LTuslVDwxXw8qKaRDg0MyPI7W9BYifpPey/SXK/CXMI1Uig=
X-Received: by 2002:a05:6870:9126:b0:2d4:ce45:6993 with SMTP id
 586e51a60fabf-2e862051001mr3658252fac.30.1748246897938; Mon, 26 May 2025
 01:08:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAGG=3QU5Yi2AfHS_poi8SgmatedRg-X8Ct74FOCJUc9iJNPnhg@mail.gmail.com>
 <CAGG=3QVw5+4-7f+gMJSanb0ixC=SujDQyA1=CPRvR+a6+c0U_Q@mail.gmail.com>
 <27de0526-0b19-4e14-8c51-1e8b0ddcf490@gmail.com> <CAK7LNAQAoPhZrbY=5iBSCxWegSaoqsdtY=3zK+u+ZrgevidAsw@mail.gmail.com>
In-Reply-To: <CAK7LNAQAoPhZrbY=5iBSCxWegSaoqsdtY=3zK+u+ZrgevidAsw@mail.gmail.com>
From: Bill Wendling <isanbard@gmail.com>
Date: Mon, 26 May 2025 01:08:06 -0700
X-Gm-Features: AX0GCFvABg0Oy4QBciPdw3oAuT7SDVaQ11met7fEnftYSd7Nx1ImszWK7jvl_w4
Message-ID: <CAEzuVAdu3bDXUGgi4U-XY4dRmBxKaCA_OjKrvK-2ftOWWwVEYA@mail.gmail.com>
Subject: Re: [PATCH v3] kconfig: check for a NULL pointer before access
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Bill Wendling <morbo@google.com>, 
	Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, 
	Randy Dunlap <rdunlap@infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, May 24, 2025 at 10:08=E2=80=AFAM Masahiro Yamada <masahiroy@kernel.=
org> wrote:
>
> On Sat, May 24, 2025 at 9:49=E2=80=AFAM Bill Wendling <isanbard@gmail.com=
> wrote:
> >
> > The call to 'prop_get_symbol' may return NULL in some cases. The if-the=
n
> > statement accesses the returned value without cheecking if it's
> > non-NULL. After inlining, the compiler may treat the conditional as
> > 'undefined behavior', which the compiler may take the opportunity to do
> > whatever it wants with the UB path. This patch simply adds a check to
> > ensure that 'def_sym' is non-NULL to avoid this behavior.
> >
> > Signed-off-by: Bill Wendling <isanbard@gmail.com>
>
> Same reaction to this patch
>
> https://lore.kernel.org/linux-kbuild/20250212154537.235297-1-ant.v.moryak=
ov@gmail.com/
>
I apologize for the whitespace problems. My mailer is crap and
sendmail isn't available on my local machine (it's a long story).

> Please attach a test case
> that causes a segfault with NULL pointer dereference.
>
I don't have a testcase. I discovered this while working on a Clang
feature to isolate paths with undefined behavior. (GCC already has
this pass.) The compiler notices that, after inlining, the path has
UB. It's not necessarily important whether the current compiler messes
up the code path, it's more a matter of *when* the compiler will mess
up the code path, as marking UB paths as "not executable therefore not
executed" is a common trope for some compiler developers.

-bw

