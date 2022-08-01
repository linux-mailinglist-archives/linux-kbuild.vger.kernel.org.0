Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4F9E9586345
	for <lists+linux-kbuild@lfdr.de>; Mon,  1 Aug 2022 06:16:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238898AbiHAEQX (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 1 Aug 2022 00:16:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49282 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229497AbiHAEQW (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 1 Aug 2022 00:16:22 -0400
Received: from conssluserg-04.nifty.com (conssluserg-04.nifty.com [210.131.2.83])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D12166303
        for <linux-kbuild@vger.kernel.org>; Sun, 31 Jul 2022 21:16:20 -0700 (PDT)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52]) (authenticated)
        by conssluserg-04.nifty.com with ESMTP id 2714Futd029295
        for <linux-kbuild@vger.kernel.org>; Mon, 1 Aug 2022 13:15:57 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-04.nifty.com 2714Futd029295
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1659327357;
        bh=JzIIFFlyHriUlJmmYAecRbEzPwCfn+KCkQwLwtoFp8M=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=lggOYhUpZdj0Oemnvs5m9XZcp8h4iQW5upoOKj/MuLk4mTWSbRXomXlwI8/JbUX2o
         4erWoq67ztETm5NW6ZZQvGcEfRerc/3P05qISE0ngJqKQIcu4DtiDpTQBdgnQE73vJ
         jPqdY/w7oJbdLFQSzyD3qyOeiutDu/pLlM70gxFWKjCPCY/ZMsEOytYludbcgfeJMY
         yEIl1SC48U+SWGYeCuJWizfNznNeLDjmqVF3QZALH+cRHmXKvRRFinET0CskTTYVxV
         47CKzxUjyNdaCrO5OK6k1KhG5+Flb4rJ9w9Qh+dD6VyZ5QbzUNAdHP+dnRnUxN8wRT
         k32A1LhhPgcJg==
X-Nifty-SrcIP: [209.85.128.52]
Received: by mail-wm1-f52.google.com with SMTP id x23-20020a05600c179700b003a30e3e7989so5019048wmo.0
        for <linux-kbuild@vger.kernel.org>; Sun, 31 Jul 2022 21:15:56 -0700 (PDT)
X-Gm-Message-State: AJIora+sKraKgetYldeJtSTulmOCXVBfnO3mGvK40mu1WBb3zo041/vu
        CVzSoXE8mDdKxyl05UXvABdjNUlp+60JzH+eYxk=
X-Google-Smtp-Source: AGRyM1ugT4cGdSzw+VS5WZvtrVKJcRPGeVnes5yMNrsUCPmycJdg2e1z3bM4pxI4voyEUD+83mZVYZtLDbjRKPC4AdE=
X-Received: by 2002:a05:600c:1da8:b0:3a3:1969:b0d with SMTP id
 p40-20020a05600c1da800b003a319690b0dmr9905660wms.172.1659327355460; Sun, 31
 Jul 2022 21:15:55 -0700 (PDT)
MIME-Version: 1.0
References: <CAGRSmLsBwZdDhcKjnC0=COU7B+kM8vuRjPv_znZ5=p3k+QCONg@mail.gmail.com>
In-Reply-To: <CAGRSmLsBwZdDhcKjnC0=COU7B+kM8vuRjPv_znZ5=p3k+QCONg@mail.gmail.com>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Mon, 1 Aug 2022 13:14:54 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQpTBtfnCGpO2O+w--=DPNJL14y+2Xc7GimH1j2qyd2SA@mail.gmail.com>
Message-ID: <CAK7LNAQpTBtfnCGpO2O+w--=DPNJL14y+2Xc7GimH1j2qyd2SA@mail.gmail.com>
Subject: Re: kbuild self-created module file errors with: ERROR: modpos:
 missing MODULE_LICENSE
To:     "David F." <df7729@gmail.com>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_SOFTFAIL autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Mon, Aug 1, 2022 at 2:16 AM David F. <df7729@gmail.com> wrote:
>
> Years ago I set up a series of makefiles and bash scripts to build
> both a support library for kernel modules and my own kernel modules.
> Now years later, I don't recall much about how all this works but it
> has until moving to 5.15 (from 5.10. kernels).  Although, there was an
> issue with it not supporting libraries at some upgrade point, but this
> list helped me with a patch so it would build the .a libraries and
> link with them.
>
> Looking at the makefile for building the library it has a note that I
> needed to set up a fake obj-m for it to actually build the library.
> So what I have is:
>
> # Setup module name for kbuild
> obj-m:=junk.o
> junk-objs:=lib.a
>
> There is no reference to any junk_mod.c file, it appears kbuild
> automatically creates the junk-mod.c file itself.   The problem is the
> build now fails due to the:
> ERROR: modpost: missing MODULE_LICENSE() in /.../junk.obj
>
> Is there some other makefile option to make kbuild set the
> MODULE_LICENSE() or perhaps ignore it since it's not needed in this
> type of case?


You need to add MODULE_LICENSE()
somewhere in your module source code.







>
> Or should I take this junk.mod.c file and now modify it and then
> actually copy it over as the actual source to use to force the library
> to be created?
>
> Thanks!!



-- 
Best Regards
Masahiro Yamada
