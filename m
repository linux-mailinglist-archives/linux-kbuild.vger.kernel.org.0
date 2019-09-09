Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B2B9DADA32
	for <lists+linux-kbuild@lfdr.de>; Mon,  9 Sep 2019 15:43:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730516AbfIINnr (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 9 Sep 2019 09:43:47 -0400
Received: from mail-qt1-f194.google.com ([209.85.160.194]:37914 "EHLO
        mail-qt1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729438AbfIINnr (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 9 Sep 2019 09:43:47 -0400
Received: by mail-qt1-f194.google.com with SMTP id b2so16188093qtq.5;
        Mon, 09 Sep 2019 06:43:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=642cFtI3f24XPx+5CJOS0tuBt/rWYPYIkmSER4gGvqI=;
        b=ZfxSEkfquoKKvIngIqHiKeW0stnX8fa31cKbbjtZR5p6yVeasDtthawj+wFp1QLEHX
         jeRw1NPSApPboksxvSHchSoGOyFz5tb8oBbTU/JUrHlJGJ3z3zej/b5yqhgxak84dFbC
         NlK5MusQ/n9Ecvey1GmMfqP10/ClSKajACUpWnkr7/5KUVpWNUNdMkIXeTJCODOItkho
         ShsAi6qbx699/iu61YSPFz/03kxGr8sFA+ZRCDNGPgVnIgY1gucJ1LopUDxGeM0z5PYF
         8zKqr1fOtOqPwemXZ+HdeCii5y1+ZC+INCrW7lt8lWFZOlkrtrHAML64u+UchkU37VAT
         4+wQ==
X-Gm-Message-State: APjAAAWxZrR2/247MhNabzKSFMCJkSKvQJaFbBMsN/LWQ+zRLmgDEjiK
        dqYjknGg4vlj5Phaxe2FBLwOAEHCMTGztIZfUh8=
X-Google-Smtp-Source: APXvYqxsd48uc76vj06LPa3C/gIwjvH1qE1KDfxVodGiwZLdizquOW+NL+DPH8y8oaGhqAMuDEo3ROFiCKnsdys3ksw=
X-Received: by 2002:ad4:4529:: with SMTP id l9mr9849589qvu.45.1568036625284;
 Mon, 09 Sep 2019 06:43:45 -0700 (PDT)
MIME-Version: 1.0
References: <20190909105317.20473-1-yamada.masahiro@socionext.com> <20190909105317.20473-2-yamada.masahiro@socionext.com>
In-Reply-To: <20190909105317.20473-2-yamada.masahiro@socionext.com>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Mon, 9 Sep 2019 15:43:29 +0200
Message-ID: <CAK8P3a0XX_ZZNgZcU=PucJ3-aJccR80mBnTpgpGNew_mOUv8-w@mail.gmail.com>
Subject: Re: [PATCH 2/2] export.h, genksyms: do not make genksyms calculate
 CRC of trimmed symbols
To:     Masahiro Yamada <yamada.masahiro@socionext.com>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Denis Efremov <efremov@linux.com>,
        Nicolas Pitre <nico@fluxnic.net>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Mon, Sep 9, 2019 at 12:53 PM Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:
> Since commit 15bfc2348d54 ("modpost: check for static EXPORT_SYMBOL*
> functions"), it is harmful because the bogus __crc* symbols make
> modpost call sym_update_crc(), and then new_symbol(), but there is
> no one that clears the ->is_static member.
>
> I gave Fixes to the first commit that uncovered the issue, but the
> potential problem has long existed since commit f235541699bc
> ("export.h: allow for per-symbol configurable EXPORT_SYMBOL()").
>
> Fixes: 15bfc2348d54 ("modpost: check for static EXPORT_SYMBOL* functions")
> Reported-by: Arnd Bergmann <arnd@arndb.de>
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>

Tested-by: Arnd Bergmann <arnd@arndb.de>

Thanks for providing a proper fix!

       Arnd
