Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C786E774FF3
	for <lists+linux-kbuild@lfdr.de>; Wed,  9 Aug 2023 02:44:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229970AbjHIAoL (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 8 Aug 2023 20:44:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55644 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229904AbjHIAoK (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 8 Aug 2023 20:44:10 -0400
Received: from mail-ot1-x32c.google.com (mail-ot1-x32c.google.com [IPv6:2607:f8b0:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7404119BE
        for <linux-kbuild@vger.kernel.org>; Tue,  8 Aug 2023 17:44:09 -0700 (PDT)
Received: by mail-ot1-x32c.google.com with SMTP id 46e09a7af769-6bcade59b24so4914822a34.0
        for <linux-kbuild@vger.kernel.org>; Tue, 08 Aug 2023 17:44:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691541848; x=1692146648;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z4Vi3aTzUB12cGNvveZLYU48iDTjb6nIKgJNjqAibfg=;
        b=D2C2mx8zSJ7keRQlTNknXJcj6J6hgw1P3ZP6R5KBNMxoRaWK+b2U1tVj3o/Vl5/O7Q
         9Ky1oJMdfLaempqyFnPunSaNkUf6R1I2V6agkqZRpXIJESvgnEUEVnemVrp5i9q1Vsr2
         V3XnycUZC/K0jw1nBiTV7fQIH7oppS/QqktZRM9Nl1aj76t0bUiNd9FYfvKnddYhwJuC
         fs4ib5diwu1gg7cPktGagRwj//rPqPZn1tqmuCKn6FuTUgrTRX+8EbLZ2hRPiol/8bkd
         t8yLozHmIWJlWJY1/nLiXyyehj5YKEdh/HJ7+oF8ynUownzj0nMJnTzCnWJcKilU8p7U
         wPWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691541848; x=1692146648;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Z4Vi3aTzUB12cGNvveZLYU48iDTjb6nIKgJNjqAibfg=;
        b=PNGgelBezbsd1MZYhifHmpKtzGL/fUFwG+ULMacWbhefo0kD9DgKnnkJYXwCIm8T4g
         AXuRSVvs4//7ihHc/BBTRyBKkHIvRfaVPag9ziaS7nTedvCgHHsR6eamnxk2wLUp96co
         4aDi9CU7neY92wph+ACerxiyqu0RY6Vg9Tb/wJMcTZva16cJVMVP78OsUgV807CX1g2c
         lbVKbqrllwO/krVGDhBGlpah7pVtoHgMdKp+NEj/jAkjiYs2wlhMSPlgIQYzGDdSx0kc
         TKa8UENMxR0q/8D6w4y3EaHfMBU0gngiEkY7atc9JhapzNwARMuFKKsyNk81aKAJ1UYc
         EEwg==
X-Gm-Message-State: AOJu0Yz5SEjqOy/naFvQHOL+Gauo4hf0RY1txqKduBvPtx6znH5N4z5k
        /O+gsuA3GJ2OANq0neg/RdHbbvgcPnGWf1hGs7GSo7w7
X-Google-Smtp-Source: AGHT+IHI9Ehri5nSWrBFgcpRHbpgIfjqQudr5vRsOx+UjbIVJJ5/NJbaIQJKIQzlrDF2VkA7n5gaIKAfVbThgG+0gQA=
X-Received: by 2002:a05:6870:5491:b0:1b4:4935:653f with SMTP id
 f17-20020a056870549100b001b44935653fmr1575590oan.49.1691541848291; Tue, 08
 Aug 2023 17:44:08 -0700 (PDT)
MIME-Version: 1.0
References: <20230809004220.1884118-1-Mr.Bossman075@gmail.com>
In-Reply-To: <20230809004220.1884118-1-Mr.Bossman075@gmail.com>
From:   Jesse T <mr.bossman075@gmail.com>
Date:   Tue, 8 Aug 2023 20:43:56 -0400
Message-ID: <CAJFTR8Rx6KicumuvzPAqz7poHD_-rST117JYBocBrENp5ndKWQ@mail.gmail.com>
Subject: Re: [PATCH v4] kconfig: nconf: Add search jump feature
To:     linux-kbuild@vger.kernel.org
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Randy Dunlap <rdunlap@infradead.org>,
        Stephen Boyd <sboyd@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, Aug 8, 2023 at 8:42=E2=80=AFPM Jesse Taube <mr.bossman075@gmail.com=
> wrote:
>
> From: Jesse Taube <mr.bossman075@gmail.com>
>
> Menuconfig has a feature where you can "press the key in the (#) prefix
> to jump directly to that location. You will be returned to the current
> search results after exiting this new menu."
>
> This commit adds this feature to nconfig, with almost identical code.
>
> Signed-off-by: Jesse Taube <Mr.Bossman075@gmail.com>
> ---
> v1->v2:
>  Add selected_conf to go to menu and select a specific option.
>  Use get_line instead of creating new function.
>  Use Masahiro Yamada's new jump search implementation.
> v2->v3:
>  Change `start, end` to size_t and move scope to if
>  Removed redundant assignment of `again` to false.
> v3->v4:
>  Remove unnecessary size_t cast
>  Use ncurses to find line index in selected_conf

@randy can you please test this as well.

Thanks,
Jesse Taube
> ---
>  scripts/kconfig/nconf.c     | 113 ++++++++++++++++++++++++++++++++----
>  scripts/kconfig/nconf.gui.c |  37 ++++++++++--
>  scripts/kconfig/nconf.h     |   5 ++
>  3 files changed, 140 insertions(+), 15 deletions(-)
>
> diff --git a/scripts/kconfig/nconf.c b/scripts/kconfig/nconf.c
> index 3ba8b1af390f..143a2c351d57 100644
> --- a/scripts/kconfig/nconf.c
> +++ b/scripts/kconfig/nconf.c
> @@ -220,7 +220,7 @@ search_help[] =3D
>  "Location:\n"
>  "  -> Bus options (PCI, PCMCIA, EISA, ISA)\n"
>  "    -> PCI support (PCI [ =3D y])\n"
> -"      -> PCI access mode (<choice> [ =3D y])\n"
> +"(1)   -> PCI access mode (<choice> [ =3D y])\n"
>  "Selects: LIBCRC32\n"
>  "Selected by: BAR\n"
>  "-----------------------------------------------------------------\n"
> @@ -231,9 +231,13 @@ search_help[] =3D
>  "o  The 'Depends on:' line lists symbols that need to be defined for\n"
>  "   this symbol to be visible and selectable in the menu.\n"
>  "o  The 'Location:' lines tell, where in the menu structure this symbol\=
n"
> -"   is located.  A location followed by a [ =3D y] indicates that this i=
s\n"
> -"   a selectable menu item, and the current value is displayed inside\n"
> -"   brackets.\n"
> +"   is located.\n"
> +"     A location followed by a [ =3D y] indicates that this is\n"
> +"     a selectable menu item, and the current value is displayed inside\=
n"
> +"     brackets.\n"
> +"     Press the key in the (#) prefix to jump directly to that\n"
> +"     location. You will be returned to the current search results\n"
> +"     after exiting this new menu.\n"
>  "o  The 'Selects:' line tells, what symbol will be automatically selecte=
d\n"
>  "   if this symbol is selected (y or m).\n"
>  "o  The 'Selected by' line tells what symbol has selected this symbol.\n=
"
> @@ -275,7 +279,9 @@ static const char *current_instructions =3D menu_inst=
ructions;
>
>  static char *dialog_input_result;
>  static int dialog_input_result_len;
> +static int jump_key_char;
>
> +static void selected_conf(struct menu *menu, struct menu *active_menu);
>  static void conf(struct menu *menu);
>  static void conf_choice(struct menu *menu);
>  static void conf_string(struct menu *menu);
> @@ -685,6 +691,57 @@ static int do_exit(void)
>         return 0;
>  }
>
> +struct search_data {
> +       struct list_head *head;
> +       struct menu *target;
> +};
> +
> +static int next_jump_key(int key)
> +{
> +       if (key < '1' || key > '9')
> +               return '1';
> +
> +       key++;
> +
> +       if (key > '9')
> +               key =3D '1';
> +
> +       return key;
> +}
> +
> +static int handle_search_keys(int key, size_t start, size_t end, void *_=
data)
> +{
> +       struct search_data *data =3D _data;
> +       struct jump_key *pos;
> +       int index =3D 0;
> +
> +       if (key < '1' || key > '9')
> +               return 0;
> +
> +       list_for_each_entry(pos, data->head, entries) {
> +               index =3D next_jump_key(index);
> +
> +               if (pos->offset < start)
> +                       continue;
> +
> +               if (pos->offset >=3D end)
> +                       break;
> +
> +               if (key =3D=3D index) {
> +                       data->target =3D pos->target;
> +                       return 1;
> +               }
> +       }
> +
> +       return 0;
> +}
> +
> +int get_jump_key_char(void)
> +{
> +       jump_key_char =3D next_jump_key(jump_key_char);
> +
> +       return jump_key_char;
> +}
>
>  static void search_conf(void)
>  {
> @@ -692,7 +749,8 @@ static void search_conf(void)
>         struct gstr res;
>         struct gstr title;
>         char *dialog_input;
> -       int dres;
> +       int dres, vscroll =3D 0, hscroll =3D 0;
> +       bool again;
>
>         title =3D str_new();
>         str_printf( &title, "Enter (sub)string or regexp to search for "
> @@ -721,11 +779,28 @@ static void search_conf(void)
>                 dialog_input +=3D strlen(CONFIG_);
>
>         sym_arr =3D sym_re_search(dialog_input);
> -       res =3D get_relations_str(sym_arr, NULL);
> +
> +       do {
> +               LIST_HEAD(head);
> +               struct search_data data =3D {
> +                       .head =3D &head,
> +                       .target =3D NULL,
> +               };
> +               jump_key_char =3D 0;
> +               res =3D get_relations_str(sym_arr, &head);
> +               dres =3D show_scroll_win_ext(main_window,
> +                               "Search Results", str_get(&res),
> +                               &vscroll, &hscroll,
> +                               handle_search_keys, &data);
> +               again =3D false;
> +               if (dres >=3D '1' && dres <=3D '9') {
> +                       assert(data.target !=3D NULL);
> +                       selected_conf(data.target->parent, data.target);
> +                       again =3D true;
> +               }
> +               str_free(&res);
> +       } while (again);
>         free(sym_arr);
> -       show_scroll_win(main_window,
> -                       "Search Results", str_get(&res));
> -       str_free(&res);
>         str_free(&title);
>  }
>
> @@ -1062,10 +1137,15 @@ static int do_match(int key, struct match_state *=
state, int *ans)
>  }
>
>  static void conf(struct menu *menu)
> +{
> +       selected_conf(menu, NULL);
> +}
> +
> +static void selected_conf(struct menu *menu, struct menu *active_menu)
>  {
>         struct menu *submenu =3D NULL;
>         struct symbol *sym;
> -       int res;
> +       int i, res;
>         int current_index =3D 0;
>         int last_top_row =3D 0;
>         struct match_state match_state =3D {
> @@ -1081,6 +1161,19 @@ static void conf(struct menu *menu)
>                 if (!child_count)
>                         break;
>
> +               if (active_menu !=3D NULL) {
> +                       for (i =3D 0; i < items_num; i++) {
> +                               struct mitem *mcur;
> +
> +                               mcur =3D (struct mitem *) item_userptr(cu=
rses_menu_items[i]);
> +                               if ((struct menu *) mcur->usrptr =3D=3D a=
ctive_menu) {
> +                                       current_index =3D i;
> +                                       break;
> +                               }
> +                       }
> +                       active_menu =3D NULL;
> +               }
> +
>                 show_menu(menu_get_prompt(menu), menu_instructions,
>                           current_index, &last_top_row);
>                 keypad((menu_win(curses_menu)), TRUE);
> diff --git a/scripts/kconfig/nconf.gui.c b/scripts/kconfig/nconf.gui.c
> index 9aedf40f1dc0..25a7263ef3c8 100644
> --- a/scripts/kconfig/nconf.gui.c
> +++ b/scripts/kconfig/nconf.gui.c
> @@ -497,10 +497,17 @@ void refresh_all_windows(WINDOW *main_window)
>         refresh();
>  }
>
> -/* layman's scrollable window... */
>  void show_scroll_win(WINDOW *main_window,
>                 const char *title,
>                 const char *text)
> +{
> +       (void)show_scroll_win_ext(main_window, title, (char *)text, NULL,=
 NULL, NULL, NULL);
> +}
> +
> +/* layman's scrollable window... */
> +int show_scroll_win_ext(WINDOW *main_window, const char *title, char *te=
xt,
> +                       int *vscroll, int *hscroll,
> +                       extra_key_cb_fn extra_key_cb, void *data)
>  {
>         int res;
>         int total_lines =3D get_line_no(text);
> @@ -514,6 +521,12 @@ void show_scroll_win(WINDOW *main_window,
>         WINDOW *win;
>         WINDOW *pad;
>         PANEL *panel;
> +       bool done =3D false;
> +
> +       if (hscroll)
> +               start_x =3D *hscroll;
> +       if (vscroll)
> +               start_y =3D *vscroll;
>
>         getmaxyx(stdscr, lines, columns);
>
> @@ -549,8 +562,7 @@ void show_scroll_win(WINDOW *main_window,
>         panel =3D new_panel(win);
>
>         /* handle scrolling */
> -       do {
> -
> +       while (!done) {
>                 copywin(pad, win, start_y, start_x, 2, 2, text_lines,
>                                 text_cols, 0);
>                 print_in_middle(win,
> @@ -593,8 +605,18 @@ void show_scroll_win(WINDOW *main_window,
>                 case 'l':
>                         start_x++;
>                         break;
> +               default:
> +                       if (extra_key_cb) {
> +                               size_t start =3D (get_line(text, start_y)=
 - text);
> +                               size_t end =3D (get_line(text, start_y + =
text_lines) - text);
> +
> +                               if (extra_key_cb(res, start, end, data)) =
{
> +                                       done =3D true;
> +                                       break;
> +                               }
> +                       }
>                 }
> -               if (res =3D=3D 10 || res =3D=3D 27 || res =3D=3D 'q' ||
> +               if (res =3D=3D 0 || res =3D=3D 10 || res =3D=3D 27 || res=
 =3D=3D 'q' ||
>                         res =3D=3D KEY_F(F_HELP) || res =3D=3D KEY_F(F_BA=
CK) ||
>                         res =3D=3D KEY_F(F_EXIT))
>                         break;
> @@ -606,9 +628,14 @@ void show_scroll_win(WINDOW *main_window,
>                         start_x =3D 0;
>                 if (start_x >=3D total_cols-text_cols)
>                         start_x =3D total_cols-text_cols;
> -       } while (res);
> +       }
>
> +       if (hscroll)
> +               *hscroll =3D start_x;
> +       if (vscroll)
> +               *vscroll =3D start_y;
>         del_panel(panel);
>         delwin(win);
>         refresh_all_windows(main_window);
> +       return res;
>  }
> diff --git a/scripts/kconfig/nconf.h b/scripts/kconfig/nconf.h
> index 6f925bc74eb3..ab836d582664 100644
> --- a/scripts/kconfig/nconf.h
> +++ b/scripts/kconfig/nconf.h
> @@ -67,6 +67,8 @@ typedef enum {
>
>  void set_colors(void);
>
> +typedef int (*extra_key_cb_fn)(int, size_t, size_t, void *);
> +
>  /* this changes the windows attributes !!! */
>  void print_in_middle(WINDOW *win, int y, int width, const char *str, int=
 attrs);
>  int get_line_length(const char *line);
> @@ -78,6 +80,9 @@ int dialog_inputbox(WINDOW *main_window,
>                 const char *title, const char *prompt,
>                 const char *init, char **resultp, int *result_len);
>  void refresh_all_windows(WINDOW *main_window);
> +int show_scroll_win_ext(WINDOW *main_window, const char *title, char *te=
xt,
> +                       int *vscroll, int *hscroll,
> +                       extra_key_cb_fn extra_key_cb, void *data);
>  void show_scroll_win(WINDOW *main_window,
>                 const char *title,
>                 const char *text);
> --
> 2.40.0
>
