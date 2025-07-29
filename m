Return-Path: <linux-kbuild+bounces-8246-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CEB5CB14F03
	for <lists+linux-kbuild@lfdr.de>; Tue, 29 Jul 2025 16:04:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6915C1899D77
	for <lists+linux-kbuild@lfdr.de>; Tue, 29 Jul 2025 14:04:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 191981A23BE;
	Tue, 29 Jul 2025 14:04:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="usOJVrBx"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2976200A3;
	Tue, 29 Jul 2025 14:04:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753797860; cv=none; b=Ajnc0RFSWH7QRTiq6j3lbu0UxuLpYXkUeKAo00BO1Ds0Yeh55WXzmuDIel+dK9GP5Ec337jU05x5Qwx20IPZk6TbWemBJHTRpiw5sw7qWXRFSg4tPACUuiwJwt/v20XmxZaqpxL4YlXIkrF/ugRFoeTwq5qtIStRdTPCUqEyYP8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753797860; c=relaxed/simple;
	bh=H0pj4EHfbODrkNfFki+kZ6eUhahF4iOMxp7aM3iRv9c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=p0As9boKUzYedsRGFvYtnd6qkb1hPYIjIeG1KUWZBky0dhwg24JntRfgWSSVcEbvU74S+iboJBov6G4RSM1+VF3OaEKWD3OPltVBkyidB2W+q6r0bHJF3IxpL3nnvv1LzN3Z2oeU2a+Hf5pdGwO5QKMQcYASJd9SARsE4zLn8oM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=usOJVrBx; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 64A83C4CEEF;
	Tue, 29 Jul 2025 14:04:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753797859;
	bh=H0pj4EHfbODrkNfFki+kZ6eUhahF4iOMxp7aM3iRv9c=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=usOJVrBxEPvXWsrjjNS0ogUZ6birGeuMF/mu/j98Zd2KT1zrxKbWsQ4/OzVBTlRN9
	 2UhhFzgfbVAXojXZbpzTaN5sImL7A1kJLIt0NouFFZXWQWfMEY49+/hXilP5nTz3dB
	 0VpfHjcswHQ0jZizvaOY6hMUGsjO3jdSRapMIcZ9CMNiAa5z3/HljhXlnmH0itc3/Q
	 pYN5E9V5QEiUZEBkiUsaB7LNyTDtgBrsN/hPqS38wR84pLEPWtgPiW6WXNPNy48dgr
	 1xE7+eOTtblB+n3/6lfjsf3TCMuMfmAndEwJxheN90wQGnlctXJ+6a5MK9k+XJAqm1
	 X5GUa5QuEIMpA==
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-55a10c74f31so5945618e87.1;
        Tue, 29 Jul 2025 07:04:19 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUeb0LnPzyWvp00E0bsCI3b8YHLw0NWqZNgogAKilToiQPUeJ9STM+sGrkUoazEIMzE8xuy0M6bV7vyHBI=@vger.kernel.org, AJvYcCX6geAQLKnG2dPnHWHn2WYiZYC9HVbm3uqZ1WYkFgdCbz/i18YhnuyWVfdAGyEWFh9GfThtqNLWdgC3uQfI@vger.kernel.org
X-Gm-Message-State: AOJu0YyhR9ZSHnMg/Ys1yBT8Ttpj/wJ6Y7qI0lqK3Zg4hQfzRU+rifj7
	RMSJvAJw16Ow+ncCN7g2NgyC+SMlUPS3xLjUynE1FWhpy7q6iuZ0/Eano+mail0C93Xy6K1Suxo
	yTLdkNGnf1gYHjfnHsLaGInVgGTSZK/w=
X-Google-Smtp-Source: AGHT+IH5wDVveyh3WzZWltbcKF0cLa05vmVbff/VTK475pJfDWYQ1vjzwG4l/9IYuqtXO4Z+M63jDX7q101JuDDGnEo=
X-Received: by 2002:a05:6512:b8f:b0:553:268e:5019 with SMTP id
 2adb3069b0e04-55b5f41e48bmr4056835e87.11.1753797857590; Tue, 29 Jul 2025
 07:04:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20230801174922.333700-1-bmasney@redhat.com> <20230801174922.333700-3-bmasney@redhat.com>
 <CAK7LNAQ-nhy1_xFYiwuvOKvfUVSjvnEb4ZnJ8EMWo7uJun89Zg@mail.gmail.com> <249abbe2-0f2a-4e58-b7f2-bb286c0a4f8f@infradead.org>
In-Reply-To: <249abbe2-0f2a-4e58-b7f2-bb286c0a4f8f@infradead.org>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Tue, 29 Jul 2025 23:03:40 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQSoU6cnAJ4ayNG44hez+tK1ixrE+CJQzKoE1Tgdw5okw@mail.gmail.com>
X-Gm-Features: Ac12FXzkcN-1KyJpuTU5Kt8a1HiHK7ZoobY1HFkaDeh9WrkDEWg5Wwo--N3fsSw
Message-ID: <CAK7LNAQSoU6cnAJ4ayNG44hez+tK1ixrE+CJQzKoE1Tgdw5okw@mail.gmail.com>
Subject: Re: [PATCH 2/2] scripts: add kconfig lookup script
To: Randy Dunlap <rdunlap@infradead.org>
Cc: Brian Masney <bmasney@redhat.com>, linux-kernel@vger.kernel.org, 
	linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 28, 2025 at 3:38=E2=80=AFAM Randy Dunlap <rdunlap@infradead.org=
> wrote:
>
> Hi,
> Sorry about the very late feedback.
>
>
> On 8/2/23 11:23 PM, Masahiro Yamada wrote:
> > On Wed, Aug 2, 2023 at 2:49=E2=80=AFAM Brian Masney <bmasney@redhat.com=
> wrote:
> >>
> >> Add a script that allows looking up the full Kconfig entry based on
> >> the symbol name. Documentation and example usage is found at the top
> >> of the script itself.
> >>
> >> Signed-off-by: Brian Masney <bmasney@redhat.com>
> >> ---
> >>  scripts/kconfig/lookup.sh | 77 ++++++++++++++++++++++++++++++++++++++=
+
> >>  1 file changed, 77 insertions(+)
> >>  create mode 100755 scripts/kconfig/lookup.sh
> >
> >
> >
> > Everyone tends to have their own utility scripts
> > on their machines.
> >
> > I think this patch set falls into that category
> > as "create a wrapper script of grep" is what everyone
> > does to reduce typing.
> >
> >
> >
> >
> > FWIW, I have the following scripts in my ~/bin directory.
> >
> >
> >
> > $ cat ~/bin/kgrep
> > #!/bin/sh
> >
> > exec find . -name .repo -prune -o -name .git -prune -o -type f \
> > \( -name 'Kconfig*' -o -name 'Config.in' \) \
> > -print0 | xargs -0 grep --color -n "$@"
> >
>
> Sometimes I just want to see a symbol's definition. So using
> $ kgrep -A8 config.TSL2772
> finds only the config|menuconfig definition for the symbol
> without printing other mentions of it (in selects or depends on
> or help text or comments etc.).
>
> >
> > $ cat ~/bin/mgrep
> > #!/bin/sh
> >
> > exec find . -name .repo -prune -o -name .git -prune -o -type f \
> > \( -name 'Makefile*' -o -name 'Kbuild*' -o -name "*.mk" \) \
> > -print0 | xargs -0 grep --color -n "$@"
> >
> >
>
> Using
> $ mgrep floppy.o
> shows me nothing. It never completes, just hangs (OK, I killed it
> after 30 seconds). Any ideas?
>
> Thanks for the tooling.

I do not know.
It worked for me.

masahiro@zoe:~/ref/linux(master)$ mgrep floppy.o
./drivers/block/Makefile:17:obj-$(CONFIG_BLK_DEV_FD) +=3D floppy.o






--=20
Best Regards
Masahiro Yamada

