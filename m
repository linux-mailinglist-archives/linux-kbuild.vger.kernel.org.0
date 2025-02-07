Return-Path: <linux-kbuild+bounces-5666-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 01B66A2CB8B
	for <lists+linux-kbuild@lfdr.de>; Fri,  7 Feb 2025 19:41:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4E4B73AF3C2
	for <lists+linux-kbuild@lfdr.de>; Fri,  7 Feb 2025 18:40:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E251E1A8412;
	Fri,  7 Feb 2025 18:36:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pvOwmal5"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7F421A3161;
	Fri,  7 Feb 2025 18:36:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738953415; cv=none; b=jxMLqwlymPlNkS7XqUXU3bMx+FSwgygxwY35tA+p+h0Y5wq9Zw5kTn1t1bGzgkinS2wJ4ekzmiPoGxtBbftIjO+jf3tQVL46v/at12G6wm0XEEVGkLpdgLbmXVgEGAq/K/gFBGxxIGfufhejzZ0XksxLefBcVc4FtbwdxBMAJ7g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738953415; c=relaxed/simple;
	bh=L4SabA78oMLZLqMu8BASlkexrk1dtRH3ggYFE99fL3o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PUwg4RwDKQqT9LTQCrTwy6icqjSbYHPY2p+1kuqGOD8tUMy68n0zL6G3vMw9nO8Bb+02F2iDMdhD/aLr6PT1rfnT+uNXFIyLQQR1XMoKE9vtZLj6EJQeWLxtezpq7K6gw6q6akcIK0EX0jLvSQp9LuhoeXZP0i/vOV+cxqhrldY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pvOwmal5; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A093C4CED1;
	Fri,  7 Feb 2025 18:36:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738953415;
	bh=L4SabA78oMLZLqMu8BASlkexrk1dtRH3ggYFE99fL3o=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=pvOwmal5UZ9I/GOs6Hs3RIs11qCg8axF1A32ru4AO83rnBfBhybYRYlkMJJ1QHQBX
	 T26eCM9P7ClJ6MmNqu54Ov/FDbEVwGQaiJbKHK0vndo5CX1WMyvBhQO1HPsnm2r7ej
	 eqt9yNF8cFhxBh7YDc0fl5ELKLw1Z/D4mAhHMPQ/fLJOWcDd0DBrpqYcssdUAzC6QC
	 MPPIVvafvv5upw9hSrbcW/yu5ayDyyjFLSmJKU5D/XQ3bp1b7YavSmbxvMNU08cuSZ
	 qk2LV9kG6pv2axEcociNr9IADsPxtGwY4k5NF1q4S5wgrNAeOLLnBeBbrtX9Zp8REP
	 OGaM4CP0f2Nag==
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-307e4e72ef3so13312311fa.0;
        Fri, 07 Feb 2025 10:36:55 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCU3g5Bncz2CKn+enGMb5DWcQyEKtoh6VW+iN9t0rSJI1BUJxMVw890+RCPBi60MM9S0fj271iPrjyDWlsyH@vger.kernel.org, AJvYcCVMsoln2avbaT/NjQbWJ3XKTEOq2oMmF38yn9jQ9vldMh2oQZxGKtmn1h78HGezoA4TTMPRsnuDMwJ+uQk=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywp/VV4tGiB6CeMwzbEYdGsJnGPGZtuEi68VjMaEzd7CJ30bWju
	SpcO+rGelQFcemOclmxe7lk6ZjgqMB9aEag6Ru7GNTAihW0FBAVXizVJDF+wbE5w0p2W/ZgtVuQ
	ZdQtSSoUxAHrvaRI7kk9bN84cERY=
X-Google-Smtp-Source: AGHT+IGKrt+U3I6m3VETh9oqfow8/fcZA18C4A56HPq/MQcTyYDXU3wKngKe/aUvANihPITnWRXgMBzskneoHxEPWR8=
X-Received: by 2002:a05:651c:b29:b0:302:1b18:2c06 with SMTP id
 38308e7fff4ca-307e58169b4mr12624841fa.17.1738953413943; Fri, 07 Feb 2025
 10:36:53 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <43AE9F470D835AD1+20250207070855.227283-1-wangyuli@uniontech.com>
In-Reply-To: <43AE9F470D835AD1+20250207070855.227283-1-wangyuli@uniontech.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Sat, 8 Feb 2025 03:36:16 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQ3wBCTCNT4YBXEr1m06VCPFCJUJuDyHBj1QuyD7xTC-Q@mail.gmail.com>
X-Gm-Features: AWEUYZlMBpTNz7ZdJDYi7HxCIdReDgc9bvzREQ6uewnzSwLm34Jj3njagMcs08Y
Message-ID: <CAK7LNAQ3wBCTCNT4YBXEr1m06VCPFCJUJuDyHBj1QuyD7xTC-Q@mail.gmail.com>
Subject: Re: [PATCH] scripts: install-extmod-build: add missing quotation
 marks for CC variable
To: WangYuli <wangyuli@uniontech.com>
Cc: nathan@kernel.org, nicolas@fjasle.eu, jeffbai@aosc.io, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, revy@deepin.org, 
	zhanjun@uniontech.com, guanwentao@uniontech.com, chenlinxuan@uniontech.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 7, 2025 at 4:26=E2=80=AFPM WangYuli <wangyuli@uniontech.com> wr=
ote:
>
> While attempting to build a Debian packages with CC=3D"ccache gcc", I
> saw the following error as builddeb builds linux-headers-$KERNELVERSION:
>
>   make HOSTCC=3Dccache gcc VPATH=3D srcroot=3D. -f ./scripts/Makefile.bui=
ld obj=3Ddebian/linux-headers-6.14.0-rc1/usr/src/linux-headers-6.14.0-rc1/s=
cripts
>   make[6]: *** No rule to make target 'gcc'.  Stop.
>
> Upon investigation, it seems that one instance of $(CC) variable referenc=
e
> in ./scripts/package/install-extmod-build was missing quotation marks,
> causing the above error.
>
> Add the missing quotation marks around $(CC) to fix build.
>
> Fixes: 5f73e7d0386d ("kbuild: refactor cross-compiling linux-headers pack=
age")
> Co-developed-by: Mingcong Bai <jeffbai@aosc.io>
> Signed-off-by: Mingcong Bai <jeffbai@aosc.io>
> Tested-by: WangYuli <wangyuli@uniontech.com>
> Signed-off-by: WangYuli <wangyuli@uniontech.com>
> ---

Applied to linux-kbuild/fixes.
Thanks!



--=20
Best Regards
Masahiro Yamada

