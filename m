Return-Path: <linux-kbuild+bounces-10000-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 3172FCA5104
	for <lists+linux-kbuild@lfdr.de>; Thu, 04 Dec 2025 20:06:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 80FC83024283
	for <lists+linux-kbuild@lfdr.de>; Thu,  4 Dec 2025 19:06:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A7982BD58A;
	Thu,  4 Dec 2025 18:36:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="hDHvuyKZ"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA19B2ECE97
	for <linux-kbuild@vger.kernel.org>; Thu,  4 Dec 2025 18:36:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764873414; cv=none; b=h8Q1gAQk3PX2GPDhYLoVnn0tKDpb6vzV6I6SdObFolgjUo5xq89kF+La2oUAHxByeOBh9U24q94WKx3zc45q+samlizO3w8LQ0SZGbmNXtKE87lv5LMfrCtXksvGPuu8RSHcSj2YlfeVXKBc8xKqaJnrBb5dihr4fiIjuR234R4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764873414; c=relaxed/simple;
	bh=SGRJGW+S1sIUufJvj6Tjt1v8B/ZWkglN6tSz7kiK0os=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=O4Z89bkL16ZUBwsMyWLFgooQfWTmbZrkqM9PG7L9i/xxyGRTkz8L37i0SvkeAH12r9mKdLzQpc7u0t62mMQB9pCCBl9RZh7BNCbXsVwSzqO+/WtB6mc4kIkdp2uPTlqpEuTivs52JTrgbGak71GsU+Vun/vUpgijhrT1Jge+iWc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=hDHvuyKZ; arc=none smtp.client-ip=209.85.160.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-4ee147baf7bso26201cf.1
        for <linux-kbuild@vger.kernel.org>; Thu, 04 Dec 2025 10:36:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1764873412; x=1765478212; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CsYrPVr2QqKJbaV0xcIxlUV6NeC72UK28di6JMzzOjk=;
        b=hDHvuyKZwE+CZmfhbFEpCySJM1nNtQxh2KPBkVrmIzNBQz5gkyeDDQ4CeVYuYetejI
         dqWGu/da9lm/fcPjBwpuZ3hXHwiS7l6e6zP4/+Aya4NcTyBNg4/APnkb6BJzukgvXtwo
         oldrJ8Gki69DM+uc1Fw9SWkLvE1B947fm+A6FAnAJM7+xXEZNEum/S7gjjm86hVAtpJQ
         4UE79eITwZpI07aE8GX7wuHVzmjSQXfe/xqmQSxjZiKhs8a1iVWGpxgHTQ+4iQOr5K65
         THlqS73khM2qfhLCc0U7AgY8IJn0xhEfQ1MQJmJehBmnxfgyFN1xLj4nhh4DfcdquGkK
         Agtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764873412; x=1765478212;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=CsYrPVr2QqKJbaV0xcIxlUV6NeC72UK28di6JMzzOjk=;
        b=SB1rV+d8z1/82/u3YGx/qo8V3ew2ymqeb3czM4G6XEf4wwbf2m12XQ/nu9AIcdQfe2
         TSVJWSWSmRXsNcGdfEXQHTtT0FKGJQRJaRrRjBONO/S8o7EtF6Z4EcDfiPh9Bd7u14fX
         qYmJ5fqZzBvXioS5y8Xk5xf6OnXru0Mn1KrC3UhPE7pfAbpjn/q46dtgqhIntrCp3i7f
         /BDazDhpDItoeGZHLwN3WNXz+JNwQNpVNDCTogkoxfSSY4n3mJuc77cd8SM7klfFRYLt
         7gSQJm/QYaJjc3/18yQv2seQhWKAs3NERUuyKwP8HvLAMfLyQc/A4o2uut466v36/3IQ
         dfSQ==
X-Forwarded-Encrypted: i=1; AJvYcCXTCY5y+WnJRopurMLeziXptOCkEu6E8COFTvVijxvLqvKsnOwYtekvKQhNzsgIdyAf68UrBN4Irh6sdiw=@vger.kernel.org
X-Gm-Message-State: AOJu0YzrZj8WQScWrmsrkA0qIZYPU4/YzUZT1FqxehXYVH3VmYzLJf4g
	53Fesk6XHd2ZJ9zGwtdJKBbRTQ+KgWJlI8BPH8Mu+dpUri+yMjyMo3ngNmLd6DsyU49ReIRxLRE
	VSyzeUK70/XtqpXzKb+SlXJ0OZZtgknDsLqxxiotC
X-Gm-Gg: ASbGncuzvMehCj9YgpE12xhSpMHv0WPiHwCB8a4AHTwH+X/k1Rff3tR1mHNfjfsIIs8
	tvAeDZs6jMwXh09X5NwSBnUW2E42WBM+GjhYGbj1fKdHk8xnCKjEGiiKNFIliwlzrIRHl6P5UIu
	D4vXXrcuz16rQDQeoAZh+5PpZGSVRfoX0AGwjl0gTRNwg6aOxHCs6kQc2vEejgwdGuJuqvL0SeM
	1/wR3VTBAydd2GeQX3BdjC4JqhyxdTVTfsDKhUm7x8BIaJpMsQuvPoZ+oFo9YD34clAkLLTIUvc
	6+CBDHOe1nld9f1ZqQDskp4ccQ==
X-Google-Smtp-Source: AGHT+IECOuaDK8PQQ8MGYEYUxu5nMjEsM6twQcV37PAe9/sgPjtwnGZPg87NgA21qhu9H5nF+K0Li9xrNAhTU4NUPeU=
X-Received: by 2002:ac8:7f06:0:b0:4f0:22fb:6c1e with SMTP id
 d75a77b69052e-4f030e5dd48mr473381cf.8.1764873408304; Thu, 04 Dec 2025
 10:36:48 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251028182822.3210436-1-xur@google.com> <20251204174954.GA1177092@ax162>
In-Reply-To: <20251204174954.GA1177092@ax162>
From: Rong Xu <xur@google.com>
Date: Thu, 4 Dec 2025 10:36:36 -0800
X-Gm-Features: AWmQ_bkT-ttFDkboXEEMPR8PO6dNYqj_msvOG67DSBRrGI1kR6lEjxgc6u53IVo
Message-ID: <CAF1bQ=RvJnN2DULkRPk7LBK07HsRaON5fMbny1ZmpjuO8cvvOQ@mail.gmail.com>
Subject: Re: [PATCH v5 0/2] kbuild: distributed build support for Clang ThinLTO
To: Nathan Chancellor <nathan@kernel.org>
Cc: Masahiro Yamada <masahiroy@kernel.org>, Nicolas Schier <nicolas.schier@linux.dev>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Alice Ryhl <aliceryhl@google.com>, 
	Sami Tolvanen <samitolvanen@google.com>, "Mike Rapoport (Microsoft)" <rppt@kernel.org>, 
	Rafael Aquini <aquini@redhat.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Stafford Horne <shorne@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	Piotr Gorski <piotrgorski@cachyos.org>, Teresa Johnson <tejohnson@google.com>, 
	linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks Nathan for testing and reviewing the patch!

On Thu, Dec 4, 2025 at 9:50=E2=80=AFAM Nathan Chancellor <nathan@kernel.org=
> wrote:
>
> Hi Rong,
>
> On Tue, Oct 28, 2025 at 06:28:20PM +0000, xur@google.com wrote:
>
> First of all, my apologies for taking so long to get to testing and
> reviewing this patchset.
>
> > Rong Xu (2):
> >   kbuild: move vmlinux.a build rule to scripts/Makefile.vmlinux_a
> >   kbuild: distributed build support for Clang ThinLTO
> >
> >  .gitignore                 |  2 +
> >  Makefile                   | 25 +++++-------
> >  arch/Kconfig               | 19 +++++++++
> >  scripts/Makefile.lib       |  7 ++++
> >  scripts/Makefile.thinlto   | 40 ++++++++++++++++++
> >  scripts/Makefile.vmlinux_a | 83 ++++++++++++++++++++++++++++++++++++++
> >  scripts/mod/modpost.c      | 15 +++++--
> >  7 files changed, 174 insertions(+), 17 deletions(-)
> >  create mode 100644 scripts/Makefile.thinlto
> >  create mode 100644 scripts/Makefile.vmlinux_a
>
> Overall, this seems reasonable from a high level perspective. I have
> been testing it with my arm64 and x86_64 distribution configurations for
> the past couple of days and I have not noticed any issues.
>
> Did you take a look at the robot report from patch 2?
>
>   https://lore.kernel.org/202511052257.Bb85ptQG-lkp@intel.com/
>
> It seems like it could be caused by different optimizations?

I haven't tried to reproduce the issue in this report. However, based
on the warning messages, it looks fine to me: Distributed build mode
will have different optimizations from current in-process ThinLTO
build. This is mainly due to the fact that distributed build mode has
more precise option control. For a more detailed explanation, please
refer to my LLVM Discourse post:
https://discourse.llvm.org/t/rfc-distributed-thinlto-build-for-kernel/85934

Additionally, I will be presenting a talk on distributed ThinLTO
builds at the LPC next week and would be happy to discuss this topic
further with interested individuals in person.

Thanks,

-Rong

>
> I plan to take a more in-depth look at the implementation after I am
> back home from Plumbers in a couple of weeks (just to make sure I
> understand it from a maintainer's perspective). Based on that, I will
> either apply it to kbuild-next for 6.20/7.0 or ask for further
> interations, while still aiming to get it into that release.
>
> Cheers,
> Natha

