Return-Path: <linux-kbuild+bounces-5419-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CF350A0900B
	for <lists+linux-kbuild@lfdr.de>; Fri, 10 Jan 2025 13:14:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DBFA93A229D
	for <lists+linux-kbuild@lfdr.de>; Fri, 10 Jan 2025 12:14:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5DF99205E37;
	Fri, 10 Jan 2025 12:14:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XlLK6X/d"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30136205E21;
	Fri, 10 Jan 2025 12:14:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736511259; cv=none; b=lr2VUoQ3CevOglU9wM0nf0VhGG6ygvPsJ5xrUOmXtS/joEFQ+CjizrVcbmg+sM+G54yVi8lcKSGTeMoAKr0H8EmuLe1nzH9qsQxakdWkMFdu49W4hl8okyk/K/JDfHAJQL06ljf32PBd+oUVEJo/q7Cu4RrLHRt39UhZB6TL+pg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736511259; c=relaxed/simple;
	bh=LKo8bpEtYIe5t1VceBxZS22BvfVVDlhIZm0EoNnQYEs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=T+CU/HxBddKe1GbvNDT0lTG4TQoTPeXrltoBepk3uU960gHSMsU/blFizoV8SGlS9iwc5IpOPKyDle80+cWqOW5rFeKPVTk/Vh2E4Mg7gq5imLu0cIXQL3arhw0OCeR1/3vjjeot30bWqq2X8BQdrboGkU5i4b0hlPQY9FgDIYc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XlLK6X/d; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC297C4CEE1;
	Fri, 10 Jan 2025 12:14:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736511258;
	bh=LKo8bpEtYIe5t1VceBxZS22BvfVVDlhIZm0EoNnQYEs=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=XlLK6X/dS8tqVWhYOAJVc4GMdupJU0aj3EbEpgjG5ELiHvIrp92f3An90gvP6r2uF
	 Sdt/RO5yWD7whAscqg2x5vvLmkc9ghXYG5ku1ARD8cLJ+rRcYQpK6BwZxyNBXrnLme
	 hoKYYPLj3VdnAUhSbldJrWSjomkiBzk3BmFpUcOgnUwOCvTxzXaeLySIONJc527TwB
	 GoN3HeoEsM5+phLM6E6RMX5B3AFozfV1N/gDFazPfOTcfg/IFsfnTiWW2eLEI8yR/X
	 f3UuqtrVqHKrjts5F5wgKfObTlnpW+BuOLR6Mb31EUaMP1tc28G3LRp83iL1op8R8U
	 nLg2+pu6IUEeQ==
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-53ff1f7caaeso2036749e87.0;
        Fri, 10 Jan 2025 04:14:18 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWfF1x2sV34hswMAZXNoZKRQRjUXCS+TxsELvL4/gwvS+UKgMZ3pb2IlKX2mLejx6g9iDUy75kNpRG3jA==@vger.kernel.org, AJvYcCXWx6ZzTqwP0cszRMoKh3/AGiga8nkATmkqL+1iMnMXVK6Z44i8D1sgYv3uJjyv78bT315PKEomg9Gi60E=@vger.kernel.org
X-Gm-Message-State: AOJu0YxbiqlJ9YTG7It6mV/dmR7PFtDQ+8MrGSNVJii9j7xKdkxgHhV1
	oIRBhm5ELIJrYEAk8dTx6yR+wS/j68YTzlsp6Nph1UzA1Fo4AcSVWciNDVCs+C2OnqK+H3o6E2a
	jYr197GK7O7NVz8ttFxHmJ6XcayE=
X-Google-Smtp-Source: AGHT+IH34RNFIsnvALe6AjqSTDDJWj/TiAsDt+LHFUd3XT4Qq1HhowlIi4/eiuJedBUmy+/wHA0rdXMqF+/iSLbSmak=
X-Received: by 2002:a05:6512:1149:b0:540:2201:57d1 with SMTP id
 2adb3069b0e04-542845c01b8mr3284401e87.49.1736511257474; Fri, 10 Jan 2025
 04:14:17 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250110082744.457067-2-ardb+git@google.com>
In-Reply-To: <20250110082744.457067-2-ardb+git@google.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Fri, 10 Jan 2025 21:13:41 +0900
X-Gmail-Original-Message-ID: <CAK7LNASygf5gRdYOOa3KsKbz8mny9nnn5RduuGtP5WoWgXDTQA@mail.gmail.com>
X-Gm-Features: AbW1kvYJSJ4ULPz9l8U8QGvpjCXJw-r5-U5EtXUed8QBmqt7AOBtvhMEG4S3Zrw
Message-ID: <CAK7LNASygf5gRdYOOa3KsKbz8mny9nnn5RduuGtP5WoWgXDTQA@mail.gmail.com>
Subject: Re: [PATCH] kbuild: Strip runtime const RELA sections correctly
To: Ard Biesheuvel <ardb+git@google.com>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Ard Biesheuvel <ardb@kernel.org>, Linus Torvalds <torvalds@linux-foundation.org>, 
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 10, 2025 at 5:28=E2=80=AFPM Ard Biesheuvel <ardb+git@google.com=
> wrote:
>
> From: Ard Biesheuvel <ardb@kernel.org>
>
> Due to the fact that runtime const ELF sections are named without a
> leading period or double underscore, the RSTRIP logic that removes the
> static RELA sections from vmlinux fails to identify them. This results
> in a situation like below, where some sections that were supposed to get
> removed are left behind.
>
>   [Nr] Name                              Type            Address         =
 Off     Size   ES Flg Lk Inf Al
>
>   [58] runtime_shift_d_hash_shift        PROGBITS        ffffffff83500f50=
 2900f50 000014 00   A  0   0  1
>   [59] .relaruntime_shift_d_hash_shift   RELA            0000000000000000=
 55b6f00 000078 18   I 70  58  8
>   [60] runtime_ptr_dentry_hashtable      PROGBITS        ffffffff83500f68=
 2900f68 000014 00   A  0   0  1
>   [61] .relaruntime_ptr_dentry_hashtable RELA            0000000000000000=
 55b6f78 000078 18   I 70  60  8
>   [62] runtime_ptr_USER_PTR_MAX          PROGBITS        ffffffff83500f80=
 2900f80 000238 00   A  0   0  1
>   [63] .relaruntime_ptr_USER_PTR_MAX     RELA            0000000000000000=
 55b6ff0 000d50 18   I 70  62  8
>
> So tweak the match expression to strip all sections starting with .rel.
> While at it, consolidate the logic used by RISC-V, s390 and x86 into a
> single shared Makefile library command.

I do not know how this works because arch/*/Makefile.post
do not include scripts/Makefile.lib





--=20
Best Regards
Masahiro Yamada

