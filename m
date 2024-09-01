Return-Path: <linux-kbuild+bounces-3302-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E1D289675F2
	for <lists+linux-kbuild@lfdr.de>; Sun,  1 Sep 2024 12:51:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 27CE51C20D81
	for <lists+linux-kbuild@lfdr.de>; Sun,  1 Sep 2024 10:51:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E5D011514C9;
	Sun,  1 Sep 2024 10:51:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iUaBjzyo"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B063914E2FD;
	Sun,  1 Sep 2024 10:51:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725187871; cv=none; b=lDhf4XrKnLLDv4DVrKvRvDh1vIsZ8auibshqYt+vHPord7CBs7r1A7ZtPcdb0blIgdmmsfWa+gPqEFy3MYDdB8fSgbl1MII3ntXSRGuEV4TsydZrb9S+JcFv9s74T8akbbh94uSplPvabHKSGIQ9lmAw+MypLR4GUv1n9f0ER1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725187871; c=relaxed/simple;
	bh=tEod7l1TOEILAYrzrtgJeK+5LXqWOv/BlAH82sxk6Ag=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gxsCVMerBYXgssYjLYgqO3fw0THOn1SmUvE0iTedGGOwcssW9phIjJRZuQDUms96KUSmYiW334EJxKSbQodmAQK9ciwuRRKM6RZbLzOU47pHCqjeZ7OCQQnur2FIYetl7CYTEnW87GOJucwfgqiGUYTmQs+NhF3CM+angOvVmA8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iUaBjzyo; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40412C4CEC9;
	Sun,  1 Sep 2024 10:51:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725187871;
	bh=tEod7l1TOEILAYrzrtgJeK+5LXqWOv/BlAH82sxk6Ag=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=iUaBjzyowjcs1/lFuLVGFbd8r1IXSHuD8cNaSC8PxeLC3z0su1gpO4sR0VHhVEOCb
	 bJmW0hiIPsKF31a8gxb75R98/Ue5fGxlhfosEYJVWgatK6cPQ8wBKRCCXdnQtjcJD0
	 TsMxEbWF/31yKDLoMgUomTJgtXuKP2alj8/RPAvwarhcqjNrS2DdjkQnwWy5tBfEdM
	 +P/rb3xiftTcvd/WpoaHEHmCW6yUv3V2HjiQznClU3usw4ctj/yf08Aw3wjlfwjhO9
	 opJDCWaYgBI386Td+kBBMlzcVuSTL+iq0F2bxXFupXGZq2xiGJLnKHBK4kEY6ia6st
	 f87Lsv4TI6aTQ==
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5334c018913so3053967e87.0;
        Sun, 01 Sep 2024 03:51:11 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU52cN/z7JBRWZZl6B6P/6PtA2cWoHd7UoFp5JvFEG53+nqW0HM0pQ+syh9dxBziZvHHopz7V/EgoaHKzs=@vger.kernel.org, AJvYcCVHSlZ5GTOPiTdKDJi7TJe9diMh3UZGBq/KBRzRIEEcPdrwl2EeUZkreW4HjJEZz83eollKFxsDlY8O9cGv@vger.kernel.org, AJvYcCVK/DyuiYPvXgnxyL4VFAaRwDmPAEPo7rDUmJprYARJEVWn6NZ2R82Bt410yJUWTwu4srxcnuowxBc4JwJG/A==@vger.kernel.org, AJvYcCWFx7r+OMhWye7rjyv2v41JUi8NDrw4/pKMl3r6onFg31cDKQLAlBoiF6eZ9Zq5BUnlbVOrGOHdUOyKZ+NzAwM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzRDN8XYl/xFF37M09DARPWIePxEN2oeAQYennjSiyKbIRkXOpL
	BRoF6XL25MQIEZ/QlEVJy7mcW5fDond6mpuFMJ6r6vwcRjoAt95w1mG9maV93mhsVmUpzj+k273
	O2oxW5dvHz7IeF7ukj7IHVW9kQfQ=
X-Google-Smtp-Source: AGHT+IFj24VJLRe5mGXDbBsTIFHvsslq2fVan6e2JAmdiLbQYfHXryZyyS7TDjp35LE1bYWF/nTCJRQscAz0eiZm6cM=
X-Received: by 2002:a05:6512:3d07:b0:530:e28a:3c17 with SMTP id
 2adb3069b0e04-53546b34715mr5450093e87.25.1725187869747; Sun, 01 Sep 2024
 03:51:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240815173903.4172139-21-samitolvanen@google.com> <20240815173903.4172139-39-samitolvanen@google.com>
In-Reply-To: <20240815173903.4172139-39-samitolvanen@google.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Sun, 1 Sep 2024 19:50:32 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQ4Qy-Z7Z2ads7JNRs+aTP5BrRTqCZgmm51e+_6mU3sYg@mail.gmail.com>
Message-ID: <CAK7LNAQ4Qy-Z7Z2ads7JNRs+aTP5BrRTqCZgmm51e+_6mU3sYg@mail.gmail.com>
Subject: Re: [PATCH v2 18/19] x86/asm-prototypes: Include <asm/ptrace.h>
To: Sami Tolvanen <samitolvanen@google.com>
Cc: Luis Chamberlain <mcgrof@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Matthew Maurer <mmaurer@google.com>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Wedson Almeida Filho <wedsonaf@gmail.com>, Gary Guo <gary@garyguo.net>, 
	Petr Pavlu <petr.pavlu@suse.com>, Neal Gompa <neal@gompa.dev>, Hector Martin <marcan@marcan.st>, 
	Janne Grunau <j@jannau.net>, Asahi Linux <asahi@lists.linux.dev>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-modules@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 16, 2024 at 2:39=E2=80=AFAM Sami Tolvanen <samitolvanen@google.=
com> wrote:
>
> <asm/ftrace.h> refers to struct pt_regs, make sure it's visible.
>
> Signed-off-by: Sami Tolvanen <samitolvanen@google.com>


Then, why don't you include <asm/ptrace.h>
from arch/x86/include/asm/ftrace.h
instead of from arch/x86/include/asm/asm-prototypes.h


And, this patch can get in independently.

You should send it as a standalone patch
to the x86 ML.







> ---
>  arch/x86/include/asm/asm-prototypes.h | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/arch/x86/include/asm/asm-prototypes.h b/arch/x86/include/asm=
/asm-prototypes.h
> index 25466c4d2134..c82e68c8b7c2 100644
> --- a/arch/x86/include/asm/asm-prototypes.h
> +++ b/arch/x86/include/asm/asm-prototypes.h
> @@ -1,4 +1,5 @@
>  /* SPDX-License-Identifier: GPL-2.0 */
> +#include <asm/ptrace.h>
>  #include <asm/ftrace.h>
>  #include <linux/uaccess.h>
>  #include <linux/pgtable.h>
> --
> 2.46.0.184.g6999bdac58-goog
>


--
Best Regards
Masahiro Yamada

