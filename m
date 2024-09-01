Return-Path: <linux-kbuild+bounces-3309-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F304967763
	for <lists+linux-kbuild@lfdr.de>; Sun,  1 Sep 2024 18:15:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 640831C20A10
	for <lists+linux-kbuild@lfdr.de>; Sun,  1 Sep 2024 16:15:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 81B59181B88;
	Sun,  1 Sep 2024 16:15:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="F5h1/eNL"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51AE817F394;
	Sun,  1 Sep 2024 16:15:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725207339; cv=none; b=n4wiyz/xPKN6DQqTSVBxy2Cyd1vYzdgS4CI42c77xQezcVmjeYf7LsS9E169qtGH8aXi5O5uSJX+35i9MIeSrSe6UvFAbnKp6J7teOAMZCa+Zr4cyPH8/V3Wd9lTe3ynYW+9mI2HHitdFcgQx8pjnNRG68kKE0DDYVL/5ADDdXo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725207339; c=relaxed/simple;
	bh=gYIgZOi4sdR4hTdNE3LJJ3LeXGN5BLGNfkofNqnsRBc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=N6qqo20wIkhFTpJlW43OidiwknW60YVmFQQ/2ZN47qOO+nTSh5IRp0EOHOg84KyhTVjQjPaOymrBVRws8KlIDKDO6Vm3N3zddDoosP9lVeOiofyw+Dt9eSr9Fdm4Qsa5IISgmuAnBSVlhDRsc7CLa7QvhG0zjjqvXDQl0NRe1uo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=F5h1/eNL; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC4C0C4AF09;
	Sun,  1 Sep 2024 16:15:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725207338;
	bh=gYIgZOi4sdR4hTdNE3LJJ3LeXGN5BLGNfkofNqnsRBc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=F5h1/eNLAut+K9xbInA8o1Vqa2sZpvVnt33i+mDoFpaubGehtbFtkTdZKWa1mvOQU
	 CSsiRwCvOWvZvMvEO8L0Dsxwyr89B9qMvVFfrWbzq6Z8wKms7E7vADuGZJavaJ+Yq9
	 ddCRkatwMBI2yP8xVSOJokY6nLAtiaa47fyw12UjAMSKYqFuQqVvxjY3Vk9ZgQzRoc
	 6bOCtTkFHWjSazc04tEnJCsudAEBR8Pcv/himZ9VWJRdbe++qCe48wzQKqTx7uOX07
	 J7ewjUPy7qvCfaKAR8hR3puGLgD0egOP9gXsf94jOOO8lGHC7jbxrL/PZ8tNivTSUu
	 C2srQRHZ3LE7g==
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-53346132348so4320896e87.2;
        Sun, 01 Sep 2024 09:15:38 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUvUcCBe16O8XgY8+8oc+TCjVfgPmpihcSlmXZ2eWIJh3yJSz+FvODvY0t4JxspluH66Zvq5ZQXc/CFfco=@vger.kernel.org, AJvYcCV7ukIK4vcYbvG2qG4F4imGNNoK9b4A4ddvdiF8EMydJ7YPdUHrLT9thOXhIN6rcEXIBEZ9/2gdp17uafY+@vger.kernel.org, AJvYcCVOwvPO53lZozh/S5b7mDMUMdtFB7K/qdU2xG2U0a1ldYfhVQcJGZX37sHXmJ/CtWVPrqEHOFROyA==@vger.kernel.org, AJvYcCVa5cuMyLQb7TuyfbhcTVlVT+iixhGXmJxDK4y8fjqPc+e0tacHps85X4NcVWLmuksZX5znAAyMa1xsUA15@vger.kernel.org
X-Gm-Message-State: AOJu0YyZla+F39OjMQMjryPzXjQP8oR07FA+yRoQ9uwkEkOy+8X+/3mw
	NYe1C6xYS3MYTr25Su77PZMeDSQiqv23MDR4WTsOymFpxecb4s+how8H1wArvGpHPZpl/CFay3b
	EjBPS+7WEU/+Bm6JKYqL28J8H6iM=
X-Google-Smtp-Source: AGHT+IEvW4vK5zxx451a7ZmsPELGu2ASm3u0aIbHJUwKBVb/P5sQhkJtI91jLzLi0FROvKEcgj/L3zpZL4SS+3Wibx0=
X-Received: by 2002:a05:6512:282b:b0:533:d3e:16e9 with SMTP id
 2adb3069b0e04-53546bb4402mr4892938e87.57.1725207337206; Sun, 01 Sep 2024
 09:15:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240807-macos-build-support-v1-0-4cd1ded85694@samsung.com>
 <20240807-macos-build-support-v1-8-4cd1ded85694@samsung.com>
 <CGME20240807110435eucas1p2eca071b0a0122b8686d43c57bd94dc8c@eucas1p2.samsung.com>
 <2024080717-cross-retiree-862e@gregkh> <dxkmmrlhlhsrjulnyabfgcr37ojway2dxaypelf3uchkmhw4jn@z54e33jdpxmr>
 <2024080720-skyline-recapture-d80d@gregkh> <20240807-mottled-stoic-degu-d1e4cb@lindesnes>
 <20240823225450.spuvjs5b5ruujim4@AALNPWDAGOMEZ1.aal.scsc.local> <ZtIjNBhqdxmMBxfM@fjasle.eu>
In-Reply-To: <ZtIjNBhqdxmMBxfM@fjasle.eu>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Mon, 2 Sep 2024 01:15:01 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQhHBi7nSG5SAbqD3HFO3uMR6GHckZHcQXgWao7G8i9gw@mail.gmail.com>
Message-ID: <CAK7LNAQhHBi7nSG5SAbqD3HFO3uMR6GHckZHcQXgWao7G8i9gw@mail.gmail.com>
Subject: Re: [PATCH 08/12] include: add elf.h support
To: Nicolas Schier <nicolas@fjasle.eu>
Cc: Daniel Gomez <da.gomez@samsung.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Nathan Chancellor <nathan@kernel.org>, Lucas De Marchi <lucas.demarchi@intel.com>, 
	=?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, 
	Rodrigo Vivi <rodrigo.vivi@intel.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
	William Hubbs <w.d.hubbs@gmail.com>, Chris Brannon <chris@the-brannons.com>, 
	Kirk Reiser <kirk@reisers.ca>, Samuel Thibault <samuel.thibault@ens-lyon.org>, 
	Paul Moore <paul@paul-moore.com>, Stephen Smalley <stephen.smalley.work@gmail.com>, 
	Ondrej Mosnacek <omosnace@redhat.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	James Morse <james.morse@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Jiri Slaby <jirislaby@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-kbuild@vger.kernel.org" <linux-kbuild@vger.kernel.org>, 
	"intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, 
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, 
	"speakup@linux-speakup.org" <speakup@linux-speakup.org>, 
	"selinux@vger.kernel.org" <selinux@vger.kernel.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"kvmarm@lists.linux.dev" <kvmarm@lists.linux.dev>, 
	"linux-serial@vger.kernel.org" <linux-serial@vger.kernel.org>, 
	"llvm@lists.linux.dev" <llvm@lists.linux.dev>, Finn Behrens <me@kloenk.dev>, 
	"Daniel Gomez (Samsung)" <d+samsung@kruces.com>, "gost.dev@samsung.com" <gost.dev@samsung.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Aug 31, 2024 at 4:54=E2=80=AFAM Nicolas Schier <nicolas@fjasle.eu> =
wrote:
>
> On Sat, Aug 24, 2024 at 12:54:50AM +0200 Daniel Gomez wrote:
> > On Wed, Aug 07, 2024 at 05:46:03PM +0200, Nicolas Schier wrote:
> > > On Wed, Aug 07, 2024 at 04:18:54PM +0200, Greg Kroah-Hartman wrote:
> > > > On Wed, Aug 07, 2024 at 02:13:57PM +0000, Daniel Gomez wrote:
> > > > > > Also, as this is not internal for the kernel, but rather for us=
erspace
> > > > > > builds, shouldn't the include/ path be different?
> > > > >
> > > > > Can you suggest an alternative path or provide documentation that=
 could help
> > > > > identify the correct location? Perhaps usr/include?
> > > >
> > > > That is better than the generic include path as you are attempting =
to
> > > > mix userspace and kernel headers in the same directory :(
> > >
> > > Please keep in mind, that usr/include/ currently does not hold a sing=
le
> > > header file but is used for dynamically composing the UAPI header tre=
e.
> > >
> > > In general, I do not like the idea of keeping a elf.h file here that
> > > possibly is out-of-sync with the actual system's version (even though
> > > elf.h should not see that much changes).  Might it be more helpful to
> > > provide a "development kit" for Linux devs that need to build on MacO=
S
> > > that provides necessary missing system header files, instead of mergi=
ng
> > > those into upstream?
> >
> > I took this suggestion and tried pushing a Homebrew formula/package her=
e [1].
> > I think I chose a wrong name and maybe something like "development kit"=
 would
> > have been better. However, would it be possible instead to include the =
*.rb file
> > in the scripts/ directory? So users of this can generate the developmen=
t kit in
> > their environments. I would maintain the script to keep it in sync with=
 the
> > required glibc version for the latest kernel version.
> >
> > [1] https://github.com/Homebrew/homebrew-core/pull/181885
>
> I think it sounds sensible to hold that formula file in the upstream tree=
.  But
> I am not sure if scripts/ is the best location.
>
> Masahiro, what do you think?


I do not know much about the homebrew, but why does the upstream
kernel need to merge such masOS stuff?



>
> Kind regards,
> Nicolas



--=20
Best Regards
Masahiro Yamada

