Return-Path: <linux-kbuild+bounces-4210-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B0B49A587E
	for <lists+linux-kbuild@lfdr.de>; Mon, 21 Oct 2024 03:22:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C1A2A28208D
	for <lists+linux-kbuild@lfdr.de>; Mon, 21 Oct 2024 01:22:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DEEDC8BE5;
	Mon, 21 Oct 2024 01:22:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CG7+E6Vz"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A622C4C70;
	Mon, 21 Oct 2024 01:22:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729473763; cv=none; b=KIeUKa6JFmTBEA83JXYRHC8ch5d8wJ3fzZNnJXWd2Nj/195nY3g6MR6ibXLZbX+VVYEtb+oi+ep50OBa/xkU9ghx30XqZ3skqAtYf6Oy3OB2jkvr6VwMGMlyT946WTUXBI/M/hAjVvsl42U1yUWekL2xFVkPbZE+8C1u6KeFDLw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729473763; c=relaxed/simple;
	bh=jlCzg7egAixbWdgUefAl7xo5OOX4XAUpPQw4CNFUOIo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Wt1MS4iyIs+rgn5UIu4vbyf0J7svmy8sEORztD6YTGBe+XyPRyw2WVtyIFeqnHqIRrJMi/apitrn8IyPX1urKfvDg2r8iKgWuXn8V/09mNAd7XLIiMmcI17A2L6HtsrUf7txebrACCspt8EKabH3U4DaC3v4ax5sm14LCAVGQG0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CG7+E6Vz; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35EC7C4CEC7;
	Mon, 21 Oct 2024 01:22:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729473763;
	bh=jlCzg7egAixbWdgUefAl7xo5OOX4XAUpPQw4CNFUOIo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=CG7+E6VzrSrwBrhwvoSrkmrlXQtOW8B22B8eFwlRO9GrJyrW/jHD8SztOSd3JNflR
	 u5tSATP4Y+I3hP1gVAZgTGFSgBvyuM7B2FmO5q0ERSf70fo3evLrEkNvnvE+dAbkZ5
	 iYywmNzmXytC9xC6MVv0xBjEt3pe4I7RbTbf8icw+v+rs1WWDC0GLu5hbQjddHG1MN
	 DTrXnwFr0phT/a3dLgu18+KxUKJBzf4ZMuNCNl95zX5lhXqa0tYPmZ+CjZQHkvZFP6
	 UsyjpeCtvHyyrT5bCMb1CclRstx7xmcCConnRVyGlH0IgcfD9Khw9YcW1yvYwXonYU
	 46UlX9NtYR2Hg==
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-2fb3ce15172so45328601fa.0;
        Sun, 20 Oct 2024 18:22:43 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVCbXIf2qw2SY/7XOrA6jkBBQJLAC0U9cdJNctCRc52clgiOJRp46vffVNKq6lOxoosmoSaLQyM5+Ac4xM9@vger.kernel.org, AJvYcCVDb950Q7ilKE1hnJAc0FJztdTIptRLQyNITIdDtnWPFKSmn8tVvRT4bxousrbXWuwsP2zJwovAVNDzTHKp@vger.kernel.org, AJvYcCXP05sKMD8O5prAwSiCC0NAuwblXAjc6qBbBtb1F2o1HkFKeod/doFS8TI6aouPXrfN05m0aXLWmNDX@vger.kernel.org
X-Gm-Message-State: AOJu0YzUvp4778UxTgp1pgky7sbBaSn5C1RoBu6k+xGnbRIS9qxmAEh9
	WHFmmvLhjzkqbQapfsYQNVH1ZMEWGiTpTAhS4dghQ6Rlf+Xva5aXSt+MUQl64qH2aDx8xM8NJuW
	AbVbJSwER/B7SKc0NJ4t03bACpfE=
X-Google-Smtp-Source: AGHT+IHKEipf35MYVwH+nk6bWLaxQ2XVrgwntLhq6reCsCyEjeQfuvEfGfKQ2g8ZLOkWK0d/FcaxQkfXbS6HX1Iz10k=
X-Received: by 2002:a2e:a545:0:b0:2fb:50e9:34cc with SMTP id
 38308e7fff4ca-2fb6dc74e7bmr44845751fa.17.1729473761693; Sun, 20 Oct 2024
 18:22:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241016194149.4178898-1-chris.packham@alliedtelesis.co.nz>
 <CAK7LNAR4h6NZ+D0BK+q4VQBeHWpjzRBQFQ9ovBrftM=6dHRcUg@mail.gmail.com> <bca44b71-d002-4dac-8c53-6b7dd90ffce1@alliedtelesis.co.nz>
In-Reply-To: <bca44b71-d002-4dac-8c53-6b7dd90ffce1@alliedtelesis.co.nz>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Mon, 21 Oct 2024 10:22:05 +0900
X-Gmail-Original-Message-ID: <CAK7LNASZSSkUOTGeCB-JsSyX8a7EbKOD5UdQPqN4pVnG5rXeKg@mail.gmail.com>
Message-ID: <CAK7LNASZSSkUOTGeCB-JsSyX8a7EbKOD5UdQPqN4pVnG5rXeKg@mail.gmail.com>
Subject: Re: [PATCH v2] kbuild: Restore the ability to build out of tree dtbs
To: Chris Packham <chris.packham@alliedtelesis.co.nz>
Cc: nathan@kernel.org, nicolas@fjasle.eu, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 21, 2024 at 7:57=E2=80=AFAM Chris Packham
<chris.packham@alliedtelesis.co.nz> wrote:
>
> +cc devicetree
>
> Hi Masahiro,
>
> On 19/10/24 00:19, Masahiro Yamada wrote:
> > On Thu, Oct 17, 2024 at 4:59=E2=80=AFAM Chris Packham
> > <chris.packham@alliedtelesis.co.nz> wrote:
> >> A build pattern to handle out of tree dtbs is to copy the .dts file in=
to
> >> the kernel source tree and run `make myboard.dtb`. This is supported b=
y
> >> the wildcard %.dtb rule in the Makefile but recent changes to split th=
e
> >> dtb handling out of scripts/Makefile.build stopped this from working.
> >> Restore this functionality by looking for .dtb in $(MAKECMDGOALS) as
> >> well as $(targets).
> >>
> >> Fixes: e7e2941300d2 ("kbuild: split device tree build rules into scrip=
ts/Makefile.dtbs")
> >> Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
> >> ---
> > This is not a use-case in upstream.
> >
> > If you drop-in your downstream DT to the kernel tree,
> > you need to associate it with Makefile.
>
> I agree that this is Hyrum's Law at work.  I still feel that handling
> out-of-tree dtbs is something that would be in the best interest of the
> Linux kernel. It doesn't necessarily need to be done by allowing copying
> arbitrary .dts files into the tree, a mechanism like the way out of tree
> kernel modules are handled would be workable.
>
> Often supporting a new hardware platform is just a matter of writing a
> dts that describes the board. Particularly when that board is based on
> an existing one. The way most dts/dtsi files are arranged in-tree
> requires a non trivial amount of handling by the C processor. So while
> one could produce a dtb file by invoking cc -E and dtc with the right
> options pointing at the right paths, having the kernel build system
> provide something that abstracts that would be beneficial for developers
> and even end users.



I also handle a bunch of yet-to-upstream device tree files.


I have them in the proper directory location, and add

  dtb-$(CONFIG_ARCH_FOO)  +=3D foo-downstream-custom1.dtb
  dtb-$(CONFIG_ARCH_FOO)  +=3D foo-downstream-custom2.dtb
    ...

jutt like how they would look when they were upstreamed.



I do not understand why the drop-in way is supported.











> >> Notes:
> >>      Changes in v2:
> >>      - keep $(target) and search for .dtb in $(MAKECMDGOALS)
> >>
> >>   scripts/Makefile.build | 2 +-
> >>   1 file changed, 1 insertion(+), 1 deletion(-)
> >>
> >> diff --git a/scripts/Makefile.build b/scripts/Makefile.build
> >> index 8f423a1faf50..78763a4bc58a 100644
> >> --- a/scripts/Makefile.build
> >> +++ b/scripts/Makefile.build
> >> @@ -449,7 +449,7 @@ ifneq ($(userprogs),)
> >>   include $(srctree)/scripts/Makefile.userprogs
> >>   endif
> >>
> >> -ifneq ($(need-dtbslist)$(dtb-y)$(dtb-)$(filter %.dtb %.dtb.o %.dtbo.o=
,$(targets)),)
> >> +ifneq ($(need-dtbslist)$(dtb-y)$(dtb-)$(filter %.dtb %.dtb.o %.dtbo.o=
,$(targets))$(filter %.dtb,$(MAKECMDGOALS)),)
> >>   include $(srctree)/scripts/Makefile.dtbs
> >>   endif
> >>
> >> --
> >> 2.47.0
> >>
> >>
> >
> > --
> > Best Regards
> > Masahiro Yamada
>


--=20
Best Regards
Masahiro Yamada

