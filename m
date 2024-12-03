Return-Path: <linux-kbuild+bounces-4961-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 707E29E1A64
	for <lists+linux-kbuild@lfdr.de>; Tue,  3 Dec 2024 12:09:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4434A163956
	for <lists+linux-kbuild@lfdr.de>; Tue,  3 Dec 2024 11:09:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 778BA1E2838;
	Tue,  3 Dec 2024 11:09:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="u8ll8iTf"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B5E51E2306;
	Tue,  3 Dec 2024 11:09:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733224194; cv=none; b=CpTZdBWciP3LuoFWCBrNeifNIwL121Bpb/q5cqpG4PR5rn9vEyIR1u6tofs+KSS8XTOsSoHiW0aIYYBxGWLZIV2fOk4YsM9pldA9ggxTGT+BAOe4bhHRATbpTpTvsGylnr+UHY0GLC488H2YAzbjxAmGjMMb7d7NSiBGXVBWvlE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733224194; c=relaxed/simple;
	bh=/vLW0bP5wDLhIh1dpy97QQHaNRuSaKOu4d15CBULTl0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LYSfDdxmrFjtYBylzLsDuOQa2rrGlekubQqD0gpphuhUz5MQXHnmtGhZx97gD4v67+qGFJ3++b21PW0wX1a9Jx+r0Z8yegMm5gOjI+BCba9u3inxiF/sG0OFCtWs0+oxfwsERu7OLfDT6ImQH6v81SZTbZ7OCkpzp1Bh5ZaXfwI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=u8ll8iTf; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C578CC4AF09;
	Tue,  3 Dec 2024 11:09:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733224193;
	bh=/vLW0bP5wDLhIh1dpy97QQHaNRuSaKOu4d15CBULTl0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=u8ll8iTftHDeRNQDfYBF2E8yt9t+PWRxlaCE87rg2+w+CuHZF9AbB3/qUXu/sgSXL
	 Y/ej9e5j086/BweR/iDMdasmxSqQW92dXwTCx5o3HUI3V6IqL7MsqUGBel4/9gA5Q2
	 IimMKgNP/nEU73aVJBcHPanLzIeTaKdPLY9b0adoBirPCzZCvvgT2Ecv2obGlzaFUM
	 5n8OT0JCWo07X7tjYCN0Ex5Cyc9v8C1rgbXzhsodXv9i15WYwRDuYC0qiffHtsgYxd
	 OwVwd3Y+X8UIJLPvDyo+RbZTRdFjl08a4JRP4Nm35w8rQEzyWyxsfYOPsJT9squ+Ld
	 cYKXdXL9zTb8Q==
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-53ddd4705f8so5069772e87.0;
        Tue, 03 Dec 2024 03:09:53 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUEUehR/pQIRvEUcr5kyWUL0+LzaMA7TR6FvDu2k/2o4tGXqRDa7Eriq7Nv8SLem2tm7LCuX1Rm3uOvhIbG@vger.kernel.org, AJvYcCUgIwG4ZQQqUmUKtyyqLY2OMnq7qS7CFCGv2J0VfqgPmYbMGhspCdpghr5Mh2g94NULU5FYeXvPqXk/DWE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx92AIzJ07E+xp2WnZC8nH42jJsLxMKPTPxdBvrnHVw2vKGJdj3
	y7qTPrjL9Q3hOVBYBl+TGdRDhdKT7lkvXO1hWwfejrd6xRV4l6zJFSlcikdqy4kVtgRXQTw99u8
	fmSWRjSyksytEab8N/Za3PBLIxQ4=
X-Google-Smtp-Source: AGHT+IF1sKwCv8EeMZpMTKxMELTCmYpVHvJzZlR8uT+oSgAEZ0p4zfuj9NIZQ9Uq0qgR03OboGqjVnO5KJacg48LUIQ=
X-Received: by 2002:a05:6512:159b:b0:53d:ed29:43ac with SMTP id
 2adb3069b0e04-53e12df00a2mr583542e87.28.1733224192324; Tue, 03 Dec 2024
 03:09:52 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241203102124.3147478-1-masahiroy@kernel.org>
In-Reply-To: <20241203102124.3147478-1-masahiroy@kernel.org>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Tue, 3 Dec 2024 20:09:16 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQ8MKTWWzLNYDBMCcRzWGVhX-kUyFM=BwK8-maKtqZj3Q@mail.gmail.com>
Message-ID: <CAK7LNAQ8MKTWWzLNYDBMCcRzWGVhX-kUyFM=BwK8-maKtqZj3Q@mail.gmail.com>
Subject: Re: [PATCH 0/3] module: fixups after module namespace conversion
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Peter Zijlstra <peterz@infradead.org>, 
	Matthias Maennich <maennich@google.com>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Linus,


I submitted this patch set to you, hoping you can merge it.
Please let me know if you would prefer a different course.



On Tue, Dec 3, 2024 at 7:21=E2=80=AFPM Masahiro Yamada <masahiroy@kernel.or=
g> wrote:
>
>
> [1/3]
> Commit cdd30ebb1b9f added double-quotes to enclose the variable in the
> semantic patch, scripts/coccinelle/misc/add_namespace.cocci.
> Since then, 'make nsdepds' always changes the missing import to silly cod=
e:
>    MODULE_IMPORT_NS("ns");
>
> [2/3]
> MODULE_IMPORT_NS("") is misleading in the context of documentation
> about MODULE_IMPORT_NS() tags in general.
>
> [3/3]
> Convert DEFAULT_SYMBOL_NAMESPACE from a macro expansion to a string
> literal. There is no good reason to keep inconsistency in the default
> case.
>
>
>
> Masahiro Yamada (3):
>   scripts/nsdeps: get 'make nsdeps' working again
>   doc: module: revert misconversions for MODULE_IMPORT_NS()
>   module: Convert default symbol namespace to string literal
>
>  Documentation/core-api/symbol-namespaces.rst              | 8 ++++----
>  .../translations/it_IT/core-api/symbol-namespaces.rst     | 8 ++++----
>  .../translations/zh_CN/core-api/symbol-namespaces.rst     | 8 ++++----
>  drivers/cdx/Makefile                                      | 2 +-
>  drivers/crypto/intel/iaa/Makefile                         | 2 +-
>  drivers/crypto/intel/qat/qat_common/Makefile              | 2 +-
>  drivers/dma/idxd/Makefile                                 | 2 +-
>  drivers/gpio/gpio-idio-16.c                               | 2 +-
>  drivers/hwmon/nct6775-core.c                              | 2 +-
>  drivers/i2c/busses/i2c-designware-common.c                | 2 +-
>  drivers/i2c/busses/i2c-designware-master.c                | 2 +-
>  drivers/i2c/busses/i2c-designware-slave.c                 | 2 +-
>  drivers/pwm/core.c                                        | 2 +-
>  drivers/pwm/pwm-dwc-core.c                                | 2 +-
>  drivers/pwm/pwm-lpss.c                                    | 2 +-
>  drivers/tty/serial/sc16is7xx.c                            | 2 +-
>  drivers/usb/storage/Makefile                              | 2 +-
>  include/linux/export.h                                    | 2 +-
>  scripts/coccinelle/misc/add_namespace.cocci               | 4 ++--
>  scripts/nsdeps                                            | 2 +-
>  20 files changed, 30 insertions(+), 30 deletions(-)
>
> --
> 2.43.0
>


--=20
Best Regards
Masahiro Yamada

