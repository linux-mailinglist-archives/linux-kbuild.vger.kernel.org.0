Return-Path: <linux-kbuild+bounces-4913-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C4729DEF73
	for <lists+linux-kbuild@lfdr.de>; Sat, 30 Nov 2024 10:20:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C065AB20F99
	for <lists+linux-kbuild@lfdr.de>; Sat, 30 Nov 2024 09:20:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 015B682890;
	Sat, 30 Nov 2024 09:19:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="u6EZbDLB"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C58DD184F;
	Sat, 30 Nov 2024 09:19:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732958397; cv=none; b=DRfgK/v4ImB4dSuw2g//ZIK9eNya276HHn9vXVMJMgDH5YPpylr5Hoi8r4fP87lqVBgtMBx5KZGQTvb54jLnTiVYmTlcZsVi76p6RYOxtaR6h+6U1pNLZbQNr9I3zQKGWANvfTGGBYEawSVMwmZ6oULTE/NhgEIOwLIFm86jQmM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732958397; c=relaxed/simple;
	bh=6O+AJeFp14s3p2HvhKAk9vTQ2vBF+MrXRpK6RoTeKGg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=daR93i9ySpPmQmC3UwspLW15m/kYeQ4/2Fm2uPDljPiQmy4Q9yeBLnUxX1V5zHT6mUGv5P7MbzXnGsnPhmJ6JaeBl3M3PtO+sfv/UiUBxQRlQNJpCbL8eCrYKzZMKDlZ6wDT9NjGFD/lI2CZnuWf4RJA+O41dmTEhC+My5z0ZBQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=u6EZbDLB; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 634BAC4CED3;
	Sat, 30 Nov 2024 09:19:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732958397;
	bh=6O+AJeFp14s3p2HvhKAk9vTQ2vBF+MrXRpK6RoTeKGg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=u6EZbDLBTsWhlWoj3VgqctVUaVcjOX2++Gep+hDodU8t3I5sozR6n32JRtzfOzmNO
	 +UNdgKzgvhHO/j1ckl/R/qEjnL0s9KTsBU5mAnnAl7OwNgHjc4/rpG5kRxCdgMsabg
	 sLpox9XWv3kWwTjTRrpuQntzpatw/bgVuWN9qFOtX3n6t1MuzQlZqG+zqzwooV8pqe
	 iDlmEzMUTHOaDv3V/LQEwVqz26b6BtIWS9gdHKSxGMp2ZHuxOxJCikpLWrUo+HZoMO
	 pShNvrOZghNSiuTWsRilZVxKN/nf98vvdDSCiR2UoeGFBGsWj7V5CuxabS0QpnHY5A
	 wrGgETW+yPkoA==
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-53de84e4005so3033054e87.0;
        Sat, 30 Nov 2024 01:19:57 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWivI4mKLWZwL6nczhUpXC/ftP08Vfu7JjkMdxCgPl9eyLHIQ/+es66+RNoSVXYI4GCXgh2qyObywIjP64=@vger.kernel.org, AJvYcCXG8hyjeBhdYm+iXYTG9AOq8GBxgzY/XL15/ToXQLhBbImyt5/gvlOofrDIZt17PWClN0IZA7yAY0YGdzZmY7A=@vger.kernel.org
X-Gm-Message-State: AOJu0YxymQ2q4T4M9mb47v6ri2JK2yCM7ASQPxl1J99ppgoOwhfrTHgD
	aHANGgtUZMek9lQOhuvC1Eu/DjFTEVmTgcZHyrHYn8oIy1pnfv5ADnCUSp+tafBJcdu+y2fFVWx
	zamddKl89ld2lEb5VFY1hYtJo2PM=
X-Google-Smtp-Source: AGHT+IFDDTkywWGGEiytKg6jJ7ET5HHAhInfeskVEUdneXktYpKQU6M2qWGRPm9/r4qrlI4rUxsnFBOO4Rv1Rc7IJaY=
X-Received: by 2002:a05:6512:23a2:b0:53d:cd25:4a61 with SMTP id
 2adb3069b0e04-53df0108fdbmr8682948e87.42.1732958396015; Sat, 30 Nov 2024
 01:19:56 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240917141725.466514-1-masahiroy@kernel.org> <20240917141725.466514-22-masahiroy@kernel.org>
 <b453017b-d719-4984-91d9-f28d34352d8f@linaro.org>
In-Reply-To: <b453017b-d719-4984-91d9-f28d34352d8f@linaro.org>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Sat, 30 Nov 2024 18:19:19 +0900
X-Gmail-Original-Message-ID: <CAK7LNATgO-ujY1xOowqmL0Dz03qBsjANx4Zc69aXB0Qbju2-8g@mail.gmail.com>
Message-ID: <CAK7LNATgO-ujY1xOowqmL0Dz03qBsjANx4Zc69aXB0Qbju2-8g@mail.gmail.com>
Subject: Re: [PATCH 21/23] kbuild: use absolute path in the generated wrapper Makefile
To: Caleb Connolly <caleb.connolly@linaro.org>
Cc: linux-kbuild@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, 
	Stephan Gerhold <stephan.gerhold@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 30, 2024 at 8:31=E2=80=AFAM Caleb Connolly
<caleb.connolly@linaro.org> wrote:
>
> Hi Masahiro,
>
> On 9/17/24 16:16, Masahiro Yamada wrote:
> > Keep the consistent behavior when this Makefile is invoked from another
> > directory.
>
> This breaks building in a chroot for me. I usually compile the kernel on
> my host and then use some tooling to just run the "package" step of an
> Alpine kernel package definition. See
>
> https://wiki.postmarketos.org/wiki/Compiling_kernels_with_envkernel.sh#Pa=
ckaging_kernels_built_without_envkernel
>
> Since this requires mounting the source directory into a chroot, and
> then symlinking the output directory to the package "src" dir. It relies
> on the fact that make can be run from the output directory and
> implicitly relies on the include being relative since the absolute paths
> don't map inside the chroot.


I do not understand what is happening in your workflow, but presumably
you need to come up with a solution on your end (or in the pmos community).

 - Kbuild never promised that $(srctree) is always a relative path.
   $(srctree) is relative only when building in-tree (srctree=3D.)
   or when the output directory is a sub-directory of the source tree.
    (srctree=3D..) For other cases, $(srctree) is an absolute path.
   Therefore, "include directive with an absolute path" is not something ne=
w.

 - The wrapper Makefile generated in the output directory
   is a bonus convenience for humans. It is not even required
   to build the kernel from scripts.

Your report seems like a jungle of a chroot and mounts with a symlink.
I guess it just happened to work, relying on something Kbuild did not suppo=
rt.


>
> I'm not sure if breakages like this justify a revert, but I noticed this
> issue in -next the other day and thought it was at least worth reporting.


Thanks for the report, but I do not think this is worth a revert
for the above reasons.


> I wouldn't be surprised if other folks with other build systems get
> bitten by this too.
>
> Kind regards,
> Caleb
> >
> > Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> > ---
> >
> >   Makefile | 5 +++--
> >   1 file changed, 3 insertions(+), 2 deletions(-)
> >
> > diff --git a/Makefile b/Makefile
> > index ce646a6994a6..9f0ba07e8f25 100644
> > --- a/Makefile
> > +++ b/Makefile
> > @@ -643,8 +643,9 @@ ifdef building_out_of_srctree
> >
> >   quiet_cmd_makefile =3D GEN     Makefile
> >         cmd_makefile =3D { \
> > -     echo "\# Automatically generated by $(srctree)/Makefile: don't ed=
it"; \
> > -     echo "include $(srctree)/Makefile"; \
> > +     echo "\# Automatically generated by $(abs_srctree)/Makefile: don'=
t edit"; \
> > +     echo "export KBUILD_OUTPUT =3D $(CURDIR)"; \
> > +     echo "include $(abs_srctree)/Makefile"; \
> >       } > Makefile
> >
> >   outputmakefile:
>


--=20
Best Regards
Masahiro Yamada

