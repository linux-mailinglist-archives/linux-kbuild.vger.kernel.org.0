Return-Path: <linux-kbuild+bounces-7340-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FB45ACACE5
	for <lists+linux-kbuild@lfdr.de>; Mon,  2 Jun 2025 12:59:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 247E117E90D
	for <lists+linux-kbuild@lfdr.de>; Mon,  2 Jun 2025 10:59:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DED181FF61E;
	Mon,  2 Jun 2025 10:59:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dlYHi/A7"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2B3B4C92;
	Mon,  2 Jun 2025 10:59:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748861959; cv=none; b=eFyFPsdbZCDNCiR3C+kSEYn8ID6T5VfDKtmPDOWYfy4h3uJcHlb+HwwMhzpM8EaxGvQZbVj8RIYKYFHkKQZHhoXi7Gq/eDYCRNQHszP4S5Kvu0BhgTzmyN6tECdG6pq5xir2n0E5ilL7Xm8jA8+PbpjKh+pZ1thnXsjWaLGt5gU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748861959; c=relaxed/simple;
	bh=2VEo2hMZzwdhi+wgZfkvsTKcIzhkMWVMAWCJSwtXtlo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OusBSSyPEFLIPvE19/uf020g2eUhxYxau0q8BAC/txA4/cxxrMLHus2iFwRYwNEV2ZcRR7x+0zn9kUk5YBDiklKjk6NI4q1mQ+1UEuNpUJ/h9MMmiP5jf6hC0dLQRSyvukKtAMUJDIIhLb+MHCJg2R4jEcsIUBCEqmywAS3T26g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dlYHi/A7; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B8E5C4CEF3;
	Mon,  2 Jun 2025 10:59:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748861959;
	bh=2VEo2hMZzwdhi+wgZfkvsTKcIzhkMWVMAWCJSwtXtlo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=dlYHi/A7rMw3XokgajrCkMO+rVaNnlgrlBK+W55zIECxXMenuTd/muPtNw6KrpmFz
	 dWQl2fgo4ygxuhsHpX2xNvskMMqzaPjAbNUb4GuQXJ/rJx0qjS0VhcdbJ1DsbwP55I
	 TGp0ruu6ZY/+43avy9ALNZOvYy/hNvvC4z45xVAcvXkhCcV8XgSu+AFRg6P34rucxt
	 7vp1iMvlaSOoPGP8YClB0FvYuwnTSfwtgJsJiG5mouvSHzxa/fFuVaU8JOlTVorV02
	 kq+71gkSai1nsBucaM0OBJlYiLdfXFkDaOdNtO1Im0MNO7AOgQCd9T9mcOusPjrEn2
	 eZrig+ybeeZxA==
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-54e7967cf67so5069560e87.0;
        Mon, 02 Jun 2025 03:59:19 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU6HhoXACZT3dH/cXYYvRxJKxtrNQAoAX38nNhgK2K0PuZI/TsHXehwTpwvCp3HuO16qBLy+ZbjvYNZ5faP@vger.kernel.org, AJvYcCVOdbEUiWSW32YKc9OGHBSHhvchGGKEq36Ln+nK7Z6dgD3TjaJqw3Nq/ihFe3IE14spSttCk0Lto6Zd4ggXYg==@vger.kernel.org, AJvYcCWC/bZVxBWBSIRlthrQ92Tw9p0kgySBuL0bVvyFldHu8rdf5i5Ki6qCEgyNpOTW1YwatPGrGsqwZL7zm+M=@vger.kernel.org
X-Gm-Message-State: AOJu0YydqSmQbfv0VUwkVO1ictSlbQEtVtJm8T1vM4cOcllcM8Wul3En
	BqzMs6C6ekoH75Kx8Do/+M40QYOh8bDTYtOSPhsH7WcFD6kJgAoiqpfiBN583JwvybZC3A1VywV
	4ACLCJU4Zgut7ayCW0thFBXuqtDWX934=
X-Google-Smtp-Source: AGHT+IEOgCfgH7IcYMl7oqdLZ5WGrqkp9giDUV05KwH5YZl0aU1XpTeJCMpsIuO62wHRQ0ujeoffva1bKg4zb1r6hfQ=
X-Received: by 2002:a05:6512:4023:b0:553:2645:4e90 with SMTP id
 2adb3069b0e04-5534318e377mr1817747e87.52.1748861958159; Mon, 02 Jun 2025
 03:59:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1748335606.git.legion@kernel.org> <ecf0ebdda5bcf82464ed1cebbf50afdcd8b5b23a.1748335606.git.legion@kernel.org>
 <CAK7LNARkhc40UfrmmqsqmqkCn60=7zHc=pDFGR4o=k2p7CsABA@mail.gmail.com> <aD1bozP0l67f_wbs@example.org>
In-Reply-To: <aD1bozP0l67f_wbs@example.org>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Mon, 2 Jun 2025 19:58:41 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQmQtvB4PfmH4MkRM123wySON6cF6TG79fi0WER1sz4Gw@mail.gmail.com>
X-Gm-Features: AX0GCFvAZfsItMIePqVADcifMZhyGwMHA0rsh6EXENQAN-lX6_h-ON-2R3Ep-tU
Message-ID: <CAK7LNAQmQtvB4PfmH4MkRM123wySON6cF6TG79fi0WER1sz4Gw@mail.gmail.com>
Subject: Re: [PATCH v3 3/6] modpost: Make mod_device_table aliases more unique
To: Alexey Gladkov <legion@kernel.org>
Cc: Petr Pavlu <petr.pavlu@suse.com>, Luis Chamberlain <mcgrof@kernel.org>, 
	Sami Tolvanen <samitolvanen@google.com>, Daniel Gomez <da.gomez@samsung.com>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas.schier@linux.dev>, 
	linux-kernel@vger.kernel.org, linux-modules@vger.kernel.org, 
	linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 2, 2025 at 5:07=E2=80=AFPM Alexey Gladkov <legion@kernel.org> w=
rote:
>
> On Mon, Jun 02, 2025 at 04:45:36PM +0900, Masahiro Yamada wrote:
> > On Tue, May 27, 2025 at 6:08=E2=80=AFPM Alexey Gladkov <legion@kernel.o=
rg> wrote:
> > >
> > > In order to avoid symbol conflicts if they appear in the same binary,=
 a
> > > more unique alias identifier can be generated.
> >
> > Why must this be unique?
> >
> > What problem would happen if the same symbol names
> > appear in MODULE_DEVICE_TABLE()?
>
> Before these patches this was not a problem as non-unique characters are
> in separate object files when the module is compiled separately.
>
> But when the modules are compiled into the kernel, there is a symbol
> conflict when linking vmlinuz. We have modules that export multiple devic=
e
> tables from different object files.

This is because the __mod_device_table__* symbols are global, but
I suspect they do not need to be.

Let's test this
https://lore.kernel.org/lkml/20250602105539.392362-1-masahiroy@kernel.org/T=
/#u




--=20
Best Regards
Masahiro Yamada

