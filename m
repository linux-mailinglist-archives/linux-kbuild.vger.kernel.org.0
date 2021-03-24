Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 981EB347155
	for <lists+linux-kbuild@lfdr.de>; Wed, 24 Mar 2021 07:02:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235287AbhCXGCK (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 24 Mar 2021 02:02:10 -0400
Received: from conssluserg-01.nifty.com ([210.131.2.80]:28094 "EHLO
        conssluserg-01.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235232AbhCXGCG (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 24 Mar 2021 02:02:06 -0400
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48]) (authenticated)
        by conssluserg-01.nifty.com with ESMTP id 12O61oeT014303;
        Wed, 24 Mar 2021 15:01:51 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-01.nifty.com 12O61oeT014303
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1616565711;
        bh=MBCQP2zHL/sR0wxVV6u9u8KQ+iY7KyvPeLuDOS77YAY=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=rTGGM8xLlHv7+YjLe+AHrT3dctA8XOghpXbFDSefZnmVRgo94R/AQ1XacFpaS0W+W
         GFrpaFTPPzBsoU+lJAEz4ePWWUqPd0SDlDEPIacMamnOvKGN2IYv4w4uFAl2JQ9RYA
         +CFyF9Zk2KOwwtwLtk/TGPw9WYrFJ4VRCEdI4LcD9BPyn+p2TecYExtZ1EULqQ7EoY
         OSZt4PtkdeMstIS2CXWmM7TPwPO/VaR2rH6mq1mhrq/8urk8IYCr7VodfUgcfRlvR6
         lVPOLF+v5pu38avVEnmHhzSatvOhAvw31QZFDxZHCpV6EdHprXXTrDafGWCNyimSPo
         E+mqAR8sdI0KA==
X-Nifty-SrcIP: [209.85.216.48]
Received: by mail-pj1-f48.google.com with SMTP id il9-20020a17090b1649b0290114bcb0d6c2so591842pjb.0;
        Tue, 23 Mar 2021 23:01:51 -0700 (PDT)
X-Gm-Message-State: AOAM531tfD1ruETJesbZnV+UXeDohXANLs4V8G2zEhxAHzlJhWCDiQFk
        XbVIM1LnvLfqwohuR+T5qy680UqDTzCxwx4zjXk=
X-Google-Smtp-Source: ABdhPJyxKIB14B60TFeQsEqKGx9oYMUa/Bcb3WTqmU+amtCX5fOD0+Zr2U4cqEladVwnZA0P4e58RvYdRgPjzDYQRNI=
X-Received: by 2002:a17:902:8ec9:b029:e6:c5e:cf18 with SMTP id
 x9-20020a1709028ec9b02900e60c5ecf18mr2071211plo.47.1616565710424; Tue, 23 Mar
 2021 23:01:50 -0700 (PDT)
MIME-Version: 1.0
References: <20210322213806.089334551@goodmis.org> <20210322214032.293992979@goodmis.org>
In-Reply-To: <20210322214032.293992979@goodmis.org>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Wed, 24 Mar 2021 15:01:13 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQh=zKVTwup5Kh39oTnVEUNotX-Ce7_+2uRO1GNVOaDbw@mail.gmail.com>
Message-ID: <CAK7LNAQh=zKVTwup5Kh39oTnVEUNotX-Ce7_+2uRO1GNVOaDbw@mail.gmail.com>
Subject: Re: [PATCH 2/2] streamline_config.pl: Add softtabstop=4 for vim users
To:     Steven Rostedt <rostedt@goodmis.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        "John (Warthog9) Hawley" <warthog9@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, Mar 23, 2021 at 6:40 AM Steven Rostedt <rostedt@goodmis.org> wrote:
>
> From: "Steven Rostedt (VMware)" <rostedt@goodmis.org>
>
> The tab stop for Perl files is by default (at least in emacs) to be 4
> spaces, where a tab is used for all 8 spaces. Add a local variable comment
> to make vim do the same by default, and this will help keep the file
> consistent in the future when others edit it via vim and not emacs.
>
> Signed-off-by: Steven Rostedt (VMware) <rostedt@goodmis.org>


Documentation/process/coding-style.rst says "do not do this".

Rather, I want to remove this ugly stuff entirely.
https://lore.kernel.org/patchwork/patch/1401439/

Adding .editorconfig seems OK to me, but
Doing this in individual files in an editor-specific
manner is a horror.





> ---
>  scripts/kconfig/streamline_config.pl | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/scripts/kconfig/streamline_config.pl b/scripts/kconfig/streamline_config.pl
> index 059061b6daef..044829972ba5 100755
> --- a/scripts/kconfig/streamline_config.pl
> +++ b/scripts/kconfig/streamline_config.pl
> @@ -702,3 +702,5 @@ foreach my $module (keys(%modules)) {
>         print STDERR "\n";
>      }
>  }
> +
> +# vim: softtabstop=4
> --
> 2.30.1
>
>


-- 
Best Regards
Masahiro Yamada
