Return-Path: <linux-kbuild+bounces-4366-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 612899B316B
	for <lists+linux-kbuild@lfdr.de>; Mon, 28 Oct 2024 14:14:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 92BF61C2187F
	for <lists+linux-kbuild@lfdr.de>; Mon, 28 Oct 2024 13:14:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B0DF41DB37A;
	Mon, 28 Oct 2024 13:14:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DYZdU+03"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C5321E48A;
	Mon, 28 Oct 2024 13:14:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730121254; cv=none; b=AO3nEaTQggxwmovnwP+/qLr1bMNcjGkafnO4SqeDW/E1d2OV6gb96S61tbTNAXfCd7Fd6K8oqbn+6gBG2ZcnZLMJomvYYKP3LFz4C70PPjtkgv+P/lmlgIkpWlG35/x06QG5MUX67DD8GDFg/BRzR5LiPg0u6n0seKrtvdJHASw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730121254; c=relaxed/simple;
	bh=umXgkxvsn6pDDf/HDvjTuNRj/50/wdrGHMkq15iPbhc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DYWv5X/plFQO/7QXiuhujgs/vnCYB9qF+zO30AqakjmSOBdrgiwOTz9D90uWMRYZWIlFBO1G0dUgNUhhBWGrxC1g1MlOTOjySECkNzNn3YyfyfQgQlF0F5qJTbjUKVCqUdTFDgo+1ClXMa0TvJ5mO0Dj6GgURHLSn52s49oCGt8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DYZdU+03; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1CEA1C4CEEC;
	Mon, 28 Oct 2024 13:14:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730121254;
	bh=umXgkxvsn6pDDf/HDvjTuNRj/50/wdrGHMkq15iPbhc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=DYZdU+03iEdFhVk6XAp+TgXryYadk927GCLCnF/cjY1oEcuv1ykc2UbVIA35FN92j
	 oTbxzoRmr7/iyleb+67SXJQk/AWyK9bUhn4Z0eJ/8nRaKnz51vyMi5mhhsdLSWHF1d
	 Lb38yEAt7DwS89iHYA7KCK5vhLWRnv0c0mN1L4F2Me8JrPL0Ac1JaH5CFtTsrby4as
	 MM/1qIY5BNOQ26XP78kKBUzGGfrbYdUGgtZg1wFeizzEYp/H4r8tgjb2EgOjUIL35Y
	 AcBteTQDzJOWcUPavb2SMWIbP5LpY6zP/uWn9xkv0krN7WMQGN1xySJ+0g4pgZD5x+
	 IB4sMXh3eStUw==
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-2fb3da341c9so40504411fa.2;
        Mon, 28 Oct 2024 06:14:14 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCV7tWww33e2GWEwVlyVM3mhul2iST+6ypTS/4czmG23j5P9tu03TDS0ll2FqMmwFx1Nz9dVY6AsYE/EpwkP@vger.kernel.org, AJvYcCVAd/PYGPqSbRMp4oXYtcX15IeINEW8IudXmVbtmQ0gubIk1YPPI1GVlRBsIEAk1ZK+yo0Dp+SZJZ5Q8QQ=@vger.kernel.org, AJvYcCWC6rKGFQwt70l2sdOlHm/W396yYGAvKCIRfHXV/+g5X0s+pjkvqWaw9AdkjIqbMxRBAU0RskqedJmqjTrz0A==@vger.kernel.org, AJvYcCX39l6soPmMvWJNyTwj5P7XPcfvyTxOJGj7lvsl24jLWiGm+TSZq+Ivys8zXFvdwX3sRYw02cYJI/aJKf+jIyU=@vger.kernel.org
X-Gm-Message-State: AOJu0YywsB1RgtquwRh9Oh9PcDQTmo+Xfu29cQMWt3CCprc9YS58z1Hn
	z76nGKqqI/5AOvaZZYhl40A+x6xKjFoFagQmz1vHnxaPZMh4moZh5UPi3yNYs5/4Gfd5GfFPOxS
	yUOsdRS2MgDd3tY7cwHaqyeuoyLg=
X-Google-Smtp-Source: AGHT+IG9gyko7VXssgM2SznITKHdLjhPfPryjecLgn1FTNeKz7JFR7J+mcsrozK/vjiUGUaUbgu6OiWUprCs1uMwqR8=
X-Received: by 2002:a05:651c:1504:b0:2fb:5014:c998 with SMTP id
 38308e7fff4ca-2fcbe08cf24mr28249331fa.28.1730121252616; Mon, 28 Oct 2024
 06:14:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241015231925.3854230-1-mmaurer@google.com> <20241015231925.3854230-2-mmaurer@google.com>
In-Reply-To: <20241015231925.3854230-2-mmaurer@google.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Mon, 28 Oct 2024 14:13:36 +0100
X-Gmail-Original-Message-ID: <CAK7LNASAbDNZYcSZ+F+4JrbGFWiV4qO-W=HfaBEieKhcg+=jCw@mail.gmail.com>
Message-ID: <CAK7LNASAbDNZYcSZ+F+4JrbGFWiV4qO-W=HfaBEieKhcg+=jCw@mail.gmail.com>
Subject: Re: [PATCH v6 1/5] export_report: Rehabilitate script
To: Matthew Maurer <mmaurer@google.com>
Cc: ndesaulniers@google.com, ojeda@kernel.org, gary@garyguo.net, 
	mcgrof@kernel.org, Alex Gaynor <alex.gaynor@gmail.com>, rust-for-linux@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, neal@gompa.dev, 
	marcan@marcan.st, j@jannau.net, asahi@lists.linux.dev, 
	linux-modules@vger.kernel.org, samitolvanen@google.com, 
	Boqun Feng <boqun.feng@gmail.com>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 16, 2024 at 1:19=E2=80=AFAM Matthew Maurer <mmaurer@google.com>=
 wrote:
>
> The `export_report.pl` script was broken [1] a while back due to a code
> cleanup causing the regex to no longer match.

Instead of the link to lore, you can refer to
commit a3d0cb04f7df ("modpost: use __section in the output to *.mod.c")



> Additionally, it assumes a
> `modules.order` file containing `.ko` in a build directory with `.mod.c`
> files. I cannot find when this would have been the case in the history,
> as normally `.ko` files only appear in `modules.order` in installed
> modules directories, and those do not contain `.mod.c` files.

If necessary, you can refer to
commit f65a486821cf ("kbuild: change module.order to list *.o instead of *.=
ko")


As suggested, I vote for the removal since it has been broken for 5 years
since a3d0cb04f7df.



--=20
Best Regards
Masahiro Yamada

