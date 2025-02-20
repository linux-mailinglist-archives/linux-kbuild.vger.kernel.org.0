Return-Path: <linux-kbuild+bounces-5847-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 55E71A3E383
	for <lists+linux-kbuild@lfdr.de>; Thu, 20 Feb 2025 19:13:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 166DE3B9C52
	for <lists+linux-kbuild@lfdr.de>; Thu, 20 Feb 2025 18:12:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4047A212B0A;
	Thu, 20 Feb 2025 18:13:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jvrjRSc3"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 178EF20485D;
	Thu, 20 Feb 2025 18:13:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740075185; cv=none; b=XK/uqf8xkkx5EuElAsqR5aMSxWAy/2/pmcxqVVfV+BsZhvK2JRLI0g52TXUGNwK0GWjWgejYVLjQ77uzoNluaFsjmEvgRmfBv+dqUUqWe5tLNarEn4KOqiqMH5H9CUN7cufHIgrabjknH58hCcUhTEAtBOhB4C2pJmQII/FTK1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740075185; c=relaxed/simple;
	bh=iOwyubfEwlgonjCBmwXc8PikMqd0oQVwQdZ+60PJrV4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=S3HIwmrwFhpGp2duQ95batTKv4M2DGb5ypGuCyqiw0t+eHq/xhTVSsRN8VPBRmVVLIHKr08akoJRd/J2XG0cRB6fQiqvUI34djv4i7WT09z/OwfSHLUFpyzv+66S/cLmenxNPVIy0HB8it9IeJD1iIBZeHZlSEaIIx4KFU/rl5E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jvrjRSc3; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9EF4DC4CEE3;
	Thu, 20 Feb 2025 18:13:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740075184;
	bh=iOwyubfEwlgonjCBmwXc8PikMqd0oQVwQdZ+60PJrV4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=jvrjRSc3Mewmsbw4uj7gV3Y8iVi71m28V6XJovvoioCzse6ZF3st6hPfADUdmKAnT
	 k0TtCyEgKiJ1k3GXoEMHTBfJgaq4Kutz46lBH/oQYN8UPDpGle5uOAffGCBhrKKhcW
	 CUr8dnIzy29JLZni+YQjvuiq0BhT7zL7fdrnPETV+bAXRsqg/eSmLAO5eTVr4xPcZa
	 +060VNhj1pLVAnI5NLPHxN7HJV4dxaj48b6l6A+NOFhRxf7Sk7PlPcaiecHntIcjp0
	 5oHl2VPJ58oHUz6bFKoVnOqb4Zj5a2EYeLO/++t7i/2JSeMk2cbpe/MKQmLkHVQR57
	 5FlNFvwDK2q8A==
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-543d8badc30so1535357e87.0;
        Thu, 20 Feb 2025 10:13:04 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWM7pimAuU8GC+YZJFbEgs9RijOtmAjhwyw2tSipSzypb/IenbZBNQvqjRMrYRWcZkHgNSw+dlX+FS0zlat@vger.kernel.org, AJvYcCXWgFFYp0dFZ7/hYSzimKrQIYmAZr+eUZlXInWftu/xk9+p8PJwW9uucCCaE26BiZHyiw7yGfglsqBm4Ng=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1BlGMG+eI6JX6YeFCI0BwqNCZ1VgUGKXKyQvjUtBn4xmNnSvQ
	ehxxuwbTzoi6L7hIgzwwDdpgpJXmtRhIrU914ASD3/MreRgxmpQOq1XSWJ4W6aK3FL5M90E6RdC
	DUOIh4PNIyisrLqNs8xutZXmC80A=
X-Google-Smtp-Source: AGHT+IHHVUrcL5rkcVLI1kVwE0GL8V4V3P5DP0PzgyCNVcQrxnx7WthKcd//qPDaSMSnPoYzVrVrQvELsanbaCpbQZU=
X-Received: by 2002:a05:6512:ba6:b0:545:e19:ba1c with SMTP id
 2adb3069b0e04-54838ef208bmr5168e87.19.1740075183320; Thu, 20 Feb 2025
 10:13:03 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240727074526.1771247-1-masahiroy@kernel.org>
 <20240727074526.1771247-4-masahiroy@kernel.org> <b3a8816c-3846-83ab-9750-fd12041d9495@quicinc.com>
 <20250220-red-antelope-of-education-5417aa@l-nschier-nb> <0ee862ec-4c36-4c3e-ae90-627c6b0e527b@quicinc.com>
 <20250220-kickass-famous-kittiwake-c11f5b@l-nschier-nb> <80cf4e9a-5d49-4bc3-8160-1b23c31d4d36@quicinc.com>
 <2025022020-armband-clock-69af@gregkh> <13fac9ee-cad9-466b-9216-8c0516600b03@quicinc.com>
 <2025022057-reclusive-overreach-ac89@gregkh>
In-Reply-To: <2025022057-reclusive-overreach-ac89@gregkh>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Fri, 21 Feb 2025 03:12:25 +0900
X-Gmail-Original-Message-ID: <CAK7LNARZon-tqr+oKfr0r+nSfK9R6iz1AZrY9pLoaAhOqWfL6w@mail.gmail.com>
X-Gm-Features: AWEUYZlMlGicc1vOO01YGbQTwSZKn4jkM5kXZSNLg62qBjkuNlwITi8aKcn3HUU
Message-ID: <CAK7LNARZon-tqr+oKfr0r+nSfK9R6iz1AZrY9pLoaAhOqWfL6w@mail.gmail.com>
Subject: Re: [PATCH 3/4] kbuild: slim down package for building external modules
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Jeffrey Hugo <quic_jhugo@quicinc.com>, Nicolas Schier <n.schier@avm.de>, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Kees Cook <kees@kernel.org>, Nathan Chancellor <nathan@kernel.org>, Ben Hutchings <ben@decadent.org.uk>, 
	regressions@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 21, 2025 at 2:43=E2=80=AFAM Greg KH <gregkh@linuxfoundation.org=
> wrote:
>
> On Thu, Feb 20, 2025 at 10:24:32AM -0700, Jeffrey Hugo wrote:
> > On 2/20/2025 9:49 AM, Greg KH wrote:
> > > What do you need/want to parse the .config file in the first place?  =
Why
> > > not rely on the generated .h files instead as those can be parsed the
> > > same way as before, right?
> >
> > Two usecases -
> >
> > First when secure boot is enabled, DKMS looks for CONFIG_MODULE_SIG_HAS=
H to
> > figure out signing the modules so that they can be loaded.  Removing .c=
onfig
> > causes an error in DKMS and the module signing process will fail.  The
> > resulting modules (already compiled successfully) will fail to load.
> > Whatever the user needed those modules for will no longer work.
>
> Shouldn't the "normal" kbuild process properly sign the module if it
> needs to be signed?  Or are you trying to do this "by hand"?

You can ignore this.
This is not related to the upstream module signing.

He is just explaining how DKMS greps CONFIG_MODULE_SIG_HASH.

See this line:
https://github.com/dell/dkms/blob/v3.1.5/dkms.in#L1113

The upstream kernel documentation said "do not grep .config" many years ago=
.
The latest DKMS has been fixed.



>
> > If the user is on Ubuntu, and has built a kernel 6.12 or later, they ne=
ed to
> > build upstream DKMS and use it as none of the Canonical provided DKMS b=
uilds
> > have the fix.  This feels like a situation that would make the user afr=
aid
> > to upgrade their kernel (to your point above).
> >
> > This feels very much like an "at runtime" issue, assuming external modu=
les
> > are supported.  I may be wrong here.
>
> external modules can be broken at any moment in time, you know that.
> There's never a guarantee for that at all.
>
> > Second, our usecase is that we look at the .config to tell if a particu=
lar
> > driver is included in the kernel build (config =3Dy or =3Dm). This driv=
er
> > provides diagnostic information which is useful to our product, but not
> > required for operation.  It does not have headers that are exposed to t=
he
> > rest of the kernel, so checking the generated .h files does not work.  =
If
> > the driver is not built, we provide a backported version that is then b=
uilt
> > out of tree.
>
> You can check the same .h files for those config options, no need to
> manually parse a .config file.  What's wrong with including
> include/generated/autoconf.h properly?  That's what the build system
> uses, right?

Upstream uses include/config/auto.conf
External modules can do the same.




--=20
Best Regards
Masahiro Yamada

