Return-Path: <linux-kbuild+bounces-3465-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D23C8970483
	for <lists+linux-kbuild@lfdr.de>; Sun,  8 Sep 2024 01:49:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4F9EA1F2200C
	for <lists+linux-kbuild@lfdr.de>; Sat,  7 Sep 2024 23:49:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9ED1A165F13;
	Sat,  7 Sep 2024 23:49:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QmBIZHvz"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74333208D7;
	Sat,  7 Sep 2024 23:49:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725752967; cv=none; b=FzGFQHPRmmWYJCNjr6Pq6DM7qtQ57JkiUeyux/2ZBAENDlPShWp5vtiXeo41CkDwPxzX8PF3QhQ2offhXv0nOyapGaCcTfL+Kj14eoEH02mHw0WYisClBp7uplCVmY6BVz1KXRiom+qBesUzwBJZoH+aXQqAWcHz5qt2g/xSD8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725752967; c=relaxed/simple;
	bh=zAY4p1Q7lLy35ngV4/SXZB5oUavxE9Own3IN5mq7oR8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dgw2Tzw7WfFl0kgQ217Xy1f+Q+G+n42Ue83QylLfQPStfTZ64gXC1WT5cw31kH8w7B+utJ4K96vAROaSG0yVTOY7g3NabizcK/m50vM5qxkeq6bt5swgCHZ1R8s0R9bi1THpTdy6xOcAkksZzbJG5CByKrv3b0u/xawmWoKWQxM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QmBIZHvz; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE019C4CEC9;
	Sat,  7 Sep 2024 23:49:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725752966;
	bh=zAY4p1Q7lLy35ngV4/SXZB5oUavxE9Own3IN5mq7oR8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=QmBIZHvzhO9j/kFWLgfm65L2gS/d8UslUG2+w+nFRSOcZOOPYzdTwj+SIxi+T63Q/
	 Y+HiXxdXV4iB8zVWVSMLepSwqVhtFhNzuY/9TtVLK3plP9CY0LfeEYwNzJnUmct2AB
	 DONJeFZv4gEVbslRhTFv7cP9V2gIIRr7HnKjN/s5sZiDlPn0i6KjMyXjGDA/ABWiw8
	 MnHD3juREZvsiEtRBhTuXVxl0qo0x0s733FyWZtf+LGwfUZK7cRwNOYAV+FR9fa8Fy
	 gnmhharq3/LkAS7TqZef6c+Iu4So4jo6SDG548t09ZbU0RSn1K1aLI4RdCsvTZZnLm
	 QwNxfHQzZVGkg==
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5365c060f47so1816444e87.2;
        Sat, 07 Sep 2024 16:49:26 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUzeJ2td51X/NrZdTEVqFj60Os3/3TTDMFSlvmx+gOF7353+jVOMtKieocnUrDX4HAvfHHAuAYNYhkaVGo=@vger.kernel.org, AJvYcCVvoCMhHaGx4KmRoHv4717aihN5XbN8lHYDxYmeV5xABwCCdNNBkRxU5Cr10RpqJYwDLSfmgSAa/Hghq894@vger.kernel.org
X-Gm-Message-State: AOJu0YxALgvas73+wpIgwZVor7AOvLsdku8by0AZ73606uVW6c9pY6Lj
	F4+9U6N4KC01mXrP+lvyWDD1vUUKwXtLJtf/ag000NLQ0Q4sy7R1iIKR2gmCQNbGg7E/oAhJABn
	BgvOAv/1kkHgvHqSk+u7pWndIfCM=
X-Google-Smtp-Source: AGHT+IH7r3Tri7JgT6fNe258CU9guqckSBDNHHG6YpWF039xOA2eknDblA01d5Ir5usdSHdtjpvXT1skH5tkhj/57zs=
X-Received: by 2002:a05:6512:118f:b0:52f:c14e:2533 with SMTP id
 2adb3069b0e04-536587f831amr3823802e87.48.1725752965369; Sat, 07 Sep 2024
 16:49:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <3132727fea08e81e834104761b5a5630d337340a.1725636560.git.sam@gentoo.org>
 <CAK7LNATeuwaO8AvAqmz_4hyb5vjFnL-jhxbXv6_KoCTZbsS86A@mail.gmail.com>
 <87y143ixdb.fsf@gentoo.org> <87seubioi4.fsf@gentoo.org>
In-Reply-To: <87seubioi4.fsf@gentoo.org>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Sun, 8 Sep 2024 08:48:48 +0900
X-Gmail-Original-Message-ID: <CAK7LNARW8CgOXFLtavR9BQMdDqASDTBLMij23b8Srn5Krd32Ug@mail.gmail.com>
Message-ID: <CAK7LNARW8CgOXFLtavR9BQMdDqASDTBLMij23b8Srn5Krd32Ug@mail.gmail.com>
Subject: Re: [PATCH] fixdep: handle short reads in read_file
To: Sam James <sam@gentoo.org>
Cc: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Sep 7, 2024 at 10:26=E2=80=AFPM Sam James <sam@gentoo.org> wrote:
>
> Sam James <sam@gentoo.org> writes:
>
> > Masahiro Yamada <masahiroy@kernel.org> writes:
> >
> >> On Sat, Sep 7, 2024 at 12:29=E2=80=AFAM Sam James <sam@gentoo.org> wro=
te:
> >
> > Hi Masahiro,
> >
> >>>
> >>> 50% or so of kernel builds within our package manager fail for me wit=
h
> >>> 'fixdep: read: success' because read(), for some reason - possibly pt=
race,
> >>> only read a short amount, not the full size.
> >>>
> >>> Unfortunately, this didn't trigger a -Wunused-result warning because
> >>> we _are_ checking the return value, but with a bad comparison (it's c=
ompletely
> >>> fine for read() to not read the whole file in one gulp).
> >>>
> >>> Fixes: 01b5cbe7012fb1eeffc5c143865569835bcd405e
> >>
> >>
> >> Fixes: 01b5cbe7012f ("fixdep: use malloc() and read() to load dep_file
> >> to buffer")
> >>
> >
> > Ah, thanks. I'll fix that and send v2 depending on how we decide to mov=
e
> > forward wrt below.
> >
> >>
> >> I guess, another approach would be to use fread() instead of read().
> >>
> >> Does the attached diff fix the issue too?
> >>
> >>
> >
> > Unfortunately no. It failed for me in the same way as before :(
> >
> > The man page mentions:
> >> On  success, fread() and fwrite() return the number of items read or
> >> written. This number equals the number of bytes transferred only when =
size is 1.
> >
> > so I guess it suffers from the same pitfall. I checked POSIX & ISO C as=
 well
> > which says:
> >> If a partial element is read, its value is unspecified.
> > and
> >> The fread() function shall return the number of elements successfully
> >> read, which shall be less than nitems only if an error or end-of-file
> >> is encountered, or size is zero.
> >
> > The error reference is kind of mysterious there though.
> >
> > It kind of looks like fread *should* work. I'll send this mail and then
> > think about it a bit later and ask around to see if I'm missing
> > something obvious?
>
> OK, others disagree with my reading of fread and think it is ambiguous.
>
> With your patch, I was able to get failures albeit possibly less
> frequently. I'm trying my patch again in a loop now.
>
> >
> >> [...]
> >
> > thanks,
> > sam
>






Your quotation of the POSIX fread() spec:
(https://pubs.opengroup.org/onlinepubs/000095399/functions/fread.html)

> If a partial element is read, its value is unspecified.
and
> The fread() function shall return the number of elements successfully
> read, which shall be less than nitems only if an error or end-of-file
> is encountered, or size is zero.


I think this is clear enough.


The end-of-file should not be encountered, as we check the file
size in advance.

So, some error might be happening.




--=20
Best Regards
Masahiro Yamada

