Return-Path: <linux-kbuild+bounces-6012-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AD22A579CD
	for <lists+linux-kbuild@lfdr.de>; Sat,  8 Mar 2025 11:49:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4FFC416EF4C
	for <lists+linux-kbuild@lfdr.de>; Sat,  8 Mar 2025 10:49:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E706B1A9B40;
	Sat,  8 Mar 2025 10:49:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RiCi92Oc"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEC981624F7;
	Sat,  8 Mar 2025 10:49:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741430962; cv=none; b=NJxLT1BJCIwYa2YJBYVfSrYl6tmZeR9afBCblMxlq4apNF4wyaqH2ly09PuYX+XAg393eosA2bL6Pahf2DYKRLJXGSC6n59p4MLT8eufjtIfPAwE2WKY2I2FU/n97ygtt1cc3qDLTM9pDxCURDJSpNQM0ZNBSGNnEeLAFDBrVFk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741430962; c=relaxed/simple;
	bh=VtyxIhn1MqFuj4Ez+8kB3Bet4PSr1CCgIGFP5TsZw10=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lca1cJJF0llnJYVvtEozmLkFpfVxk7pFQT+3mptGyvqvJE5XXzQWG2GWORGXbXVkA1fITJn2bYJf/SD5skgiWW/uboMq+9WaBdO0rtxoxqso8RBJcgSaI/Gd50CTUEhqces/QJn9GBCLYe2OblJJ0DoZ4p7yTcQsYB9RNo/8GZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RiCi92Oc; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9899FC4CEE0;
	Sat,  8 Mar 2025 10:49:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741430962;
	bh=VtyxIhn1MqFuj4Ez+8kB3Bet4PSr1CCgIGFP5TsZw10=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=RiCi92OcmsI8Gxvhb4Fzt/INHK1kbh8/N/DGVGhR3VNWxHxfO50N7H+GegB/Fr86H
	 5+OHRaxqDkVp3ImCBKYzz0pJwZKCEoyXsKiJNYC5+AUW9TdjFm2VGaZqiMxZdtFAnB
	 gsGkC+IhqNB9KjLGz602fyC/IbI9xtE2LNmrJZAjsQSX/FeVit4omISh9nofClIfeP
	 3cKSGPuhkowjk1I6ISIVIuNU0vvAdZI/CBzT2CQCqEc4w8wEfMgns9MaW9kksZYZUk
	 rXFzTcKNyHkoGLcNkvtI1syFWbJUAnz2YyrR1TghTQX4uyD4tcjADbXgEZSedG8jah
	 TOKZHCyNxwoZA==
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-54991d85f99so1694125e87.1;
        Sat, 08 Mar 2025 02:49:22 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWrz2ZiAvHADW5BQFGfNhd+CKqjRQvlAUb+aYB4q1CtHptzNvEHgVL9gLtN0d+yR2GGXhnQ1UMIhNyOnXQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YzokImS0q7EQQR2HDBVi4pbtrDaLRggoLf3nd69PPdEAGySK/6m
	HgnfoIrX83FhsAYlYdmqgqz5hDkBRC/WeOHt2YKvN2LwQQc+iOgXWpLzw9voXi+yARE165ZDASr
	ibvkKK/qacfGRO2xCikf0pxN0Afw=
X-Google-Smtp-Source: AGHT+IG2An5WF2QlGh2eCzveAL3dfszVI0/qGJMycmfCIf8KiNvGAp92NpHru1Tjs9I5dlF/DDesMTs1/F4epdiaeTU=
X-Received: by 2002:a05:6512:1252:b0:549:8dd6:fb41 with SMTP id
 2adb3069b0e04-54997ef677emr1099186e87.24.1741430961001; Sat, 08 Mar 2025
 02:49:21 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250224132132.1765115-6-ardb+git@google.com> <CAMj1kXHamiZ8u4YO9FnrWhpcotUkAusDF_db_5H2qaVD85qmVA@mail.gmail.com>
 <CAK7LNATLf2iXNGi-UKRg=+PRRqgmxry5QQnQ4GUNsuVmDBAnmw@mail.gmail.com>
In-Reply-To: <CAK7LNATLf2iXNGi-UKRg=+PRRqgmxry5QQnQ4GUNsuVmDBAnmw@mail.gmail.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Sat, 8 Mar 2025 11:49:09 +0100
X-Gmail-Original-Message-ID: <CAMj1kXGVe-R7VF1nHmRx+UB4FuhSjiwMU=n_uWCLC99rTTa5ZQ@mail.gmail.com>
X-Gm-Features: AQ5f1JqD9j-0PZ6Su8a_JuvMkpVsCaunLd1ZKbi_6BD3YAku5dpbUrIEghClm2w
Message-ID: <CAMj1kXGVe-R7VF1nHmRx+UB4FuhSjiwMU=n_uWCLC99rTTa5ZQ@mail.gmail.com>
Subject: Re: [RFC PATCH 0/4] x86/build: Get rid of vmlinux postlink step
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-kernel@vger.kernel.org, x86@kernel.org, linux-kbuild@vger.kernel.org, 
	Ingo Molnar <mingo@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 7 Mar 2025 at 19:54, Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> On Fri, Mar 7, 2025 at 1:47=E2=80=AFAM Ard Biesheuvel <ardb@kernel.org> w=
rote:
> >
> > On Mon, 24 Feb 2025 at 14:21, Ard Biesheuvel <ardb+git@google.com> wrot=
e:
> > >
> > > From: Ard Biesheuvel <ardb@kernel.org>
> > >
> > > Kbuild supports an architecture specific Makefile.postlink file that =
is
> > > invoked for the vmlinux target after it has been built. This Makefile
> > > takes 'vmlinux' (which has just been built) as the target, and mangle=
s
> > > the file and/or constructs other intermediate artifacts from it.
> > >
> > > This violates the general philosophy of Make, which is based on rules
> > > and dependencies, and artifacts that are rebuilt only when any of the=
ir
> > > dependencies have been updated.
> > >
> > > Instead, the different incarnations of vmlinux that are consumed by
> > > different stages of the build should be emitted as distinct files, wh=
ere
> > > rules and dependencies are used to define one in terms of the other.
>
>
> In my understanding, the build rule of vmlinux is atomic
> because vmlinux embeds a timestamp and a build version.
>
> Now, you are splitting it into two stages.
>
> vmlinux.unstripped (this includes timestamp and the build version)
>   --(cmd_strip_relocs)-->  vmlinux
>
>
> When cmd_strip_relocs is changed, only vmlinux is updated.
> This changes the content of vmlinux, but its timestamp and build version
> remain the same.
>
> So, I am not sure if this is the right direction.
>

You are saying that, when we change the contents of the
cmd_strip_relocs build rule and rebuild without cleaning, vmlinux will
have an older timestamp? I think there are many more cases where the
version is not updated, so I don't see this as a problem at all.

>
> You can see more steps for updating vmlinux.
> Do you believe the build rule should be further split into
> more fine-grained stages?
>

No.

The problem is that vmlinux.relocs (in arch/x86/boot/compressed)
depends on vmlinux, but not the version of vmlinux that is ultimately
produced.

It should depend on an artifact that is always suitable to generate
the relocation table, not only during the short time between the
initial creation of vmlinux and the point during the execution of
Makefile.postlink where the relocations that are needed to generate
vmlinux.relocs are stripped from vmlinux.

> For example,
>
> vmlinux.pre-sort  (this includes timestamp and the build version)
>    --(scripts/sortable)-->

Why? Which other artifact depends on the unsorted tables, and can no
longer be generated correctly after the tables have been sorted?

> vmlinux.unstripped
>    --(cmd_strip_relocs)-->
> vmlinux
>
> But, again, even when sorttable is changed,
> the timestamp and the build version remain the same.
>

Again, there are many other ways in which the final vmlinux can be
newer than the internal version fields suggest. I really don't think
this is an issue.

>
> Yeah, arch/*/Makefile.postlink is a crap
> where arch maintainers build a fence
> and start whatever they want to do.
>
> If they completely disappear, I would love it.
>

Good.

> However, this seems a partial clean-up
> within the scope you are interested in.
> (more specifically your motivation is because Linus pointed out
> a failure in arch/x86/Makefile.postlink deleted vmlinux)
>

Yes. Makefile.postlink failures propagate back to the build rule that
generates vmlinux, and so the file is deleted again.

For sanity checks performed on vmlinux, this is fine. But for
generating another file that takes vmlinux as its input, this is
completely broken.

