Return-Path: <linux-kbuild+bounces-7734-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AF6B2AECF5B
	for <lists+linux-kbuild@lfdr.de>; Sun, 29 Jun 2025 19:57:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 737793B2788
	for <lists+linux-kbuild@lfdr.de>; Sun, 29 Jun 2025 17:56:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D656235364;
	Sun, 29 Jun 2025 17:56:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gdS0vQLP"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74F6C2576;
	Sun, 29 Jun 2025 17:56:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751219817; cv=none; b=n7NocdHWWBGwtR5AtlWXnAv+I2yMtRl0yWKyHu/fi5DMx/cZLd8bRpKRBW2LyfwXoOOezbjUKek5SeHVBa2B3Vy19iTgfL4BRfxAOCGU+6vziEe73zkDQjgZJ+Ko8Zj0jYhT0YZSdrTiF9XkeXdc1zSEDjGPJtfOvqt7ztOichY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751219817; c=relaxed/simple;
	bh=n5DQi97FMY7mz0WdwSUISHqEUK1VaA55AkvgGXSgggk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SAiU+XMZFENqYCV6rXY2gEWw4RDQmOa7uqFs1mNmIZ0NvuvOyZb4DGiOkDrz+IO8TCXIEGLb8svf5pUlGwgKKdaJON2Cp+liz9XqjUKEAzHK79DwVGxGjnD567oP+h2yYEvNUz8OQw54LgLOx+dHeC36hcvmkpGV5FiTtOcklQw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gdS0vQLP; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F40F0C4CEEB;
	Sun, 29 Jun 2025 17:56:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751219817;
	bh=n5DQi97FMY7mz0WdwSUISHqEUK1VaA55AkvgGXSgggk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=gdS0vQLPnQrbakSYFykI2LN9c0Yvfp3lLB1wqF4WlEYe9hHzhUmbjzms/dyfcDF9r
	 c3DQ23MHdzZlEj8WwTZul6ySlxJ8dOutj7mfVRp5GXTPGHfE+gynVknkRGsqdW9qw7
	 77e5BTXP3Jzzwm38liXXLZB3plBN1/PLVJFST54/GXtm5IdalkV/kjbG3qxaSM8ytN
	 5xHKUE0E97SmTtVOIu3fjFnYcNpj0KrSe3thWMK13XrNU2AMbgJ74FqwevEmFZ53wX
	 dmy4d9eRfiTHzAbd1jhM181im5KgUh3fha62tAseTvkMp18lZqj9W6tQ1RCKoJs64T
	 elHDU69MJ+5mw==
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-553bcf41440so3777219e87.3;
        Sun, 29 Jun 2025 10:56:56 -0700 (PDT)
X-Gm-Message-State: AOJu0YwNP9SaGWSbcFDg04gXu/tqSdZS41jsim5j8zD/Bg7wgYmUopeF
	71m8pg6Y00ULpPMXaeotayAuletPqSkwGcN5anjTz1XjMrS39XGmf18h+K1AXEiYOejAE7ovGrl
	VE4RikHDKVQOkr7DgJ+KfEBifJMo0pw8=
X-Google-Smtp-Source: AGHT+IEOYGdgII750p16CO8TPyHrwQiLPvxJuzFgm77M5QgPlxrBI/hLlqNPchqYJJjwKWqeCylAGwsrYk4TvvXun5s=
X-Received: by 2002:a05:6512:224b:b0:553:2357:288c with SMTP id
 2adb3069b0e04-5550b8802b9mr3716438e87.17.1751219815659; Sun, 29 Jun 2025
 10:56:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250624150645.1107002-1-masahiroy@kernel.org> <20250624150645.1107002-54-masahiroy@kernel.org>
In-Reply-To: <20250624150645.1107002-54-masahiroy@kernel.org>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Mon, 30 Jun 2025 02:56:19 +0900
X-Gmail-Original-Message-ID: <CAK7LNARxjFmzeP8-B3JcUbYaiJF_cKe_VNbX_f-WYqW4E3mbNg@mail.gmail.com>
X-Gm-Features: Ac12FXzYgM9YmpmkL2XngL2KPWknsLFqr1Iruax6yNWjhAOwa1iey2vj2I48sbE
Message-ID: <CAK7LNARxjFmzeP8-B3JcUbYaiJF_cKe_VNbX_f-WYqW4E3mbNg@mail.gmail.com>
Subject: Re: [PATCH 53/66] kconfig: gconf: use size_allocate event handler
To: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 25, 2025 at 12:09=E2=80=AFAM Masahiro Yamada <masahiroy@kernel.=
org> wrote:
>
> The size_request event is not available in GTK 3. Use the size_allocate
> event handler instead.
>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---

This has a regression - with this, we cannot move
the horizontal separator between in the right pane.

I will use the "configure-event" event instead.

>
>  scripts/kconfig/gconf.c | 20 ++++++--------------
>  1 file changed, 6 insertions(+), 14 deletions(-)
>
> diff --git a/scripts/kconfig/gconf.c b/scripts/kconfig/gconf.c
> index b86d54c222e3..6487d6a0dd9d 100644
> --- a/scripts/kconfig/gconf.c
> +++ b/scripts/kconfig/gconf.c
> @@ -660,21 +660,13 @@ static void on_window1_destroy(GtkObject *object, g=
pointer user_data)
>         gtk_main_quit();
>  }
>
> -static void on_window1_size_request(GtkWidget *widget,
> -                                   GtkRequisition *requisition,
> +static void on_window_size_allocate(GtkWidget *widget,
> +                                   GtkAllocation *allocation,
>                                     gpointer user_data)
>  {
> -       static gint old_h;
> -       gint w, h;
> +       gint h;
>
> -       if (widget->window =3D=3D NULL)
> -               gtk_window_get_default_size(GTK_WINDOW(main_wnd), &w, &h)=
;
> -       else
> -               gdk_window_get_size(widget->window, &w, &h);
> -
> -       if (h =3D=3D old_h)
> -               return;
> -       old_h =3D h;
> +       h =3D allocation->height;
>
>         gtk_paned_set_position(GTK_PANED(vpaned), 2 * h / 3);
>  }
> @@ -1000,8 +992,8 @@ static void init_main_window(const gchar *glade_file=
)
>         main_wnd =3D glade_xml_get_widget(xml, "window1");
>         g_signal_connect(main_wnd, "destroy",
>                          G_CALLBACK(on_window1_destroy), NULL);
> -       g_signal_connect(main_wnd, "size_request",
> -                        G_CALLBACK(on_window1_size_request), NULL);
> +       g_signal_connect(main_wnd, "size_allocate",
> +                        G_CALLBACK(on_window_size_allocate), NULL);
>         g_signal_connect(main_wnd, "delete_event",
>                          G_CALLBACK(on_window1_delete_event), NULL);
>
> --
> 2.43.0
>


--=20
Best Regards
Masahiro Yamada

