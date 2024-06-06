Return-Path: <linux-kbuild+bounces-2016-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 70CB18FE766
	for <lists+linux-kbuild@lfdr.de>; Thu,  6 Jun 2024 15:16:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7980B1C23BEF
	for <lists+linux-kbuild@lfdr.de>; Thu,  6 Jun 2024 13:16:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4516CFC02;
	Thu,  6 Jun 2024 13:16:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EdzcF/lQ"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EC95645
	for <linux-kbuild@vger.kernel.org>; Thu,  6 Jun 2024 13:16:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717679809; cv=none; b=CPAPPNgHXd/G1eODGy9cpgKswcs/z+2uPVU79NMS2zijMGCQxYX5gupVodkFQI1eu3zZOh6rsrrQ+1bY9dkZ9iu8yWo8f5zj6POzgKuKtOrY1cEj9szGH3YyopZQBraA4VH6mXsNJ+GWmDDNfdFQjPKzd1pNBZaIeO3Ap5bf9wU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717679809; c=relaxed/simple;
	bh=uPlc/BWX6vj3xmDvsRAXzbhwIrnV2RriuzP+VtqLITY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WE7NTyLTPmNrA4rMkmKtC42N9ykCfwTaiutxVr1Qivg2gNULJThPQxZyTOYtHOIGIuvHj8xZWKSly95qANrPOutUPGNb/x6W9UP1gT8kC3XUUz3kVbF9qGH/znVdWhb7lyiWDy88kbScV6hIScg6OVtWtlO127dskxnKVvgqsF0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EdzcF/lQ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C7E1C4AF07
	for <linux-kbuild@vger.kernel.org>; Thu,  6 Jun 2024 13:16:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717679808;
	bh=uPlc/BWX6vj3xmDvsRAXzbhwIrnV2RriuzP+VtqLITY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=EdzcF/lQtYlFlPToiH1o55lUZD+vEydxyZ20KA5UYkj1SLPMvwsHqy0upknyfYcun
	 1/wqCKgU65t78vUYcBcbmTLgxrk2RffmelV2dzuDiYSrqGkQ85jtqOLNYWHXu9oPIO
	 3d3f0NupuIJGxVhbMc2SurYzGqRwfXrF+wbREpbQJg5dZfVP0Uizyg2oYlhXp/Hbix
	 jaolAtr8N/S2qL188wIb6POdUq2Ffp+zZhhxaBv2xQ+UpkgldMe6CRIPHbz289K/cj
	 MbeK4YB/Ojs7qv0sEeA7kypWQVZFxu3e8NkNbTxnYE2cBJtHFDdV994T9xCGEvpWcW
	 ROLg4rs1pZz7g==
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-2eaa80cb550so11319611fa.0
        for <linux-kbuild@vger.kernel.org>; Thu, 06 Jun 2024 06:16:48 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVodkl/Bln7UTGSFbbO48qkStpG2Ym5YJ29zeWcTbZamNbjPZzxi96FuOW6KAFZSuc4eoKQx1Gpg7ld3YCaBDlUZPdgZeg4Snx84mnT
X-Gm-Message-State: AOJu0YxCguXZUYVmmgfPIacTzbKx3QG5IfWOexNlqzUQV+CbvXUhlQFD
	dV3IoLebLu9Xtt9Oa28qUqImeLrOsfXqYbwuDBHsUnHpU+SnabiugdLDSrDGZZ0d425fEDSkhDY
	kbC62O9Q+ZvfTBY0CyXqX/dhs2DY=
X-Google-Smtp-Source: AGHT+IGUJrPehD9HGRrUAy0fAsZZty9HCqUPZHjmQnDAlmsYsD246IkuyUinGE48caN9hBkmuciMYB/Ujyinkslqkns=
X-Received: by 2002:a2e:9396:0:b0:2e6:f1d3:9e7a with SMTP id
 38308e7fff4ca-2eac7a131c6mr32838371fa.19.1717679807241; Thu, 06 Jun 2024
 06:16:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240605175807.106447-3-mailingradian@gmail.com>
In-Reply-To: <20240605175807.106447-3-mailingradian@gmail.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Thu, 6 Jun 2024 22:16:10 +0900
X-Gmail-Original-Message-ID: <CAK7LNATZGXMXFV8oxRom12pxRc7zEfWwW7X=zjKCc6OJFZvsNQ@mail.gmail.com>
Message-ID: <CAK7LNATZGXMXFV8oxRom12pxRc7zEfWwW7X=zjKCc6OJFZvsNQ@mail.gmail.com>
Subject: Re: [PATCH -next v2] kbuild: explicitly run mksysmap as sed script
 from link-vmlinux.sh
To: Richard Acayan <mailingradian@gmail.com>
Cc: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, 
	Kent Overstreet <kent.overstreet@linux.dev>, linux-kbuild@vger.kernel.org, 
	Jon Hunter <jonathanh@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 6, 2024 at 2:59=E2=80=AFAM Richard Acayan <mailingradian@gmail.=
com> wrote:
>
> In commit b18b047002b7 ("kbuild: change scripts/mksysmap into sed
> script"), the mksysmap script was transformed into a sed script,
> made directly executable with "#!/bin/sed -f". Apparently, the path to
> sed is different on NixOS.
>
> The shebang can't use the env command, otherwise the "sed -f" command
> would be treated as a single argument. This can be solved with the -S
> flag, but that is a GNU extension. Explicitly use sed instead of relying
> on the executable shebang to fix NixOS builds without breaking build
> environments using Busybox.
>
> Fixes: b18b047002b7 ("kbuild: change scripts/mksysmap into sed script")
> Signed-off-by: Richard Acayan <mailingradian@gmail.com>
> ---

Applied with Kent's Reported-by.

Thanks!


>  scripts/link-vmlinux.sh | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/scripts/link-vmlinux.sh b/scripts/link-vmlinux.sh
> index 46ce5d04dbeb..518c70b8db50 100755
> --- a/scripts/link-vmlinux.sh
> +++ b/scripts/link-vmlinux.sh
> @@ -193,7 +193,7 @@ kallsyms_step()
>  mksysmap()
>  {
>         info NM ${2}
> -       ${NM} -n "${1}" | "${srctree}/scripts/mksysmap" > "${2}"
> +       ${NM} -n "${1}" | sed -f "${srctree}/scripts/mksysmap" > "${2}"
>  }
>
>  sorttable()
> --
> 2.45.2
>
>


--=20
Best Regards
Masahiro Yamada

