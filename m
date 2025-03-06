Return-Path: <linux-kbuild+bounces-5985-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BD295A55315
	for <lists+linux-kbuild@lfdr.de>; Thu,  6 Mar 2025 18:29:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 260B517446A
	for <lists+linux-kbuild@lfdr.de>; Thu,  6 Mar 2025 17:29:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A247D2571DA;
	Thu,  6 Mar 2025 17:29:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nkMREX4w"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7909A21129A;
	Thu,  6 Mar 2025 17:29:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741282184; cv=none; b=npWFMdgeYeZ9gEYv9qG1IWl4ZDwxuRBjrN1XLGAWEE9GJP9CbzPZeRXEq+SQhntnEXawPjb6ImGav6pnZY5kBuq0lawRImatQhGcx/5JHGzFwnfP1aVc3Fbsh42Tobi3UMx/2O48DT1qNnFfNMkQyTbTolMZJlnPEN4gjDqpHKA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741282184; c=relaxed/simple;
	bh=KZYtcdwW8Wk9dB1oWd/rkVWpEBmI93Y6YOUh38AImKw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GVI7sC6qtXGKPU6uEzqhh+yGxH7aZonLRdEJ58s6gUJA7nUns7K4jhbmItYqbiwl8myzQz8pitUNSXXrAHOfZB8xv9KT3hmWrSEULZ+jzGqWe7/Dk2ezSXXN6kwZMF2Ps7no3AlIncw45WkGSiJtNgVZZNehOlzBll4vC04Hsnw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nkMREX4w; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B251C4AF09;
	Thu,  6 Mar 2025 17:29:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741282183;
	bh=KZYtcdwW8Wk9dB1oWd/rkVWpEBmI93Y6YOUh38AImKw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=nkMREX4wtdjn12EKSLg+tLJLbOLwgg7LyHhQ3ekTyc51NmiDBRkXFY141tlNTDUSY
	 OBOyH4risP+uPZ1WnFKx3n71NxEdQlyh8LHdlh3xxmhpwqak1arnOQaoZRJfG1dmtx
	 jpjMI0/TgpEjGKj0KysikG2jj1H3YwObvYx24Swt/hkl/xjgl9vZZA6RilnbUlRRoB
	 mjn4uP4Z9cYmktL+vgJ0P8yOzJGW76SyqR5Xv/iA+mxKi33XdqLIeOQsj6qstZW3nx
	 vM2HSMv0h56NqBD/9fyMCpK8h2T122gDXCbkLsewybBelgIh3v7hO6Jxb2Ve7ebbu6
	 nDuJHpKK9F5QA==
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5497e7bf2e0so1056094e87.3;
        Thu, 06 Mar 2025 09:29:43 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCV1/qVYJRHkYIsznqSbiF3qxq2NqfdQbanjvXIh4fLms5oVE0lqZtgAMfMEh7w0Be5WeqLiwFh73/zXeWc=@vger.kernel.org, AJvYcCXYuArNubTft7GITIJHl9hE1O6ZncmkgLJX2UEDKIoKaiuua5fhG1m8rcwBX+oVrDvK6wxPRMgUmxNssDhGZrixThNM@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9zOPTruyYYk0uOkH6E4VULOrXXdun1P6SQgBQkd1aavvkJRx9
	LmNYrHCwiO8P5tqozS9aazz6hRXN9A/8fy9EZLX5tBnHF16JzBWtfp/QO/DCf6/BoGaa8PQcoJs
	Kt1CPsmrocXBfVY1sVZZtLp7bsD8=
X-Google-Smtp-Source: AGHT+IGU5J/kHOirCJPifRWunKlkyXDV/e/ZZrChNepJwo5HfLLMGsihhruo0L+jcVyQfQ5KYPNIjS5I42jd8QhihiQ=
X-Received: by 2002:a05:6512:31c6:b0:546:27f0:21a7 with SMTP id
 2adb3069b0e04-5497d38379amr3645553e87.49.1741282181766; Thu, 06 Mar 2025
 09:29:41 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250210-debuginfo-v1-0-368feb58292a@purestorage.com> <20250210-debuginfo-v1-1-368feb58292a@purestorage.com>
In-Reply-To: <20250210-debuginfo-v1-1-368feb58292a@purestorage.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Fri, 7 Mar 2025 02:29:04 +0900
X-Gmail-Original-Message-ID: <CAK7LNASVnC5tVNok7F-Jj8-0Pxv-TmPYPAX1HbSixBBb9CkeUw@mail.gmail.com>
X-Gm-Features: AQ5f1JoZVxu0kJi6UXDNLfRX-XXv77TpTYRYNmkEXtNZvY5aHVLk9nP9njXC5Ts
Message-ID: <CAK7LNASVnC5tVNok7F-Jj8-0Pxv-TmPYPAX1HbSixBBb9CkeUw@mail.gmail.com>
Subject: Re: [PATCH 1/2] scripts: make python shebangs specific about desired version
To: Uday Shankar <ushankar@purestorage.com>
Cc: Steven Rostedt <rostedt@goodmis.org>, Masami Hiramatsu <mhiramat@kernel.org>, 
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nicolas@fjasle.eu>, linux-trace-kernel@vger.kernel.org, 
	linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 11, 2025 at 10:12=E2=80=AFAM Uday Shankar <ushankar@purestorage=
.com> wrote:
>
> The RPM packaging tools like to make sure that all packaged python
> scripts have version-unambiguous shebangs. Be more specific about the
> desired python version in a couple of places to avoid having to disable
> these checks in make rpm-pkg.
>
> Signed-off-by: Uday Shankar <ushankar@purestorage.com>


Applied to linux-kbuild.
Thanks.


> ---
>  scripts/show_delta                | 2 +-
>  scripts/tracing/draw_functrace.py | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/scripts/show_delta b/scripts/show_delta
> index 291ad65e30894645205101e3f31f2e38e90e172e..3755b6c6e55704ef08c2483ab=
44793adab78f76c 100755
> --- a/scripts/show_delta
> +++ b/scripts/show_delta
> @@ -1,4 +1,4 @@
> -#!/usr/bin/env python
> +#!/usr/bin/env python3
>  # SPDX-License-Identifier: GPL-2.0-only
>  #
>  # show_deltas: Read list of printk messages instrumented with
> diff --git a/scripts/tracing/draw_functrace.py b/scripts/tracing/draw_fun=
ctrace.py
> index 42fa8730094166b5883aaa92b0e2c32e0268b120..97594b65f8ce9b1ade7f08b6b=
95eee6a1383fec7 100755
> --- a/scripts/tracing/draw_functrace.py
> +++ b/scripts/tracing/draw_functrace.py
> @@ -1,4 +1,4 @@
> -#!/usr/bin/env python
> +#!/usr/bin/env python3
>  # SPDX-License-Identifier: GPL-2.0-only
>
>  """
>
> --
> 2.34.1
>
>


--
Best Regards
Masahiro Yamada

