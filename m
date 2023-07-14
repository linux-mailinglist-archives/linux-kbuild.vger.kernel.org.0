Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C549675438B
	for <lists+linux-kbuild@lfdr.de>; Fri, 14 Jul 2023 22:02:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233193AbjGNUCN (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 14 Jul 2023 16:02:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51780 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235873AbjGNUCM (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 14 Jul 2023 16:02:12 -0400
Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AD68926B7
        for <linux-kbuild@vger.kernel.org>; Fri, 14 Jul 2023 13:02:02 -0700 (PDT)
Received: from leknes.fjasle.eu ([46.142.49.15]) by mrelayeu.kundenserver.de
 (mreue108 [212.227.15.183]) with ESMTPSA (Nemesis) id
 1MiJdI-1piL992lza-00fOwG; Fri, 14 Jul 2023 22:01:49 +0200
Received: by leknes.fjasle.eu (Postfix, from userid 1000)
        id 30D403E8B2; Fri, 14 Jul 2023 22:01:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=fjasle.eu; s=mail;
        t=1689364908; bh=xyc8fC9vZQ81HzZlZTY6/awnBVcCEiA9TYAhcIsM2bM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=w0KXmgkZvrBwJvIKI0YEw776YMU0IbRlj3YqL+Fx7PzpwNhMAZeJRKHB6Go5KKiA8
         jXPtpRO2ejRF1tgkPZlaq5HjX7xAslP92jx96J4ciOLJhRNb1V2I/iQdqFz3+tfrd3
         KcVcN4WdHSyWSizGHMokMuQ/kHqVaEsHLGIxi7Go=
Date:   Fri, 14 Jul 2023 22:01:48 +0200
From:   Nicolas Schier <nicolas@fjasle.eu>
To:     Jiri Slaby <jirislaby@kernel.org>
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Subject: Re: con3270.o is built twice, leading to errors
Message-ID: <ZLGprFmL8iDz0jbH@fjasle.eu>
References: <7b663b86-4df0-c3df-18a7-e4f47f900be4@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7b663b86-4df0-c3df-18a7-e4f47f900be4@kernel.org>
X-Provags-ID: V03:K1:pV5V3DLpwyD98Ho5U1CFxCZBiqVXLxk358xk5YsnB6WDdFl4dJY
 tccSnRDPoRxgww9xdRb7f7UfmZFLi9fkJbHZIYzOC9Wkc8pSwXKKIRQ75HIQg/E73wrivUm
 kCkXBDIauRwJicmyr4Kq+qpky1BttcDE1npb0o/+BrrWnM5gaV5+Lq+rPBNKBjYr1/VP0fz
 T8rYEWyskPZh1gNlt7TuA==
UI-OutboundReport: notjunk:1;M01:P0:zSlO4bpPGKI=;bMMJq6X8G5DvivsVCwZOoUAmLdn
 Z9GujcvodC1n1ZVscscnx37cRNDk5npKRhsrgayxH7IXY769ySvp4yW37AdFi6LcWyfyNXHUN
 y1YPpr1cVPB6qhJsx9iNXGLSBY1Gi5FXJOPq1oNPPsWrWFzNKF0gkL0PR9AlWEqiET13W51ZY
 TUsFqs5Dtgaad0v46c4e4ebdXZ9HKwpxHw7dvZq59RNn6+mNkQHSeFeDgv+9Syktmvt08oaoh
 j1v8jlTk37mwX/MGy6JPr53LkvZtWFiIBcqv6Cazf6Ci9PiHU7AGVkSAXylZvJ1OvY/0ylrQP
 PFNfrXrpSyp+LLHdeonPDyepJX8agE/fE4XlNgpUKda8L3fBus0YJwsG85wSVW2d5ARqgs3JD
 VzJ4DU+Hjr/eetoytkHCTj8HESOuOdpSYkjI/Quw6vLnahaOHj1e7OsN97EJVLQ+wE7CIKiTt
 ef9Wuwfwmtm8paznwNpge/hTQ7hQ0eEYIE680PfUxniu/KK6CkyUcKbOOCrI8j4atYLWe4esX
 U8puoQ0a+iX01xKN2q84yt5bqgNnL4h7UpYHbIEHmsSqVdG8qk3r3s98r7QFHuuJ+WVZKVzAi
 9U92dQBdGhun5QrqVzsr2Gne3VpiItCxxGkVkUJUemgm3VldxOe4HUveu+8RIvYvtzbitP0Nt
 Ke66HXEenaAi/pfaMlxW7Uv+l4Ofmjq3bZ9xxWmQKw==
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,DKIM_INVALID,
        DKIM_SIGNED,RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,
        SPF_HELO_NONE,T_SCC_BODY_TEXT_LINE,T_SPF_TEMPERROR,URIBL_BLOCKED
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Fri, Jul 14, 2023 at 08:33:46AM +0200 Jiri Slaby wrote:
> Hi,
> 
> if I create an s390 defconfig:
> mkdir /tmp/s390/
> make O=/tmp/s390/ ARCH=s390 CROSS_COMPILE=s390x-suse-linux- defconfig
> 
> And then if I try for a couple times:
> make O=/tmp/s390/ -j17 ARCH=s390 CROSS_COMPILE=s390x-suse-linux-
> drivers/s390/char/con3270.o
> 
> Most of the time, I get:
> make[1]: Entering directory '/tmp/s390'
>   GEN     Makefile
>   CALL    /home/latest/linux/scripts/checksyscalls.sh
>   CC      drivers/s390/char/con3270.o
>   CC      drivers/s390/char/con3270.o
> 
> I.e. it is built twice.
> 
> Sometimes, I also get an error:
> fixdep: error opening file: drivers/s390/char/.con3270.o.d: No such file or
> directory
> make[4]: *** [/home/latest/linux/scripts/Makefile.build:243:
> drivers/s390/char/con3270.o] Error 2
> make[4]: *** Deleting file 'drivers/s390/char/con3270.o'
> make[3]: *** [/home/latest/linux/scripts/Makefile.build:477: drivers]
> 
> Obviously due to some race.
> 
> Any ideas what is going on?

Which reason does compiling with V=2 reveal?

Kind regards,
Nicolas
