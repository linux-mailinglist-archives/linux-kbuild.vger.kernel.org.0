Return-Path: <linux-kbuild+bounces-4541-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F148F9BFFC1
	for <lists+linux-kbuild@lfdr.de>; Thu,  7 Nov 2024 09:13:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A98BE1F23033
	for <lists+linux-kbuild@lfdr.de>; Thu,  7 Nov 2024 08:13:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DCE371D54C5;
	Thu,  7 Nov 2024 08:13:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HjDE1G+w"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF1831D3644;
	Thu,  7 Nov 2024 08:13:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730967215; cv=none; b=OE2PR9WnUdaxqUStidnkg0FouZwul7YKrcn5y9ntC+gFcbwrBY9oj0KSa0srtTzvMGbE6HMo1cm7KSMnmSHAH0L9qnPDYqViD2sN293eDguAAJEdtFuPdtIYw8KK7amRkwVOLGUqHMaY+H63C5JdGP96I0U5VNXctuWfLYVzy24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730967215; c=relaxed/simple;
	bh=4Gp7NgkH2bJqCGngPvp+IQbfoaYJHJZsWZ4irQEDe6I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fiMro7a7m9ZRVgn6tuXzuoulmje0WaD+srg7tgGfEn735GtwLbPsHDNx/lAio102ddW0Hl0qhquk5OnocucCa49YCXs+30Xq9HyJATMbk63xarK8pXy8+KsvuL/iwLNpxGFAFTIZE21u+ytA4OS5OveG1sL3cX7gM2YUQkoM8mw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HjDE1G+w; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 468D8C4AF0B;
	Thu,  7 Nov 2024 08:13:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730967215;
	bh=4Gp7NgkH2bJqCGngPvp+IQbfoaYJHJZsWZ4irQEDe6I=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=HjDE1G+wouJVjzLF35Az7/q9/wdoGFlBcnrVJcob1UJRYlnZSkCN1TWu3lrjlktCP
	 py/7/BUKnrWa+KzxCY761dySmqFAWlYSO6Ep7ToyRwQTEUsYP+PZF3Cz89deNjcmCj
	 jhskBCjBy11xyp5W10q/wWdErsFJaqv3RuFz93LBHGqF2W3yjgXtGH5EGLvCx0jhA6
	 pdgenJRaclUsPBxz9r+5lkw/9wwXgbJzJlkDfTB7/gvrIls1JPRDeLRN+KbzoIqrte
	 GB/d2qGfl/gvKP6WVgashaHTWQClnBbdOiBELJUKtmsCirwCqWOpgARi5Ozt9xm7iL
	 bAR6MIs6BkT5Q==
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-2fb498a92f6so5384191fa.1;
        Thu, 07 Nov 2024 00:13:35 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUmUGPgeN0Tod3IW5TyS3Ell5cSpZ29c0pTAG9rJypH1GpZ33M5V1TN0OMAl4nr05R/LYEn0hcFOKbAl3zVCw==@vger.kernel.org, AJvYcCVZMUcY6DK8iCkZ52bGSfb4JSbMa/0lLJSnIRYWz9PCZoC+BpvGYIakVIjrasVmsb3sSA0+OzLWHcgZd/lr@vger.kernel.org, AJvYcCXLO+ULt+jTU6rId1lkkF+13C+RkVXo81Pbe/ztI1L/wB4f2Pf4Xv5DVAXtzmWJeufxmR8qeQJLb1qmdjI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwJHmXMSxHJ2xGsTUE6EjXJO5bYOU9iLquSUk8UYUH3vaH8/DaS
	kd2e8GLbpfEE9b55EK478zeRB+S3oEcLdu1P3S4siGM3M12DZwjNGA+RSDFEis7TcGSPSZOPbnB
	Rc0zSQiWEQscQcVZS/piqx+VBviI=
X-Google-Smtp-Source: AGHT+IEfkbuZAVqhb0UlE9xN85OUJcL6GmdKeqptL1m9TrfR0DbuKvesnTUhsNiljX71+aAb4oqdMzx4yNNGkrkWdkk=
X-Received: by 2002:a2e:b88d:0:b0:2fb:3d86:d932 with SMTP id
 38308e7fff4ca-2fcbdfaea70mr218462241fa.12.1730967213878; Thu, 07 Nov 2024
 00:13:33 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241106190240.GR10375@noisy.programming.kicks-ass.net>
 <Zyv-yxClglfwvmUa@bombadil.infradead.org> <ZyxUTT8t28XUkk4x@infradead.org>
In-Reply-To: <ZyxUTT8t28XUkk4x@infradead.org>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Thu, 7 Nov 2024 17:12:57 +0900
X-Gmail-Original-Message-ID: <CAK7LNASDnB86Ds_dqBTxfHi=OfTXqu66U3v+4M_OEzKiK5Skdw@mail.gmail.com>
Message-ID: <CAK7LNASDnB86Ds_dqBTxfHi=OfTXqu66U3v+4M_OEzKiK5Skdw@mail.gmail.com>
Subject: Re: [RFC] module: Strict per-modname namespaces
To: Christoph Hellwig <hch@infradead.org>
Cc: Luis Chamberlain <mcgrof@kernel.org>, Peter Zijlstra <peterz@infradead.org>, x86@kernel.org, 
	hpa@zytor.com, petr.pavlu@suse.com, samitolvanen@google.com, 
	da.gomez@samsung.com, nathan@kernel.org, nicolas@fjasle.eu, 
	linux-kernel@vger.kernel.org, linux-modules@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, gregkh@linuxfoundation.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 7, 2024 at 2:46=E2=80=AFPM Christoph Hellwig <hch@infradead.org=
> wrote:
>
> On Wed, Nov 06, 2024 at 03:42:03PM -0800, Luis Chamberlain wrote:
> > > This allows exports targeted at specific modules and no others -- one
> > > random example included. I've hated the various kvm exports we've had
> > > for a while, and strictly limiting them to the kvm module helps
> > > alleviate some abuse potential.
> >
> > Yeah we also want:
> >
> > EXPORT_SYMBOL_NS_GPL(bdev_disk_changed, MODULE_loop);
> > EXPORT_SYMBOL_NS_GPL(bdev_disk_changed, MODULE_dasd_kmod);
> >
> > But we might as well have EXPORT_SYMBOL_GPL_FOR() with the implied
> > module list. We could then add just:
> >
> >
> > EXPORT_SYMBOL_GPL_FOR(bdev_disk_changed, loop);
> >
> > But it would be nice to just also support this as well:
> >
> > EXPORT_SYMBOL_GPL_FOR(bdev_disk_changed, loop, dasd_kmod);
>
> Parsing a variable length list in a single macro tends to be a bit
> of a pain, and I don't think there is much benefit.  Most of the cases
> should be exactly one module.  If we can cover the small uses of
> multiple uses with multiple exports I think its perfectly fine, and if
> we can't cover it at all I can probably live with that aswell.
>

Perhaps, the namespace argument can be a string.

EXPORT_SYMBOL_GPL_FOR(bdev_disk_changed, "loop,dasd_kmos");

If a symbol is intended for particular subsystem drivers,
maybe, we can support a wildcard.

/*
 * foo_register and foo_unregister can be used by
 * modules names "foo-*".
 */
EXPORT_SYMBOL_GPL_FOR(foo_register, "foo-*");
EXPORT_SYMBOL_GPL_FOR(foo_unregister, "foo-*");





Commit d143b9db8069f0e2a0fa34484e806a55a0dd4855
revealed a bare namespace string was a bad idea.

With EXPORT_SYMBOL_NS_GPL(dw_spi_resume_host, SPI_DW_CORE)
we do not know if "SPI_DW_CORE" is really a namespace string, or
replaced with another string by macro expansions.


With EXPORT_SYMBOL_NS_GPL(dw_spi_resume_host, "SPI_DW_CORE")
we clearly know  "SPI_DW_CORE" is a namespace string.


https://lore.kernel.org/lkml/Ymltn72chRkV4P83@kroah.com/T/



> > > EXPORT_SYMBOL_NS_GPL(dw_spi_resume_host, "SPI_DW_CORE")
> > >
> > >    is much much better than:
> > >
> > > EXPORT_SYMBOL_NS_GPL(dw_spi_resume_host, SPI_DW_CORE)



--=20
Best Regards
Masahiro Yamada

