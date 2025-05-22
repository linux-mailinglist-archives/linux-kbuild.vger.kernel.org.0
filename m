Return-Path: <linux-kbuild+bounces-7219-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A84AAC05C3
	for <lists+linux-kbuild@lfdr.de>; Thu, 22 May 2025 09:32:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1D7AC1669FE
	for <lists+linux-kbuild@lfdr.de>; Thu, 22 May 2025 07:32:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 986E3221DB1;
	Thu, 22 May 2025 07:32:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FPcQGbSJ"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E4C84A3C;
	Thu, 22 May 2025 07:32:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747899124; cv=none; b=rPpe8/AsKRiRoR4xrAb06gW2oef9caKSdCcMGiJj6tLiUq59epYvO/WSnNxXhbf1UusniBgMz0gJuFiChwLLtKLuhgRxvpSiNcAeCOG3qo3qyf6fKQYyGj7VgcrLl8X9gH3NjQTJeNYdJoCFLU8jjwU5H+C3N/LhcRvAx1XvJJI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747899124; c=relaxed/simple;
	bh=QgRy7TuwiDs3QolmmZ6/MEashaeGj727efB625Ipw80=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jz71Ayinza0MqgJU2mBlpV4/qgV6wepPE9K+ti64y7qo2d8LJUPrjWqpBMSXG2bAy/L6oeNw9UCqkrh/WazMcVkcZ2kiIktfnx0XrwN/7tvSzWH+Vwr2j3HH3yDy4MLg2t3+5xO5qSSDYq22gmFCnjsJELf6u9ftMbqgEtiBuZw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FPcQGbSJ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD890C4CEEF;
	Thu, 22 May 2025 07:32:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747899123;
	bh=QgRy7TuwiDs3QolmmZ6/MEashaeGj727efB625Ipw80=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=FPcQGbSJWsROY0SXihiztVZ4pogx42ckV4OAJ42wusAfyg637/S6fzMxokPbh3Ive
	 D5v2rR9PyGdPhFd44JTSJFAbotB7kpArTlS0wJMIesigGo1QRBiQ5a0gTZQJncevWA
	 2aM6Kosbqr9mgy9lwBQRi5HeSCHQGGOxUp8CSEPRPVkvDqzPtL/hKaPNhjBNVCy50l
	 p5s4IkQaoD+rMHH19kI9N7TsWuEtooKOaLQf7gqa7U5Z5pW9pcXscH8Z7wigCgmSbT
	 sKx0z1gIPPownUphImoRo4e78cln63FoAzviWFsd+V2kHApiSwQMGPpgSNpkTMzBFD
	 cEvO0kUsbtH7w==
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-32925727810so31280271fa.0;
        Thu, 22 May 2025 00:32:03 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVM7HKBcg79MGMUzOpMv8bG5hpaBPSCbVjM7yfjcSi0wCijDOJVfOKB2/YqKjsS7Zg0lDCM9/lriDI+WFQ7@vger.kernel.org, AJvYcCWUH9x1rSfJ89kd3C+dd4nj1WZZFmEefgE5JFkJ7MELwYVqgM/Do0Y7hbdRZKu78CjrdT5Bckw0h+DqWz0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzcK1yVZlz7BTxFrIl+OpPeyQTZe44PgjfQIjIPWlrocm1T7BkW
	BSbu1StoKkmJc2BpBcNKrO66SvqiVeqizKD4IgqEJKzaixxCaH98IGhtvp+BnInMVULwMSOBPBS
	jhoXoYMgnUP/g0LoAHvV1izEGar5bRow=
X-Google-Smtp-Source: AGHT+IFlSmcTcJKiSoIh2g//2bldeunCHesHuXBUCA1cM/xMXD0oa+u9lUMcKbNSRgPgqcyTfUIPQF4eLl2DH0Dw8ns=
X-Received: by 2002:a05:651c:20c3:b0:329:adf:1811 with SMTP id
 38308e7fff4ca-3290adf1a21mr33185191fa.41.1747899122577; Thu, 22 May 2025
 00:32:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250521112425.20218-1-unixbhaskar@gmail.com>
In-Reply-To: <20250521112425.20218-1-unixbhaskar@gmail.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Thu, 22 May 2025 16:31:24 +0900
X-Gmail-Original-Message-ID: <CAK7LNARD3C0zPtzvtKCZssuY8gXJmfmXUsVYZ64wsNXLRdh+wQ@mail.gmail.com>
X-Gm-Features: AX0GCFsOhFg4fvsC778aTNhIkTT5Ma4dWJ3ej46TfT8fAsvMUGQmdDvBeXBybuc
Message-ID: <CAK7LNARD3C0zPtzvtKCZssuY8gXJmfmXUsVYZ64wsNXLRdh+wQ@mail.gmail.com>
Subject: Re: [PATCH] scripts: Correct the function name in comment
To: Bhaskar Chowdhury <unixbhaskar@gmail.com>
Cc: nathan@kernel.org, nicolas.schier@linux.dev, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 21, 2025 at 8:25=E2=80=AFPM Bhaskar Chowdhury <unixbhaskar@gmai=
l.com> wrote:
>
> Simple correction about the function name to match in the comment section=
.
>
> Signed-off-by: Bhaskar Chowdhury <unixbhaskar@gmail.com>
> ---
>  scripts/link-vmlinux.sh | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/scripts/link-vmlinux.sh b/scripts/link-vmlinux.sh
> index 51367c2bfc21..6ff23a77bf96 100755
> --- a/scripts/link-vmlinux.sh
> +++ b/scripts/link-vmlinux.sh
> @@ -165,7 +165,7 @@ sysmap_and_kallsyms()
>  }
>
>  # Create map file with all symbols from ${1}
> -# See mksymap for additional details
> +# See mksysmap for additional details

I think this "mksysmap" refers to scripts/mksysmap
instead of the function name.

However, I'd like to delete this useless comment.






>  mksysmap()
>  {
>         info NM ${2}
> --
> 2.49.0
>
>


--=20
Best Regards
Masahiro Yamada

