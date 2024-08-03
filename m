Return-Path: <linux-kbuild+bounces-2791-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 290FE946794
	for <lists+linux-kbuild@lfdr.de>; Sat,  3 Aug 2024 07:59:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BD4A4282552
	for <lists+linux-kbuild@lfdr.de>; Sat,  3 Aug 2024 05:59:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CFDEE13DDB5;
	Sat,  3 Aug 2024 05:59:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XCGLtZRM"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96193136351;
	Sat,  3 Aug 2024 05:59:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722664758; cv=none; b=A3OWrxpwUDffuKPrQfQiuXGpv8K/5lSVqeD5ewZ/vyC0JYwH4R+Olcl/rq7tNlIQvOtfqFPPMDbCubWw8/FGBovr2qOUvRQ4fWpYaAIkNvQy19e/K+i1tSFQ1iY4VVw6kjdaIoWl8IRFMtm8JvabY56vO4FDaWVPlF+lt9tL87k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722664758; c=relaxed/simple;
	bh=CRTjdpok2ylJOBVRB5NG+v3YKMZN4sDLzRfETUx+ZQ8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PxVT+Yu+GwWhekPlqSVyzurnMqL7ZJwinyI1QjaNodnKyUQCoFEfHS2m785wIaFxFj7WUgeIUer44TA7Ha6CQL6YmYR/NvrDsUv5pZPSQpTDcMYLtsgAqJJ8ePUkAfWNA67rKdLNqBtm3LKpiL1X/B0oc6powaatAobVw6j+r+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XCGLtZRM; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2CFC0C4AF0F;
	Sat,  3 Aug 2024 05:59:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722664758;
	bh=CRTjdpok2ylJOBVRB5NG+v3YKMZN4sDLzRfETUx+ZQ8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=XCGLtZRMUCMbu6BQGQk49WxH5ioOsEqgD/dlbMGahAWxu/FIHRvD4heSeli5ntERw
	 wwuMI7EOh3r4LHLtUPIhwyeaouzexismarEux3mtMgNa5kzrvWM4E70ICdsPxnnWAS
	 RndLH+2XsXWPFQzAoyiSgZSXPoKuIQ8WSjkKK6rkLquL9QWt6IlAbQEMTWqLNgPxts
	 4O59B8dg76/sxj5C/Nmxo3jMpxDojqmR+lafqyLd/nDUm4bGNKtueWr+Np/7hMQcgg
	 xUQSIFR+grHcWFMVE1J+kYiuhVw1Wbw4LDe1L/y9j252Cx4vgX+fbwosdk4kodFSUU
	 53rKEz9rwt1LA==
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-530c2e5f4feso734196e87.0;
        Fri, 02 Aug 2024 22:59:18 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVT2UDfpiYZNiLdlNHJXH/TsRdVQrmejJWJtKea3Y9PHJCjsXMhphySs7NN6FsXoQFbc0wc95aoi/n5kEYao82Xn4lszVMx2beETLXh5jBqqczvjumMDD3ixNxW9qyx+SfDW+lq8XRYLpgo3lRNvF5wIFTpghl6h48w7ca8J+XAjHOnZxIDhg==
X-Gm-Message-State: AOJu0Yzou48IT2x5UlpGTN81mhDb4AH9/vc1KvOOfRsRpk/AvU9/C4DC
	dRf6IdMwLpLURQ2whdeSsOZHbr7nBGNS4ptwUiDhf9HfqtEX4+8+juWR1pVBNl1q5nscEh+L/XX
	gbtjqLzlA3XbqD/6tBar5nXVGdv0=
X-Google-Smtp-Source: AGHT+IGH3RhSkPSqDeBQj38zD+0ibup0k8GYvLycZ0CcyN+aNPlxgoEpaXhYyETxTBdvMTXtFmvfO0h4X1uuLe82UVE=
X-Received: by 2002:a05:6512:ba3:b0:52e:bdfc:1d09 with SMTP id
 2adb3069b0e04-530bb36f0b1mr3632046e87.18.1722664756789; Fri, 02 Aug 2024
 22:59:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240717-sparc-cflags-v2-0-259407e6eb5f@protonmail.com> <20240717-sparc-cflags-v2-2-259407e6eb5f@protonmail.com>
In-Reply-To: <20240717-sparc-cflags-v2-2-259407e6eb5f@protonmail.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Sat, 3 Aug 2024 14:58:40 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQmrzNHbAHC91OSS3TXwex7W4bjsoKaYVBULx+-e6Omfw@mail.gmail.com>
Message-ID: <CAK7LNAQmrzNHbAHC91OSS3TXwex7W4bjsoKaYVBULx+-e6Omfw@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] sparc/build: Add SPARC target flags for compiling
 with clang
To: koachan@protonmail.com
Cc: "David S. Miller" <davem@davemloft.net>, Andreas Larsson <andreas@gaisler.com>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, glaubitz@physik.fu-berlin.de, 
	Nicolas Schier <nicolas@fjasle.eu>, sparclinux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 18, 2024 at 1:12=E2=80=AFAM Koakuma via B4 Relay
<devnull+koachan.protonmail.com@kernel.org> wrote:
>
> From: Koakuma <koachan@protonmail.com>
>
> clang only supports building 64-bit kernel, so we use the
> sparc64-linux-gnu target.
>
> See also: https://lore.kernel.org/lkml/e26PTXUXEz8OYXmaeKn4Mpuejr4IOlFfFw=
dB5vpsluXlYiqDdlyQTYcDtdAny_o4gO4SfPeQCCN2qpyT6e0nog5EaP3xk2SeUPTrF54p1gM=
=3D@protonmail.com/T/#m068e010dcf8b99d3510a90d7532bcdb70e2e2c6b
>
> Signed-off-by: Koakuma <koachan@protonmail.com>



Acked-by: Masahiro Yamada <masahiroy@kernel.org>


(I assume this will go through the sparc subsystem)




--=20
Best Regards
Masahiro Yamada

