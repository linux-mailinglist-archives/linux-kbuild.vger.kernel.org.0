Return-Path: <linux-kbuild+bounces-7623-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 72091AE628A
	for <lists+linux-kbuild@lfdr.de>; Tue, 24 Jun 2025 12:34:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 65BFC189DD38
	for <lists+linux-kbuild@lfdr.de>; Tue, 24 Jun 2025 10:34:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A2D52868AF;
	Tue, 24 Jun 2025 10:33:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YLKqoZDu"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2802B284B2E
	for <linux-kbuild@vger.kernel.org>; Tue, 24 Jun 2025 10:33:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750761231; cv=none; b=BcR7dnPs6X2NfdbDgSrkU6oe0aKh0H9vMrDE86XI6lbHT8xFE/ZPbQ0r1F22cYs6NNau/EEyY2HyYeJiiU7guT0BiB3289PS3xc6Sqg+CALzV4UxnS16btVAOeWJpy9BpU4PXOjVRy+d9YvqjBhKjjOWc1T0jbaJiALrH2hCkcQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750761231; c=relaxed/simple;
	bh=5rKAldb8yDdjesRBjmIB1D1oa6CsxdGfweE+SPmulRI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ey/6Ofo4AUZvffdHBdhpByElax7YN8M76Q3Aii61StcmP41YOWCcOX5KqBouH9FhmwOfa4zuZR639bRmHWIUXStsV4sEdL+8S+q6GlV4RfJU7vBjBCHB4dbUurmFRPhWRn75PpxFT9DSKjTjPonVFl2+JZXwMnU7Y6xLXZm273I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YLKqoZDu; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9259CC4CEEE
	for <linux-kbuild@vger.kernel.org>; Tue, 24 Jun 2025 10:33:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750761230;
	bh=5rKAldb8yDdjesRBjmIB1D1oa6CsxdGfweE+SPmulRI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=YLKqoZDuk/CPeZZL3/vtthkUjB7jYhecSnnoWqUPUU5uL2C84UVh7wKSm3rSSHrC4
	 AXxArS/bSqqsOwSOhBHjz49I7K43Va+HWy+G2h42DELQojrJymwDqSNAWBCwL3lY2z
	 7FvH0YCKZaAC+VIsGjxeuYd97K/j81anfZ3jgSLLxHsSE30iBLAJVBysT0cyl6AzGy
	 +USZhuxFyjWcKQfY7gWbk9+7PQH/E/w5JfQ2TZJxDPILwzyYJcrQX8T3IrJ4rDCSSu
	 PyWlarLlngkkyuKmzC01CGNjyfRDKIQ6blEjr1vt7eWT5yg0+TY+Dpz23YJX2HlNaN
	 rXxg/bAXyAN4w==
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-54998f865b8so217611e87.3
        for <linux-kbuild@vger.kernel.org>; Tue, 24 Jun 2025 03:33:50 -0700 (PDT)
X-Gm-Message-State: AOJu0YzlRRXRnaKIymVSQfQOje2e2lWuThGlQ2+1msWS0DoOCl9KhsRF
	iGLGO9ijZuNSVlDmDd0WVj7JJvg6yZKvvgRoPJvsytaNQa43YIY+P+WUlvuD+oW700x3nt7/QG2
	BTT3RCOgobjGlUaH5kZGGEsUQIuW11Ac=
X-Google-Smtp-Source: AGHT+IH2TXpTTnro0upQkWeZRD4Bcv7Aa14O4W++v/Tiu79EfS1Wq8eEUZ7ikHng/09jkS78+D1Zh5qI47crUQL1Py0=
X-Received: by 2002:a05:6512:b84:b0:553:ac4e:c41 with SMTP id
 2adb3069b0e04-553e3be918bmr5058457e87.28.1750761229219; Tue, 24 Jun 2025
 03:33:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250604183539.425053-1-martellif67@gmail.com>
 <CAK7LNAROMO2686KPbt+ZquymcZC-RLr0aX5x477uF1DaesUkCQ@mail.gmail.com>
 <9aaea19f-cd15-44fe-8d61-984f7ff316b7@gmail.com> <64d93af1-b602-4dba-ad4b-a2b9a493c800@gmail.com>
In-Reply-To: <64d93af1-b602-4dba-ad4b-a2b9a493c800@gmail.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Tue, 24 Jun 2025 19:33:12 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQTuk9S5+oUARefryz3cz2HF3q6_bvW8PmJi1dhWa26DA@mail.gmail.com>
X-Gm-Features: AX0GCFvuEsE5D1VAbgXG4AHFp99vgEwM10gEo4pJPLYafFlDH8C1eyP759N61Vs
Message-ID: <CAK7LNAQTuk9S5+oUARefryz3cz2HF3q6_bvW8PmJi1dhWa26DA@mail.gmail.com>
Subject: Re: [PATCH v2] Kconfig: Added compare capabilities for mconf Ver. 2
To: Franco Martelli <martellif67@gmail.com>
Cc: linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 19, 2025 at 3:55=E2=80=AFAM Franco Martelli <martellif67@gmail.=
com> wrote:
>
> On 16/06/25 at 15:44, Franco Martelli wrote:
> > On 16/06/25 at 15:04, Masahiro Yamada wrote:
> >> On Thu, Jun 5, 2025 at 3:36=E2=80=AFAM Franco Martelli <martellif67@gm=
ail.com>
> >> wrote:
> >>>
> >>> Signed-off-by: Franco Martelli <martellif67@gmail.com>
> >>> ---
> >>>
> >>> Dear Linux hacker,
> >>>
> >>> I've written a patch that allows to compare the tristate value of two
> >>> .config files inline, symbol by symbol, in mconf (make menuconfig) on=
ly.
> >>
> >>
> >> I do not understand why this needs to be implemented in
> >> menuconfig.
> >> scripts/diffconfig is already available.
>
> > When a new stable release of a distribution is available, in the Linux
> > kernel many things has changed, this patch comes in help in this
> > situations, it allows to easily compare the customized .config file
> > built for the previous version of the distribution, with the one
> > provided by the new software distribution, used as reference.
> > Generally it can be helpful when the differences between .config files
> > are huge, because you can navigate across them in the menu window.
>
> >>
> >> I think the comparison mode is rather distracting.
> >>
>
> A solution to improve readability of the comparison mode could
> be to skip symbols without differences, so leaving those menu
> entries untouched. This will shrink the amounts of characters
> displayed significantly.
>
> I can send a version 3 of the patch changed accordingly, if
> you don't reply to this email I will assume yes, but if you
> are definitely against to this patch, please let me to know.

I do not think menuconfig (or nconfig) is the right place,
the user appearance does not assume an extra column.

If you really want to implement this, xconfig or gconfig
is better, as they have a 'value' column. It is easier to
add another column.

But, have you used scripts/diffconfig?
Didn't it suffice your needs?


--=20
Best Regards
Masahiro Yamada

