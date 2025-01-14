Return-Path: <linux-kbuild+bounces-5477-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id F14CEA1000B
	for <lists+linux-kbuild@lfdr.de>; Tue, 14 Jan 2025 06:05:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2FAD63A3577
	for <lists+linux-kbuild@lfdr.de>; Tue, 14 Jan 2025 05:05:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 63B3723099C;
	Tue, 14 Jan 2025 05:05:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WKpTn44M"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BDF31B4159
	for <linux-kbuild@vger.kernel.org>; Tue, 14 Jan 2025 05:05:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736831123; cv=none; b=Du96NK88rYQnMZMjBHnxOenKaF6wiOVhEKclg2ZtH54zeEpsPaYZmrLGiV0Snw8OpHgw7z37VZ6zhYVnCQoEGF1snRUwXu7vMAZ4s3xVHewNs+Ouu10lJFimRo3Ww/KAOJQoCWW7Die4oH1ic3wxkFmDllcy62mgeUrDj7Zsxyw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736831123; c=relaxed/simple;
	bh=PUxktxTRVOR5Hv87RdY/jYYuxV9qrBofuQvsWrxHeIw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fS2RqvT5OLNZjG9WpezcI3aLQSs4v1UzvrvD/2unTlqhi/GE9XNaUQ/8Y8ykf16KnuI4Nu2mG40vFvGjDB1pKlWx8hDElfRIp2ic0JwiQCnyeGJ5VdoePIGzcVhrr8FJhv7M0Uw3Erm1dfuxvkkB0KzIGh5AwBc+alCgOWJgMg0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WKpTn44M; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4C11C4CEDF
	for <linux-kbuild@vger.kernel.org>; Tue, 14 Jan 2025 05:05:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736831122;
	bh=PUxktxTRVOR5Hv87RdY/jYYuxV9qrBofuQvsWrxHeIw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=WKpTn44MtpQCyUPB6qmADLN7u5/YLYV0ChYxml2P+qb2Lv45ElQ4EolWB8gXoRKJG
	 y9f0gLbSLZ0TCCaLqIjOqNcky1ElpwlqcgSrysyt/sUrpspW4oipZS23TBAnbtt+tV
	 aXud4HELiTQIdrR7Z/HVfbE61uH+MiYmGqUXruc+UQn8917MY4J3yi170sTst9z49A
	 vpkUraLGmZwIqulyuZL73U2ckX3ckyJUJCS49rD462c4CYobYkqN7TLBKKiHmaTujv
	 Nwp5np13CuBySSv9/lVrenwgvvn98rPiBB88ymMJMQZLQ9Y3BWxcrGECSU13agCJ4b
	 rQ54S0lo3UipQ==
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-3047818ac17so41847461fa.3
        for <linux-kbuild@vger.kernel.org>; Mon, 13 Jan 2025 21:05:22 -0800 (PST)
X-Gm-Message-State: AOJu0YybVT+F34MKy6+lKXQ/XwYPMYDA0/XGWj67EVLXkGcipyGDyCc+
	Me+eIBr2/7MuQDf3H7hwUXPT7h4nu/YrH0DoUg+SvlkextPJFYxRge6hM4ZpOJl6LFuCIk9hmW3
	yXZA09rN1H22RzIysE6fY0aZr/QM=
X-Google-Smtp-Source: AGHT+IEI+OuDXT084LCgnAioUFGK/k5ag9GCIj08sN+d2tFE8cx0E5rt8NGfuuP26pMJi4I/jn8pYyF07211scJh6Jk=
X-Received: by 2002:a05:651c:4cb:b0:2fb:8c9a:fe3f with SMTP id
 38308e7fff4ca-305f459ab0amr78970271fa.22.1736831121448; Mon, 13 Jan 2025
 21:05:21 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <302dedfd-af8b-43cc-99cf-3a3f7b34b714@secunet.com>
 <4915d245-4419-43cf-abbe-b28cd27c869a@secunet.com> <CAK7LNAQi0ZbVF9BLMCkHKufim43qH7MULW5iksoLK_sxYhRjkg@mail.gmail.com>
 <be81c0ac-fac7-44bf-9062-018bf47e7bbe@secunet.com> <CAK7LNAS5ZrLNeV=_gjbbJvKWLsdPaCHM=KgOevxKe_dRFCnUEw@mail.gmail.com>
 <4cce9f70-71ef-4bd8-8517-ab4086386555@secunet.com>
In-Reply-To: <4cce9f70-71ef-4bd8-8517-ab4086386555@secunet.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Tue, 14 Jan 2025 14:04:44 +0900
X-Gmail-Original-Message-ID: <CAK7LNARb+3k4XwaJnwdCvG4nXKUtuooC-khz0XB0zHkkGrBXkg@mail.gmail.com>
X-Gm-Features: AbW1kvbRhnqTFCkzaG3j0JoUOg7w5UxYgYjU_ldy8OARpplUiTRjeC5IY5op8CI
Message-ID: <CAK7LNARb+3k4XwaJnwdCvG4nXKUtuooC-khz0XB0zHkkGrBXkg@mail.gmail.com>
Subject: Re: [PATCH v2] kbuild: Fix signing issue for external modules
To: Torsten Hilbrich <torsten.hilbrich@secunet.com>
Cc: linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 13, 2025 at 3:01=E2=80=AFPM Torsten Hilbrich
<torsten.hilbrich@secunet.com> wrote:
>
> When running the sign script the kernel is within the source directory
> of external modules. This caused issues when the kernel uses relative
> paths, like:
>
> make[5]: Entering directory '/build/client/devel/kernel/work/linux-2.6'
> make[6]: Entering directory '/build/client/devel/addmodules/vtx/work/vtx'
>    INSTALL /build/client/devel/addmodules/vtx/_/lib/modules/6.13.0-devel+=
/extra/vtx.ko
>    SIGN    /build/client/devel/addmodules/vtx/_/lib/modules/6.13.0-devel+=
/extra/vtx.ko
> /bin/sh: 1: scripts/sign-file: not found
>    DEPMOD  /build/client/devel/addmodules/vtx/_/lib/modules/6.13.0-devel+
>
> Working around it by using absolute pathes here.
>
> Fixes: 13b25489b6f8 ("kbuild: change working directory to external module=
 directory with M=3D")
> Link: https://lore.kernel.org/linux-kbuild/302dedfd-af8b-43cc-99cf-3a3f7b=
34b714@secunet.com
> Signed-off-by: Torsten Hilbrich <torsten.hilbrich@secunet.com>
> ---

Applied to linux-kbuild.
Thanks!



--=20
Best Regards
Masahiro Yamada

