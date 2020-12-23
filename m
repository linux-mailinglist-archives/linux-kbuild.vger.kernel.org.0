Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 759B92E1DBC
	for <lists+linux-kbuild@lfdr.de>; Wed, 23 Dec 2020 16:08:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727360AbgLWPHp (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 23 Dec 2020 10:07:45 -0500
Received: from conssluserg-05.nifty.com ([210.131.2.90]:23038 "EHLO
        conssluserg-05.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727176AbgLWPHp (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 23 Dec 2020 10:07:45 -0500
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177]) (authenticated)
        by conssluserg-05.nifty.com with ESMTP id 0BNF6Z1U031951;
        Thu, 24 Dec 2020 00:06:36 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-05.nifty.com 0BNF6Z1U031951
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1608735996;
        bh=rVleOCwdA5mNcHzx2fk9F0Qc+X+VP6kaTvPtwieTX9o=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=GUb3J/lvEcnx5jM74AWQpKMYWQID2N+iJGg4E5mV5Qs3XN15V/maSlCtMhcDJVgCY
         SKWmVkvnHTaS4kozn/ZOdREtjK8O5SlNboQPHKHNrpVDJuNbSzYcgDKCa7WdyffEjw
         yqSDlqOpgQWX/9VRR+cd0DWNqD2MWRV1+fiZ0cGcOkBsf6YvgnBwSU6fhNWL91U/0x
         qLq9jStlDtLvuk7L3okDItHbIAu/0lutVS9Rz3vYe0aIexqN2g0bvzP2Xoc2KQ5K/g
         TtHg2TtcT3wuWUaTUy/zzoaqQoRastd3o0ofL6VlzSWacUzp0WW3zRV1GtPu2uMC+D
         Tzk/r89oOnAkQ==
X-Nifty-SrcIP: [209.85.210.177]
Received: by mail-pf1-f177.google.com with SMTP id c79so10530484pfc.2;
        Wed, 23 Dec 2020 07:06:36 -0800 (PST)
X-Gm-Message-State: AOAM530KPAfftiW3aSQWHHGihF+ZBo4B3Lz7G003/71MPE/ithg7Pged
        6echfWeCUBh25ppC6mEZCGNkXfUnPlJdmjB3TJE=
X-Google-Smtp-Source: ABdhPJyG0PVPLrfWb+gE/h6hG28LKhOLIsv7LZcm00nbzrKSKvxq5R5+PcMkkB4imNBKyhEkWxpIqQw8LcNZAoYstIg=
X-Received: by 2002:a63:ff09:: with SMTP id k9mr6019331pgi.175.1608735995368;
 Wed, 23 Dec 2020 07:06:35 -0800 (PST)
MIME-Version: 1.0
References: <20201219170805.7151-1-rdunlap@infradead.org>
In-Reply-To: <20201219170805.7151-1-rdunlap@infradead.org>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Thu, 24 Dec 2020 00:05:58 +0900
X-Gmail-Original-Message-ID: <CAK7LNARBo-Kww4PQmZseoYddWiFFSbZeNkaoOTik9bFjMM__-Q@mail.gmail.com>
Message-ID: <CAK7LNARBo-Kww4PQmZseoYddWiFFSbZeNkaoOTik9bFjMM__-Q@mail.gmail.com>
Subject: Re: [PATCH v2] kconfig: config script: add a little user help
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Andi Kleen <ak@linux.intel.com>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Sun, Dec 20, 2020 at 2:08 AM Randy Dunlap <rdunlap@infradead.org> wrote:
>
> Give the user a clue about the problem along with the 35 lines of
> usage/help text.
>
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Cc: Andi Kleen <ak@linux.intel.com>
> Cc: Masahiro Yamada <masahiroy@kernel.org>
> Cc: linux-kbuild@vger.kernel.org
> ---
> v2: spell out "command" & send to STDERR; (Yamada-san)

Applied to linux-kbuild. Thanks.


>  scripts/config |    1 +
>  1 file changed, 1 insertion(+)
>
> --- linux-next-20201218.orig/scripts/config
> +++ linux-next-20201218/scripts/config
> @@ -223,6 +223,7 @@ while [ "$1" != "" ] ; do
>                 ;;
>
>         *)
> +               echo "bad command: $CMD" >&2
>                 usage
>                 ;;
>         esac



-- 
Best Regards
Masahiro Yamada
