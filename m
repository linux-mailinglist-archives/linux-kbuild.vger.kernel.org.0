Return-Path: <linux-kbuild+bounces-6921-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 606B4AA8353
	for <lists+linux-kbuild@lfdr.de>; Sun,  4 May 2025 01:32:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 987B817C056
	for <lists+linux-kbuild@lfdr.de>; Sat,  3 May 2025 23:32:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C24B21AD403;
	Sat,  3 May 2025 23:32:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Z2ZPhU4A"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95AEC23CE;
	Sat,  3 May 2025 23:32:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746315149; cv=none; b=Y8IDxNrT53/JnKre0+IQFEinjaUh//eSrphmf85IRa8Vb07DzB2J48zrV1YEvXFISouIaxpnE85Ht8tVtAG13ij/gf3J5u0GJ7q3/SHrMg3QgUVTpWUdPgHtuQNWGFUE6Cv0C01sC1fNuOBnvqr3J6wdTWMmfg65I7t65E4TmHY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746315149; c=relaxed/simple;
	bh=xc9lKabqS+jgFsgzNP92VOzP/IKd1xqVek/iWg7fBfc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lTSD8s0QrBg8RF0QfksmPaWfVSnWzoOFMMz8VEdcA9RoBONkLJKuV/4z3L7TJ4quC9hbZ0eUMU6Kr/20M2Wajpz/m2geWvn4MPT75kmufUwlnsb1kNtH8acOh+5zgJU9pA1C4iOdhqKTJ6ulFjF4NNoEt1uf0rYrdmTgs71ky00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Z2ZPhU4A; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6A0DC4AF09;
	Sat,  3 May 2025 23:32:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746315148;
	bh=xc9lKabqS+jgFsgzNP92VOzP/IKd1xqVek/iWg7fBfc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Z2ZPhU4AFoMGxgkjdg/ETnjMODG07ZCxzqC9/viO4VzqnKjH8qO/RjwWsqpKx1pZu
	 uADCtlAsgO1bMUY8XzRSVC4d2+FVPMXF+09m/rkw6PsoT25AaCFq4ndHtlVeuSOSnV
	 dweFxOqVpix8EX8EtTXnRk8ZAznaG9DAvPWphPjgmlpvxKLusfiA2z15AZmytS328T
	 rdGQCSN5PrUQZHyNFOzlxVTAZjC6oU7wgvTt141m4ol/iAVLarsQE7O9yF0vkXNZwY
	 K3YDR3cKPKaGaWCwT2iiov1CK3ald2zDs2ZpPDlLy+hW4qnwiEfruwgIulLvhU9Z1e
	 IWvTWTwtwQ2RA==
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-317f68d0dffso35463711fa.2;
        Sat, 03 May 2025 16:32:28 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWH/jeF/vT0uVz0nkx/HWuLe+EOiNl6yXGpJ7fsVJbZp6Uhl/aZweLGVYjZ3D4hcQfHWDJ0eTFsR0bF5sEYYGU=@vger.kernel.org, AJvYcCXYmGeqL+tpMzcdNHqxB9sNIh+qeczeVuujc3RehrnAFefkdvWOxfjsrd5Ai541SjcsWbtuzlIMq1q8d/0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzbsu3FR/gBT+GZICpvtybTW9oV358DRGvvaGhTSSj/sJhlzk7a
	sQPEzcaurglpnZQxVXI4Sec8QD/G6gDdmgjsCa5e+4/pjqe1zk0vt5CsuFU+ALvNj3lVA3vWcEF
	gBb3jA5/NpJhBZa89MgdC6fqHFZk=
X-Google-Smtp-Source: AGHT+IGvF3oxJxZ+72vhJNwD/Ed2BC5iPDJFBrwGVhBr18BPc/0R9QJfGTwEMQoO/exDkH6p0dkRgS6jcRTZ4wkopJY=
X-Received: by 2002:a2e:bc26:0:b0:31b:4770:4932 with SMTP id
 38308e7fff4ca-321daae5e2fmr11400511fa.3.1746315147459; Sat, 03 May 2025
 16:32:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250426030815.1310875-1-rdunlap@infradead.org>
 <CAK7LNASww7Zyeg7G0R9US-_MWtFmBF-P5JiwZkgGBBrfoivi5A@mail.gmail.com>
 <CAK7LNAQpZvXREY5+4H_WA4UOgYpYoTLS=bpb_Gkb+SyetKh_tw@mail.gmail.com> <21182762-30b9-49e5-aa6c-a0f967d81529@infradead.org>
In-Reply-To: <21182762-30b9-49e5-aa6c-a0f967d81529@infradead.org>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Sun, 4 May 2025 08:31:50 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQr9Ceb36R44Kqvn6bj5qAB3BxSW5-RKXaaejoAQEubPA@mail.gmail.com>
X-Gm-Features: ATxdqUHzITCAN2Lk5xLfFOJwrpa-3QKeVyYoHGkm5Yr2q7Kdr4cE4LFkAz6vAUc
Message-ID: <CAK7LNAQr9Ceb36R44Kqvn6bj5qAB3BxSW5-RKXaaejoAQEubPA@mail.gmail.com>
Subject: Re: [PATCH] usr/include: openrisc: don't HDRTEST bpf_perf_event.h
To: Randy Dunlap <rdunlap@infradead.org>
Cc: linux-kernel@vger.kernel.org, Jonas Bonn <jonas@southpole.se>, 
	Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>, Stafford Horne <shorne@gmail.com>, 
	linux-openrisc@vger.kernel.org, linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, May 4, 2025 at 8:23=E2=80=AFAM Randy Dunlap <rdunlap@infradead.org>=
 wrote:
>
>
>
> On 5/3/25 9:13 AM, Masahiro Yamada wrote:
> > On Sun, May 4, 2025 at 1:01=E2=80=AFAM Masahiro Yamada <masahiroy@kerne=
l.org> wrote:
> >>
> >> On Sat, Apr 26, 2025 at 12:08=E2=80=AFPM Randy Dunlap <rdunlap@infrade=
ad.org> wrote:
> >>>
> >>> Since openrisc does not support PERF_EVENTS, omit the HDRTEST of
> >>> bpf_perf_event.h for arch/openrisc/.
> >>>
> >>> Fixes a build error:
> >>> usr/include/linux/bpf_perf_event.h:14:28: error: field 'regs' has inc=
omplete type
> >>
> >>
> >>
> >> Where can I get openrisc compiler that enables CONFIG_CC_CAN_LINK?
> >
> > Never mind.
> > I downloaded a one from
> > https://github.com/stffrdhrn/or1k-toolchain-build/releases
> >
> > Hmm, I did not observe an error like that.
> >
> > Instead, I got a different error message.
> >
> >   HDRTEST usr/include/linux/bpf_perf_event.h
> > In file included from <command-line>:
> > ./usr/include/linux/bpf_perf_event.h:15:9: error: unknown type name '__=
u64'
> >    15 |         __u64 sample_period;
> >       |         ^~~~~
> > ./usr/include/linux/bpf_perf_event.h:16:9: error: unknown type name '__=
u64'
> >    16 |         __u64 addr;
> >       |         ^~~~~
> >
>
> Does HDRTEST use the #include files from the header that is being tested?
>
> usr/include/linux/bpf_perf_event.h #includes <asm/bpf_perf_event.h>
> (from usr/include/ ??) which #includes <asm-generic/bpf_perf_event.h>
> (from usr/include/ ??) which #includes <linux/ptrace.h> (from usr/include=
/ ??)
> which #includes <linux/types.h>.  I don't see this problem in my builds.
>
> I do still continue to see this failure:
>
>   HDRTEST usr/include/linux/bpf_perf_event.h
> In file included from <command-line>:
> ./usr/include/linux/bpf_perf_event.h:14:28: error: field 'regs' has incom=
plete type
>    14 |         bpf_user_pt_regs_t regs;
>       |                            ^~~~
> make[5]: *** [../usr/include/Makefile:85: usr/include/linux/bpf_perf_even=
t.hdrtest] Error 1


Sorry, my local issue.

Applied now.



--=20
Best Regards
Masahiro Yamada

