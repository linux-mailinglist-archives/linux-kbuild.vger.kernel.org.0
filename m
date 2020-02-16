Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A52EF16045D
	for <lists+linux-kbuild@lfdr.de>; Sun, 16 Feb 2020 15:42:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728292AbgBPOmw (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sun, 16 Feb 2020 09:42:52 -0500
Received: from conssluserg-06.nifty.com ([210.131.2.91]:30875 "EHLO
        conssluserg-06.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728258AbgBPOmw (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 16 Feb 2020 09:42:52 -0500
Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com [209.85.217.53]) (authenticated)
        by conssluserg-06.nifty.com with ESMTP id 01GEgP9S010513;
        Sun, 16 Feb 2020 23:42:26 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-06.nifty.com 01GEgP9S010513
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1581864146;
        bh=UoXPiVZxlWkvCqFNMcjAUwJQCoq8GSwZbx8UAZFUf+g=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=nQTrfunf3CEK7lzn82MaJMNvJWBlL3QKKGT7DWcph3+bEq24Zk2LPGStO1ShFxlBH
         JY9bGiSr7SbvjnA+cdNoymfbVtTVqTrCRo/hU25CSwn+PzFGjn4M/CQoK5JrHHmq6t
         I7JqXPc6ZkHqEIMD2vcn7ip94m6nVAkCJdIy0tQJ8hTgsD2fa6gScFcgmgi88jMii+
         qgyxWnxrBZBdaJd/ijFAxlE20PfANCXoukWg3e9dVP0FZhbk4cX/VLiueK73qDpHXl
         1uABnQZ16STKEouuynUnhP60/UoP9HH/a62wF7Cu6Dx41tF8itrEBM7ioEsg0TW1mX
         cUAZlQ3GRVJoA==
X-Nifty-SrcIP: [209.85.217.53]
Received: by mail-vs1-f53.google.com with SMTP id x18so9108396vsq.4;
        Sun, 16 Feb 2020 06:42:26 -0800 (PST)
X-Gm-Message-State: APjAAAVGtXW7wfL6jc1dWWJOzatAZCqKuOtADvwF0mJI+tHV0+elWCnD
        MxMqHrx4x0/ABBUzjeAyE2G5g0DD8UI+DIrFp+8=
X-Google-Smtp-Source: APXvYqwW5HVWUuzDn0HmhcW/DFcMylTWOtCMGEgW2Ijo9vm/IhTP/HsMT4VTAuXnu2z7SG0GRxtxwnZsRfNlStQW5AY=
X-Received: by 2002:a67:6485:: with SMTP id y127mr6263902vsb.54.1581864145392;
 Sun, 16 Feb 2020 06:42:25 -0800 (PST)
MIME-Version: 1.0
References: <a06194f0-3713-cc04-1673-c05b35c03242@infradead.org>
In-Reply-To: <a06194f0-3713-cc04-1673-c05b35c03242@infradead.org>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Sun, 16 Feb 2020 23:41:49 +0900
X-Gmail-Original-Message-ID: <CAK7LNATQowM6w5TmHiqCeY7yae8j-qV==e9yw3HYD9=fABxjtg@mail.gmail.com>
Message-ID: <CAK7LNATQowM6w5TmHiqCeY7yae8j-qV==e9yw3HYD9=fABxjtg@mail.gmail.com>
Subject: Re: [PATCH] kbuild: add comment for V=2 mode
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        linux-kbuild <linux-kbuild@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, Feb 13, 2020 at 1:41 PM Randy Dunlap <rdunlap@infradead.org> wrote:
>
> From: Randy Dunlap <rdunlap@infradead.org>
>
> Complete the comments for valid values of KBUILD_VERBOSE,
> specifically for KBUILD_VERBOSE=2.
>
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>


Applied to linux-kbuild. Thanks.



> ---
>  Makefile |    1 +
>  1 file changed, 1 insertion(+)
>
> --- linux-next-20200206.orig/Makefile
> +++ linux-next-20200206/Makefile
> @@ -68,6 +68,7 @@ unexport GREP_OPTIONS
>  #
>  # If KBUILD_VERBOSE equals 0 then the above command will be hidden.
>  # If KBUILD_VERBOSE equals 1 then the above command is displayed.
> +# If KBUILD_VERBOSE equals 2 then give the reason why each target is rebuilt.
>  #
>  # To put more focus on warnings, be less verbose as default
>  # Use 'make V=1' to see the full commands
>


-- 
Best Regards
Masahiro Yamada
