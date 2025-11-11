Return-Path: <linux-kbuild+bounces-9582-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 570BEC4FED2
	for <lists+linux-kbuild@lfdr.de>; Tue, 11 Nov 2025 22:54:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 695003B5B0E
	for <lists+linux-kbuild@lfdr.de>; Tue, 11 Nov 2025 21:52:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 066542EC09B;
	Tue, 11 Nov 2025 21:52:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="X31TeZJJ"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77FA02E9EB9
	for <linux-kbuild@vger.kernel.org>; Tue, 11 Nov 2025 21:52:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762897971; cv=none; b=pCRW5wfR1Lb40NbgWANI6CTASHd7MNstR0EteoCp9D8BOViVqt2Izj0Z/hn+SD/XW8EO337c70fNxTPfSooRJh1hoAKzBb3VUYTQhN5U+v6DvNaQDmSJxET25/cQSryNMSOumQMaNQzfaLJmJfDr33e/V0WodUMwfwQGP4hVl0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762897971; c=relaxed/simple;
	bh=/QNM/X5XSQpv+FQQDdZzB/lI65SBmqPTlRzLtg/G38Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LeF0HW2J+c8WCWg0/nIoxQ1hBcDmt281AV2PuS+WGXx/9WzNA/AE3tLy71VjEvobl9r4OxhWvjcT4opCxnPQr0K+WfB4aP/rrxYewOoyS8z/izgYynkjN0XdbfN/Pnw1AOZJUU6gbyFVz5jIMFOCxPNN8kE78rDzw9NaX6e98s4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=X31TeZJJ; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2980343d9d1so20675ad.1
        for <linux-kbuild@vger.kernel.org>; Tue, 11 Nov 2025 13:52:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1762897970; x=1763502770; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5VvFajYi15kIWiai7n5Hcqwg/6HJ3wZiBhWSzTOg9vo=;
        b=X31TeZJJTS2OAcZIg9EZeJi6NN0aBtnpmXyOhgXRoCs/LO28/TF5rp8jN9Di0FRZBg
         wCcu/HptH2DO/LDRc35gaDbmMUMWSVBis0Bd6yReoKg4r9s3XMhZ3cx+7Yd/bEPAOY+e
         CvyQkyx4BdpT4REKv/Yfoz+I4uzkNvsCeDsp/yxxcma9LUnHDHTddILOqHw4x+igUoeA
         C3zzmLg0sfnvPf7fuBaSpeJwUY3TjfqY98pxqtF08yx2E0oNRwgZhdpSYwI0Z/uNZyON
         upBk71DwlgBeGV1JlIHH0y/Nf3WwH4NGWiQwGxoHI5mUWG55sg+/eUiUskyMdiI1MLGN
         oM+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762897970; x=1763502770;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5VvFajYi15kIWiai7n5Hcqwg/6HJ3wZiBhWSzTOg9vo=;
        b=FEqLw0iFVq9BdKmEfPXyaVSiCplrpIvYYgi3kg5npuvvdL60AR4EibMt7q/iR7yrhC
         crNUw88aLS9HogRvElit61/528ed/fVljnip7DbgFgxNNeah9NVZjwmfQ4HiUSntgssg
         yCtk/FdmeD5VBe8OPmO4C8oe/HjJD8+sklHPTKBLss52NdebUokH6Q/aJIItIZRZzpOV
         77joKHPrWA81g/kuDK3pZCKUOt9Nf8eMQM67dvPsO+ImVoh7EPVwrROzxbnzJwnS+4kc
         juoVHhT5NirnjySoCApLFn9vsydSBZVXC5wJDqrKKzGPpwDX1jXGMUrWo3VROhpzOzu7
         pMDg==
X-Forwarded-Encrypted: i=1; AJvYcCUJCwmibl1k3xpzIGbhAkP9BGvkq12hZ+e/CafbOXbmjkgrsSy3PJv/I9kQJF8vdYR/aUTlfHpHKm6LxJw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzw8+BfXIMFhHHtV7jHFShewCAj/6u25NHOAzMpkiUIZorgKgLw
	L+zC5kA/BR6UHWKGEGc+KWB6/I70qNhwu7vhnlmQbyWs2qj8Z9jU9k+zp9P2ZaIMM4d1mA8jC5n
	OVzMVssn7YTLZByMmYsLtSifvtMQgTh0juZsBVRiJAqpI2/W1pqe42ckA
X-Gm-Gg: ASbGncvSqhJA3MYENTynMnqm7k9QmjrooQv5oa6i865ta/j6jji3K9RSVcShZEHSr2+
	biqNbqOJ5K+qRzIPsGimBeNNpXnVdP+GyENNABMghZEaQ75v4IhfstvKyE1m3VRy46iS0Bg8J82
	0KEu6wwJtMjzlWpTe02wziKJuhI92UDLkwoqu/V5/ilqg6Ty0Pexe4o5t74fYRhDH71K8YuIBcv
	2UZYRfhKdCwJKtTR7F261AMMueMtC37r62KCRJX2CJdNY+IIYmDFfOnao+nzLzP/FoJAQc+zhft
	pzW0EHUdwbYKDoKoUmoFqpSrnVO1NKtDvdHO7Nu1b7xygw==
X-Google-Smtp-Source: AGHT+IGAB93LHQL+r4WuB4/Ph0LFWIrxxzhVMChdM4Z+1uSkD0vwZigeDvDGyHITXjaZ7Sx0ge3nq4/BLlDcgc8jDqc=
X-Received: by 2002:a17:903:1105:b0:295:30bc:458e with SMTP id
 d9443c01a7336-2985074cdcemr378845ad.3.1762897969460; Tue, 11 Nov 2025
 13:52:49 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <b8c1c73d-bf8b-4bf2-beb1-84ffdcd60547@163.com> <CANiq72kX4Yep3pNVq8Ge=txQbPnMO=zKsci5cPgz5LDS=D6NoQ@mail.gmail.com>
 <CABCJKud0G+Xh+Wbtg4SDGvk4Yh5nmt5YgHEPj-H0y8GO5R3Amw@mail.gmail.com>
 <CANiq72mw66ADx7LoUuqY6h9KCU=uFzcNQXZ21kMP7jBjCyyaHQ@mail.gmail.com>
 <CANiq72=OFO8fBpJ6xvGunYrx5hXfcjQJ=YDqFxtMPWDzfzwpKw@mail.gmail.com>
 <CABCJKue1xeY7CGHScG04PdHT6TOPgsOpZVKWwgzO65qwAcbEJg@mail.gmail.com>
 <CANiq72ncHgjjJ_c2fdTgOO9LxmmotRS8S6pwyckLmPJG_4GPNg@mail.gmail.com>
 <CANiq72kcRsTWPhQVJ18P6RUxL=+c1Z8BJkyK_kRR8EBmmH+cWg@mail.gmail.com>
 <20251108044206.GA3038215@google.com> <CANiq72mLbEVqX-uBtqy+_wru9CRRb3PL3qFqYEcjpZdNyZGd2w@mail.gmail.com>
 <CANiq72n09yx9ZjOtOb3-3rPfpPLKaJZ2fs_Bmpbz28Y8U05snA@mail.gmail.com>
In-Reply-To: <CANiq72n09yx9ZjOtOb3-3rPfpPLKaJZ2fs_Bmpbz28Y8U05snA@mail.gmail.com>
From: Sami Tolvanen <samitolvanen@google.com>
Date: Tue, 11 Nov 2025 13:52:12 -0800
X-Gm-Features: AWmQ_blNo6f4wsXHyITG7HidznvwA4riTyEbTpdABn5ekbyYeCZL85bPH0bxaHw
Message-ID: <CABCJKuc-jkz3HfOvAi3cJh9C9JmOpMpPY8PR4ETXBUpUQ8R_gw@mail.gmail.com>
Subject: Re: Only rust/bindings.o build fail on rust-1.91.0
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Haiyue Wang <haiyuewa@163.com>, rust-for-linux@vger.kernel.org, 
	Miguel Ojeda <ojeda@kernel.org>, linux-modules@vger.kernel.org, 
	Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Miguel,

On Tue, Nov 11, 2025 at 1:41=E2=80=AFPM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> On Sat, Nov 8, 2025 at 6:08=E2=80=AFAM Miguel Ojeda
> <miguel.ojeda.sandonis@gmail.com> wrote:
> >
> > Exactly, that is what I was suggesting in the other thread about
> > editing the `cmd` command or directly teaching `genkallksyms` to
> > auto-skip, but I didn't know if there was a reason you didn't do that
> > originally instead of having (some of) the `skip_*` lines in the
> > `Makefile`.
> >
> > If not, then I assume we could already remove some of those lines,
> > e.g. the one for `ffi.o` (no need to do it on the fix, of course,
> > better to keep it minimal, but just to confirm there is no hidden
> > reason there).
>
> For (cross-)reference: I sent "v2" of the fix, essentially taking your
> patch and my commit log and putting them together -- please let me
> know if this is with you!
>
>     https://lore.kernel.org/rust-for-linux/20251110131913.1789896-1-ojeda=
@kernel.org/

Yes, that looks good to me. Thanks for picking this up!

Sami

