Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E773776B2E3
	for <lists+linux-kbuild@lfdr.de>; Tue,  1 Aug 2023 13:16:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234106AbjHALQE (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 1 Aug 2023 07:16:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49710 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234007AbjHALP1 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 1 Aug 2023 07:15:27 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 372201FD8
        for <linux-kbuild@vger.kernel.org>; Tue,  1 Aug 2023 04:13:07 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id BEDE961545
        for <linux-kbuild@vger.kernel.org>; Tue,  1 Aug 2023 11:13:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D86DC433C8
        for <linux-kbuild@vger.kernel.org>; Tue,  1 Aug 2023 11:13:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1690888386;
        bh=8G2Ci204AS3gNEz/p1V6JmH0fE0VAh6YU9+03VsB4lU=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=iUPe8CAa/LqZa/6s4nhw3Sm4mPW/zzYus1A7pF/Pnt336SFBq0bqFzGLKSqJqlFuM
         i1EPUU0ccNSWpJmiNgTAU4A6cg3wWk8dgjgWWVV4MR3Dx/fqH1yuE/rgDQt4usLka4
         FtG/XzWhPn0TV3O6bACr1cx07UxJrWnyWUXncdzW48GqrvAfyFb5TrbnD6BV2+WJfc
         dQk+wKNqYFBR3h0WlpfdXglcWm/BhTsSm8BPuAGDnORKQL6STpIO5vcfI3vvbutoDO
         ZET500bSiDAGegHMdXrJ1imA8DXYX8pw4pdrlIuXG4NTAFMR2eAoh7Z96sNpGmj7qM
         1uZaS8XQivLtw==
Received: by mail-oo1-f43.google.com with SMTP id 006d021491bc7-56c8757d45bso1996014eaf.2
        for <linux-kbuild@vger.kernel.org>; Tue, 01 Aug 2023 04:13:06 -0700 (PDT)
X-Gm-Message-State: ABy/qLYLZdYeQVa9B4xIl2LABIQKStQ5Mcq5NFEIrKkYWas4JmJIZDnC
        Jd+AmDDATMvF1potJvC0SGnfTT5ZkimuAC2CnGM=
X-Google-Smtp-Source: APBJJlFmhUAhugqo7QOSHmJfx1jJku3+3YGQxeWxaoZfed898ePKnKpIKbaoeDiqm6pp3MXkB5mtpQDbogQKRSeMsGc=
X-Received: by 2002:a4a:7551:0:b0:569:ac56:ca98 with SMTP id
 g17-20020a4a7551000000b00569ac56ca98mr10239098oof.3.1690888385362; Tue, 01
 Aug 2023 04:13:05 -0700 (PDT)
MIME-Version: 1.0
References: <20230730233415.4178504-1-Mr.Bossman075@gmail.com>
In-Reply-To: <20230730233415.4178504-1-Mr.Bossman075@gmail.com>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Tue, 1 Aug 2023 20:12:29 +0900
X-Gmail-Original-Message-ID: <CAK7LNASJvYOVpYV3GY54vT2KALGTd5fPd-qvaqC2ni-Mq_aGZw@mail.gmail.com>
Message-ID: <CAK7LNASJvYOVpYV3GY54vT2KALGTd5fPd-qvaqC2ni-Mq_aGZw@mail.gmail.com>
Subject: Re: [PATCH v3] scripts: kconfig: nconf: Add search jump feature
To:     Jesse Taube <mr.bossman075@gmail.com>
Cc:     linux-kbuild@vger.kernel.org, Randy Dunlap <rdunlap@infradead.org>,
        Stephen Boyd <sboyd@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Mon, Jul 31, 2023 at 8:34=E2=80=AFAM Jesse Taube <mr.bossman075@gmail.co=
m> wrote:
>
> Menuconfig has a feature where you can "press the key in the (#) prefix
> to jump directly to that location. You will be returned to the current
> search results after exiting this new menu."
>
> This commit adds this feature to nconfig, with almost identical code.
>
> Signed-off-by: Jesse Taube <Mr.Bossman075@gmail.com>
> ---


Applied to linux-kbuild. Thanks.


> v1->v2:
>  Add selected_conf to go to menu and select a specific option.
>  Use get_line insead of creating new function.
>  Use Masahiro Yamada's new jump search implementation.
> v2->v3:
>  Change `start, end` to size_t and move scope to if
>  Removed redundant assigment of `again` to false.
> ---
>  scripts/kconfig/nconf.c     | 111 ++++++++++++++++++++++++++++++++----
>  scripts/kconfig/nconf.gui.c |  27 +++++++--
>  scripts/kconfig/nconf.h     |   4 ++
>  3 files changed, 127 insertions(+), 15 deletions(-)
>
> diff --git a/scripts/kconfig/nconf.c b/scripts/kconfig/nconf.c
> index 3ba8b1af390f..172dc8fdd3ef 100644
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
> @@ -693,6 +750,7 @@ static void search_conf(void)
>         struct gstr title;
>         char *dialog_input;
>         int dres;
> +       bool again;
>
>         title =3D str_new();
>         str_printf( &title, "Enter (sub)string or regexp to search for "
> @@ -721,11 +779,27 @@ static void search_conf(void)
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
> @@ -1063,9 +1137,14 @@ static int do_match(int key, struct match_state *s=
tate, int *ans)
>
>  static void conf(struct menu *menu)
>  {
> -       struct menu *submenu =3D NULL;
> +       selected_conf(menu, NULL);
> +}
> +
> +static void selected_conf(struct menu *menu, struct menu *active_menu)
> +{
> +       struct menu *submenu =3D NULL, *child;
>         struct symbol *sym;
> -       int res;
> +       int i, res;
>         int current_index =3D 0;
>         int last_top_row =3D 0;
>         struct match_state match_state =3D {
> @@ -1074,6 +1153,18 @@ static void conf(struct menu *menu)
>                 .pattern =3D "",
>         };
>
> +       if (active_menu !=3D NULL) {
> +               for (i =3D 0, child =3D menu->list; child; child =3D chil=
d->next) {
> +                       if (!show_all_items && !menu_is_visible(child))
> +                               continue;
> +                       if (active_menu =3D=3D child) {
> +                               current_index =3D i;
> +                               break;
> +                       }
> +                       i++;
> +               }
> +       }
> +
>         while (!global_exit) {
>                 reset_menu();
>                 current_menu =3D menu;
> diff --git a/scripts/kconfig/nconf.gui.c b/scripts/kconfig/nconf.gui.c
> index 9aedf40f1dc0..bf015895053c 100644
> --- a/scripts/kconfig/nconf.gui.c
> +++ b/scripts/kconfig/nconf.gui.c
> @@ -497,10 +497,16 @@ void refresh_all_windows(WINDOW *main_window)
>         refresh();
>  }
>
> -/* layman's scrollable window... */
>  void show_scroll_win(WINDOW *main_window,
>                 const char *title,
>                 const char *text)
> +{
> +       (void)show_scroll_win_ext(main_window, title, (char *)text, NULL,=
 NULL);
> +}
> +
> +/* layman's scrollable window... */
> +int show_scroll_win_ext(WINDOW *main_window, const char *title, char *te=
xt,
> +                       extra_key_cb_fn extra_key_cb, void *data)
>  {
>         int res;
>         int total_lines =3D get_line_no(text);
> @@ -514,6 +520,7 @@ void show_scroll_win(WINDOW *main_window,
>         WINDOW *win;
>         WINDOW *pad;
>         PANEL *panel;
> +       bool done =3D false;
>
>         getmaxyx(stdscr, lines, columns);
>
> @@ -549,8 +556,7 @@ void show_scroll_win(WINDOW *main_window,
>         panel =3D new_panel(win);
>
>         /* handle scrolling */
> -       do {
> -
> +       while (!done) {
>                 copywin(pad, win, start_y, start_x, 2, 2, text_lines,
>                                 text_cols, 0);
>                 print_in_middle(win,
> @@ -593,8 +599,18 @@ void show_scroll_win(WINDOW *main_window,
>                 case 'l':
>                         start_x++;
>                         break;
> +               default:
> +                       if (extra_key_cb) {
> +                               size_t start =3D (size_t)(get_line(text, =
start_y) - text);
> +                               size_t end =3D (size_t)(get_line(text, st=
art_y + text_lines) - text);
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
> @@ -606,9 +622,10 @@ void show_scroll_win(WINDOW *main_window,
>                         start_x =3D 0;
>                 if (start_x >=3D total_cols-text_cols)
>                         start_x =3D total_cols-text_cols;
> -       } while (res);
> +       }
>
>         del_panel(panel);
>         delwin(win);
>         refresh_all_windows(main_window);
> +       return res;
>  }
> diff --git a/scripts/kconfig/nconf.h b/scripts/kconfig/nconf.h
> index 6f925bc74eb3..912f668c5772 100644
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
> @@ -78,6 +80,8 @@ int dialog_inputbox(WINDOW *main_window,
>                 const char *title, const char *prompt,
>                 const char *init, char **resultp, int *result_len);
>  void refresh_all_windows(WINDOW *main_window);
> +int show_scroll_win_ext(WINDOW *main_window, const char *title, char *te=
xt,
> +                       extra_key_cb_fn extra_key_cb, void *data);
>  void show_scroll_win(WINDOW *main_window,
>                 const char *title,
>                 const char *text);
> --
> 2.40.0
>


--=20
Best Regards
Masahiro Yamada
