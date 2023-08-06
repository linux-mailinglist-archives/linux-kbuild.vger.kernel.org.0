Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 13D7977135D
	for <lists+linux-kbuild@lfdr.de>; Sun,  6 Aug 2023 05:20:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229544AbjHFDUj (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 5 Aug 2023 23:20:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58062 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229468AbjHFDUi (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 5 Aug 2023 23:20:38 -0400
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com [IPv6:2607:f8b0:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2025B1FE1
        for <linux-kbuild@vger.kernel.org>; Sat,  5 Aug 2023 20:20:36 -0700 (PDT)
Received: by mail-pg1-x532.google.com with SMTP id 41be03b00d2f7-563e21a6011so2475069a12.0
        for <linux-kbuild@vger.kernel.org>; Sat, 05 Aug 2023 20:20:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691292035; x=1691896835;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1l5PpttEWgTbTiDqutcx7xzkKoPKzCAMtPG7TkBUcIk=;
        b=U0JA7ov3qbXjfk9Jm+wN+CLBpEtJwLTRyV4VeoZFM5Zn+wJ6qW+JIoCvwaVUuW1laI
         gosNoq6YJB0Ev+W1mBtn+0cPL74MR2lp6MQubyu5exhiwGVmMu/SQWpvMq4a6Vy0nqdT
         qw6SPO+jLxoZZZ6jZ5VhlOx4EgE9ZRJV4520u8aAWFDCNGaMcIrABNAFlxkitzKCedEU
         KXU+ns+BOpCeUee7MNEnFCowpjNuv14ntku970ACBe7njqDsPkR1FsFrxsJw2zG0TCop
         YThaIAV1b9eDKcdJ+9tBNb1YvDWzPylSeZ7gULJnvtsm03V5cxN1ZCt5x6+8mGa//XK+
         v+og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691292035; x=1691896835;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1l5PpttEWgTbTiDqutcx7xzkKoPKzCAMtPG7TkBUcIk=;
        b=P0D7SgmuAfZIVO/6ajtK7XzSUnsfcpzFJ9E50hcTl1M/YUIvUnmzquAUaYl8/wCKq3
         kCaxx02dgrnTuS84ufOispktPAH4IpOKbxA8gLr0evAbtY9PKAsXSd6zxCofpUCGirkL
         sQ7mAlFpf1r7GPb1LU2tzTu1ojWcXpBainhsVUD+dk+Msn8pg9RzWQ4PyY3XAfcHpFlN
         93pnJLclNzJ2FkSm3n/FTDX5OdsZxn0oJqiryC7FrltzIxGno+SeN5rP6KUQMYp2bEnD
         pPx9KLG091gGDi7JU4lVh6mXd9SSgST1dFdGMqMrjNWaVw8ltGPwxF5OAI3RiDuOSA39
         iNIg==
X-Gm-Message-State: AOJu0YwGGUl4KviM4sq7lvf5/AhCsbCsgUlePXG7BmAFrsebIrxWUxiS
        yIR2ICaCaUJq5qIj6lKNch5jqG9jnrI8gsDs/GAgtLbi31s=
X-Google-Smtp-Source: AGHT+IFyT1lN5P+5BkNgdGRs9V1XZpCDulXTBDc5Q96DgOrVCnM2ZtHP72ebR8PD+1RtecHjZrDS2HaX8JtYXRjycJ0=
X-Received: by 2002:a17:90a:ea0a:b0:263:2335:594e with SMTP id
 w10-20020a17090aea0a00b002632335594emr5826465pjy.38.1691292035213; Sat, 05
 Aug 2023 20:20:35 -0700 (PDT)
MIME-Version: 1.0
References: <20230806031658.1656667-1-Mr.Bossman075@gmail.com>
In-Reply-To: <20230806031658.1656667-1-Mr.Bossman075@gmail.com>
From:   Jesse T <mr.bossman075@gmail.com>
Date:   Sat, 5 Aug 2023 23:20:24 -0400
Message-ID: <CAJFTR8QZDxhmyDewqsuOmVUHDvspw-W_wbNAFAQ+MUpr3pwhBQ@mail.gmail.com>
Subject: Re: [PATCH v1] kconfig: nconf: Keep position after jump search
To:     linux-kbuild@vger.kernel.org
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Randy Dunlap <rdunlap@infradead.org>,
        Stephen Boyd <sboyd@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Please ignore this email refer to v2

On Sat, Aug 5, 2023 at 11:16=E2=80=AFPM Jesse Taube <mr.bossman075@gmail.co=
m> wrote:
>
> In this Menuconfig, pressing the key in the (#) prefix will jump
> directly to that location. You will be returned to the current search
> results after exiting this new menu.
>
> In nconfig, exiting always returns to the top of the search output, not
> to where the (#) was displayed on the search output screen.
>
> This patch fixes that by saving the current position in the search.
>
> Reported-by: Randy Dunlap <rdunlap@infradead.org>
> Link: https://lore.kernel.org/r/20230805034445.2508362-1-Mr.Bossman075@gm=
ail.com/
> Signed-off-by: Jesse Taube <Mr.Bossman075@gmail.com>
> ---
>  scripts/kconfig/nconf.c     |  3 ++-
>  scripts/kconfig/nconf.gui.c | 12 +++++++++++-
>  scripts/kconfig/nconf.h     |  1 +
>  3 files changed, 14 insertions(+), 2 deletions(-)
>
> diff --git a/scripts/kconfig/nconf.c b/scripts/kconfig/nconf.c
> index 172dc8fdd3ef..536332286c2f 100644
> --- a/scripts/kconfig/nconf.c
> +++ b/scripts/kconfig/nconf.c
> @@ -749,7 +749,7 @@ static void search_conf(void)
>         struct gstr res;
>         struct gstr title;
>         char *dialog_input;
> -       int dres;
> +       int dres, vscroll =3D 0, hscroll =3D 0;
>         bool again;
>
>         title =3D str_new();
> @@ -790,6 +790,7 @@ static void search_conf(void)
>                 res =3D get_relations_str(sym_arr, &head);
>                 dres =3D show_scroll_win_ext(main_window,
>                                 "Search Results", str_get(&res),
> +                               &vscroll, &hscroll,
>                                 handle_search_keys, &data);
>                 again =3D false;
>                 if (dres >=3D '1' && dres <=3D '9') {
> diff --git a/scripts/kconfig/nconf.gui.c b/scripts/kconfig/nconf.gui.c
> index bf015895053c..a3f7c921d6c2 100644
> --- a/scripts/kconfig/nconf.gui.c
> +++ b/scripts/kconfig/nconf.gui.c
> @@ -501,11 +501,12 @@ void show_scroll_win(WINDOW *main_window,
>                 const char *title,
>                 const char *text)
>  {
> -       (void)show_scroll_win_ext(main_window, title, (char *)text, NULL,=
 NULL);
> +       (void)show_scroll_win_ext(main_window, title, NULL, NULL, (char *=
)text, NULL, NULL);
>  }
>
>  /* layman's scrollable window... */
>  int show_scroll_win_ext(WINDOW *main_window, const char *title, char *te=
xt,
> +                       int *vscroll, int *hscroll,
>                         extra_key_cb_fn extra_key_cb, void *data)
>  {
>         int res;
> @@ -522,6 +523,11 @@ int show_scroll_win_ext(WINDOW *main_window, const c=
har *title, char *text,
>         PANEL *panel;
>         bool done =3D false;
>
> +       if (hscroll)
> +               start_x =3D *hscroll;
> +       if (vscroll)
> +               start_y =3D *vscroll;
> +
>         getmaxyx(stdscr, lines, columns);
>
>         /* find the widest line of msg: */
> @@ -624,6 +630,10 @@ int show_scroll_win_ext(WINDOW *main_window, const c=
har *title, char *text,
>                         start_x =3D total_cols-text_cols;
>         }
>
> +       if (hscroll)
> +               *hscroll =3D start_x;
> +       if (vscroll)
> +               *vscroll =3D start_y;
>         del_panel(panel);
>         delwin(win);
>         refresh_all_windows(main_window);
> diff --git a/scripts/kconfig/nconf.h b/scripts/kconfig/nconf.h
> index 912f668c5772..ab836d582664 100644
> --- a/scripts/kconfig/nconf.h
> +++ b/scripts/kconfig/nconf.h
> @@ -81,6 +81,7 @@ int dialog_inputbox(WINDOW *main_window,
>                 const char *init, char **resultp, int *result_len);
>  void refresh_all_windows(WINDOW *main_window);
>  int show_scroll_win_ext(WINDOW *main_window, const char *title, char *te=
xt,
> +                       int *vscroll, int *hscroll,
>                         extra_key_cb_fn extra_key_cb, void *data);
>  void show_scroll_win(WINDOW *main_window,
>                 const char *title,
> --
> 2.40.0
>
