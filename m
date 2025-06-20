Return-Path: <linux-kbuild+bounces-7576-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5646BAE111D
	for <lists+linux-kbuild@lfdr.de>; Fri, 20 Jun 2025 04:32:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D622719E2D6D
	for <lists+linux-kbuild@lfdr.de>; Fri, 20 Jun 2025 02:32:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C26D01917C2;
	Fri, 20 Jun 2025 02:32:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GlycR+Vu"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 936DA190696;
	Fri, 20 Jun 2025 02:32:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750386756; cv=none; b=pL0scqBwkYi7RM4dFO83TS+eJK00aKVIn0tNb2TAx3wEFVAkXgQBhhRjXM4l/8gvGJS5RXx+6h7uV8CfzdiMcG0HuZfux78c8T13ugIZPjpHYALqCTkBd4fVmrD4yJb3hZvkj6AsmU5ZKMeJgUpHi6jQuN/bS7p9vkkE1Bs0prY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750386756; c=relaxed/simple;
	bh=nFwAjdcCBmuCFAWX9WMeLyT+AO0LFKWNtBekZcA+g8k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HIcdaNUlXb/F5nqWqG0IW+P80QzzQoyC5EO9gF0cBBpMfkoPmcJGSNHqdpTtEOd8tc3ckJZ2t+y6kSzFLE3xs6CIxbG5g36FXPNdwDKLw6UbbELoOP84BdQ5tbdYt2FWxQRXduod63ww7OVMWhLCBaSdCXqWktmlvogATdC6m04=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GlycR+Vu; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 21192C4AF09;
	Fri, 20 Jun 2025 02:32:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750386756;
	bh=nFwAjdcCBmuCFAWX9WMeLyT+AO0LFKWNtBekZcA+g8k=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=GlycR+VuvjLYWJ4I6djxLbVZVOzZ5BvQsJCFfnrDbSddUWNzItrgfXapLUgX4uSWk
	 u0LbGElgQ5mUj+S+oybZpaaU6nCBGtooAQO5Euuew+Z2G7JPc99cS35PgpOdhqevei
	 ujJ9DZLdZmYdn+oERg4qAcTCDGL4g1rboV49D3TZrmUK3A50DcPOlbQDLGfxWHIA4u
	 mfDAcaU78A8qEda9EraXNakPpYIL8nGwxuwzLJO1z/tgWRSEU4JQ9E4VrgCzUozPpp
	 9eTJ+/zNWXOSa/JwypVoFSHApRF+ByMIwTa24xDDx+Xm58XmZm8Yvsc05tg2v6FcnH
	 MfeCEt2hsXXvg==
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-551fc6d4a76so1359573e87.0;
        Thu, 19 Jun 2025 19:32:36 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU6A+Ck5kl7P9h/AyJj9hyWwGKOgDACIQD+wFRX/cpAdaxr48HgkooldeBpZjz8UzMSFumbYbJwZ+3vOPo=@vger.kernel.org, AJvYcCV37OHktKV8YqPKZfBu4/7h5F5fl0Um9f+PiFD5ZoRQ5BgF/8EkENBWtApxJPdgb3VeTDJNRlM5@vger.kernel.org, AJvYcCWC9MzDG7IOoISMvDWsATaEUCWRxzK4PYLGr8JqakUMW4xGiJn2oI4aWVyBvE5Zx9u8NduaQBjw41+dEn+Y@vger.kernel.org
X-Gm-Message-State: AOJu0Ywe/m6pQ6BjZJG4VyVIfLGsTzQBn7QHwxdcuiw5/ab58/ds7bnX
	9ffloSGj42CtmoXnSrY0ziLNxtY/G1GzGSZ7nTqKUbjo4xztqwZ+xZ65Spd3kzHsHYvCLcl5UPT
	aI79L+BD5NMYYW2XIwqosTumtIIH55ZM=
X-Google-Smtp-Source: AGHT+IF7KhN1uteG5Uxd3myLT7qqu+b6R67w8bIpo5CxMzP2p2xxNhvi+eJk2suEmLF/ecrta0Tla3VG3jH7pCkyRH4=
X-Received: by 2002:a05:6512:31d5:b0:553:2d93:d31 with SMTP id
 2adb3069b0e04-553e3bd0367mr416872e87.22.1750386754813; Thu, 19 Jun 2025
 19:32:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250618-arm-expand-include-unified-h-path-v1-1-aef6eb4c44ca@kernel.org>
In-Reply-To: <20250618-arm-expand-include-unified-h-path-v1-1-aef6eb4c44ca@kernel.org>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Fri, 20 Jun 2025 11:31:58 +0900
X-Gmail-Original-Message-ID: <CAK7LNAREwF0Yn6R80+1WnrJpHe4vXcjMdqUqqEU=cL1++Yk9SA@mail.gmail.com>
X-Gm-Features: AX0GCFto2VXAU61sRbn1UlLUs-rN5P4yoY-wp1BS5Fvn7pkoy54ZTWiHwmO_VTc
Message-ID: <CAK7LNAREwF0Yn6R80+1WnrJpHe4vXcjMdqUqqEU=cL1++Yk9SA@mail.gmail.com>
Subject: Re: [PATCH] ARM: Use an absolute path to unified.h in KBUILD_AFLAGS
To: Nathan Chancellor <nathan@kernel.org>
Cc: Russell King <linux@armlinux.org.uk>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	stable@vger.kernel.org, KernelCI bot <bot@kernelci.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 19, 2025 at 4:29=E2=80=AFAM Nathan Chancellor <nathan@kernel.or=
g> wrote:
>
> After commit d5c8d6e0fa61 ("kbuild: Update assembler calls to use proper
> flags and language target"), which updated as-instr to use the
> 'assembler-with-cpp' language option, the Kbuild version of as-instr
> always fails internally for arch/arm with
>
>   <command-line>: fatal error: asm/unified.h: No such file or directory
>   compilation terminated.
>
> because '-include' flags are now taken into account by the compiler
> driver and as-instr does not have '$(LINUXINCLUDE)', so unified.h is not
> found.
>
> This went unnoticed at the time of the Kbuild change because the last
> use of as-instr in Kbuild that arch/arm could reach was removed in 5.7
> by commit 541ad0150ca4 ("arm: Remove 32bit KVM host support") but a
> stable backport of the Kbuild change to before that point exposed this
> potential issue if one were to be reintroduced.
>
> Follow the general pattern of '-include' paths throughout the tree and
> make unified.h absolute using '$(srctree)' to ensure KBUILD_AFLAGS can
> be used independently.
>
> Cc: stable@vger.kernel.org
> Fixes: d5c8d6e0fa61 ("kbuild: Update assembler calls to use proper flags =
and language target")
> Reported-by: KernelCI bot <bot@kernelci.org>
> Closes: https://lore.kernel.org/CACo-S-1qbCX4WAVFA63dWfHtrRHZBTyyr2js8Lx=
=3DAz03XHTTHg@mail.gmail.com/
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>


Reviewed-by: Masahiro Yamada <masahiroy@kernel.org>





--=20
Best Regards
Masahiro Yamada

