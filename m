Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F2B121DEDCF
	for <lists+linux-kbuild@lfdr.de>; Fri, 22 May 2020 19:02:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730669AbgEVRCd (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 22 May 2020 13:02:33 -0400
Received: from conssluserg-05.nifty.com ([210.131.2.90]:46773 "EHLO
        conssluserg-05.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730665AbgEVRCc (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 22 May 2020 13:02:32 -0400
Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com [209.85.222.54]) (authenticated)
        by conssluserg-05.nifty.com with ESMTP id 04MH1skM012772
        for <linux-kbuild@vger.kernel.org>; Sat, 23 May 2020 02:01:54 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-05.nifty.com 04MH1skM012772
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1590166914;
        bh=9b3IaAyt6mnyi8C223l9LbfENupwb+x9OEjIuk84k14=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=HOpTcB1GkMCS89RWicrQ3eQFAhAftpiBYrsJ946+UjL/YN9csCvobKLTAcjZgDKM3
         /4fhCXDuik9M+fLtcraON1D2Ko004OFM9fkTsQ/6FfLjvKfWk6o7MWL1dE47RJUR+3
         IRaImVwe4VZGx+lGm8TJS8BIVvkH+ecUJ8fFKd19T5gcRHhVnXxG3gCnII1c35Pvq8
         VqbVFeKXgKc7lSfz2wUVcfPiuL/8LJi2yey+AHy3Zx3VXGwCtmPgdWUwuUACQKIZbP
         NQChj1+cSQ0QBy0HNFBoslt3458y1Hi+4vJkPWKolyTJ7DZQFHlQ2RjDyEYQ4VHa9+
         rTTYCTW/AKGjA==
X-Nifty-SrcIP: [209.85.222.54]
Received: by mail-ua1-f54.google.com with SMTP id f9so4022571uaq.2
        for <linux-kbuild@vger.kernel.org>; Fri, 22 May 2020 10:01:54 -0700 (PDT)
X-Gm-Message-State: AOAM5306DHvX2Qcj9vFs7vo+vI2kjpICyXecMzq9Ln/q5pYvC0auZY22
        71Tv89OcVcDr0uhTD7+WarljaQYPDylMqHbOrxc=
X-Google-Smtp-Source: ABdhPJy09ihLGzj++Nmq7Xk5QWWa2YR/PtvSFTmLokvd2ywyHGd+3xFZ6r+uh9CD29Sy5Sys6HabLQOj1wsZDn6Iy0k=
X-Received: by 2002:ab0:7313:: with SMTP id v19mr12129197uao.121.1590166913339;
 Fri, 22 May 2020 10:01:53 -0700 (PDT)
MIME-Version: 1.0
References: <20200510040616.2207-1-j@jxself.org>
In-Reply-To: <20200510040616.2207-1-j@jxself.org>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Sat, 23 May 2020 02:01:17 +0900
X-Gmail-Original-Message-ID: <CAK7LNAScfa9bqc3ViVX-+u3uJU=Zv_oWXCWdN6O_N_fw=AdQ5w@mail.gmail.com>
Message-ID: <CAK7LNAScfa9bqc3ViVX-+u3uJU=Zv_oWXCWdN6O_N_fw=AdQ5w@mail.gmail.com>
Subject: Re: [PATCH] make builddeb invoke calls to linux-update-symlink
To:     Jason Self <j@jxself.org>, Ben Hutchings <ben@decadent.org.uk>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hi Ben,

On Sun, May 10, 2020 at 1:06 PM Jason Self <j@jxself.org> wrote:
>
> The official Debian kernel packages,

I'd like to consult you.
Does this patch look OK?


Thanks.



> in addition to running the
> scripts in /etc/kernel, also runs linux-update-symlinks via the
> postinst and postrm scripts. This maintains the /vmlinuz and
> /initrd.img (if it uses an initramfs) symlinks. This change makes the
> builddeb script generate those same calls.
>
> Signed-off-by: Jason Self <j@jxself.org>
> ---
>  scripts/package/builddeb | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/scripts/package/builddeb b/scripts/package/builddeb
> index 6df3c9f8b2da..f34c11c63ede 100755
> --- a/scripts/package/builddeb
> +++ b/scripts/package/builddeb
> @@ -195,6 +195,14 @@ export DEB_MAINT_PARAMS="\$*"
>  # Tell initramfs builder whether it's wanted
>  export INITRD=$(if_enabled_echo CONFIG_BLK_DEV_INITRD Yes No)
>
> +$(case $script in
> +postinst)
> +        echo linux-update-symlinks install $version $installed_image_path
> +        ;;
> +postrm)
> +        echo linux-update-symlinks remove $version $installed_image_path
> +esac)
> +
>  test -d $debhookdir/$script.d && run-parts --arg="$version" --arg="/$installed_image_path" $debhookdir/$script.d
>  exit 0
>  EOF
> --
> 2.26.0
>


-- 
Best Regards
Masahiro Yamada
