Return-Path: <linux-kbuild+bounces-1003-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 68E8185BAA2
	for <lists+linux-kbuild@lfdr.de>; Tue, 20 Feb 2024 12:31:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9FC9CB218E6
	for <lists+linux-kbuild@lfdr.de>; Tue, 20 Feb 2024 11:31:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C0244664D4;
	Tue, 20 Feb 2024 11:31:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GyoxAyW6"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C9B4657D7
	for <linux-kbuild@vger.kernel.org>; Tue, 20 Feb 2024 11:31:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708428703; cv=none; b=dJM0C+6+KDT+EH13tfnv/ue8c46l1nAWgb6Eoe00rknwEk+s76YClK0RWy4bsaBZx+Kd+ZVD+WnW7iBhzKJz3rHtNXijCfNa2vzYvMEDOi2cMrghh2WfDUNl9EGNJJ2pyU72GAGsCNQyXAXXyhRxoSrJ2g5IvY9NPonqguZh9ok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708428703; c=relaxed/simple;
	bh=x8l3YanFxYZru5A4b40SoXypi1/XbyL4t/qe0rTQZ0E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Vfq5cCc6nwgFPv3aNSog/9PmW1zNCrMH9/4FPtS8cpch37WPQKUxkkm9vX2KTVz6dYgFUtp0XWajhyVi1ClmCIt0e1Z7GolUl03ZPnA9DjV4e+RjszY8GGPTHZhDZtVIGyxRgQg2Zd5xygLgCWIILf3au/MZtGJLrm8O247tg8s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GyoxAyW6; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A976C43390
	for <linux-kbuild@vger.kernel.org>; Tue, 20 Feb 2024 11:31:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708428703;
	bh=x8l3YanFxYZru5A4b40SoXypi1/XbyL4t/qe0rTQZ0E=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=GyoxAyW6nhcFwEl+WwjWhMLNRed7K/SJjK5rUhHU9Vj/w7H/fw5MOCXvrrD0oStve
	 Jm7Pe4OhnpTB1gkKCxEtAEYpX5N2sAEJhqoCJpdnGLsHSICbLja2ZFb8te+S2SHg3l
	 FJNuXXQFWmg3OjG8z7cLTVZQVdGQJmk3mPg1h/2g6KImluXrtBZEj8dPJ6ewefrqyu
	 DmifZGljkwFpDA00HF//1mDjzdx3tkG9SqqjuLrIPi6//ONkmhXiegQYLKVOk2yTG+
	 diUjpWodTHGRHHviAkv8GPjYNJropspFs0fDfHeGeMC/pk6yY2E0lccWdZ5oSGPRYQ
	 Z/2sl4kSSc02w==
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-2d22b8c6e0dso37098221fa.2
        for <linux-kbuild@vger.kernel.org>; Tue, 20 Feb 2024 03:31:43 -0800 (PST)
X-Gm-Message-State: AOJu0Yzwh3XT+wpIgOuMPkK+xRGBFtzX/nDJypuXVPM0FksMye94k9C/
	GTGRiSQn88xO2jd++SQgM/DeywbdksvmjLQOmJKuqSS23TgLoBSM4JZ9MP8w6c+dT+Hg/eV2cbA
	vareO8ZKimNJWTQGPyHVlI6s8gbc=
X-Google-Smtp-Source: AGHT+IGOyaI6C3oilGNBfw9LxuZaqzLFSI0t6hjfa55k4Kz9DFhEK/9EUigpefVc1fIJLdQEhK8VzMj+2bLqnGSZdlQ=
X-Received: by 2002:a2e:98c7:0:b0:2d2:2ada:9267 with SMTP id
 s7-20020a2e98c7000000b002d22ada9267mr6368766ljj.6.1708428701656; Tue, 20 Feb
 2024 03:31:41 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240216141016.11425-1-dev.mbstr@gmail.com>
In-Reply-To: <20240216141016.11425-1-dev.mbstr@gmail.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Tue, 20 Feb 2024 20:31:05 +0900
X-Gmail-Original-Message-ID: <CAK7LNAR-gic2AJQFNO7s+-ovxTvCftBkeje7T-XQRganFvV3+w@mail.gmail.com>
Message-ID: <CAK7LNAR-gic2AJQFNO7s+-ovxTvCftBkeje7T-XQRganFvV3+w@mail.gmail.com>
Subject: Re: [PATCH] kconfig: lxdialog: fixed cursor render in checklist
To: Matthew Bystrin <dev.mbstr@gmail.com>
Cc: linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 16, 2024 at 11:10=E2=80=AFPM Matthew Bystrin <dev.mbstr@gmail.c=
om> wrote:
>
> When a checklist is opened, the cursor is rendered in a wrong position
> (after the last list element on the screen). You can observe it by
> opening any checklist in menuconfig.
>
> Added wmove() to set the cursor in the proper position, just like in
> menubox.c. Removed wnoutrefresh(dialog) because dialog window has
> already been updated in print_buttons(). Replaced wnoutrefresh(list) and
> doupdate() calls with one wrefresh(list) call.
>
> Signed-off-by: Matthew Bystrin <dev.mbstr@gmail.com>


Applied to linux-kbuild.

Thanks.




> ---
>  scripts/kconfig/lxdialog/checklist.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
>
> diff --git a/scripts/kconfig/lxdialog/checklist.c b/scripts/kconfig/lxdia=
log/checklist.c
> index fd161cfff121..31d0a89fbeb7 100644
> --- a/scripts/kconfig/lxdialog/checklist.c
> +++ b/scripts/kconfig/lxdialog/checklist.c
> @@ -188,9 +188,8 @@ int dialog_checklist(const char *title, const char *p=
rompt, int height,
>
>         print_buttons(dialog, height, width, 0);
>
> -       wnoutrefresh(dialog);
> -       wnoutrefresh(list);
> -       doupdate();
> +       wmove(list, choice, check_x + 1);
> +       wrefresh(list);
>
>         while (key !=3D KEY_ESC) {
>                 key =3D wgetch(dialog);
> --
> 2.43.0
>


--=20
Best Regards
Masahiro Yamada

