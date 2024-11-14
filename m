Return-Path: <linux-kbuild+bounces-4674-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 017BF9C7FBC
	for <lists+linux-kbuild@lfdr.de>; Thu, 14 Nov 2024 02:09:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7AE191F2191B
	for <lists+linux-kbuild@lfdr.de>; Thu, 14 Nov 2024 01:09:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C0F3C1CCEED;
	Thu, 14 Nov 2024 01:09:34 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAEBE1CCEE0;
	Thu, 14 Nov 2024 01:09:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731546574; cv=none; b=TVYFaI2DF9j9lDTdyihAFjAwBjEQuxfct8r6I95hexcvs0LP3paUab3ZUF27qMkC0pOOEruyqbaBbQagkpXHgRRwelyqHy/47bZTpxoF5EH/ZvS8I/RPXQAC/3yjp7ULxRGMkJVkh+XG7fvsL3h011YkaHHADHmrDPFLTXNsC5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731546574; c=relaxed/simple;
	bh=4dBnu6yXq+K0Mi0c+uAajHja4UE4d0nABKzZl+smMfw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QPNEsXjWwBu2Vc5xynxXTZeUXugtINfx5XCD8swTErFotskcZIouLlS8GYNtJJfe2IHBfIuaRviNxOpNynSOhRmgXZyBf0tMkIoiIvzm+JoA5IaVQFcDcBTcMiTMNZg0dhDlfLJx0POahMEA7sP0Gj61fw9p3SpeLyiC2oxfeBs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gompa.dev; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gompa.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-539fb49c64aso73334e87.0;
        Wed, 13 Nov 2024 17:09:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731546570; x=1732151370;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=poZXREh8ime1SzzkUl+eZQKKgwvGXn8BXWEpCPeefZg=;
        b=mU86A2N49MlMdzEHaaz5SmN7IgUU4u6Ks46VUc6D4rEFwbFBroInT53mTCHN4AqmFB
         s6e1mkT8FJdV3JhE/a9Mld+EhlbOVW5UUBHV3YoNEjSNqjbrxTf2Kmp4UTj+SDGXBYTQ
         VHC9CnKEL3AKWXJMUthe5xTVsPJLewCXjsFRrofeuI3OzSTQMn9UzCn+jWaYftYSwsZP
         eus0kT3rYjOCThUf3fXqIKylBvkgvfrh2G8dB7gSPaX5N8uFPHWjvReV2aCWRPhFtIQT
         kSczfdeP1cMVeCG0c0oBprgeiHaCNhVbUXTKW3RUCRqJlPjXz4BEVkmdHCxgqigt+bIS
         mRMg==
X-Forwarded-Encrypted: i=1; AJvYcCVKRQchfiDb6bdz/V50uon9/BKQqOeLuADB+w2lAsZmy6Mz+4mfZIGLHll2XKS4t0zNdpjMLGO9dUaX6rF1ROo=@vger.kernel.org, AJvYcCVu6M/7T6Tv8qZLb/QOULSSyDoooBYDid8S4TMvcY6D7QgxItSf5L+voK7cTO5+lTIHpNzDwiFqJYo7G95XgQ==@vger.kernel.org, AJvYcCXcRHiIUq54GcD79eoLEjE9mMU5rRFi1IkQeTk8gWzPxBZlO0dZi28nIgjABrSWkv5uyTH4VBlSAcLa9S2P@vger.kernel.org, AJvYcCXiE8NxH/la0wylfGcsyintCWZkRvt0+HPEXMCSUGlge8zWXAp+iJDSOym+bOZ1L1axlUIfc3IDzO2A/v8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwJ2LVBFOSoD6aDsUzZcQ7au/kwMJee6TG9a+y+JWN3azY+dRIZ
	77C1W+CKAnxfMMEqNpOoQ3FxJX8innYDXPCVBeOMxCSIifr7hXXGwOIY3sM3aQ4GqQ==
X-Google-Smtp-Source: AGHT+IFg2ulbEahV6fcZy9QQvfeb2d4TR4fvLjExiGL18iXsp/dreHuH87gojPMBSaV4e49oENcR0g==
X-Received: by 2002:a05:6512:114c:b0:53d:a2da:d396 with SMTP id 2adb3069b0e04-53da5c3eb3amr231136e87.23.1731546570341;
        Wed, 13 Nov 2024 17:09:30 -0800 (PST)
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com. [209.85.208.173])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53da6500ed8sm9564e87.90.2024.11.13.17.09.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Nov 2024 17:09:28 -0800 (PST)
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-2fb51e00c05so1146921fa.0;
        Wed, 13 Nov 2024 17:09:28 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWBXNIEL/mIT4eKJZ6sOJJK4W003238SM+AF3bJo1b/kEisGVDslJbtaEZtKsTI7Z/1/AmjHt966RFP5SS0eQ==@vger.kernel.org, AJvYcCWLN5P2VVKU8IKR4/SKGdi+rdVI1WfHN9SGerY2L7SzH39+ALsiqkjl/weHdtGzYeer7IE5O3IoJh7xXJvV9jI=@vger.kernel.org, AJvYcCXEWYvLeh5mZS497AyD4y67ZwShY9Vqai8tXSU5GUB2DvUEa1oNusGMQ6cr6lB4oOOGOB+OYCCJ1XdDcJs=@vger.kernel.org, AJvYcCXuWLtT9gtkiI17CAp/HwKTBea2sT+829erSCgl/d7Ivh/1AzdCXM7A4DMNnaZqVKjoQFRxvjti4x//Yi5c@vger.kernel.org
X-Received: by 2002:a05:651c:503:b0:2fb:3960:9667 with SMTP id
 38308e7fff4ca-2ff59027c97mr1506281fa.14.1731546568430; Wed, 13 Nov 2024
 17:09:28 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241030170106.1501763-21-samitolvanen@google.com>
 <20241030170106.1501763-22-samitolvanen@google.com> <CAK7LNAShVzrE6uhXxZ7HepKhmOJYsZeigq6w19jRN3OH-T_Jyg@mail.gmail.com>
 <CAEg-Je_o-e3Sc0vNJpF+3eG3sZvV-f2zrCdubRAvPSLzVdyd5Q@mail.gmail.com> <ZzT_ZSNAmeloDjLT@bombadil.infradead.org>
In-Reply-To: <ZzT_ZSNAmeloDjLT@bombadil.infradead.org>
From: Neal Gompa <neal@gompa.dev>
Date: Wed, 13 Nov 2024 20:08:51 -0500
X-Gmail-Original-Message-ID: <CAEg-Je9yJh4teQeix4N9BF85JhkQMPHLAz2dnBrM1MLbBjO1iA@mail.gmail.com>
Message-ID: <CAEg-Je9yJh4teQeix4N9BF85JhkQMPHLAz2dnBrM1MLbBjO1iA@mail.gmail.com>
Subject: Re: [PATCH v5 01/19] scripts: move genksyms crc32 implementation to a
 common include
To: Luis Chamberlain <mcgrof@kernel.org>
Cc: Masahiro Yamada <masahiroy@kernel.org>, Sami Tolvanen <samitolvanen@google.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Matthew Maurer <mmaurer@google.com>, Alex Gaynor <alex.gaynor@gmail.com>, Gary Guo <gary@garyguo.net>, 
	Petr Pavlu <petr.pavlu@suse.com>, Daniel Gomez <da.gomez@samsung.com>, 
	Hector Martin <marcan@marcan.st>, Janne Grunau <j@jannau.net>, Miroslav Benes <mbenes@suse.cz>, 
	Asahi Linux <asahi@lists.linux.dev>, Sedat Dilek <sedat.dilek@gmail.com>, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-modules@vger.kernel.org, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 13, 2024 at 2:35=E2=80=AFPM Luis Chamberlain <mcgrof@kernel.org=
> wrote:
>
> On Wed, Nov 13, 2024 at 09:04:51AM -0500, Neal Gompa wrote:
> > On Mon, Nov 11, 2024 at 11:06=E2=80=AFPM Masahiro Yamada <masahiroy@ker=
nel.org> wrote:
> > >
> > > On Thu, Oct 31, 2024 at 2:01=E2=80=AFAM Sami Tolvanen <samitolvanen@g=
oogle.com> wrote:
> > > >
> > > > Suggested-by: Petr Pavlu <petr.pavlu@suse.com>
> > > > Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
> > > > Acked-by: Neal Gompa <neal@gompa.dev>
> > >
> > > Does this Ack add any value?
> > >
> > > Acked-by is meaningful only when it is given by someone who
> > > maintains the relevant area or has established a reputation.
> > >
> > > $ git grep "Neal Gompa"
> > > $ git shortlog -n -s | grep "Neal Gompa"
> > >      2 Neal Gompa
> > >
> > > His Ack feels more like "I like it" rather than a qualified endorseme=
nt.
> > >
> >
> > I have tested and looked over the patches from that lens.
>
> The tests you did, what exaclty was tested?
>
> If it was to just ensure no regressions, then that information is
> useful too, and with that you can just provide: Tested-by.
>
> But actual details of what you test are useful. We now also have
> automation of tests for modules, and expanding test coverage on that is
> always welcomed too [0] [1] [2], so far we have 0 Rust coverage.
>

I tested that I could turn on MODVERSIONS with the relevant patch
series, and get symbol expressions out of it. I didn't go very far
into it, because I didn't want to invest in reworking the kernel
symbol dependency generator for RPM packaged kernels to leverage this
until after it is finally merged. But it worked as described, even if
none of our kernel packaging infrastructure is adapted for it yet.

To be honest, I considered sending both Acked-by and Tested-by, but I
figured Acked-by would be sufficient given that I have also looked
over the code as well and thought it was reasonable.

Strictly speaking, we don't really use MODVERSIONS in Fedora, it's a
CentOS/RHEL thing. But, pushing this forward helps make Rust
enablement for Fedora easier because the Fedora kernel is managed
through the ARK project, which is mostly oriented around the needs of
the RHEL kernel team. And CentOS Hyperscale (which I am also part of
and maintain a kernel for) does have MODVERSIONS on and I would like
to be able to start enabling Rust stuff there (particularly Asahi
code, as that's currently the main interesting thing in Rust to use).




--
=E7=9C=9F=E5=AE=9F=E3=81=AF=E3=81=84=E3=81=A4=E3=82=82=E4=B8=80=E3=81=A4=EF=
=BC=81/ Always, there's only one truth!

