Return-Path: <linux-kbuild+bounces-4899-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 85DCD9DAEF4
	for <lists+linux-kbuild@lfdr.de>; Wed, 27 Nov 2024 22:31:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1E357B20EDA
	for <lists+linux-kbuild@lfdr.de>; Wed, 27 Nov 2024 21:31:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 505CE12E1E0;
	Wed, 27 Nov 2024 21:31:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AQGesUzo"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A8A2322E;
	Wed, 27 Nov 2024 21:31:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732743075; cv=none; b=c3jQmJc8ACAQmDsJUaqbh5BLo2mRTqLeB9jQLq2yUrM4d8UidX7WVMezIigYAXkSR5iyKUkbXlaVbGDdM6pKCW4s1PsIj/VJWeEa1/coDe2YVCEORw7roKed7Ryqz5gfLneY41A+XaanbYlaM0kCKdjy5A1jWOG07fhF7pz8Tzc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732743075; c=relaxed/simple;
	bh=rF0P/oK+/sxgso0hocpUT2X91lu6qi/ELVD9lR33fJI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ly5mScjc2hWWijGOhdnTskoif8A3kDw0ANT/xowjFm1jNWvtNAWFn8Ok4m6Gdl43QYFBG60HZbL9w8rVR9U90/R5LPhJ4fO5FTqzIQgPo1WTvbzIq80mfuAOBGo8efsFt/4rvJluoMgCzFBblnfo/i1Ql75hXbdwkyzJpkB8I3s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AQGesUzo; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-2ffa49f623cso2390901fa.1;
        Wed, 27 Nov 2024 13:31:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732743070; x=1733347870; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O5O2OQSI/S+1vPggQ7mGR0YWzFzwK0obiH3lF7ckWh0=;
        b=AQGesUzoLWaky38CNW4+yqTRzzaB+/aX3MlKjd8etnHnc05Zby+Foq4Zzr0LtuLs9L
         ZUfeRJJF2MXzjFXozKBrvg1MRpm1EXP+RqcEbyxsq1Q1HUDKDen0sH4BnVSlYST7WHMy
         c8M9zQBhw9sw2tAMfR/UJysdV5jlfLEWZ2LF2bxjEtAVfYwybWQ00hHAZEa8qCjeugqy
         fJuekiqndl0s4DA/d+Yiw/oUc3rqm+a6T3qjPi1C61wOoyrGxsyfEa6/JO9WdU4ilVu9
         P7na2KthfC/otCPwD+PhV0eW+7K+8K05yRyGfNtiVBijeh4VW+Ih8yNn9dSBDXfl5ltm
         6TGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732743070; x=1733347870;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=O5O2OQSI/S+1vPggQ7mGR0YWzFzwK0obiH3lF7ckWh0=;
        b=RiwhiTIcOwmmnf4QdXNJ9kCUOBLKd8aw0LMHIEJxgyHnRyfm5yVApV1Xp2S52N080x
         AoATTCVFmRMSoqVeK1/MsBQwH9A1AdHR2zH69qzmKgDsjPj+fhWc+WU2foz9e4ypgADw
         r0SqiGEq9SlJjlH1CrIXOkEk8AmYsjdmL5fwA/CC2fIg+2yLn2wYpXxHdM/KsL38OIiv
         aUwCBt4X1DA2fMkgam1e52fBxQUpgeEeG52TFWAQeSwyIQbZU1BoL7ubb3EQvnBu5Ncu
         rIJ4HvVd0SMKtyXZ4k3FJSAvJx1hyC65oe85zEXrI2ZnEAONQWCsZVnhcV0J151y0187
         9uAA==
X-Forwarded-Encrypted: i=1; AJvYcCUFaR1S99tpL4aSYJOuH7XZCI5DBYfuW1Ztte3e2Sy19okGtsIyUhQbQtpu+vW2T9xLmy/B0P8vQ6IaHk/E@vger.kernel.org, AJvYcCWRaRllF9ZBSpyGPNJnyHfrGHdOjBCRF/A7lUtX2lo1NGTge9DEl++moa4bwSZzrRGsE8O4h7wc9TT4PSw=@vger.kernel.org
X-Gm-Message-State: AOJu0YwabpJ9yuhLsF61iiY9WW0t/1NBEgWl3iZbtbBEmJnJaPg10RhP
	n3nhiBLjiuM+UCFCWP/Vh2DdnnNKPkwVqKOQI8FpAPNQ5shO1seRQQuUz1Cs231AzbGeJDDiXZW
	QrkfJkn0kMcBBze9M93RoFi0xQzVPm8Nf4bM=
X-Gm-Gg: ASbGncstIK8kt/68u7m3hI1sgXSJyC6Jwo2XU74ovRVe8VrWld0arwLeE2Ij+IgsqcY
	AFTU/2XZL7bllTpzrVpNw5ocUG4f7ME/JBG45FDasI7BpQZ2Xlk9zomuQw5Cs
X-Google-Smtp-Source: AGHT+IE2zuvT9nkDbOkC4V4DPtrLpnGENPPXWPjlLLxpz84u8zvf6i2IIIxaivUhcc5ioHZgmzqAMBH3bg2xjXBmhOA=
X-Received: by 2002:a05:651c:1597:b0:2fa:f5f1:2539 with SMTP id
 38308e7fff4ca-2ffd604ca52mr28449861fa.24.1732743070053; Wed, 27 Nov 2024
 13:31:10 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241127162904.28182-1-advaitdhamorikar@gmail.com> <Z0eGY_6e9jVMezxE@fjasle.eu>
In-Reply-To: <Z0eGY_6e9jVMezxE@fjasle.eu>
From: Advait Dhamorikar <advaitdhamorikar@gmail.com>
Date: Thu, 28 Nov 2024 03:00:57 +0530
Message-ID: <CAJ7bep+s04GXoht7MuVDBZ-FsjDXgdVtk11k9ajok8SkoCwH2w@mail.gmail.com>
Subject: Re: [PATCH-next] modpost: Remove logically dead condition
To: Nicolas Schier <nicolas@fjasle.eu>
Cc: Masahiro Yamada <masahiroy@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Nicolas,

> vsnprintf prototypes also indicate 'int' as return type.  What is the sou=
rce of your mentioned findings?
Sorry, I read an alternate vsnprintf implementation and have worded my
patch log wrong based on it.

However there is still an issue that n is declared as size_t which is
a typedef for
an unsigned long, I think the correct solution then is to use a signed
data type here for n?

Thanks for your time and feedback.

Best regards,
Advait

On Thu, 28 Nov 2024 at 02:21, Nicolas Schier <nicolas@fjasle.eu> wrote:
>
> On Wed, Nov 27, 2024 at 09:59:04PM +0530 Advait Dhamorikar wrote:
> > In case of failure vsnprintf returns `pos`, an unsigned long integer.
> > An unsigned value can never be negative, so this test will always evalu=
ate
> > the same way.
>
> 'man vsnprintf' on my system reveals a different behaviour:
>
> | The  functions  snprintf() and vsnprintf() do not
> | write more than size bytes (including the  termi=E2=80=90
> | nating  null  byte  ('\0')).   If  the output was
> | truncated due to  this  limit,  then  the  return
> | value  is the number of characters (excluding the
> | terminating null  byte)  which  would  have  been
> | written  to  the final string if enough space had
> | been available.  Thus, a return value of size  or
> | more  means  that the output was truncated.  (See
> | also below under NOTES.)
> |
> | If an output error  is  encountered,  a  negative
> | value is returned.
>
> vsnprintf prototypes also indicate 'int' as return type.  What is the sou=
rce of your mentioned findings?
>
> Kind regards,
> Nicolas
>

