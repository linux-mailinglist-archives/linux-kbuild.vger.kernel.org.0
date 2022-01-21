Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2534D4962DE
	for <lists+linux-kbuild@lfdr.de>; Fri, 21 Jan 2022 17:36:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239055AbiAUQgK (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 21 Jan 2022 11:36:10 -0500
Received: from sdaoden.eu ([217.144.132.164]:50354 "EHLO sdaoden.eu"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234718AbiAUQgI (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 21 Jan 2022 11:36:08 -0500
Received: from kent.sdaoden.eu (kent.sdaoden.eu [10.5.0.2])
        by sdaoden.eu (Postfix) with ESMTPS id 1355F16057;
        Fri, 21 Jan 2022 17:36:06 +0100 (CET)
Received: by kent.sdaoden.eu (Postfix, from userid 1000)
        id C75E93876; Fri, 21 Jan 2022 17:36:04 +0100 (CET)
Date:   Fri, 21 Jan 2022 17:36:04 +0100
Author: Steffen Nurpmeso <steffen@sdaoden.eu>
From:   Steffen Nurpmeso <steffen@sdaoden.eu>
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Subject: Re: Makefile: uses rsync(1), could this be optional?
Message-ID: <20220121163604.QqCVq%steffen@sdaoden.eu>
In-Reply-To: <CAK7LNAQOm8NYiTDQnd0P-UsGa7GurffQiWQgGh0Cze4wLmDmgA@mail.gmail.com>
References: <20220120192151.k46VF%steffen@sdaoden.eu>
 <CAK7LNAQOm8NYiTDQnd0P-UsGa7GurffQiWQgGh0Cze4wLmDmgA@mail.gmail.com>
User-Agent: s-nail v14.9.23-223-g046972b06d
OpenPGP: id=EE19E1C1F2F7054F8D3954D8308964B51883A0DD;
 url=https://ftp.sdaoden.eu/steffen.asc; preference=signencrypt
BlahBlahBlah: Any stupid boy can crush a beetle. But all the professors in
 the world can make no bugs.
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Guten Tag.

Masahiro Yamada wrote in
 <CAK7LNAQOm8NYiTDQnd0P-UsGa7GurffQiWQgGh0Cze4wLmDmgA@mail.gmail.com>:
 |On Fri, Jan 21, 2022 at 4:31 AM Steffen Nurpmeso <steffen@sdaoden.eu> \
 |wrote:
 |> I sent this to linux-kernel@vger.kernel.org on the 15th, which
 |> seems to be legacy.  Just in case someone is wondering about the
 |> resend.
 |
 |I did not see your previous post.
 |What is bad about using rsync?

Oh really nothing, but this Linux distribution (CRUX) recreates
Linux headers before the GNU LibC is build, and this is the only
dependency of rsync around.  And, unless i am mistaken, the other
code path is more expensive but otherwise functionally equivalent?

 |> As a not-yet-tested low-quality Makefile suggestion, with modern
 |> GNU tools and find(1)'s -printf, wouldn't the following code work
 |> out gracefully in practice?  (Not subscribed.)
 |>
 |> Thanks for Linux!
 |>
 |> --- Makefile.orig       2022-01-15 19:33:59.337393371 +0100
 |> +++ Makefile    2022-01-15 19:34:07.447393217 +0100
 |> @@ -1260,8 +1288,17 @@ export INSTALL_HDR_PATH = $(objtree)/usr
 |>  quiet_cmd_headers_install = INSTALL $(INSTALL_HDR_PATH)/include
 |>        cmd_headers_install = \
 |>         mkdir -p $(INSTALL_HDR_PATH); \
 |> -       rsync -mrl --include='*/' --include='*\.h' --exclude='*' \
 |> -       usr/include $(INSTALL_HDR_PATH)
 |> +       if command -v rsync; then \
 |> +               rsync -mrl --include='*/' --include='*\.h' --exclude='*' \
 |> \
 |> +               usr/include $(INSTALL_HDR_PATH);\
 |> +       else \
 |> +               cd usr;\
 |> +               find include/ -type f -name '*.h' -printf '%f %h\n' |\
 |> +               while read f d; do \
 |> +                       mkdir -p $(INSTALL_HDR_PATH)/$$d;\
 |> +                       cp -P $$d/$$f $(INSTALL_HDR_PATH)/$$d/$$f;\
 |> +               done;\
 |> +       fi
 |>
 |>  PHONY += headers_install
 |>  headers_install: headers

--steffen
|
|Der Kragenbaer,                The moon bear,
|der holt sich munter           he cheerfully and one by one
|einen nach dem anderen runter  wa.ks himself off
|(By Robert Gernhardt)
