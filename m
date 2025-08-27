Return-Path: <linux-kbuild+bounces-8633-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 66743B38A4D
	for <lists+linux-kbuild@lfdr.de>; Wed, 27 Aug 2025 21:38:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1F4767A5D63
	for <lists+linux-kbuild@lfdr.de>; Wed, 27 Aug 2025 19:37:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD28D2EC57B;
	Wed, 27 Aug 2025 19:38:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EH7zDK5u"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD0EB2EBDD6;
	Wed, 27 Aug 2025 19:38:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756323501; cv=none; b=QvigeR8ivRLf/wveFYocoa/5fuv4KzWmHVPDTCDAM/b49pzC1ipqRiWuYZfSkgOZTjavjAm2pOrzUXdgN442N877G101nBRfEhueIzyIS45Uvze3gXR6KIQw88Ff2rB8vo5232epSyAEwMhVr9oY/kYzlJ+JMkkK1UuAbmE5JDg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756323501; c=relaxed/simple;
	bh=W1AubzeJB5Z8LwdDQVCG3K8ifP+7BeoXcKAJfA+3/kA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VAEJn9NXB67a7gRtyfEOqGK714xauNu2D6r8tFxAq1CWvIG4h49+TWVLP6qQC6TcAm37FslOxKh/nBhXP7sz2qrTxmUR2/5VBU17AUdI7N3PEiWrSZbsuzSgwtCeJbqxOozqcWfTwlU3C4ip/r4Mq7XlP4eB0VF/jW20v/QZ3cw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EH7zDK5u; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D1760C4CEEB;
	Wed, 27 Aug 2025 19:38:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756323501;
	bh=W1AubzeJB5Z8LwdDQVCG3K8ifP+7BeoXcKAJfA+3/kA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EH7zDK5u6fdSChttEZ9MV34eaB/tec1yaLBsuBo62yZMBidjNVD3N2cfcpetw5OlX
	 dJwRpObDkmjwGuaEeXNcXsBTkxrloAbzi8JdZ0ou0e1d6kpAPZqFf4WZIolLovvjuL
	 NfPNU9xcO+AxflQmOxwBl/n3JmC5OLK8+qePfSEKNJFf8YgASTiiRPhij5JYDJWxUj
	 B7V9W5raCFZMwDkbFJOvSMd641UP4EnSUSoI/B72ovoBaT7nE5yb/JfDIjVkJehFBO
	 auGCVBbIQHa226riQz1U1ceP19zIf1WljY658hJJqpXQA2G7m0vw5u9tkyjn84TBe8
	 sefDaIsTF223w==
Date: Wed, 27 Aug 2025 12:38:15 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: Kees Cook <kees@outflux.net>,
	Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
	Kees Cook <kees@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
	Sami Tolvanen <samitolvanen@google.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Puranjay Mohan <puranjay@kernel.org>,
	David Woodhouse <dwmw2@infradead.org>,
	Jonathan Corbet <corbet@lwn.net>, x86@kernel.org,
	linux-doc@vger.kernel.org, linux-kbuild@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org, llvm@lists.linux.dev,
	linux-hardening@vger.kernel.org
Subject: Re: [PATCH 5/5] kcfi: Rename CONFIG_CFI_CLANG to CONFIG_CFI
Message-ID: <20250827193815.GA2293657@ax162>
References: <20250825141316.work.967-kees@kernel.org>
 <20250825142603.1907143-5-kees@kernel.org>
 <CANiq72kc7Ky6+7Ny7jR04s8vU-g23qBQC0rQrOZDxDzXT+m1TQ@mail.gmail.com>
 <202508250834.E2456B9@keescook>
 <CANiq72mQsLqhpX29NP3Zm8HZ5m429tSXjgFcRYJM3e=Zac1G1w@mail.gmail.com>
 <9CCDBE93-7DBD-41D0-B9B6-05900F2AB1EE@outflux.net>
 <20250827013444.GA2859318@ax162>
 <56c2b1ce-00a4-403c-9927-79bfd9a23574@infradead.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <56c2b1ce-00a4-403c-9927-79bfd9a23574@infradead.org>

On Wed, Aug 27, 2025 at 12:35:12AM -0700, Randy Dunlap wrote:
> On 8/26/25 6:34 PM, Nathan Chancellor wrote:
> > On Mon, Aug 25, 2025 at 03:31:34PM -0400, Kees Cook wrote:
> >> On August 25, 2025 1:00:22 PM EDT, Miguel Ojeda <miguel.ojeda.sandonis@gmail.com> wrote:
> >>> On Mon, Aug 25, 2025 at 5:35 PM Kees Cook <kees@kernel.org> wrote:
> >>>>
> >>>> Yeah, that's a good idea. What the right way to do that?
> >>>>
> >>>> config CFI_CLANG
> >>>>         bool "Use Clang's Control Flow Integrity (CFI)"
> >>>>         depends on ARCH_SUPPORTS_CFI
> >>>>         select CFI
> >>>>
> >>>> ?
> >>>
> >>> I don't recall what is the idiomatic solution for renames, but I
> >>> remember Linus talking about this topic and about avoiding losing old
> >>> values if possible (perhaps getting a new question in `oldconfig` is
> >>> OK as long as the `olddefconfig` respects the old value).
> >>>
> >>> I think your suggestion above will still make it appear twice in
> >>> `menuconfig` -- there may be a way to play with visibility to make it
> >>> better.
> >>>
> >>> A simple possibility I can think of (assuming it works) is having the
> >>> CFI symbol for the time being introduced just as a `def_bool
> >>> CFI_CLANG` for a few releases so that people get the new one in their
> >>> configs.
> >>
> >> Ah, I think this works:
> >>
> >> config CFI_CLANG
> >>     bool
> >>
> >> config CFI
> >>     bool "...."
> >>     default CFI_CLANG
> >>
> >> I will add that for v2.
> > 
> > That does not appear to work for me. I applied
> > 
> > diff --git a/arch/Kconfig b/arch/Kconfig
> > index c25a45d9aa96..0d3ed03c76c2 100644
> > --- a/arch/Kconfig
> > +++ b/arch/Kconfig
> > @@ -876,8 +876,12 @@ config ARCH_SUPPORTS_CFI
> >  config ARCH_USES_CFI_TRAPS
> >         bool
> > 
> > +config CFI_CLANG
> > +       bool
> > +
> >  config CFI
> >         bool "Use Kernel Control Flow Integrity (kCFI)"
> > +       default CFI_CLANG
> >         depends on ARCH_SUPPORTS_CFI
> >         depends on $(cc-option,-fsanitize=kcfi)
> >         help
> > 
> > on top of this series and
> > 
> >   CONFIG_CFI_CLANG=y
> >   # CONFIG_CFI_ICALL_NORMALIZE_INTEGERS is not set
> >   # CONFIG_CFI_PERMISSIVE is not set
> > 
> > gets turned into
> > 
> >   # CONFIG_CFI is not set
> > 
> > after olddefconfig. CONFIG_CFI_CLANG has to be user selectable with a
> 
> Could/did you test with 'oldconfig' instead?
> 
> olddefconfig is going to use the default value from the Kconfig file,
> which if CFI_CLANG which is undefined/No/Not set.
> 
> oldconfig will use the old value from the .config file.

I am not sure I understand what you mean here. With the series as it is
or Kees's suggested fix, oldconfig still prompts the user to enable
CONFIG_CFI with CONFIG_CFI_CLANG=y in the old configuration. Both Miguel
and I allude to that being fine but it would be really nice if users
with CONFIG_CFI_CLANG=y were automatically transitioned to CONFIG_CFI=y
without any action on their part. That seems to be in line with how
Linus feels even as recently as this past merge window:

https://lore.kernel.org/CAHk-=wgO0Rx2LcYT4f75Xs46orbJ4JxO2jbAFQnVKDYAjV5HeQ@mail.gmail.com/

Another idea I had to avoid this is introducing CONFIG_CFI_GCC as a user
selectable symbol and making CONFIG_CFI the hidden symbol that both
compiler symbols select. After a couple of releases (or maybe the next
LTS), both CONFIG_CFI_CLANG and CONFIG_CFI_GCC could be eliminated with
CONFIG_CFI becoming user selectable, which would keep things working
since CONFIG_CFI=y will be present in the previous configuration.

Maybe it is not worth optimizing for this situation. I personally check
my configurations into git so that it is easy to deal with losing
things, as I have had my networking broken several times by new symbols
and dependencies that do not get handled well with olddefconfig.

> > prompt but the only solution I can think of at the moment results in a
> > duplicate prompt for Clang.
> > 
> > diff --git a/arch/Kconfig b/arch/Kconfig
> > index c25a45d9aa96..93bf9b41a9de 100644
> > --- a/arch/Kconfig
> > +++ b/arch/Kconfig
> > @@ -876,8 +876,17 @@ config ARCH_SUPPORTS_CFI
> >  config ARCH_USES_CFI_TRAPS
> >         bool
> > 
> > +config CFI_CLANG
> > +       bool "Use Kernel Control Flow Integrity (kCFI) - Transitional" if CC_IS_CLANG
> > +       select CFI
> > +       depends on ARCH_SUPPORTS_CFI
> > +       depends on $(cc-option,-fsanitize=kcfi)
> > +       help
> > +         This is a transitional symbol to CONFIG_CFI, see its help text
> > +         for more information.
> > +
> >  config CFI
> > -       bool "Use Kernel Control Flow Integrity (kCFI)"
> > +       bool "Use Kernel Control Flow Integrity (kCFI)" if CC_IS_GCC
> >         depends on ARCH_SUPPORTS_CFI
> >         depends on $(cc-option,-fsanitize=kcfi)
> >         help
> > 
> > Maybe that does not matter for the sake of keeping things working?
> > Otherwise, we could just keep things as they are with the patch set and
> > expect people to actually use oldconfig or diff the results of
> > olddefconfig (which I think is good practice anyways).
> > 
> > Cheers,
> > Nathan
> > 
> 
> -- 
> ~Randy
> 

