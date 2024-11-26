Return-Path: <linux-kbuild+bounces-4869-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 67EA19D9896
	for <lists+linux-kbuild@lfdr.de>; Tue, 26 Nov 2024 14:35:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2DDC32840A5
	for <lists+linux-kbuild@lfdr.de>; Tue, 26 Nov 2024 13:35:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5CABDD53C;
	Tue, 26 Nov 2024 13:35:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aNLtLnEj"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2820BBA49;
	Tue, 26 Nov 2024 13:35:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732628140; cv=none; b=cmFH4iFqNIqlcZaAi9zoRNPoyTlkIP3QbLVMmY3zvWv5cXmJma9vzsSsrpKeXYHcKZ+mjxgPQljiB/B+ew1uzCsWof68+HI4MqYU5JOXckruwlW4/MacMiX5i2zVMDnQbEPQ3Rksmtwbs//t94/YXKvDKtu/QM9WL93YvZZFO4s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732628140; c=relaxed/simple;
	bh=eEdgeH8RAM4gsztBcwR0qWURd6umlZnREyPmTlInX0I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cGp3wIGDwVGqoYjvdqEcNkWUwTj6+/11GoewAHz2C5t58aA+TN/ROIeNRithOyzWzRLfez6b+pYamhn5AdAVxAZjyGvjU2fxlHKXyBdt6+pe/xMPW3E8NFrIxZCrTkwmRDxvlNdiae0qNGq/VoDArL8SlpwP+5L+MLrC3AoTw8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aNLtLnEj; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4205C4CED0;
	Tue, 26 Nov 2024 13:35:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732628139;
	bh=eEdgeH8RAM4gsztBcwR0qWURd6umlZnREyPmTlInX0I=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=aNLtLnEjYZSFSOlX20iTbsUk/iK3tj/E/scLGoYmYpXiWRnZHz3P8wMzPS7AbJSG6
	 hxNtAff/ppQQn9VL1B2a6gMJutYIzddwirhbdoHY38w15JG00Ia+SyHyobGs4lnnvd
	 pgf3ABFHWiQUHraJtEQg7GsF3ONgoorpUFv8jjiSP0CEpa85DcNM9wtGKE7yzWllz7
	 WqrAaA/Wkiq/8DiyvIVV+cc7yKvkvqhOu3OurrCJDJguxERTGblgucoYRb1I0jBnwd
	 R0efp1awg1Ueqfn3z4uptWTkphBGRX6+TOqNDqs0jJynyJhZTB8pTMC4ZVAMl/dfgP
	 iEwa9dt5E3clA==
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-53de8ecb39bso891833e87.2;
        Tue, 26 Nov 2024 05:35:39 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUCyGk2pmv8h3ifSYjUrJ2B8VQQEI133zaCaU3Ahu3qrf3KzhLG1NqJK7Rg6x+fOdQsJ0gwxQ5WulSPlz+mpQ==@vger.kernel.org, AJvYcCUt6YDR0ObN99q1/OkFS299ldSx5hAaYzyKb3qvyM+N0b4dawyF51BmzyN/+prBQqSkRlEpOCJ7jIZPXjg=@vger.kernel.org, AJvYcCWV94m0ZV5lsUMeWUQT0QjQyt3/cedUkdDJOdfCbOTovO0L4LQanbSb/rpS8YfKoLA3luOdNJ4/O1zU54Us@vger.kernel.org, AJvYcCX4Qxt3xfM5dlDlLlT9Ypq0mCVFzwHOMr1tJKEWFBfDDNXrPJ7XOJ9wx5ua2GpInx5OPQslSQUmGaKZ3u7C87M=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywzn5BfrHfPqaw1b1MA0NixcTjLbKc1PsdkiCEoDul3QvhbCKrC
	lGjl9DqqOFlTtG7MAV6yb9jOgTFYp/bwsgWhaALctFfK1lq4OQTw/B9Iwo20StN9bjn1btHHowj
	2JUjVSCQpnA6vGi8qcHSSgK0ovzY=
X-Google-Smtp-Source: AGHT+IF+dFvhlgin3zLG1WzH4Jppws42ttM+/X4kFx7RuGrhS2XMsjXtwtSwj19beqzn6FQMSzIX7ockErZbmN0AesU=
X-Received: by 2002:a05:6512:3da3:b0:53d:e7b6:c702 with SMTP id
 2adb3069b0e04-53de7b6c987mr2767749e87.50.1732628138542; Tue, 26 Nov 2024
 05:35:38 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241121204220.2378181-20-samitolvanen@google.com> <20241121204220.2378181-21-samitolvanen@google.com>
In-Reply-To: <20241121204220.2378181-21-samitolvanen@google.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Tue, 26 Nov 2024 22:35:02 +0900
X-Gmail-Original-Message-ID: <CAK7LNATzF9++sEcgX3t3KEAH1JFPPdeB9EMVk44KVQ1cBiO8xg@mail.gmail.com>
Message-ID: <CAK7LNATzF9++sEcgX3t3KEAH1JFPPdeB9EMVk44KVQ1cBiO8xg@mail.gmail.com>
Subject: Re: [PATCH v6 01/18] tools: Add gendwarfksyms
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

On Fri, Nov 22, 2024 at 5:42=E2=80=AFAM Sami Tolvanen <samitolvanen@google.=
com> wrote:
>
> Add a basic DWARF parser, which uses libdw to traverse the debugging
> information in an object file and looks for functions and variables.
> In follow-up patches, this will be expanded to produce symbol versions
> for CONFIG_MODVERSIONS from DWARF.
>
> Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
> Reviewed-by: Petr Pavlu <petr.pavlu@suse.com>
> ---
>  kernel/module/Kconfig                 |   8 ++
>  scripts/Makefile                      |   1 +
>  scripts/gendwarfksyms/.gitignore      |   2 +
>  scripts/gendwarfksyms/Makefile        |   8 ++
>  scripts/gendwarfksyms/dwarf.c         | 166 ++++++++++++++++++++++++++
>  scripts/gendwarfksyms/gendwarfksyms.c | 126 +++++++++++++++++++
>  scripts/gendwarfksyms/gendwarfksyms.h | 100 ++++++++++++++++
>  scripts/gendwarfksyms/symbols.c       |  96 +++++++++++++++
>  8 files changed, 507 insertions(+)
>  create mode 100644 scripts/gendwarfksyms/.gitignore
>  create mode 100644 scripts/gendwarfksyms/Makefile
>  create mode 100644 scripts/gendwarfksyms/dwarf.c
>  create mode 100644 scripts/gendwarfksyms/gendwarfksyms.c
>  create mode 100644 scripts/gendwarfksyms/gendwarfksyms.h
>  create mode 100644 scripts/gendwarfksyms/symbols.c
>
> diff --git a/kernel/module/Kconfig b/kernel/module/Kconfig
> index 7c6588148d42..f9e5f82fa88b 100644
> --- a/kernel/module/Kconfig
> +++ b/kernel/module/Kconfig
> @@ -169,6 +169,14 @@ config MODVERSIONS
>           make them incompatible with the kernel you are running.  If
>           unsure, say N.
>
> +config GENDWARFKSYMS
> +       bool


You can move the prompt addition from 17/18 to this patch.

-       bool
+       bool "gendwarfksyms (from debugging information)"


You split the patch set into a large number of patches, but
I cannot compile-test each of them until 17/18 is applied.





--=20
Best Regards
Masahiro Yamada

