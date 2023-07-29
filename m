Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 643A1767D68
	for <lists+linux-kbuild@lfdr.de>; Sat, 29 Jul 2023 11:01:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229379AbjG2JBP (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 29 Jul 2023 05:01:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39656 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229602AbjG2JBO (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 29 Jul 2023 05:01:14 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 99C813C3B
        for <linux-kbuild@vger.kernel.org>; Sat, 29 Jul 2023 02:01:13 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 2642760A58
        for <linux-kbuild@vger.kernel.org>; Sat, 29 Jul 2023 09:01:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88F37C433CB
        for <linux-kbuild@vger.kernel.org>; Sat, 29 Jul 2023 09:01:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1690621272;
        bh=3As7/Dk1eWX0duHVhscC9jt41O9v85bO7e1z1l0EEQw=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=dXg8klvU05PMskmyy3PVdlPQ04xu+0wJu+BV2KrnZzhLYGHjwsEOy2jjhMX+Ya5Xj
         FrCg0VidG3GQlDuFxZsgylejUoX0zKE/wB9zDQ+7jEX5klNnkHnA2B9eoTeWvrM6jQ
         sWkSG0av5C+y4rovrVW9nfj0vZukX78So3nN7vBd1OepuEMyori6lbLjqbV5tIwt7e
         sWbOKMoIMQVxB7m/MHPC1nzxexoyLCvwIVk/fqs710fQIRBpzeIzgJFl24iqRsgl8Z
         CgoezaXw4RM5YxLZpTDqCA9VdIRN3/hJpT8XSaiMPLUNRnC5sqgytA6Pp5RVzuVsLh
         4fHizr3rP1XBg==
Received: by mail-oa1-f41.google.com with SMTP id 586e51a60fabf-1bb7e083783so2237651fac.2
        for <linux-kbuild@vger.kernel.org>; Sat, 29 Jul 2023 02:01:12 -0700 (PDT)
X-Gm-Message-State: ABy/qLbiEIfnFLiQGiin7EhGX5fQDCayQmFBv+8pibAEJ9GiU/N+XHlw
        GlPHZifSb8bRdKQ/00ZoaN96vbhkSThi/Flxuig=
X-Google-Smtp-Source: APBJJlGlcm1lDBeVfE0HBXs/PCOUdAGNuZnCawCEyij8jiy2Z7ENVL+zQQtwfuG9jcFt1lROtffPkRQQXucrjYrlEq4=
X-Received: by 2002:a05:6870:784:b0:1b0:73e0:97eb with SMTP id
 en4-20020a056870078400b001b073e097ebmr5517412oab.30.1690621271752; Sat, 29
 Jul 2023 02:01:11 -0700 (PDT)
MIME-Version: 1.0
References: <20230725144652.1092016-1-Mr.Bossman075@gmail.com>
In-Reply-To: <20230725144652.1092016-1-Mr.Bossman075@gmail.com>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Sat, 29 Jul 2023 18:00:35 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQgAZJD7uFGe7S9Q0D60vF8g=0cP5+EKcOBrNQOEtZMEQ@mail.gmail.com>
Message-ID: <CAK7LNAQgAZJD7uFGe7S9Q0D60vF8g=0cP5+EKcOBrNQOEtZMEQ@mail.gmail.com>
Subject: Re: [PATCH v2] scripts: kconfig: nconf: Add search jump feature
To:     Jesse Taube <mr.bossman075@gmail.com>
Cc:     linux-kbuild@vger.kernel.org, Randy Dunlap <rdunlap@infradead.org>,
        Stephen Boyd <sboyd@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, Jul 25, 2023 at 11:46=E2=80=AFPM Jesse Taube <mr.bossman075@gmail.c=
om> wrote:
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
>  Use get_line insead of creating new function.
>  Use Masahiro Yamada's new jump search implementation.
> ---


Looks almost good to me.
Just a few nits.


>
>  static void search_conf(void)
>  {
> @@ -693,6 +750,7 @@ static void search_conf(void)
>         struct gstr title;
>         char *dialog_input;
>         int dres;
> +       bool again =3D false;


I think the initializer '=3D false' is unneeded.




> +
> +/* layman's scrollable window... */
> +int show_scroll_win_ext(WINDOW *main_window, const char *title, char *te=
xt,
> +                       extra_key_cb_fn extra_key_cb, void *data)
>  {
>         int res;
>         int total_lines =3D get_line_no(text);
>         int x, y, lines, columns;
>         int start_x =3D 0, start_y =3D 0;
>         int text_lines =3D 0, text_cols =3D 0;
> +       int start, end;


Maybe these should be size_t for consistency
with the prototype of handle_search_keys().
(and that is what you pointed out before)





--=20
Best Regards
Masahiro Yamada
