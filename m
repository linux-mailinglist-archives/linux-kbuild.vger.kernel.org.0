Return-Path: <linux-kbuild+bounces-6256-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 41E97A6A149
	for <lists+linux-kbuild@lfdr.de>; Thu, 20 Mar 2025 09:26:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5246B980654
	for <lists+linux-kbuild@lfdr.de>; Thu, 20 Mar 2025 08:23:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 14BAC214227;
	Thu, 20 Mar 2025 08:23:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LSHjZ3Cb"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC21120FA8B;
	Thu, 20 Mar 2025 08:23:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742458981; cv=none; b=gcNuLLiZvJKTosj1NZurGXRAimghuCgv+AbxOuJwLfJx+0Hhjvuu24GSNvqLtFlXH/phJpelG4OzzQExohqbzLz7zao+g68Yw7z2aIWgol8Y1bPfb3wpjTH0/Zx5tN3F13XKB3pHXlxiuRtW1dYkD9csRmzRg/PnGS/ubnBjPbA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742458981; c=relaxed/simple;
	bh=uuDoS8H7uaThtE/+q1g0GRK9CFx+DtO0sFLmtPBeD4E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sIa0HTAnrqmLoIcBxAt9RFIGiTNHyB7I2VBPyjRCHFGY51NfIbxaZqZgDINLkAIhELiPOzq+bS3WzPyfCj71DiJl9RYiMz7f200IDdDkKd+wWaZcrZkpY7sE9dle8p/HIzJHQXdQqXoo9dwjIoIdPlzTfrmdF+XlBzlHf/jV+AM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LSHjZ3Cb; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5BAA6C4CEEC;
	Thu, 20 Mar 2025 08:23:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742458980;
	bh=uuDoS8H7uaThtE/+q1g0GRK9CFx+DtO0sFLmtPBeD4E=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=LSHjZ3Cb1nwY8hDZZFe24onM1tyWYUA+pjm7Ntu5iTU52EROw8KWHUnjBvsSL955Z
	 h557aE2sh5GZpy+b1Nu8g5AVFskRvHi1xm3i3K6csUszqVxhMFxMF4CqPJcn2UCiFa
	 xRVRHaA9IYb8zOxYBwEWcSJ+uSLxNYN/xxK2E0dnZsItYXoWMLQFpdx/u3vsezet/b
	 IAwKXLnmCRXwkcQX8RYjcgH85vRnNqH2Hr9Te9yKjFEay8cxrWu93zPzposzfrSzbl
	 C03yb1vjdksw0J1O67BVqKTiNZrY6uySONdUbRdLca4tu8C3DJ1tkjdPtB9GM6Wf+9
	 pXtJVXDwFvq4g==
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-30762598511so6361151fa.0;
        Thu, 20 Mar 2025 01:23:00 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUmdhVodlxh45YsTcyb9EekPqPkShj2Ie7OGv8jsIaR4KC4lS83dFU+v1c75uQHYLTtZr4/PDtq3J/F98M=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2R1amSdxhJww0QL/ocwK/iNrRB/k67peUUB5BqmTsgkiEs1mP
	qjpU2nN609Xh2kQtUV1274kHvoEfuq3UQLAho2qvbSedS4rHk0U6SuEqz/0eohKXXnpWUrmPMbF
	tSlDXETiEzVxwCEEePqiG0gUcIhQ=
X-Google-Smtp-Source: AGHT+IEbHrSSAz0orcE7ux3IVnlmNkwpe31ZXIN+54sZQPWqBuHuIthlBb7EM3d3HaeT207h4cxITmbghV29DZ4qv/M=
X-Received: by 2002:a05:651c:2211:b0:30a:44ca:7e74 with SMTP id
 38308e7fff4ca-30d6a3e4308mr24169131fa.12.1742458978712; Thu, 20 Mar 2025
 01:22:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250320070746.101552-2-ardb+git@google.com>
In-Reply-To: <20250320070746.101552-2-ardb+git@google.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Thu, 20 Mar 2025 09:22:47 +0100
X-Gmail-Original-Message-ID: <CAMj1kXEqNALtjhHyj=4AY=C-mFpj_uCv1BuS5X=xdxarJ5Ekgw@mail.gmail.com>
X-Gm-Features: AQ5f1Jr9ucMoS5AX_IYMQK64fc7PpiEoA9OFnR41asQy2G4ghgZqpVV--DH4Sn4
Message-ID: <CAMj1kXEqNALtjhHyj=4AY=C-mFpj_uCv1BuS5X=xdxarJ5Ekgw@mail.gmail.com>
Subject: Re: [PATCH] gendwarfksyms: define __GENKSYMS__ when processing asm-protoypes.h
To: Ard Biesheuvel <ardb+git@google.com>
Cc: linux-kbuild@vger.kernel.org, brgerst@gmail.com, x86@kernel.org, 
	masahiroy@kernel.org, nathan@kernel.org, linux-kernel@vger.kernel.org, 
	nogikh@google.com, Sami Tolvanen <samitolvanen@google.com>, 
	syzbot+06fd1a3613c50d36129e@syzkaller.appspotmail.com
Content-Type: text/plain; charset="UTF-8"

On Thu, 20 Mar 2025 at 08:08, Ard Biesheuvel <ardb+git@google.com> wrote:
>
> From: Ard Biesheuvel <ardb@kernel.org>
>
> Ensure that __GENKSYMS__ is #define'd when passing asm/asm-prototypes.h
> through the compiler to capture the exported symbols. This ensures that
> exported symbols such as __ref_stack_chk_guard on x86, which is declared
> conditionally, is visible to the tool.
>
> Otherwise, an error such as the below may be raised, breaking the build
> when CONFIG_GENDWARFKSYMS=y
>
>   <stdin>:4:15: error: use of undeclared identifier '__ref_stack_chk_guard'
>
> Cc: Sami Tolvanen <samitolvanen@google.com>
> Reported-by: syzbot+06fd1a3613c50d36129e@syzkaller.appspotmail.com
> Signed-off-by: Ard Biesheuvel <ardb@kernel.org>

Tested-by: syzbot+06fd1a3613c50d36129e@syzkaller.appspotmail.com

https://syzkaller.appspot.com/bug?extid=06fd1a3613c50d36129e

> ---
>  scripts/Makefile.build | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/scripts/Makefile.build b/scripts/Makefile.build
> index 993708d11874..7855cdc4e763 100644
> --- a/scripts/Makefile.build
> +++ b/scripts/Makefile.build
> @@ -305,6 +305,7 @@ $(obj)/%.rs: $(obj)/%.rs.S FORCE
>  getasmexports =                                                                \
>     { echo "\#include <linux/kernel.h>" ;                               \
>       echo "\#include <linux/string.h>" ;                               \
> +     echo "\#define  __GENKSYMS__" ;                                   \
>       echo "\#include <asm/asm-prototypes.h>" ;                         \
>       $(call getexportsymbols,EXPORT_SYMBOL(\1);) ; }
>
> --
> 2.49.0.rc1.451.g8f38331e32-goog
>

