Return-Path: <linux-kbuild+bounces-5690-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3356AA2E350
	for <lists+linux-kbuild@lfdr.de>; Mon, 10 Feb 2025 06:01:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C3A7A1639AA
	for <lists+linux-kbuild@lfdr.de>; Mon, 10 Feb 2025 05:01:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0334B2E62C;
	Mon, 10 Feb 2025 05:01:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BUIHntp4"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAA5A2F2A;
	Mon, 10 Feb 2025 05:01:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739163690; cv=none; b=Hddc4h6H704YDVWqr1pDi7ntqja1NO50lOd1LdRQ+oNVjoBhgk3fF2Gi0UFpbVIjp2+9B1cM5zgSLhPZ0JmRUyhtUWXmz23Pw6F9LyqAX/rFZQVLOQYB0EvhHVBDYYeSRRrjAC927A7BNB+Pr9K0YWRVPgMqb+y2M398JogCTCM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739163690; c=relaxed/simple;
	bh=W2w6E6ETmTeuVJUBa9j4VdBuubQqmp/igTJCtkIwjVM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BFwhKqTIFsTj20tEBYgELs2uU47+AVHf8ICE7g9irfTm9cO07lmQtjPGeGKMjaHYbCwexkzQ85FHRE4+TxzP8m2IHizZiKZWiaTi+zccrc3+iw8+3zclQv5uQf+SkBJXXCelBKGrM6Air7OdXp9lacX88Eq6BriCVzvVHDMiW4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BUIHntp4; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 33B4CC4CED1;
	Mon, 10 Feb 2025 05:01:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739163690;
	bh=W2w6E6ETmTeuVJUBa9j4VdBuubQqmp/igTJCtkIwjVM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=BUIHntp4y1Kn+4uG1G4y9imPcbX5gkK6qDHFuVdkq8033fsfRQxMMSUVqL/MGYOZ3
	 ILPo85v6SwFvXfPduBazBxQahCZcLpaOtC1y/XVv4UNEad2rdAUGd3fXRKNMKOHrdx
	 TP4dAKjkJsmzPniIT5KUNuZS45N54eiI4VxHFhsntIF0DBydeZszHn0GeoyydEqJuh
	 sXJf60UgHvq9SX6iuzIHNzgq+4xafN2zHgthJDJupp9+okQTr+FsgKe1ELc307Ay42
	 wiWAAYDQPoxDueIJbwx6Q5MtTVFjkIgYUf7e8AAZ6i7XI89Pyfxk7tfNPfS9A1qSo7
	 I/DEt3rGB+m1Q==
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-308e3bd8286so12145401fa.1;
        Sun, 09 Feb 2025 21:01:30 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWPvSIunJlQkltFxwqqiRdcH/A2Olgq952F+nF0tRUvHlBZkraTcFNzNjbaXMXzI1+jUrSp4Gqzwf5i2EI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzo2AfoweHPhZAQ5S5Q3hY8Os0fsBHuo7ivA+4/cmeHFmgw2zJl
	jeobikfo/P1PZedhMuXbxgtopDH8BEuVksAu7NaeBoDp8WfqY/G+ZtDY4rkKs9VEymv+z1KrhNr
	uyoLxKRBrerPsC9qtFTv7zZpSoZI=
X-Google-Smtp-Source: AGHT+IHLxJvAHmlELrlec1zDn9FnTVtXy3FIzCBROaw6n4XXX+y3xD2ESZoqMRHGKCbcBQXAa/7je/rBVVXVRZKj1mo=
X-Received: by 2002:a2e:bccc:0:b0:307:e031:15a0 with SMTP id
 38308e7fff4ca-307e57ce0efmr42647781fa.13.1739163688887; Sun, 09 Feb 2025
 21:01:28 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250208163959.3973163-1-ole0811sch@gmail.com>
In-Reply-To: <20250208163959.3973163-1-ole0811sch@gmail.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Mon, 10 Feb 2025 14:00:52 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQBBKfSwQ=z3yBchg--gcrAykWz6xvpAYWKse9R9g8KVQ@mail.gmail.com>
X-Gm-Features: AWEUYZn_X83jYxjHSq3f6Bj36yQxqx79BFj1f1IaiFuzsHlPGiLFIKV_k8nlAig
Message-ID: <CAK7LNAQBBKfSwQ=z3yBchg--gcrAykWz6xvpAYWKse9R9g8KVQ@mail.gmail.com>
Subject: Re: [PATCH v7 00/11] kconfig: Add support for conflict resolution
To: Ole Schuerks <ole0811sch@gmail.com>
Cc: linux-kbuild@vger.kernel.org, jude.gyimah@rub.de, thorsten.berger@rub.de, 
	deltaone@debian.org, jan.sollmann@rub.de, mcgrof@kernel.org, 
	linux-kernel@vger.kernel.org, nathan@kernel.org, nicolas@fjasle.eu
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Feb 9, 2025 at 1:40=E2=80=AFAM Ole Schuerks <ole0811sch@gmail.com> =
wrote:
>
> Hi,
>
> This patch series (for next-20250207) provides support to enable users
> to express their desired target configuration and display possible
> resolutions to their conflicts. This support is provided within xconfig.
>
> Conflict resolution is provided by translating kconfig's configuration
> option tree to a propositional formula and allowing our resolution
> algorithm and PicoSAT to calculate the possible fixes for an expressed
> target kernel configuration. PicoSAT is the smallest and most robust C SA=
T
> solver we could find which is also GPL compatible. PicoSAT is used as a
> dynamically loaded library. For Debian and Fedora, the apt and dnf packag=
es
> named "picosat" provide the library. For other distros, we provide
> instructions on how PicoSAT needs to be compiled from the sources in the
> documentation.
>
> New UI extensions are made to xconfig with panes and buttons to allow use=
rs
> to express new desired target options, calculate fixes, and apply any of
> found solutions.
>
> You can see a YouTube video demonstrating this work [2]. This effort is
> part of the kernelnewbies Kconfig-SAT project [3], the approach and effor=
t
> is also explained in detail in our paper [4]. The results from the
> evaluation have significantly improved since then: Around 80 % of the
> conflicts could be resolved, and 99.9 % of the generated fixes resolved t=
he
> conflict. It is also our attempt at contributing back to the kernel
> community, whose configurator researchers studied a lot.
>
> Patches applicable to next-20250207.
>
> [0] https://gsd.uwaterloo.ca/sites/default/files/vamos12-survey.pdf
> [1] https://www.linux-magazine.com/Issues/2021/244/Kconfig-Deep-Dive
> [2] https://www.youtube.com/watch?v=3Dvn2JgK_PTbc
> [3] https://kernelnewbies.org/KernelProjects/kconfig-sat
> [4] http://www.cse.chalmers.se/~bergert/paper/2021-icseseip-configfix.pdf
>
> Thanks from the team! (and thanks to Luis Chamberlain for guiding us here=
)
>
> Changelog v7:
> * improve error handling when loading picosat symbols with dlsym(): use
>   dlerror() instead of checking for NULL
> * move list_at_index from scripts/include/list.h to
>   scripts/kconfig/cf_utils.h
> * change interface of list_for_each_entry_from and rename list_size to
>   list_count_nodes to more closely match scripts/include/list.h
> * change misleading name "rangefix" of fix generation algorithm to
>   "fixgen"



Thanks for this, but I have no plans to merge the SAT solver.

The reason is that my future plan is to move toolchain selection
to the Kconfig stage instead of specifying it statically from the command l=
ine.
This approach was suggested by Linus [1], and to achieve that,
the shell evaluation must be dynamically re-evaluated [2].

The SAT solver would likely conflict with this plan. At least due to the
significant amount of additional code, which would be an obstacle.


[1] https://lore.kernel.org/lkml/CAHk-=3DwhdrvCkSWh=3DBRrwZwNo3=3DyLBXXM88N=
Gx8VEpP1VTgmkyQ@mail.gmail.com/

[2] https://lore.kernel.org/lkml/CAK7LNATe7Ah-ow9wYGrtL9i4z-VD=3DMCo=3DsJjb=
C_S0ofEoH6CFQ@mail.gmail.com/


--=20
Best Regards
Masahiro Yamada

