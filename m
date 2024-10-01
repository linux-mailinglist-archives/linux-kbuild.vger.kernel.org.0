Return-Path: <linux-kbuild+bounces-3853-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7901398B7E8
	for <lists+linux-kbuild@lfdr.de>; Tue,  1 Oct 2024 11:07:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A15341C22908
	for <lists+linux-kbuild@lfdr.de>; Tue,  1 Oct 2024 09:07:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 564D919D090;
	Tue,  1 Oct 2024 09:06:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="o4YTNrZ1"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F17319D08A;
	Tue,  1 Oct 2024 09:06:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727773616; cv=none; b=AWKPG3TJAQVWHiVAW7unGjQ2IPn0l8VYfi9RJJT9U+Ia+/ki91T83wfHXq+dxO6W6nrTpP/v1IuNMkInGLMxyOwXMKzsXd5qood6jgED84J7PN4W+Rr/mnDuVzBBE5KJaDgB49oBjTQIv2F9BB/tObehmuuTywB+ci7XJ6NgMCA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727773616; c=relaxed/simple;
	bh=/J5lA1vMXO3fvBA8EVAQjc+hR9W0Fvx2PQHmwTFbGN4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Qn+Vpbo0te1uus18foGe7sGujAgvGgZvcV4A0qtJvQ+ejjGjda7oQf3p/XJp3TXmRqAGh6GNWGk0s0Kg7QWGXNS8QPM6cpDlAGbfXcCxTx36hakNc1v8gQN/1PjmL38CZJ4mGT1Qtnaq42NXfU2n+sXecRHLbUn9uoPInD0RO8s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=o4YTNrZ1; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE82BC4CECE;
	Tue,  1 Oct 2024 09:06:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727773615;
	bh=/J5lA1vMXO3fvBA8EVAQjc+hR9W0Fvx2PQHmwTFbGN4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=o4YTNrZ1CGw1SIZXFDFx55fFZUxM1jb6NksG4AeQwAO6na34bL781b8hlq+wqr9XZ
	 ts6wYVAdCQJcgmUoaomeDplRiNp2v7GfZ0huufq31gAkDLlkoG3LIr9L3dEgqKO9bB
	 ebFACCXfS3zR49DrMA3BDMoStV2gAFGoxbp9eL9PR4liY2q9YegtUdaDZS+yUgwm0S
	 qWw5379IANylicNgjxIRLO6zFTlPhh03XC3r+gdZgVhOBIPNZJh8MNbWiJMwIoPuuJ
	 c8WxAgcl4Jp7EOz5OMi60bksddY2ltOENtLdgSacSHVxN5lUI/eTuYbgrbkuvP8hSV
	 kZisZfq5PpvJQ==
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5398b589032so4398380e87.1;
        Tue, 01 Oct 2024 02:06:55 -0700 (PDT)
X-Gm-Message-State: AOJu0YytQt5rcpmbxhlonCByJX23EVQ8dU+N1QNIAAFOfPIIu16iN/0Q
	aI4FKxFB1J/ihwgQm5llpCGC7ngycXZOEmyfny8omttndI6d1qwMu0nXYXBNS4a6JQkueAzLMh7
	fP51G4xoX7Up/HluwQMCU43MjFX8=
X-Google-Smtp-Source: AGHT+IHXpAYDqNYgMGMaXWiXDHqmz9rLOAk8hTC0ekONh8xWp1l3kYjBcmvtCY84mNOljFt1IYq5NBBy+jK906RSjdA=
X-Received: by 2002:a05:6512:b27:b0:52c:deb9:904b with SMTP id
 2adb3069b0e04-5389fc7cd28mr9969900e87.38.1727773614289; Tue, 01 Oct 2024
 02:06:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241001090226.2784447-1-masahiroy@kernel.org>
In-Reply-To: <20241001090226.2784447-1-masahiroy@kernel.org>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Tue, 1 Oct 2024 18:06:15 +0900
X-Gmail-Original-Message-ID: <CAK7LNARc1OTiQXPhu=YoFHO7y8+70LSoDiNK8dSGvTfiZhea+Q@mail.gmail.com>
Message-ID: <CAK7LNARc1OTiQXPhu=YoFHO7y8+70LSoDiNK8dSGvTfiZhea+Q@mail.gmail.com>
Subject: Re: [PATCH] kconfig: qconf: fix buffer overflow in debug links
To: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, 
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 1, 2024 at 6:02=E2=80=AFPM Masahiro Yamada <masahiroy@kernel.or=
g> wrote:
>
> If you enable the "Option -> Show Debug Info" and click a click, the


I meant "click a link"




> program terminates with the following error:
>
>     *** buffer overflow detected ***: terminated
>
> The buffer overflow is caused by the following line:
>
>     strcat(data, "$");
>
> The buffer needs one more byte to accommodate the additional character.
>
> Fixes: c4f7398bee9c ("kconfig: qconf: make debug links work again")
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---
>
>  scripts/kconfig/qconf.cc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/scripts/kconfig/qconf.cc b/scripts/kconfig/qconf.cc
> index 7dba8014ead4..e260cab1c2af 100644
> --- a/scripts/kconfig/qconf.cc
> +++ b/scripts/kconfig/qconf.cc
> @@ -1166,7 +1166,7 @@ void ConfigInfoView::clicked(const QUrl &url)
>  {
>         QByteArray str =3D url.toEncoded();
>         const std::size_t count =3D str.size();
> -       char *data =3D new char[count + 1];
> +       char *data =3D new char[count + 2];  // '$' + '\0'
>         struct symbol **result;
>         struct menu *m =3D NULL;
>
> --
> 2.43.0
>


--=20
Best Regards
Masahiro Yamada

