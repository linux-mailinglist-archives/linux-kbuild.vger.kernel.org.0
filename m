Return-Path: <linux-kbuild+bounces-9776-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 54F8AC7E128
	for <lists+linux-kbuild@lfdr.de>; Sun, 23 Nov 2025 13:51:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 161013AB35E
	for <lists+linux-kbuild@lfdr.de>; Sun, 23 Nov 2025 12:51:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B75E021B918;
	Sun, 23 Nov 2025 12:51:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="daJsGNOW"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D38A19DF8D
	for <linux-kbuild@vger.kernel.org>; Sun, 23 Nov 2025 12:51:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763902271; cv=none; b=Cs9rS2HA2QzcFv6fSRrQs+xv0QvMKW3Qj87NVlEbLcgGLPmtWReQwzOHGXrt/1N3YtCTIMLmHq2bxMCshqdlEGhcxySmYOHcOBnh735+5r2o4mgngwDazgaE/GmjnAbnrGTyYzdeFs+gaOMGQef+KYJ1vQleQtvn0YGa7frOU+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763902271; c=relaxed/simple;
	bh=hh3f/KSBNY/MI9DUyZk2g+MRS3pxrt5gBaQH02mgQPg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qaVoaon8FfmdM+o7zwGK8GhgDC3/MhCQyIy/JQKRCCoXpVcNiz0dFAh85EH+RpMgPPId+dT2CMSrcirExDPLM2ZkinsmTXaxWg/mPZWJcelb+AwYXm952GS+jL+KV3ZK6QAxvg9AEs7Lo6Y1d8oZjqoxzPYmd+H3XvT8RUt+qp0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=daJsGNOW; arc=none smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-bc144564e07so86765a12.3
        for <linux-kbuild@vger.kernel.org>; Sun, 23 Nov 2025 04:51:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763902269; x=1764507069; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hh3f/KSBNY/MI9DUyZk2g+MRS3pxrt5gBaQH02mgQPg=;
        b=daJsGNOWavMyoIti9jpAg9octrSbHnIio8x7CHfCCHiBuSHqxiRvzfz0nCRp3bo6Sc
         xOs0Nhfj4Tnz189h4pNGu4YspCMlsc6Xpl9aUVhW1Q5+Z7RfqbKrcQpTi9RAIeKfs1iT
         sTWi8gkHVtythSohdNpPo5QUlvMqFMFnZzevbakfwLJyYvUOJwVT+ETDiw4jVQuWpmDd
         kb9vyOb4yJyLzcpn8Gp7K/sVrHJ7RMgnnz/oTW5Hr3NVRSg+xFMHFBEkeEfFUYSIlLYe
         1Wag9Q2IOv15pOab3oV25TjTJ2bk2TTADIf1A4XB3w9oOx2VcDTd+3+IUX6rq7R3ZhFX
         /WJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763902269; x=1764507069;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hh3f/KSBNY/MI9DUyZk2g+MRS3pxrt5gBaQH02mgQPg=;
        b=D0qIH8MHCmhiTSpOJQWBcJm5FLLZn4naMDg+5jcjgpybn1xwIGHBHL9d+96WURuzQ1
         2knAnglRRd1tMm3LeZrs4Dl6KwAZcOJ+EK7R96D7HLvf08kWyqGRTzWbF4itg5UOdm1a
         eGp+nvPYT9DB1/ElgheexRBViIqC7S8Y/pcYKMb5d2jjsvKWlEfElA9gb2fZ+m0n1LcE
         2gZa538XFwMVx+IP7meEw36H8AAtu/lcP0xeOSP9yanCNNXC1Need4oIwLS0GJ+p7rOx
         2SPmPedDObKsTo1JZxRFNerqsO2PjyCQVLDZ0F0XUbQUn8eZe0JajcqCJYvEu4RqDJki
         d14w==
X-Forwarded-Encrypted: i=1; AJvYcCXiduOPot9m4LlCrZWH46OEarOyIk9y1j5cdIy6kD9+6fKWuv82/yuVzB/s1hTxYzjV8FkNTWnnlX9as9Y=@vger.kernel.org
X-Gm-Message-State: AOJu0Yycqi2Tola+hv04UbImgbk/znQ7n6Aw6VATToSr5e8z54HWPkyR
	vdvbSHVRfWpsrjh0SvTPGCZMR4VrryzvdsDxQr4YQdvLnHh8mWl+0lYHAOZ6N9aOhmHJ0Qg88xR
	nDhrhb4ESb18JU3cCgKPdxHrttDF2yhA=
X-Gm-Gg: ASbGncumQ/aAdcFuGKKXlLDAxpBpb3HW/eGy1/i/BVJm6eB5yuosjVmvp06UCkm9PGD
	orWkFqhv2qxJmO+MAL9DmVb/F8SSeuR5TUTWhRE2z42WiYmAnXLDim2dmCiDG6bTP+Txk1M/tbR
	jvCtnfvE260qDTVkP9QzA71CnxOZHJokjoAcOA54hL8H177zr+dbn94JZwbJ8D9nQj5b+OLvEDr
	xWeXklIzvBwlFtqGxXvYhEOMBbWW5pufeiQQaZHqDL1qiBX0jOwlA2H9+IhXMjydZThU2T13hzR
	4kpRJajfxd0snamkthD5BRmD9OmpZIa0v8j4fYwyTYynXe8rgLP9MEoK85zVmwa0ZfltalrBMfP
	KSGE7RtcCA3O4Xg==
X-Google-Smtp-Source: AGHT+IFzGpHkwEeZtyBB1sA8C0zv73zZE61XXExuoWlx0JAyvU8o9HZNqUld4AqnEj4edoaKWnUZ2M8aAmsP3pGEL+M=
X-Received: by 2002:a05:7300:ec16:b0:2a4:5129:fe99 with SMTP id
 5a478bee46e88-2a724bc5450mr4369303eec.2.1763902269389; Sun, 23 Nov 2025
 04:51:09 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251121043750.298843-1-y.j3ms.n@gmail.com> <20251121053633.1594703-1-ojeda@kernel.org>
 <CA+tqQ4LX2ihwY11VJk3LNNE-STsONJWF0rdDa0Pq09oA7YRXEw@mail.gmail.com>
In-Reply-To: <CA+tqQ4LX2ihwY11VJk3LNNE-STsONJWF0rdDa0Pq09oA7YRXEw@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 23 Nov 2025 13:50:57 +0100
X-Gm-Features: AWmQ_bnvRqwTLU4C-A_sFwJUrt_-BRRzQMSF1pa9UGMsSEMrNHTXTBWcIgdzbNE
Message-ID: <CANiq72=Yo6-yLzQ6f047vXk1e-mm8=EH5t3dZRpLaZN1iuRNMg@mail.gmail.com>
Subject: Re: [PATCH 00/18] `syn` support
To: Jesung Yang <y.j3ms.n@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, a.hindborg@kernel.org, alex.gaynor@gmail.com, 
	aliceryhl@google.com, bjorn3_gh@protonmail.com, boqun.feng@gmail.com, 
	dakr@kernel.org, gary@garyguo.net, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, lossin@kernel.org, nathan@kernel.org, 
	nicolas@fjasle.eu, patches@lists.linux.dev, rust-for-linux@vger.kernel.org, 
	tmgross@umich.edu
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 21, 2025 at 10:08=E2=80=AFAM Jesung Yang <y.j3ms.n@gmail.com> w=
rote:
>
> Now everything compiles. Thanks!

Great and thanks for testing! Do you mind if I add a:

Tested-by: Jesung Yang <y.j3ms.n@gmail.com>

?

> By the way, I needed to make a small change to
> `generate_rust_analyzer.py` for rust-analyzer to correctly reference
> symbols from the vendored crates:
>
> This might already be covered somewhere else, but I'm bringing it up
> just in case.

Definitely, it should be included.

Cheers,
Miguel

