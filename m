Return-Path: <linux-kbuild+bounces-5256-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CD489FD088
	for <lists+linux-kbuild@lfdr.de>; Fri, 27 Dec 2024 07:02:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2A7011624C9
	for <lists+linux-kbuild@lfdr.de>; Fri, 27 Dec 2024 06:02:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E65F31386DA;
	Fri, 27 Dec 2024 06:02:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sSv7jY2c"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B230C35977;
	Fri, 27 Dec 2024 06:02:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735279323; cv=none; b=GVQLR5tEyAszjCsaQL7We3F+fSrbDqvJQg2x6CzFb4p5IdVkAGlsVY6m9H8HasAxf79eq+oBGeDCcvX6VKyI34xaK6P4r3MNeIOy2NLL6wmy4bSH0RSPueOPtUZg3lSevwRowkUwze/e+N6rLUCs6SfLBAC/rFW0+PA/wWO3MY8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735279323; c=relaxed/simple;
	bh=NkBdeXYIisGibTG/XndeP7+j7m45JE0yIS+OIQAILx0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nlb+mzR8X48LM4gxczNgKP3f8LBIIWxPKJB/bjyTOJVuMJSAQrdcyHLEiuDZtSqp1/FM7+5DVnl6glsXBGOCv+IuoSyuPmBWrr3NZXTy1h3n+9r6FuWat7tomqHNvqnh8gXgtTc/0CC7Gs7TUUW9h7mlbdpyYCssp8824P/GsJk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sSv7jY2c; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46709C4CEE3;
	Fri, 27 Dec 2024 06:02:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735279323;
	bh=NkBdeXYIisGibTG/XndeP7+j7m45JE0yIS+OIQAILx0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=sSv7jY2cqL2Awn4qJfqrvmvpj8DcEtgpfihV2UTQVetG6t8H2F4xWCpMERPI86NhH
	 1RL8Z2mLH9L/1rgipzBDuvICrMnd0GHozovwPTB4x2wblez89hKEnxnsTMfadlbewM
	 8hjnsi/h9n40VTWlTgg8KkpZXJyA9iihJjhUrxoe4lYcNcpE9DrfSV/kTCQbT75cY/
	 m/IJAvSSCoEcrqcI8IWMI8lJtJNRjJzE4G06FrLc3HdqixvI2cbKt7nLR4kERltgmq
	 6/I4I/hvFs1sOBG4jQ1A8mjladnQGOIAWyZp4K3sBstCH5AuOykQldFGW09n6tSJ7v
	 hfCB3NH0GgRJw==
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5401fb9fa03so6973601e87.1;
        Thu, 26 Dec 2024 22:02:03 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUOi3q7/gDrZYzEU5k1OyHbs7zMg4kptCq/7e/mH7j9LpHJG4yVpkN/1fTfdskFjohzRjLG1j5tYNbyYWI=@vger.kernel.org, AJvYcCWRvRnUlCZJ82xgWFJa5GrLnQtrMJaLdhySIjAd/I4OPnQEKI9vWMEKegmSROc9H9zXYVQGF/bY5iExFT29@vger.kernel.org, AJvYcCXB4MXMZy1jqMZ2/gyL5a7tcsCViMx3Zfm1naweNi4CdVWHkt6/zQ5DFWWNP5YC62eDXTa3EKzR+PCMojT2AQ==@vger.kernel.org, AJvYcCXWkmr1X+APS7BHY8Nf/H84YE0DlIML/wJ3dgZphRJYRopATWW0xAs6xIudeKk03JpmmdF0o7lSU6KzWLqDDi8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9KcvfAWDQAoNzm/6EX0cnJ8Yk6sJLzD60dlJts+/8eSy2ZmLn
	l7dYcpUl+S9TMNarMztlLSv9XB6hcvzHzply2YllUYYb7kkiOKxx2xrtBYHNG1qZLWAU9WKFHMw
	62tnWaB6w+8K0HE1zX6eB6RHNBFU=
X-Google-Smtp-Source: AGHT+IGrOOkh3bjmJb/aOioYah2DQAcGe1Q58Qjbg5w+Olw07p5F6lGwqX6+Ho5XIWZ/+tNoYVVPBmRxtDYSw3gzrxU=
X-Received: by 2002:a05:6512:3510:b0:542:2952:8848 with SMTP id
 2adb3069b0e04-54229529bb5mr4791448e87.3.1735279321817; Thu, 26 Dec 2024
 22:02:01 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241219210736.2990838-20-samitolvanen@google.com> <20241219210736.2990838-21-samitolvanen@google.com>
In-Reply-To: <20241219210736.2990838-21-samitolvanen@google.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Fri, 27 Dec 2024 15:01:25 +0900
X-Gmail-Original-Message-ID: <CAK7LNATRGzGjLLcv+aD3KdgkZXzwMsCSud116rzEThNXRQC0rw@mail.gmail.com>
Message-ID: <CAK7LNATRGzGjLLcv+aD3KdgkZXzwMsCSud116rzEThNXRQC0rw@mail.gmail.com>
Subject: Re: [PATCH v7 01/18] tools: Add gendwarfksyms
To: Sami Tolvanen <samitolvanen@google.com>
Cc: Luis Chamberlain <mcgrof@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Matthew Maurer <mmaurer@google.com>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Gary Guo <gary@garyguo.net>, 
	Petr Pavlu <petr.pavlu@suse.com>, Daniel Gomez <da.gomez@samsung.com>, Neal Gompa <neal@gompa.dev>, 
	Hector Martin <marcan@marcan.st>, Janne Grunau <j@jannau.net>, Miroslav Benes <mbenes@suse.cz>, 
	Asahi Linux <asahi@lists.linux.dev>, Sedat Dilek <sedat.dilek@gmail.com>, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-modules@vger.kernel.org, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 20, 2024 at 6:07=E2=80=AFAM Sami Tolvanen <samitolvanen@google.=
com> wrote:

> +int main(int argc, char **argv)
> +{
> +       unsigned int n;
> +       int opt;
> +
> +       struct option opts[] =3D { { "debug", 0, NULL, 'd' },

You can add "static const" to opts[] here.

I like the array initializer formatted like follows:

static const struct option opts[] =3D {
        { "debug", 0, NULL, 'd' },
        { "dump-dies", 0, &dump_dies, 1 },
        { "help", 0, NULL, 'h' },
        { 0, 0, NULL, 0 }
};





> +                                { "dump-dies", 0, &dump_dies, 1 },
> +                                { "help", 0, NULL, 'h' },
> +                                { 0, 0, NULL, 0 } };
> +



--
Best Regards
Masahiro Yamada

