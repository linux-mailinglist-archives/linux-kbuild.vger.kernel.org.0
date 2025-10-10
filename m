Return-Path: <linux-kbuild+bounces-9076-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AAC9BCE0D9
	for <lists+linux-kbuild@lfdr.de>; Fri, 10 Oct 2025 19:14:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 353A94E4244
	for <lists+linux-kbuild@lfdr.de>; Fri, 10 Oct 2025 17:14:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9708E1FFC7B;
	Fri, 10 Oct 2025 17:14:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="A+/dEAFq"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 721CA3FB31
	for <linux-kbuild@vger.kernel.org>; Fri, 10 Oct 2025 17:14:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760116440; cv=none; b=OV0AdUb00Ti/3ywpQEhmZuRyUMyxEIwMTShnmlHfM/o869fk/LP2nR+uaDjEUcdPoorkeSXbl5aXce4MC7JKAMY/M5uis5wTvDawR878M6E3HSSJUMH2aIjeSAzOSVLmZhZyNZGFzI6olwjaPe5+wpURGUcODbAjTx372iMvNgM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760116440; c=relaxed/simple;
	bh=BVuzJFqwtOPzcxjeFAHcjyaMakH52Y6oh5hO9zloV3Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ARPfqRbeV07r6S/tqAlsWaiOITDYBJr31ULtzOGLosPJaDIN2qMpwSxnFlK9ct3Ncbc+ILpKAl8afq63HZo+F+rJMrjrYhuEI6KIEjt6/jKX18yo8omkJl9y3uk6YiyMkjLDrJC+WLxmeBPVJarJ2zKod0xvDtjtUVoJR/aapmE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=A+/dEAFq; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0776FC4CEFE
	for <linux-kbuild@vger.kernel.org>; Fri, 10 Oct 2025 17:14:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760116440;
	bh=BVuzJFqwtOPzcxjeFAHcjyaMakH52Y6oh5hO9zloV3Q=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=A+/dEAFq1jnEb3c9wwTzHqBoJjyPZhEb19eoDB/YLLvbxxs8uan9DpB2bI9qKqy+F
	 eMCVIDPvT1kMkHHf7Ebdf6tHI3n36S86Ej+NSZoA2N/jYWbVXq6u9HfxjvDVM04LFe
	 G9IZWSIwAt9GgFRlAhPcYbubPvGWDNBrFI6KlEZqclFZKiYc6GC92txDc1OYZUYxPc
	 r58Q6Q+kspSMtHdKq5QYeFDahSgNTTKShiW5SvjbMohOVBdBejwBVOiz3pP9dW31QD
	 1Np0G8bKykeV7eEd+wLz+QgVM253wX6RG7kkUyK4WVM91CtPCFfR5mppVjfz2pQPUE
	 reuVoipPuCewA==
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-59054fc6a45so2930641e87.3
        for <linux-kbuild@vger.kernel.org>; Fri, 10 Oct 2025 10:13:59 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVrRzXZl8KXO47xAZR/XAPPPhmq01hTz1lhWgKNd2FKO3teZ83z14sefS7M2wCGJhelXlXuYmTF+3GRXS8=@vger.kernel.org
X-Gm-Message-State: AOJu0YzO2nwwURYKaHqRviBaL7ICyxVscOOnTW9IWQrRKibjTRnSLqw2
	MjGEdoi/LAoklfiK86pksDAv52xZB1O6+4wgu7Mm6NSGQTpm8o59RQ4hN19d3rXjsarctfohQYe
	5OelfJnbhDmMmMznWRqkpkSb6kEIlqRs=
X-Google-Smtp-Source: AGHT+IF48QMD2Xf3mP1/lsdIWQz+UNSdyB6QsqDi1r1lkHk53intQKDGJf4/+fDmlmCbdvRGLYZ+7KqHf5aG68P6Wq4=
X-Received: by 2002:a05:6512:1329:b0:57c:2474:3722 with SMTP id
 2adb3069b0e04-5906dd6bd22mr3149055e87.40.1760116438394; Fri, 10 Oct 2025
 10:13:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251008-kbuild-fix-modinfo-regressions-v1-0-9fc776c5887c@kernel.org>
 <20251008-kbuild-fix-modinfo-regressions-v1-1-9fc776c5887c@kernel.org>
In-Reply-To: <20251008-kbuild-fix-modinfo-regressions-v1-1-9fc776c5887c@kernel.org>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Fri, 10 Oct 2025 10:13:46 -0700
X-Gmail-Original-Message-ID: <CAMj1kXFiUHPSK4DsmmZEqYG67YmdqFgZZ_JhDGiW-wFOPtfa4A@mail.gmail.com>
X-Gm-Features: AS18NWBt5fz5v9M9D3bKu5NE0GH31nMMrdd8pi3JqE8jOGi3ty_2AYVzlNmEYtY
Message-ID: <CAMj1kXFiUHPSK4DsmmZEqYG67YmdqFgZZ_JhDGiW-wFOPtfa4A@mail.gmail.com>
Subject: Re: [PATCH 1/3] kbuild: Restore pattern to avoid stripping .rela.dyn
 from vmlinux
To: Nathan Chancellor <nathan@kernel.org>
Cc: Nicolas Schier <nsc@kernel.org>, Alexey Gladkov <legion@kernel.org>, 
	Masahiro Yamada <masahiroy@kernel.org>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Alexandre Ghiti <alexghiti@rivosinc.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, 8 Oct 2025 at 15:47, Nathan Chancellor <nathan@kernel.org> wrote:
>
> Commit 0ce5139fd96e ("kbuild: always create intermediate
> vmlinux.unstripped") removed the pattern to avoid stripping .rela.dyn
> sections added by commit e9d86b8e17e7 ("scripts: Do not strip .rela.dyn
> section"). Restore it so that .rela.dyn sections remain in the final
> vmlinux.
>
> Fixes: 0ce5139fd96e ("kbuild: always create intermediate vmlinux.unstripped")
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>

Acked-by: Ard Biesheuvel <ardb@kernel.org>

> ---
> Cc: Ard Biesheuvel <ardb@kernel.org>
> Cc: Alexandre Ghiti <alexghiti@rivosinc.com>
> ---
>  scripts/Makefile.vmlinux | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/scripts/Makefile.vmlinux b/scripts/Makefile.vmlinux
> index 7c6ae9886f8f..a62639982be5 100644
> --- a/scripts/Makefile.vmlinux
> +++ b/scripts/Makefile.vmlinux
> @@ -82,7 +82,7 @@ endif
>  # ---------------------------------------------------------------------------
>
>  remove-section-y                                   := .modinfo
> -remove-section-$(CONFIG_ARCH_VMLINUX_NEEDS_RELOCS) += '.rel*'
> +remove-section-$(CONFIG_ARCH_VMLINUX_NEEDS_RELOCS) += '.rel*' '!.rel*.dyn'
>
>  remove-symbols := -w --strip-symbol='__mod_device_table__*'
>
>
> --
> 2.51.0
>

