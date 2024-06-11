Return-Path: <linux-kbuild+bounces-2063-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D5AF6904165
	for <lists+linux-kbuild@lfdr.de>; Tue, 11 Jun 2024 18:34:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 73513B212C4
	for <lists+linux-kbuild@lfdr.de>; Tue, 11 Jun 2024 16:34:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2906939FE4;
	Tue, 11 Jun 2024 16:34:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="i1/u4aXu"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02C9F1CFA9;
	Tue, 11 Jun 2024 16:34:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718123653; cv=none; b=eaqiPkwIbjGoJJz8sdhYMFzxspjwrqkEcECIYIM+yQdbQ8ChyI6zMugevz0omobWdJlFZWjlnbsPA0bX9pDWPl+O+L8H8QN3ucZcz+wtwujGUaLmhTwrJzzOtyrtEaB0hCU+6JHa+3IFuah4+aEtoN4+Tdkru0Ha3IbX9ltxFDI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718123653; c=relaxed/simple;
	bh=32Qg2s2ft1DIK6vq4J5SomgbyYmYFs3dtDaha8oUJoc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sz43XKqdwNHzQVuc2TQNZeTRhFbTX83euS0C1393OlMkjQ9kvJqOxqfhLs6nMa4j+ab1mkOQuHUfDCoNyKOspqqPJIaj042RApQMpg/CDmodm2RID3B40y+MW6sZfY+ZQg+AaBaVHL6/SBXa3piLn0FjJ/Nbmg0O61zsp20TFZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=i1/u4aXu; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 924A9C4AF48;
	Tue, 11 Jun 2024 16:34:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718123652;
	bh=32Qg2s2ft1DIK6vq4J5SomgbyYmYFs3dtDaha8oUJoc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=i1/u4aXuXgm1Pq+N8swSQeQopqXSPBd7MRu6eVN6FBO5Sa1kGq1A2SuVFLSS1Vgw/
	 OTacK5dH+jA1cf/U00ZY/z/QE/ofQ6s1kUZ1I/gAMuJA6FE8VQg+wN5CVYl7vWidsp
	 zSYIqlXA07LPnj/N1e0SJkloichkCyRydihXrha5X+v8/rDKu3X40IC20wjBQ6gGfL
	 ZIQecuZ28bB75A0USed6QTGCjhzGX6lC8kSDpae4C3tx/4GCLlYO0UlqNr/V5hEd/3
	 n1n47dPqQpBFhioMbndi4S2pT4obIy+Yl/QqWvG7oki3NKGxn3e27JlpZh8RUKQQ6S
	 z3IPhFa3T98wA==
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-2ebe40673d8so12168841fa.3;
        Tue, 11 Jun 2024 09:34:12 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXttVVNJ7GD40l96vUdLG0PXiFKzuu91lFA1oR6QsTdSa98wp83By1xBOIIYNQK0tKdi+cRr5x/0PPL0ph9TJbR1G+UXgs/8+5t9sQ8
X-Gm-Message-State: AOJu0Yw5XA+ZXTRjOHptgvht2Svp9HJnnLEulO77/HqxGSwv5TeIilW9
	UlThXgKpKJbPju2ZfOSUPn9RqX6bbkNT3Y0/Mp0NzxBNfnWIm4LOtDGR9PE9FoE9adnmMl7xDMa
	9mRX04iP4Xfy0M2Ce93BMZJh40OA=
X-Google-Smtp-Source: AGHT+IGwUqOWspDrKwcqCPBzP/5c87/EKuWQ30oA7IUSD+5KCAAuLEKcBxZl7jXd07s7Mx8X8kTDWB4R6pr/MPdcy1U=
X-Received: by 2002:ac2:4e8e:0:b0:52c:81ad:77f8 with SMTP id
 2adb3069b0e04-52c81ad8048mr5110349e87.32.1718123651263; Tue, 11 Jun 2024
 09:34:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240610163856.693110-1-aquini@redhat.com> <CAK7LNASe0q4W2cuLnLnpJbWtyoOoZ6Gi+wJw=JiRyZrT9KdNEQ@mail.gmail.com>
 <Zmh1NXtY5W63BmRt@optiplex-fbsd>
In-Reply-To: <Zmh1NXtY5W63BmRt@optiplex-fbsd>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Wed, 12 Jun 2024 01:33:34 +0900
X-Gmail-Original-Message-ID: <CAK7LNATxSePzOrHaQvS1MQo4mpAwdfwrDu3iuUsYZ+RL=LiirA@mail.gmail.com>
Message-ID: <CAK7LNATxSePzOrHaQvS1MQo4mpAwdfwrDu3iuUsYZ+RL=LiirA@mail.gmail.com>
Subject: Re: [PATCH] kbuild: rpm-pkg: fix rpmbuild warnings for kernel.spec
To: Rafael Aquini <aquini@redhat.com>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 12, 2024 at 1:03=E2=80=AFAM Rafael Aquini <aquini@redhat.com> w=
rote:
>
> On Wed, Jun 12, 2024 at 12:00:18AM +0900, Masahiro Yamada wrote:
> > On Tue, Jun 11, 2024 at 1:39=E2=80=AFAM Rafael Aquini <aquini@redhat.co=
m> wrote:
> > >
> > > Newer revisions of rpmbuild are throwing warnings about the current
> > > kernel.spec template having an unversioned kernel-headers in the
> > > 'Obsoletes:' field and not being able to source the epoch's date from
> > > the spec's missing '%changelog' section:
> > >
> > >   $ make srcrpm-pkg
> > >     UPD     include/config/kernel.release
> > >     GEN     rpmbuild/SPECS/kernel.spec
> > >     UPD     .tmp_HEAD
> > >     ARCHIVE linux.tar.gz
> > >   rpmbuild -bs rpmbuild/SPECS/kernel.spec --define=3D'_topdir /mnt/nf=
s/work/kernel/linux/rpmbuild'
> > >   warning: line 34: It's not recommended to have unversioned Obsolete=
s: Obsoletes: kernel-headers
> > >   warning: source_date_epoch_from_changelog set but %changelog is mis=
sing
> > >   Wrote: /mnt/nfs/work/kernel/linux/rpmbuild/SRPMS/kernel-6.10.0_rc3-=
1.src.rpm
> > >
> > >   RPM build warnings:
> > >       line 34: It's not recommended to have unversioned Obsoletes: Ob=
soletes: kernel-headers
> > >       source_date_epoch_from_changelog set but %changelog is missing
> > >
> > > This patch addresses both RPM build warnings.
> > >
> > > Signed-off-by: Rafael Aquini <aquini@redhat.com>
> > > ---
> > >  scripts/package/kernel.spec | 4 +++-
> > >  1 file changed, 3 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/scripts/package/kernel.spec b/scripts/package/kernel.spe=
c
> > > index e095eb1e290e..4d58b29c03ad 100644
> > > --- a/scripts/package/kernel.spec
> > > +++ b/scripts/package/kernel.spec
> > > @@ -1,3 +1,5 @@
> > > +%global source_date_epoch_from_changelog 0
> > >
> >
> >
> > Another possibility might be to add %changelog section.
> >
> > In Debian packaging, debian/changelog is a requirement.
> >
> > scripts/package/mkdebian generates a very small
> > debian/changelog with a single log entry.
> >
>
> I'll take a stab at it, then. Thanks for the pointer!



When you send v2, please split it into two patches.

You are addressing two warnings.
These are separate issues.




--=20
Best Regards
Masahiro Yamada

