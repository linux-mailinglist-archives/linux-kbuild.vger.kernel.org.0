Return-Path: <linux-kbuild+bounces-4837-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BFFB9D79C6
	for <lists+linux-kbuild@lfdr.de>; Mon, 25 Nov 2024 02:28:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D4B8A2825A0
	for <lists+linux-kbuild@lfdr.de>; Mon, 25 Nov 2024 01:28:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 660984C76;
	Mon, 25 Nov 2024 01:28:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AX4WAESO"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A27A79F5;
	Mon, 25 Nov 2024 01:27:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732498080; cv=none; b=QIz51VFDKobOIdPeq0AOzu7kSGwYLRnlBHQmq9ZCe4qv1tHHG0PcSeJNFrCzkwN4eHRLBHV7gen/Zv9Ss72pGf49t2ylhw7S2kIO4nsqqserwjg4bimicF7Nyl0cHL41zjwMxOLFyaPIuYIEMb+SyHLnH952MknCQGB7nyPAORA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732498080; c=relaxed/simple;
	bh=DNnWvILlFGSRzB5QgDXte8hNW/wYoseONDiQj9vnhRg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dygh7LUpDpkQkAFtGR+0Ki5p8eXIRb+Og5Zx6K9uuBbevZe6HgkRumtlMtby5GZeRpY6g1dvAcZzgQUd4SxU+BReUX1yGqEdEdkCyGTXeZZICuirCb9p8sSSRDHLDCBkD8wz2QE7WOvkBm/CI5hYbUrIOgc1XOadAADAjgSLOAY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AX4WAESO; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C357CC4CECC;
	Mon, 25 Nov 2024 01:27:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732498078;
	bh=DNnWvILlFGSRzB5QgDXte8hNW/wYoseONDiQj9vnhRg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=AX4WAESOa0b7tdHz2lOiEE/TJYAoxkPFjlCM/CfXkd3t2zw9/3TSzjNGF3WWfdOjN
	 159vwkaEjX+gf0iadhjyCOFFULqfbH3M9oGlFcYoZWWFo7ZlK+wxpBfNydYJhQ4Uul
	 COSCIGDYdXCFvkINkzOsVdJkRDBNK4G5H39crj6W6KG6hFasd25vNPcK8sQGhXQ1tr
	 Mp/EpDzx+91iGEem1I+nD3MIbv5wDWod+fDyuFk6n8zFU+7psKFTvEK84mgcdMBaFM
	 qQXE9TBTR2FialzWtJ0CY8BSMrgdW7KwBjAkQLxjQP5hvbhs81hD/wAYEY/Ca+09YG
	 PwBkLcJ3rPcXw==
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-2ffba235991so8314151fa.0;
        Sun, 24 Nov 2024 17:27:58 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUa9ivbW+Hmct4CI+cZlazYEQBP0SUrGnqMjY3ohhQsY3wENF5EJteqCBRbW/gsJhAiZMwnJKh9919fpOiM@vger.kernel.org, AJvYcCXO/VEw3I9c7VwB3135QTsICQYZGzJK4uNK9Q86Ms9IkFM6p5g0VPs51L1GCDVoQm8Sb98oPjKoC+pX/sI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwkYHKKPFefKFAkXKQBfEVNn1DzqxgnvIaJXtDn4oVMNAH4cjBT
	3b4ZiWR1jf2jfdUuVklW+YYS4ie/5Q7SKdWRmskk/whWUO6ho6lmQKsJfTpMKsUQlb8MUqTOAgF
	1D+qx7d020GuKtM4WarvYJsAKLuo=
X-Google-Smtp-Source: AGHT+IG5tHgo1xe6Y37NtHha8xrtvKFdSdHXcffV7iV+asKnn8E7RqjpvhFLoqTfThLyVOYEGn8BZSbYbWOLIc63uvk=
X-Received: by 2002:a05:6512:1249:b0:53d:d998:c8d3 with SMTP id
 2adb3069b0e04-53dd998c91fmr2556736e87.28.1732498077489; Sun, 24 Nov 2024
 17:27:57 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241124-kbuild-allconfig_debug_info-v1-1-07a7ac8d9a73@weissschuh.net>
In-Reply-To: <20241124-kbuild-allconfig_debug_info-v1-1-07a7ac8d9a73@weissschuh.net>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Mon, 25 Nov 2024 10:27:21 +0900
X-Gmail-Original-Message-ID: <CAK7LNARURUizjHNhCKjdLSJp1mCF0HYvyOfm7n8LHmUBjYByQw@mail.gmail.com>
Message-ID: <CAK7LNARURUizjHNhCKjdLSJp1mCF0HYvyOfm7n8LHmUBjYByQw@mail.gmail.com>
Subject: Re: [PATCH] kconfig: prefer toolchain default for debug information choice
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 25, 2024 at 12:59=E2=80=AFAM Thomas Wei=C3=9Fschuh <linux@weiss=
schuh.net> wrote:
>
> Kconfig by default chooses the first entry of a choice setting.
> For the "debug information" choice this is DEBUG_INFO_NONE which
> disables debug information completely.
>
> The kconfig choice itself recommends to use "Toolchain default":
>
>         Choose which version of DWARF debug info to emit. If unsure,
>         select "Toolchain default".
>
> Align the actual configuration with the recommendation by providing an
> explicit default.
>
> This also enables more codepaths from allmodconfig/allyesconfig which
> depend on debug information being available.

Please give me some examples for "more codepaths" enabled by DEBUG_INFO
because this is the opposite to the previous decision.


Commit f9b3cd24578401e7a392974b3353277286e49cee mentions:

  all*config target ends up taking much longer and the output is much large=
r.
  Having this be "default off" makes sense.



allmodconfig is often used for compile testing in CI/CD.
We need to see the sufficient gain that sacrifices
the build speed.



--
Best Regards
Masahiro Yamada

