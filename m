Return-Path: <linux-kbuild+bounces-1806-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 886FA8BE5E3
	for <lists+linux-kbuild@lfdr.de>; Tue,  7 May 2024 16:27:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B95A41C21974
	for <lists+linux-kbuild@lfdr.de>; Tue,  7 May 2024 14:27:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A0A015ECED;
	Tue,  7 May 2024 14:26:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QzhZpYxx"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0366715FA63;
	Tue,  7 May 2024 14:26:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715092016; cv=none; b=P6yxXRpCEgjBcm+fR2uGiJjRDzc/46DKnxIc6FeaTIu8mG61jdl+ooxO/V1S6Kjqqrw1KAE1/2ZlfsPx9mLq78xw0JNNIP08hJ+clIIiZG9ejZXrL1qzYaDiadkexotiT4cIvdPo5n1MeCnreLFT09AQbvWnL3LtO491dDr4dfQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715092016; c=relaxed/simple;
	bh=lYrQrnCSDVMAZMcY6WaFG+KBzi8OpV4qLgKv1Deazgw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ePCEZ8z66EBxGWXQpewPB2R4+NUGjtXhkG0jsHKhUSDB1oUSH+XfcGfq6i9xzKOc7yEV2qVFM31S4yj3nwt9wgEkDT7Y7BNMpFCDx+NZSQYEybNe9Xonzz34mYEH2+zwbQabAGkU+7cbAH5n9wwW68zQ69SlXWAo5IKKp7BEY9o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QzhZpYxx; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 90007C2BBFC;
	Tue,  7 May 2024 14:26:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715092015;
	bh=lYrQrnCSDVMAZMcY6WaFG+KBzi8OpV4qLgKv1Deazgw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=QzhZpYxxRD7X41gFhOocwbf9cskiPbVsNmPoadZK2uRX/1ukfzajz9KEmN7IfvQS5
	 Cd1bWG/YcHCiZVpgKs5mqQu2B117nTRvKc9mbrvUyZeuEveKT/QffiBSUPQ3SaNvqN
	 5wHINKJ+2PJcdVbAy3KuuXk4DJ1t0NB+MIMXwoXdlwjCPsMpAwPqCALE7iPJxsoHa6
	 EEmjBtRFDFdM9ME4cMa5vxBvL7RGePSSRcw2+BNhNqG/mMSCGt8uXF/ZSsVJS4kKvq
	 iAEunH9gr1S5neq0Iy4faWnd21ZhNRKMOAaQ67Qv13ZNPtWqEWDe8oPsfDZny+iXfs
	 J2wNkPM6ybvIQ==
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-51f4d2676d1so3582893e87.3;
        Tue, 07 May 2024 07:26:55 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXGOVXyLJiT/B8GKgUVVIYTNoM5ieeuBZQozYNC9IV0apwBGD7UIsmfKchx5EfcPQLc3ArXGUAOX2v3G5ooDxWoS0me7EDGnb9vkry9GibRfDJ2fD+PBGqaAAoUSfr2P4ccE59XvI3OLD63
X-Gm-Message-State: AOJu0YxNDO2ZAnZzd8gqW7Fw0Z2zrrG77qSrfkXhC5uqwygvWBEmgB4v
	pXvKEBEUYJlp3Fh8p6mpx8c5EPPyv6VKE7WZnU725YtC2m0GIRmqZJM7Iynoa/pepcl5b/uwYt0
	cz74JCzbcCdtqSz8RfXb4tjVT7A4=
X-Google-Smtp-Source: AGHT+IHs4kKfrAUEx7t0s1MVsgWGje/LfqkGEHnXw4rWGq9/3VHuD/mMGzeQ5DHF1TvYMzSpucR1cpweLSSuqCMr4RI=
X-Received: by 2002:a05:6512:3da3:b0:521:684:ce1b with SMTP id
 k35-20020a0565123da300b005210684ce1bmr2905088lfv.20.1715092014346; Tue, 07
 May 2024 07:26:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240504193446.196886-1-emil.renner.berthing@canonical.com> <20240504193446.196886-3-emil.renner.berthing@canonical.com>
In-Reply-To: <20240504193446.196886-3-emil.renner.berthing@canonical.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Tue, 7 May 2024 23:26:18 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQ30jMv9FUQaf5kGRG+FTsn0pB=ydeMUPTxbZ2aSHZ4LQ@mail.gmail.com>
Message-ID: <CAK7LNAQ30jMv9FUQaf5kGRG+FTsn0pB=ydeMUPTxbZ2aSHZ4LQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] riscv: show help string for riscv-specific targets
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
> Define the archhelp variable so that 'make ACRH=3Driscv help' will show
> the targets specific to building a RISC-V kernel like other
> architectures.
>
> Tested-by: Bj=C3=B6rn T=C3=B6pel <bjorn@rivosinc.com>
> Signed-off-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>
> ---

Reviewed-by: Masahiro Yamada <masahiroy@kernel.org>


--=20
Best Regards
Masahiro Yamada

