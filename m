Return-Path: <linux-kbuild+bounces-6017-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B435A57BD6
	for <lists+linux-kbuild@lfdr.de>; Sat,  8 Mar 2025 17:17:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2B17A3AFCEF
	for <lists+linux-kbuild@lfdr.de>; Sat,  8 Mar 2025 16:17:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 308481DE3C3;
	Sat,  8 Mar 2025 16:17:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="G+CVgGJ8"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 076B4161302;
	Sat,  8 Mar 2025 16:17:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741450666; cv=none; b=BR9/5oh+aSDyaXMFA8uT1MA0z4F8hFPXu2w1ONTdcBEWivCl/seTZq1nq0Y6uhaT5jU54KdzKuwe4157WxzaCFpobJKOoRY2dWkuJpQzphqXMML+j0xZMno09Q2gAnJSx7r5cjYBeCAG7hrtuXVoWh0SPmAQS6jPtnfCBa2vImc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741450666; c=relaxed/simple;
	bh=3caCy0RcKCT9ZToiwW+03m7EirCcpKtZ6c0qBJu2ZFk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Sgf5FtT72/srgt+5cjKkDA0EeFX0e3swidsIrUCIpQ8q9e/sgy1DVKtGicOSo7mEvt4KrzyXQ4H8v6o8shgICJHxnyA652ypnx6wsWvC7FhmcNNKg0ubAvjuxfWJmE654Rgt8jS+v6JADr11/8q+guzzw0fo9Yg4AiL54o8NW7g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=G+CVgGJ8; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6FBA0C4CEE0;
	Sat,  8 Mar 2025 16:17:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741450665;
	bh=3caCy0RcKCT9ZToiwW+03m7EirCcpKtZ6c0qBJu2ZFk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=G+CVgGJ81scjhNE6lfQ1ChbGNCyk5BX/ZiMvjdwZefqCEhb7kWULDSiuWvZjzQMDj
	 LPZ+3S9YxDxQVTq21QjXuCk3T3VzPuo9CPN3VJJRaje5hwebbn+yOqbLgH5mvZ/KJr
	 SgLA6PsyCEsv/L2T60B8njbeSjVt3iQLLvmreEdgsyuxR55fZ5WnP94mSm15mIez3F
	 US3L1dRvdQ9j9WDG3WyukxlZxbz8OXb5XpKv+vVXVRq0KE0wGC7p43FNn5ChxxDrCE
	 NMI6ZSUS7NkeG6m05bIiIbpIvxmFbkysN+ockogwQlKa3LVaZ0hLhRg+AMtVQg1wmA
	 qgwRSgJCNH4kQ==
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5499fc5c68cso15375e87.0;
        Sat, 08 Mar 2025 08:17:45 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWN4D55qPsOzeV5Xld8LWr1DFiPmavi30IfUSYCCexFlJ0zHMD4WamP8iYcb2gAmDQLQkGsJ4ps1j4GRkE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwNj4yz4Mq/jUkBNFVh/k2GgJxGzqPln3xkUd8vb2W49h/f69yt
	ez1PrGTAvIGLlF/KqkPK1CQgSwgK9rFP/buk6jrSvoEMAqRDwdGRapOMkcszU6kgNVF0oTuo+Ng
	tJ6siTgapQ3eS//qsw6PZeEnISOc=
X-Google-Smtp-Source: AGHT+IH2/EO87SASC5kNZLIkqFlJW88syiByVdL4/5JbdfOfrLssMKPeDQ2y5fQ9KvmoN6lrC7wIaj4kU3NAyIFTOHY=
X-Received: by 2002:a05:6512:3c98:b0:545:1104:617d with SMTP id
 2adb3069b0e04-54990e2bd34mr2657861e87.11.1741450664068; Sat, 08 Mar 2025
 08:17:44 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250224132132.1765115-6-ardb+git@google.com> <CAMj1kXHamiZ8u4YO9FnrWhpcotUkAusDF_db_5H2qaVD85qmVA@mail.gmail.com>
 <CAK7LNATLf2iXNGi-UKRg=+PRRqgmxry5QQnQ4GUNsuVmDBAnmw@mail.gmail.com> <CAMj1kXGVe-R7VF1nHmRx+UB4FuhSjiwMU=n_uWCLC99rTTa5ZQ@mail.gmail.com>
In-Reply-To: <CAMj1kXGVe-R7VF1nHmRx+UB4FuhSjiwMU=n_uWCLC99rTTa5ZQ@mail.gmail.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Sun, 9 Mar 2025 01:17:07 +0900
X-Gmail-Original-Message-ID: <CAK7LNATkaTvAwPmNM3kSOCkCptW-bo9Ko6asWyFVcGYgu5rHtw@mail.gmail.com>
X-Gm-Features: AQ5f1JppreDRh6i4P-WQtZuvRzHQvcKxbDG7Y0d71ks78kMJIrSNEu80LyMO9k4
Message-ID: <CAK7LNATkaTvAwPmNM3kSOCkCptW-bo9Ko6asWyFVcGYgu5rHtw@mail.gmail.com>
Subject: Re: [RFC PATCH 0/4] x86/build: Get rid of vmlinux postlink step
To: Ard Biesheuvel <ardb@kernel.org>
Cc: linux-kernel@vger.kernel.org, x86@kernel.org, linux-kbuild@vger.kernel.org, 
	Ingo Molnar <mingo@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Mar 8, 2025 at 7:49=E2=80=AFPM Ard Biesheuvel <ardb@kernel.org> wro=
te:
>
> On Fri, 7 Mar 2025 at 19:54, Masahiro Yamada <masahiroy@kernel.org> wrote=
:
> >
> > On Fri, Mar 7, 2025 at 1:47=E2=80=AFAM Ard Biesheuvel <ardb@kernel.org>=
 wrote:
> > >
> > > On Mon, 24 Feb 2025 at 14:21, Ard Biesheuvel <ardb+git@google.com> wr=
ote:
> > > >
> > > > From: Ard Biesheuvel <ardb@kernel.org>
> > > >
> > > > Kbuild supports an architecture specific Makefile.postlink file tha=
t is
> > > > invoked for the vmlinux target after it has been built. This Makefi=
le
> > > > takes 'vmlinux' (which has just been built) as the target, and mang=
les
> > > > the file and/or constructs other intermediate artifacts from it.
> > > >
> > > > This violates the general philosophy of Make, which is based on rul=
es
> > > > and dependencies, and artifacts that are rebuilt only when any of t=
heir
> > > > dependencies have been updated.
> > > >
> > > > Instead, the different incarnations of vmlinux that are consumed by
> > > > different stages of the build should be emitted as distinct files, =
where
> > > > rules and dependencies are used to define one in terms of the other=
.
> >
> >
> > In my understanding, the build rule of vmlinux is atomic
> > because vmlinux embeds a timestamp and a build version.
> >
> > Now, you are splitting it into two stages.
> >
> > vmlinux.unstripped (this includes timestamp and the build version)
> >   --(cmd_strip_relocs)-->  vmlinux
> >
> >
> > When cmd_strip_relocs is changed, only vmlinux is updated.
> > This changes the content of vmlinux, but its timestamp and build versio=
n
> > remain the same.
> >
> > So, I am not sure if this is the right direction.
> >
>
> You are saying that, when we change the contents of the
> cmd_strip_relocs build rule and rebuild without cleaning, vmlinux will
> have an older timestamp? I think there are many more cases where the
> version is not updated, so I don't see this as a problem at all.

For example please?


>
> >
> > You can see more steps for updating vmlinux.
> > Do you believe the build rule should be further split into
> > more fine-grained stages?
> >
>
> No.
>
> The problem is that vmlinux.relocs (in arch/x86/boot/compressed)
> depends on vmlinux, but not the version of vmlinux that is ultimately
> produced.

Why?

Is there any case where vmlinux and vmlinux.relocs become
out of sync?


> It should depend on an artifact that is always suitable to generate
> the relocation table, not only during the short time between the
> initial creation of vmlinux and the point during the execution of
> Makefile.postlink where the relocations that are needed to generate
> vmlinux.relocs are stripped from vmlinux.

I still do not understand why this is a problem.

arch/*/Makefile.postlink is invoked from
$(call if_changed_dep,link_vmlinux)

From Make's perspective, this is a single build rule
to generate vmlinux. For x86, vmlinux.relocs is
a byproduct. I do not see this as a problem.



> > For example,
> >
> > vmlinux.pre-sort  (this includes timestamp and the build version)
> >    --(scripts/sortable)-->
>
> Why? Which other artifact depends on the unsorted tables, and can no
> longer be generated correctly after the tables have been sorted?
>
> > vmlinux.unstripped
> >    --(cmd_strip_relocs)-->
> > vmlinux
> >
> > But, again, even when sorttable is changed,
> > the timestamp and the build version remain the same.
> >
>
> Again, there are many other ways in which the final vmlinux can be
> newer than the internal version fields suggest. I really don't think
> this is an issue.

Again, for example please.

The build rule of vmlinux is atomic.
When vmlinux is updated, its timestamp is updated.
When any part of the build rule fails, vmlinux is deleted
because we cannot keep an invalid vmlinux.
This process is quite simple.



>
> >
> > Yeah, arch/*/Makefile.postlink is a crap
> > where arch maintainers build a fence
> > and start whatever they want to do.
> >
> > If they completely disappear, I would love it.
> >
>
> Good.
>
> > However, this seems a partial clean-up
> > within the scope you are interested in.
> > (more specifically your motivation is because Linus pointed out
> > a failure in arch/x86/Makefile.postlink deleted vmlinux)
> >
>
> Yes. Makefile.postlink failures propagate back to the build rule that
> generates vmlinux, and so the file is deleted again.
>
> For sanity checks performed on vmlinux, this is fine. But for
> generating another file that takes vmlinux as its input, this is
> completely broken.

I do not think it is broken.
As I mentioned above, I regard vmlinux.relocs as a byproduct
of the atomic build rule of vmlinux. This works.



--
Best Regards
Masahiro Yamada

