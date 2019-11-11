Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7A0A0F7C1D
	for <lists+linux-kbuild@lfdr.de>; Mon, 11 Nov 2019 19:43:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729608AbfKKSnW (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 11 Nov 2019 13:43:22 -0500
Received: from forward106p.mail.yandex.net ([77.88.28.109]:55623 "EHLO
        forward106p.mail.yandex.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728301AbfKKSnV (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 11 Nov 2019 13:43:21 -0500
X-Greylist: delayed 351 seconds by postgrey-1.27 at vger.kernel.org; Mon, 11 Nov 2019 13:43:19 EST
Received: from forward100q.mail.yandex.net (forward100q.mail.yandex.net [IPv6:2a02:6b8:c0e:4b:0:640:4012:bb97])
        by forward106p.mail.yandex.net (Yandex) with ESMTP id B98701C806FA;
        Mon, 11 Nov 2019 21:37:26 +0300 (MSK)
Received: from mxback8q.mail.yandex.net (mxback8q.mail.yandex.net [IPv6:2a02:6b8:c0e:42:0:640:b38f:32ec])
        by forward100q.mail.yandex.net (Yandex) with ESMTP id B41CC7080002;
        Mon, 11 Nov 2019 21:37:26 +0300 (MSK)
Received: from localhost (localhost [::1])
        by mxback8q.mail.yandex.net (mxback/Yandex) with ESMTP id Fm9TxESHgv-bPd8t6v3;
        Mon, 11 Nov 2019 21:37:25 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=golovin.in; s=mail; t=1573497445;
        bh=Kr8Q2CYrVzqyFN3+KQChl/ZmdG+3/pTsRbqPDvZ9Fks=;
        h=Message-Id:Date:Cc:Subject:To:From;
        b=0AgvEJRsURO6sGtecisNH6I2lDJ54V2JAceWcUvHyXAnXtKKbeLunJnwPU6TWGnii
         Bn9j0Ykvy8GTF7jCTOnbtINI/X+br9PLuzJg60pEkOMQevn5g2R3JkHsiGZxWY//07
         f0SY09SjPC/o6lMy23G899p+Zw3q5mZA2qLZAqdQ=
Authentication-Results: mxback8q.mail.yandex.net; dkim=pass header.i=@golovin.in
Received: by vla1-b2d94eaf2344.qloud-c.yandex.net with HTTP;
        Mon, 11 Nov 2019 21:37:25 +0300
From:   Dmitry Golovin <dima@golovin.in>
To:     Masahiro Yamada <yamada.masahiro@socionext.com>
Cc:     Ethan Sommer <e5ten.arch@gmail.com>,
        Michal Marek <michal.lkml@markovi.net>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        Sedat Dilek <sedat.dilek@gmail.com>,
        Nathan Chancellor <natechancellor@gmail.com>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        DTML <devicetree@vger.kernel.org>
Subject: Re: [PATCH v2] kbuild: support byacc as alternative YACC to bison
MIME-Version: 1.0
X-Mailer: Yamail [ http://yandex.ru ] 5.0
Date:   Mon, 11 Nov 2019 20:37:25 +0200
Message-Id: <17102241573497445@vla1-b2d94eaf2344.qloud-c.yandex.net>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

> Hmm, this is unfortunate since there is no common way to
> specify the header path directly.
> 
> I am not sure how much effort we should invent
> to support non-GNU implementation
> since we already rely on various GNU tools.
> 
> If we decide to support byacc,
> we must carry the restriction
> that bans GNU-extension.

In fact Linux now can be built without using GNU
binutils and using LLVM tools instead. It's just
one architecture and a specific config now, but
eventually the others will be built too. You can
follow the progress here:
https://github.com/ClangBuiltLinux/continuous-integration/issues/73

I believe that compatibility with different
alternative tools is a good thing as long as it
doesn't add unwanted complexity. And as this patch
is just changing command-line flags to their
portable variants and explicitly adds a couple of
definitions that are presumed by GNU bison, I
can't see a problem with it.

Regards,
Dmitry
