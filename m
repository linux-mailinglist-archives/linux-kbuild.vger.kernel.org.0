Return-Path: <linux-kbuild+bounces-1805-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id E4B108BE5F3
	for <lists+linux-kbuild@lfdr.de>; Tue,  7 May 2024 16:31:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 67C5FB22AA8
	for <lists+linux-kbuild@lfdr.de>; Tue,  7 May 2024 14:27:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 18BD915EFA6;
	Tue,  7 May 2024 14:26:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="e9Og7GVd"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E225115E7FB;
	Tue,  7 May 2024 14:26:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715092000; cv=none; b=tzDLvAxRRMvvra0S2MjRYR3LVpb6/hKjHVO/xkiMHk5VNB+5/jhFOnPVwpsodLhVtTdFSh7Nqxc6OdmB9TYhsjq1/jSWIsAUa0PWsIa9effswX7oHBFC6rp9f2AgV8VR9N0+2RAyLsXF7w9L7/Y7KCZJFr2fHyQPjTVEUY+cPvM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715092000; c=relaxed/simple;
	bh=JNqrpqc21+cKfdnld6kiGbjyWGSw4W52xBgykV/FR58=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kwLJiU/5oSoNZpFmLnupPv8vhkYR3mpDsgY7UcJSR0/4YOfsAVYscSueaFcGMLufGzxYSAH9nbAm0N4tgRrV8P0WBDFwSgxLlNSRuLqRjoG/gywzhs3DG7hzRW6yKSdKJhueCRjAjiqI621dyZ9cCf4N5AWIxtN84I/KsGW8UjU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=e9Og7GVd; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 787C5C4DDE4;
	Tue,  7 May 2024 14:26:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715091999;
	bh=JNqrpqc21+cKfdnld6kiGbjyWGSw4W52xBgykV/FR58=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=e9Og7GVdJzIjOa1yiMRxlsx/5Fmrnu06uhpsdF8fWOQP7kDgR+ITE1t15w4U03+WV
	 5HNkAZpJ1P0dTLATnMCfNvChpu8wiGVrlxbs/BJV7beeiTvOFyidaXJDArpi6S5Kqo
	 4hQzPuNw733XDHeB5vUon+ad9/y45uDhb2lDniTJTvm6vycggA+BdjJwKHpLH3Blix
	 yXFA3+zSA++gX1xd7vYG1OGi/rcJMXWQ3opLQdJux5MOyfcv+9rxBrZgcd/GWgKxtO
	 qhO3ChTNc+MIS/cPNGYZSq8vCdeXUxo29kFW/O9Aj4LBhv08uoFQfUIpe4a5LKqFW9
	 NRUiB2TOXFLig==
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-51ffff16400so4573427e87.2;
        Tue, 07 May 2024 07:26:39 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVyMoJoiri0BUuXL2dKEz35o8aeXjAnUxiRaDoURta4o80/zUJDWMpuOl0HAAY1UK3z+/SvsXSzV8AZXyjJn1a9i7wDXXKRGr6/wAlJTZHE3Sa2ZjqqksVyHqpliQE6aryKIfV5WsC1UYlA
X-Gm-Message-State: AOJu0YwtiEIMWBHluSAr6Osccl/owAiQoSrkf044kRH3Svv+BRvU2lQw
	Bcm+JHz5lac0PNqiieTaBz/teXM/rsGWdD9/Fxbmf96yj6/SWl/6gi8gcDQl1h/YUmuF6/ejNDT
	GATnY6iH+wfvShmzgrf/+Ov1UdOQ=
X-Google-Smtp-Source: AGHT+IF5vP9PGP0zs6z3+nYvoHn0waIZDDrmRwV0Au1KuFJGmdVeV3TYY+M+A2GjIjs4b1QbdcR8vz8hxEY3JW7ctVk=
X-Received: by 2002:a19:c505:0:b0:51f:2f5a:54ae with SMTP id
 w5-20020a19c505000000b0051f2f5a54aemr10429525lfe.7.1715091998116; Tue, 07 May
 2024 07:26:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240504193446.196886-1-emil.renner.berthing@canonical.com> <20240504193446.196886-2-emil.renner.berthing@canonical.com>
In-Reply-To: <20240504193446.196886-2-emil.renner.berthing@canonical.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Tue, 7 May 2024 23:26:00 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQ=nu0N4NsXwU9-qu=pPnm3WYMRfkGWoV2advj1oxTNkw@mail.gmail.com>
Message-ID: <CAK7LNAQ=nu0N4NsXwU9-qu=pPnm3WYMRfkGWoV2advj1oxTNkw@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] riscv: make image compression configurable
To: Emil Renner Berthing <emil.renner.berthing@canonical.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nicolas@fjasle.eu>, Nick Terrell <terrelln@fb.com>, 
	=?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, May 5, 2024 at 4:34=E2=80=AFAM Emil Renner Berthing
<emil.renner.berthing@canonical.com> wrote:
>
> Previously the build process would always set KBUILD_IMAGE to the
> uncompressed Image file (unless XIP_KERNEL or EFI_ZBOOT was enabled) and
> unconditionally compress it into Image.gz. However there are already
> build targets for Image.bz2, Image.lz4, Image.lzma, Image.lzo and
> Image.zstd, so let's make use of those, make the compression method
> configurable and set KBUILD_IMAGE accordingly so that targets like
> 'make install' and 'make bindeb-pkg' will use the chosen image.
>
> Tested-by: Bj=C3=B6rn T=C3=B6pel <bjorn@rivosinc.com>
> Signed-off-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>



Reviewed-by: Masahiro Yamada <masahiroy@kernel.org>





--=20
Best Regards
Masahiro Yamada

