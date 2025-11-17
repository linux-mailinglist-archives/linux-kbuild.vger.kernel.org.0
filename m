Return-Path: <linux-kbuild+bounces-9657-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 7053CC66215
	for <lists+linux-kbuild@lfdr.de>; Mon, 17 Nov 2025 21:41:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id DF2294ED54F
	for <lists+linux-kbuild@lfdr.de>; Mon, 17 Nov 2025 20:40:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B6112FD699;
	Mon, 17 Nov 2025 20:40:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="eQMv2rcH"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA96334AB18
	for <linux-kbuild@vger.kernel.org>; Mon, 17 Nov 2025 20:40:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763412019; cv=none; b=rCFaJHW9/5fR34kDScRViuIa0B7QxZ4Kpl19zn36uwbIWZ28iraaoVWs6sod9Il0yyzYdWu07ewbsH+UqviHjyzLfSvfP7jTcpyoiffFeWXWG9v4h59GT5l7DBcPXa4aiDGLgIPcQgNfHXgTUmnfc3kXmFOgDfgvfQp6PySmfCo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763412019; c=relaxed/simple;
	bh=1H0cLi2JOo6HkpMxCBZrFspi0FwuOmWdAXdzNOV92yA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AFI7XU9xHGmM0u7xPGGONx87YF7Brv72vQ303GVzze6UDBUYJC4BH6ZHGO//CgXE376H6DQ47tVAmCMGU6uzufKU5HIMjK6TU1qappemVlLlhblyULPIP0FXWcISKFiyfiWHMmgxU08qbcOKnwB8jf+c3//9GteclYHPQGsZ3M0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=eQMv2rcH; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-295c64cb951so53875ad.0
        for <linux-kbuild@vger.kernel.org>; Mon, 17 Nov 2025 12:40:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1763412013; x=1764016813; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1H0cLi2JOo6HkpMxCBZrFspi0FwuOmWdAXdzNOV92yA=;
        b=eQMv2rcH4r0WpDavc+kHqE2gJ8sDfN/n1piP94Ir8Z5tgssywVVP0igfpOrWoqawWg
         6hWn+5Ueu/rmSstKI63ytb6E3vVdSVnUIpyjhFG25QT+Ed9gN1pA1gMmTHUMaBcNvETh
         5RYd6lGbdqWFpjAzl7yuzj+ou/G7mLxMbqNTRfIc6iLwwiOcH0KO/sjLZq3M/LJJA1nk
         UQSWh9Of93Hv09j+XToABgbOSj4uMkZa+/dxYlX0cS4clHhhGouI7mvkQTvyVBiue0zu
         YtBXZUholdFVCCRyMZJrT1UOfzxVIuYTROiWtXsKsEdqPjLK/c4L7PY6jTcf8MWTaJXF
         YXMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763412013; x=1764016813;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1H0cLi2JOo6HkpMxCBZrFspi0FwuOmWdAXdzNOV92yA=;
        b=gm8fzXmvhWxc6cqeCl+0luZsWBm5SyZUeDBni6VAH7Z5dVo14vWdW2qWBrwEOOerRZ
         jdWsYeRObtGBemag7nDeum+Y4vZRXe1TPxJb7ifgX1PtxDdlbcK3NDqG9cmvcyU0dhxO
         L+nyO//aMLqtRaQ0laX2RPtyrN+oZRP6ARPSMIphp0mRJFZjAQ6tfPBIlagDlybrlPew
         QRT0cD/FurKEqH0M7JQ+rp9WDK+k/rBJvYbD0MOcPt1LupDEA0CQGtRIm+dPEPmbuV0H
         BlyqfZLJJMKJxxfcqCb40dJVX0CwOnb0t6nN4g3Wf3Vhb8Y4qiv854OwHZk8YWRODElB
         cnVw==
X-Forwarded-Encrypted: i=1; AJvYcCWwU9LPpmN4LWsQcVhH8ikAd7HSAMFoCcY++7X98CpUM1nivQfwAMthc7pOWI8I/pRH5Jm1gqCwkArMBbU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2921BHV0wQL+k2ixy2z476yqQz7j6UeaGpuNPT75OtQ4VfxKs
	EiEhPd9xESIS8NJLFNOa/s0yBYW8oHZ0BnWCJgWvSxv6iRIYly7L9YINM6rU2o0tPnp7gSM6Onl
	wA56XD0j8tHdIQLzD+YQdzXCBVjqjoiAfHo+OQGcDMFCPbBYJLvMhUltWe9A=
X-Gm-Gg: ASbGnctGQJu6QQC2HjpoOcshOiXvAbj2QpSX2N1UCuLEKJGJW9ltNwEK87aOB0RDi2M
	cIvxwfrhPVlLWj81ouQUhoygdYaRDigCX4kREvsD+EHGDdVMikDVk1s27s2oHGbZbS1wo7X49rL
	ox/Kfw2gB77kLp3POsDu1LLgHGL0KxEc/fG1TAFGdrIdunuV3JU3fFuQnClsK2w8RSSN/R1iqod
	aq2l2Gvhlt1r4Sgb69rch1D4p9ruIl5IxKIcjROujj1JB/pP7H4fTYmubXcwFkPN5Q6
X-Google-Smtp-Source: AGHT+IGRvbW4d/tIwNtyHY0u+4ZKoC2/gi1CFz+eeP0CV681ftV7r/gK4h5K+JNL4Shy2rRd6rguma3V9C0i2eAjQHA=
X-Received: by 2002:a05:7022:6182:b0:119:e56b:c1d5 with SMTP id
 a92af1059eb24-11c765a9e8emr21688c88.0.1763412013146; Mon, 17 Nov 2025
 12:40:13 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <aRcxzPxtJblVSh1y@kitsune.suse.cz>
In-Reply-To: <aRcxzPxtJblVSh1y@kitsune.suse.cz>
From: Sami Tolvanen <samitolvanen@google.com>
Date: Mon, 17 Nov 2025 12:39:36 -0800
X-Gm-Features: AWmQ_blW76vh0PVkmggdMwvKwkljCLQHPM3W9uXuIORf5C0lZqXX4jqFUb23g2I
Message-ID: <CABCJKufeEaZ1hsyHsr5=RxR=AcpMu6nnYypwvcmS-ZxjZNV77A@mail.gmail.com>
Subject: Re: gendwarksyms not 32bit-clean
To: =?UTF-8?Q?Michal_Such=C3=A1nek?= <msuchanek@suse.de>
Cc: linux-modules@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Michal,

On Fri, Nov 14, 2025 at 5:42=E2=80=AFAM Michal Such=C3=A1nek <msuchanek@sus=
e.de> wrote:
> I tried to build kernel with gendwarfksyms and it does not work on
> 32bit:
[...]
>
> Can you fix it, or make it depend on host being 64bit?

Thanks for the report. Can you test if this fixes the issue for you?

https://lore.kernel.org/linux-modules/20251117203806.970840-2-samitolvanen@=
google.com/

Sami

