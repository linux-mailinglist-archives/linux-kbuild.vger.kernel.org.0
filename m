Return-Path: <linux-kbuild+bounces-6035-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 26F80A5B659
	for <lists+linux-kbuild@lfdr.de>; Tue, 11 Mar 2025 02:53:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E96CC3ABE57
	for <lists+linux-kbuild@lfdr.de>; Tue, 11 Mar 2025 01:52:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C791F1E32C3;
	Tue, 11 Mar 2025 01:52:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GFqGcXH8"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9ABE81E32D6;
	Tue, 11 Mar 2025 01:52:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741657976; cv=none; b=cMpVRFpNUmpJKZs3yG5pVPP1IgXeGMR15SkcNHQWNH4R06JIBOaKk7qGON3dDzKteTWevUatJDSU5myVMcyyhZ/+iib+lEaNX51d/UnOizJIEtwNxH+AZ/dnhYkXhkhQWuekfzqIItTDgbbhs/EpiTvCFQoQKsIg+4crxdOE3IM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741657976; c=relaxed/simple;
	bh=MlTxgVvSZKPsUA1Zh1N2uIlutYs79Ci0sLeczGFxFUM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jUfXBcuefU5t1BZEFkg6XftUeVIdt7/bj8WFje79iXWfz+v9k1S9aALueSlx+9wCZ+R2CD4de89xFM6QGq33Ju+ChFPZJcr+AGTLsT5lOGiP7k7xdVHAmb0JTgIp7EDrpKSj1hexxFki4z+jIkZskTq6EySl8OEUGnagY8jye88=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GFqGcXH8; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 15DE0C4AF09;
	Tue, 11 Mar 2025 01:52:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741657976;
	bh=MlTxgVvSZKPsUA1Zh1N2uIlutYs79Ci0sLeczGFxFUM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=GFqGcXH8lkfxZGIXIbqPZ8jPIrnNvJtCSAaBw02o8rRY7cu1wepGppQHE/dN02yCI
	 Rc7eoLdSCuO6MF2FP/H41JuDb0Oh4CgNR0RmOiGgz/8C808XL8BoF/YcJKVMd3ThJ8
	 LtXONO1tf53wsqGomouKsw9h3zlydZHdivhgCZSz4ssRpVPw+ePRuCzPhF9kZWtvhu
	 JmiSYAar6/u5iypC4abzWmtHBcmakDGtC8rxIrAwAwhThSqT3Is1spvKYFkqPyduUz
	 Z5BuvJ9lYO6ahhMWWNwA3s1H0PGDJ6PDMwLztrw4hknxwD+Y9RnwuivChR6Bp86Q2c
	 6Irt2XmlDLZww==
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5499bd3084aso2466868e87.0;
        Mon, 10 Mar 2025 18:52:55 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUiehuhry6iWPb6HP74PyvDeDuSAoBu7RC509GG0S1NLoH+c2LAjfqBU+boXtJP9VMYcMlEN8Q13TDDn10=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyt+EfHZa3+H9kGsz3XmCrJfEh9PkmGMWBNVrA/aljfOkbdSaDx
	9FzaFYPLo0e11YtXSkXlEP7LR8VqBEeCeWKFwif58hkVVVedtzpztgF8wsdUZloztGRLOVjJst8
	CpvHonxPoVqNIOItQ4Y1KkDorhlw=
X-Google-Smtp-Source: AGHT+IGGnGHlIqSrfRtcEhqr52Xmx0BWXlTup0pbx6a/Ct3L/hwQrW+faZtidozO4L57dvcfvv6mw4mQqsv93oXhSwA=
X-Received: by 2002:a05:6512:3b9b:b0:549:3b4f:4b39 with SMTP id
 2adb3069b0e04-54990e298bfmr4957010e87.10.1741657974686; Mon, 10 Mar 2025
 18:52:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250308040451.585561-1-xin@zytor.com> <CAK7LNARHvn4Sy-e4hMmjGt0C7TFaWrGJrLq3YvN0BjehZ8QwSg@mail.gmail.com>
 <6149ac51-07da-45e2-863e-1d4418f6b662@zytor.com>
In-Reply-To: <6149ac51-07da-45e2-863e-1d4418f6b662@zytor.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Tue, 11 Mar 2025 10:52:18 +0900
X-Gmail-Original-Message-ID: <CAK7LNATGToVHEfZ-hmJ=3xbQCdHmBZf7x9w2QtQVGV-nMiP2Ag@mail.gmail.com>
X-Gm-Features: AQ5f1Jq2fCkxhFKXJrvYU15EKSnQ6PG1QaNoLvPd4kPHXDt6ZUwememQLl4myXo
Message-ID: <CAK7LNATGToVHEfZ-hmJ=3xbQCdHmBZf7x9w2QtQVGV-nMiP2Ag@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] kbuild: Add "make headers" to "make help" output
To: Xin Li <xin@zytor.com>
Cc: linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	nathan@kernel.org, nicolas@fjasle.eu, bp@alien8.de, hpa@zytor.com, 
	sraithal@amd.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 10, 2025 at 3:23=E2=80=AFPM Xin Li <xin@zytor.com> wrote:
>
> On 3/8/2025 7:12 AM, Masahiro Yamada wrote:
> > On Sat, Mar 8, 2025 at 1:05=E2=80=AFPM Xin Li (Intel) <xin@zytor.com> w=
rote:
> >>
> >> Meanwhile explicitly state that the headers are uapi headers.
> >
> > There are many internal-use targets, which are not documented in the
> > help message.
> > I assume this one is the case.
> >
> > If users want to install UAPI headers, 'headers_install' is
> > the user-visible interface and it is already documented.
> >
> >
>
> hpa and Boris prefer to add it, which I also agree.  But ofc it's your
> call :)
>
> If you don't want to add help for "headers", it probably still makes
> sense to explicitly state that the headers are uapi headers, no?
>
> Thanks!
>      Xin


If a help message for "headers" is desired, how about this?

  headers  - Build read-to-install uapi headers in usr/include




--=20
Best Regards
Masahiro Yamada

