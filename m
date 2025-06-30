Return-Path: <linux-kbuild+bounces-7771-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 517D0AED36F
	for <lists+linux-kbuild@lfdr.de>; Mon, 30 Jun 2025 06:23:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 41F5E1898566
	for <lists+linux-kbuild@lfdr.de>; Mon, 30 Jun 2025 04:23:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ACCD9137750;
	Mon, 30 Jun 2025 04:22:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Gg/RMdvt"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 831312905;
	Mon, 30 Jun 2025 04:22:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751257376; cv=none; b=eFfO+uKEjtoopd4roqPAGKakPp2AfxOfbrQpO1WI9jmsg28suHa7yNQyGXYw9qaWF8qN1S89k7HZ+KFAByKhQgtzw2H/jwGI6WvhIWN4I9usgAMgER+tFhp9bLqsqOmDiZ1hiL98znfexE8ox+MWkJY9SHRi1hoSx2IyoFu9Cnw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751257376; c=relaxed/simple;
	bh=pBbjL2ivpNmks85bmCMXD3MucnB/Nep2MGJ8Ex1SyQw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pfcT7k9EC6HFsj7PzFb8A5bYcn9wSpaMb3x8zpt+Wcyo+gcAfR/MWJLdhQfh+60AgwY+gbromY/89sbbCRLTvsYTwR5TjGtzaF191zuAmf7HdUUvfBqJ2y2UP8deGpOr0gxzxqWqibRpgqWODg2tkvgNQX3CGr7xWzp+701FfQo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Gg/RMdvt; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 025B0C4CEE3;
	Mon, 30 Jun 2025 04:22:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751257376;
	bh=pBbjL2ivpNmks85bmCMXD3MucnB/Nep2MGJ8Ex1SyQw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Gg/RMdvt5DtGzY3oDQCv36+uyRwfhT+hiLyVgJkt4eM4ouZt37FCkZy0r7ayBL2fE
	 PEjCqG+7e7VmutYm4aUINUlRBXBs/SiIy/bw8IOuBSB3CtUUW7BJddddLViNZWpNQl
	 kiUSzDvXihmvPR1ldMB5YuH6SKaPHtozMmtd9nmY0GRcvQiXY4DD2NxExtH/akwefC
	 SY/24/duk/6DqP4EdWMSrXwNYzvkMx07VvrMUS9JwOd+ThSrHYN91RfCdMdlQ73pDd
	 pPWZc2yHAt/uYfqEJ4hYmTEQGDZTWr8MInQmmthO+MAEEligjkxfJvy9qVKb3PXo6c
	 Xf6qWK4ZnM7sQ==
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-553bcf41440so4024490e87.3;
        Sun, 29 Jun 2025 21:22:55 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVt7GjUugR58eETllJCZMyNmPxhEKcM/+oTo5YYTJgQkoFLTLMBoQmHSraZGf5r/QexWx+BKBwAIbKEYm8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxgvHpqqm5DhwuUz0Z0jSVriK7bT4sbql7k81Z9tXBmQghFOHEq
	cPlwLyhMdqyLGnx8Fg6Z7M9tJNwEMKQ897ta+0yPpK+YHxPyW/bGAXIc9mRC38vHRao2/2yXJAR
	nbwdlEc+GK+yza0RqoqXU9BDl7m0V4fI=
X-Google-Smtp-Source: AGHT+IGykNiyqvrrIohADJ21s9mi33itGcWG1t6lA1z3PGVzV0fG6Y3UwHHPnhWOAHkMXPtujhB3qRsVnZIB+hBVTs8=
X-Received: by 2002:a05:6512:e95:b0:553:2dce:3ab2 with SMTP id
 2adb3069b0e04-5550b85b2fdmr3824809e87.6.1751257374679; Sun, 29 Jun 2025
 21:22:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250624150645.1107002-1-masahiroy@kernel.org>
 <20250624150645.1107002-22-masahiroy@kernel.org> <85b71c14-485e-4c85-9801-c61f7419abe3@infradead.org>
In-Reply-To: <85b71c14-485e-4c85-9801-c61f7419abe3@infradead.org>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Mon, 30 Jun 2025 13:22:17 +0900
X-Gmail-Original-Message-ID: <CAK7LNARNFgiLvNpWEywDBBHwi1bq-PZL8O5MdVn7V7NjM_WYJQ@mail.gmail.com>
X-Gm-Features: Ac12FXwOMR8vOwhs270mH7UCkrZ0M_SOrJ8QsUcUfhBJ8EAzORNyJufFc-3Z3zE
Message-ID: <CAK7LNARNFgiLvNpWEywDBBHwi1bq-PZL8O5MdVn7V7NjM_WYJQ@mail.gmail.com>
Subject: Re: [PATCH 21/66] kconfig: gconf: remove unneeded variables in on_treeview*_button_press_event()
To: Randy Dunlap <rdunlap@infradead.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 30, 2025 at 11:40=E2=80=AFAM Randy Dunlap <rdunlap@infradead.or=
g> wrote:
>
>
>
> On 6/24/25 8:05 AM, Masahiro Yamada wrote:
> > No all position parameters are used here. Passing NULL to
>
>   Not all
>
> > gtk_tree_view_get_cursor() or gtk_tree_view_get_path_at_pos() is
> > allowed. [1] [2]
> >
> > [1]: https://gitlab.gnome.org/GNOME/gtk/-/blob/2.24.33/gtk/gtktreeview.=
c#L12638
> > [1]: https://gitlab.gnome.org/GNOME/gtk/-/blob/2.24.33/gtk/gtktreeview.=
c#L12795
> > Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>

Thanks. I will locally fix it.


> >
> >  scripts/kconfig/gconf.c | 14 +++-----------
> >  1 file changed, 3 insertions(+), 11 deletions(-)
>
> --
> ~Randy



--=20
Best Regards
Masahiro Yamada

