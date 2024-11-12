Return-Path: <linux-kbuild+bounces-4650-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A19329C4D8E
	for <lists+linux-kbuild@lfdr.de>; Tue, 12 Nov 2024 05:06:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B53322869F6
	for <lists+linux-kbuild@lfdr.de>; Tue, 12 Nov 2024 04:06:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 75DA0205E31;
	Tue, 12 Nov 2024 04:06:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZNBgoJHA"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42DEB2038BA;
	Tue, 12 Nov 2024 04:06:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731384364; cv=none; b=Nb34lfNHGvnPRflQTewyy3HozSqRipuRyitIxmzKubfDKc0PiNuVO4OVqymny7OhHkwjdcP/t24Qsab/m3wm77kzUhppt3ajbptnZCcNnDFjEwa2QTrxs+rzAHQMZU8+gABYvrjTfDmjJ9Rx4YmF0FiYFlsS0xeSequ1ib7qxGs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731384364; c=relaxed/simple;
	bh=FHke1KQcD8QEibCAXGq1prANLtcdE3Qip9NGZ8so138=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UenylDrgpgjFXOCgLSvzlmd2x/++tICZQkpzv7b3VbARKJ+CMuA5s3dV+J84w+DM1Qnt/GbQB/++ZH/aobS+zjHMQHamlkEXqWS1MIP9NVPvaXsaoXqnPu6/YCo4qOqDqtiJsJFECJJ7aiKYt1uVm/vPlyAUWKoiCAHSWS3OOQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZNBgoJHA; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0B53C4CEDF;
	Tue, 12 Nov 2024 04:06:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731384363;
	bh=FHke1KQcD8QEibCAXGq1prANLtcdE3Qip9NGZ8so138=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=ZNBgoJHA5wNXMNUg4ZyDtVJvytVDggGjakai+NsKjE0ReEkscttntk9VX7BxIbVMV
	 fxLGj9TqkVKzwWWAzV4m2N5m88UmWWPelrFG07R5YjVgTyvStLJGX1pDx3Tkbokh8w
	 9bIUeQ+ZZkPMBLz3uESazlqU6/8zyt4NoMj9/mvBMcOjZytXiR9QVyvbW9mXyz6FL2
	 ab14YpfFFrd7BZ4q91LGn7JZAmJ38GYhSzNL2hQ6Nj4b3ujJ6pLa6OWnbDBQJ/Pu/r
	 EAgOz1gS2mpc3R6OEydFWaqVWOEzvpEtodT6jlnW1yid76Gf5EJLQps8aeF9TpZ8xq
	 yurKCto9PRbbw==
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-2fb559b0b00so41988091fa.0;
        Mon, 11 Nov 2024 20:06:03 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCU3dCKsvVPf6R/cnOnITmn8V39EsTy3wIANjusanJHtLeI4zNoFraBLXYHDF4CwaSMoc1vr2TSZ2vOx3c1U1w==@vger.kernel.org, AJvYcCV4DMYH5Jr8IB7BKhjq4R7D2kNb8/S+5PUaqGtdtdEqYmfzmFoxmcZx+ZY75bgz0V5hPpeG7esZdVHOdG4=@vger.kernel.org, AJvYcCWaHes3ZkyttVnKVtYzK6WEN5sPUleLUAL2MMp5a4EUJ4U4rRb1piGJrketAV1QZ1ZFpbqqIkQ/1T0kIic6woU=@vger.kernel.org, AJvYcCWfQCoN/iR2gWDMjQZfQTCSQPq8mRLHpu/eNFaK6FQ2ST6Kn103B4rmyWzqAu4r4NVu1w9bLKovwUJDbA43@vger.kernel.org
X-Gm-Message-State: AOJu0Yyyowl4PtYQJt8aWBygIYmPZigYdPwY4FLjyp/itmU8l4hu2Ywp
	ckKLrrbPN/dcXqMl56070x6Ugup5oqiwuyqlmVCUD/Fy7hIj9zIv2DtGW1+UJYZyErx5HhK+KSJ
	6Qrt/UvdgxoWJiofIrsmf5gdmmaA=
X-Google-Smtp-Source: AGHT+IFaRU5m6t+1lg1Mo1HuXiGTzkpRRzVCu43z16mgHhFLkoiREKNarCRpBVHxgtf18ImVdw8EvH+O6j07/ZYcwMM=
X-Received: by 2002:a05:651c:988:b0:2fb:8df3:2291 with SMTP id
 38308e7fff4ca-2ff2016d246mr72169041fa.16.1731384362113; Mon, 11 Nov 2024
 20:06:02 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241030170106.1501763-21-samitolvanen@google.com> <20241030170106.1501763-22-samitolvanen@google.com>
In-Reply-To: <20241030170106.1501763-22-samitolvanen@google.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Tue, 12 Nov 2024 13:05:26 +0900
X-Gmail-Original-Message-ID: <CAK7LNAShVzrE6uhXxZ7HepKhmOJYsZeigq6w19jRN3OH-T_Jyg@mail.gmail.com>
Message-ID: <CAK7LNAShVzrE6uhXxZ7HepKhmOJYsZeigq6w19jRN3OH-T_Jyg@mail.gmail.com>
Subject: Re: [PATCH v5 01/19] scripts: move genksyms crc32 implementation to a
 common include
To: Sami Tolvanen <samitolvanen@google.com>
Cc: Luis Chamberlain <mcgrof@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Matthew Maurer <mmaurer@google.com>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Gary Guo <gary@garyguo.net>, 
	Petr Pavlu <petr.pavlu@suse.com>, Daniel Gomez <da.gomez@samsung.com>, Neal Gompa <neal@gompa.dev>, 
	Hector Martin <marcan@marcan.st>, Janne Grunau <j@jannau.net>, Miroslav Benes <mbenes@suse.cz>, 
	Asahi Linux <asahi@lists.linux.dev>, Sedat Dilek <sedat.dilek@gmail.com>, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-modules@vger.kernel.org, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 31, 2024 at 2:01=E2=80=AFAM Sami Tolvanen <samitolvanen@google.=
com> wrote:
>
> To avoid duplication between host programs, move the crc32 code to a
> shared header file.


Only the motivation to use this long table is to keep compatibility
between genksyms and gendwarfksyms.
I do not think this should be exposed to other programs.


If you avoid the code duplication, you can do

// scripts/gendwarfksyms/crc.c
#include "../genksyms/crc.c"





>
> Suggested-by: Petr Pavlu <petr.pavlu@suse.com>
> Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
> Acked-by: Neal Gompa <neal@gompa.dev>

Does this Ack add any value?

Acked-by is meaningful only when it is given by someone who
maintains the relevant area or has established a reputation.

$ git grep "Neal Gompa"
$ git shortlog -n -s | grep "Neal Gompa"
     2 Neal Gompa

His Ack feels more like "I like it" rather than a qualified endorsement.



--
Best Regards
Masahiro Yamada

