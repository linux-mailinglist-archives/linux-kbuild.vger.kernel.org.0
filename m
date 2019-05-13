Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BEF661AEF0
	for <lists+linux-kbuild@lfdr.de>; Mon, 13 May 2019 04:32:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727311AbfEMCcO (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sun, 12 May 2019 22:32:14 -0400
Received: from conssluserg-02.nifty.com ([210.131.2.81]:36599 "EHLO
        conssluserg-02.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727118AbfEMCcN (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 12 May 2019 22:32:13 -0400
Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com [209.85.217.47]) (authenticated)
        by conssluserg-02.nifty.com with ESMTP id x4D2VvkW009922;
        Mon, 13 May 2019 11:31:58 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-02.nifty.com x4D2VvkW009922
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1557714718;
        bh=Zsi54OSUGNcpYm5K99Z8vy92oXo87cVf0tHTBDx1LhA=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=qXuUlB3SVwHfwTd7LV6G81NMKbTnFLS0H5Nh/rja+Peirp/tZ8CGyXFqDg+DjOxgD
         IzJkh1LtCeqGBP3qNXz7E6A37uFn3YRvcEvoEPtnYyprOra6cOdLAKnDQQAEXfyLRm
         zSM0/gbmN1nObM3CZ2Na+uFaTWtqu9bz1NLruekZaFmIcKehS1FZ+I+RENuVREkpgl
         6FAL/ej66R03aWcEdZ9zXInoU/3wVP6PYvY5ObUzNMM7DZL1UACY1QKBbNwraFsqFJ
         Rb2ilqPNnTaaNzv0Rf5fpfuThtNCABV4YCuk5AZM7KcLGhAZBluFd6D/f9msCUvL8s
         xJDWly6f6Fx9A==
X-Nifty-SrcIP: [209.85.217.47]
Received: by mail-vs1-f47.google.com with SMTP id o5so754694vsq.4;
        Sun, 12 May 2019 19:31:57 -0700 (PDT)
X-Gm-Message-State: APjAAAVp02jHmNJuN5QHLqI2ZqV2qLS/ffkdRyCKJu5NREJ9UbN2gQ1f
        gs8gLPCFoF+vyh5zejrltnPMYEyF5gDoaDK7wG0=
X-Google-Smtp-Source: APXvYqwznu7NWBF7htgakLGGukXxEvzXZOocCoKurpeQeezxk/Kh5cpfs4oRN3hVPkHjR3s0GN4jRYEWOvKiGU/GUSA=
X-Received: by 2002:a67:db8b:: with SMTP id f11mr12581079vsk.155.1557714716867;
 Sun, 12 May 2019 19:31:56 -0700 (PDT)
MIME-Version: 1.0
References: <1557507361-7418-1-git-send-email-yamada.masahiro@socionext.com>
In-Reply-To: <1557507361-7418-1-git-send-email-yamada.masahiro@socionext.com>
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
Date:   Mon, 13 May 2019 11:31:21 +0900
X-Gmail-Original-Message-ID: <CAK7LNATXs4Cr_2zwX08dd7xE84JaG6K6LF3YXA1=aFNVYji2Ew@mail.gmail.com>
Message-ID: <CAK7LNATXs4Cr_2zwX08dd7xE84JaG6K6LF3YXA1=aFNVYji2Ew@mail.gmail.com>
Subject: Re: [PATCH] kconfig: make parent directories for the saved .config as needed
To:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Sat, May 11, 2019 at 1:56 AM Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:
>
> With menuconfig / nconfig, users can input any file path from the
> "Save" menu, but it fails if the parent directory does not exist.
>
> Why not create the parent directory automatically. I think this is
> a user-friendly behavior.
>
> I changed the error messages in menuconfig / nconfig.
>
> "Nonexistent directory" is no longer the most likely reason of the
> failure. Perhaps, the user specified the existing directory, or
> attempted to write to the location without write permission.
>
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> ---

Applied to linux-kbuild.


>  scripts/kconfig/confdata.c | 3 +++
>  scripts/kconfig/mconf.c    | 2 +-
>  scripts/kconfig/nconf.c    | 3 +--
>  3 files changed, 5 insertions(+), 3 deletions(-)
>
> diff --git a/scripts/kconfig/confdata.c b/scripts/kconfig/confdata.c
> index 431b805..b7bdd96 100644
> --- a/scripts/kconfig/confdata.c
> +++ b/scripts/kconfig/confdata.c
> @@ -881,6 +881,9 @@ int conf_write(const char *name)
>                 return -1;
>         }
>
> +       if (make_parent_dir(name))
> +               return -1;
> +
>         env = getenv("KCONFIG_OVERWRITECONFIG");
>         if (env && *env) {
>                 *tmpname = 0;
> diff --git a/scripts/kconfig/mconf.c b/scripts/kconfig/mconf.c
> index 5f8c82a..694091f 100644
> --- a/scripts/kconfig/mconf.c
> +++ b/scripts/kconfig/mconf.c
> @@ -936,7 +936,7 @@ static void conf_save(void)
>                                 set_config_filename(dialog_input_result);
>                                 return;
>                         }
> -                       show_textbox(NULL, "Can't create file!  Probably a nonexistent directory.", 5, 60);
> +                       show_textbox(NULL, "Can't create file!", 5, 60);
>                         break;
>                 case 1:
>                         show_helptext("Save Alternate Configuration", save_config_help);
> diff --git a/scripts/kconfig/nconf.c b/scripts/kconfig/nconf.c
> index ac92c0d..cbafe3b 100644
> --- a/scripts/kconfig/nconf.c
> +++ b/scripts/kconfig/nconf.c
> @@ -1438,8 +1438,7 @@ static void conf_save(void)
>                                 set_config_filename(dialog_input_result);
>                                 return;
>                         }
> -                       btn_dialog(main_window, "Can't create file! "
> -                               "Probably a nonexistent directory.",
> +                       btn_dialog(main_window, "Can't create file!",
>                                 1, "<OK>");
>                         break;
>                 case 1:
> --
> 2.7.4
>


-- 
Best Regards
Masahiro Yamada
