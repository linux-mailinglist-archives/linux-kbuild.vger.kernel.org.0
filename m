Return-Path: <linux-kbuild+bounces-182-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A1A7E7FBC9B
	for <lists+linux-kbuild@lfdr.de>; Tue, 28 Nov 2023 15:20:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D2EE21C20AC4
	for <lists+linux-kbuild@lfdr.de>; Tue, 28 Nov 2023 14:20:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E84757896;
	Tue, 28 Nov 2023 14:20:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EAz96Pu6"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7181A35888
	for <linux-kbuild@vger.kernel.org>; Tue, 28 Nov 2023 14:20:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB959C433CA;
	Tue, 28 Nov 2023 14:20:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701181233;
	bh=ZafUz/tBS+WxAqK8BrScQ+1PsQuHRQibBxd+i4NeQAw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=EAz96Pu6G54eCNjLGpnYue2Jz1H9mdLT4rjwuXrUj0KySio0zBUS7XM7HRTG+sOvN
	 cvJ68LcObTkorl4drW5GvgnCEKDjLmL44N67bRd9kZ0PgU1IGmvZpWzImwyk5XuYxV
	 f5287dK2msj8dmtzGr3kfnPjZyMn+TRaz9VTdY5x+pTwtzrYxfhdrg+eYDANWTuE8V
	 bGz9zZGsmEPYOOZzavIorjgLbtJEjQl9XGpVYWpA1sizGKGPC8OkAe4/GJaGl91bK4
	 v0Y21NdmUGsZX79qBi7+kYe1JsWl9n7lilP5OLHQpQaqqgEJ3iZrerkmU0/W67fyks
	 1x+RbAEz8KxSw==
Received: by mail-oa1-f45.google.com with SMTP id 586e51a60fabf-1fa1c3755afso1491258fac.1;
        Tue, 28 Nov 2023 06:20:32 -0800 (PST)
X-Gm-Message-State: AOJu0YxRhQlsbPhL65I9cOuQe8Iu7JbM+nqoHwfmAZeNmRHi9Sb/T+pC
	UPG65Dy/nlNyRlhfeWmmb+UjR75yXmv2aXICWBU=
X-Google-Smtp-Source: AGHT+IHswiwugmGVsE4mtflYbXoTA6rzhNrpmURMsGKRXV46JcUiWdu8Hu3GnToiEji2taygrJwe0QnQUJlToz83FGA=
X-Received: by 2002:a05:6871:454:b0:1f9:f54a:f5ef with SMTP id
 e20-20020a056871045400b001f9f54af5efmr6192409oag.19.1701181232316; Tue, 28
 Nov 2023 06:20:32 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231122034753.1446513-1-senozhatsky@chromium.org> <20231128053443.GA6525@google.com>
In-Reply-To: <20231128053443.GA6525@google.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Tue, 28 Nov 2023 23:19:55 +0900
X-Gmail-Original-Message-ID: <CAK7LNAT_Z4TeNzngMskEoNdSTWUH5gGzYm5MfO6C_H8rFcF6ng@mail.gmail.com>
Message-ID: <CAK7LNAT_Z4TeNzngMskEoNdSTWUH5gGzYm5MfO6C_H8rFcF6ng@mail.gmail.com>
Subject: Re: [PATCH] kconfig: WERROR unmet symbol dependency
To: Sergey Senozhatsky <senozhatsky@chromium.org>
Cc: Patrick Georgi <pgeorgi@google.com>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Stefan Reinauer <reinauer@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 28, 2023 at 2:34=E2=80=AFPM Sergey Senozhatsky
<senozhatsky@chromium.org> wrote:
>
> On (23/11/22 12:47), Sergey Senozhatsky wrote:
> > When KCONFIG_WERROR env variable is set treat unmet direct
> > symbol dependency as a terminal condition (error).
> >
> > Suggested-by: Stefan Reinauer <reinauer@google.com>
> > Signed-off-by: Sergey Senozhatsky <senozhatsky@chromium.org>
>
> Gentle ping.


I believe you know this patch is too cheesy to be accepted.



KCONFIG_WERROR is meant to turn all warnings
to errors.

I do not see getenv("KCONFIG_WERROR")
sprinkled everywhere in Kconfig.



One more thing, you cannot directly exit(1)
from sym_calc_value().

Curses programs (menuconfig / nconfig),
must call endwin() before exiting.

Otherwise, the terminal will not come back
to the canonical mode.


You do not need to fix it, though.








--
Best Regards
Masahiro Yamada

