Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 74920E11B9
	for <lists+linux-kbuild@lfdr.de>; Wed, 23 Oct 2019 07:35:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727194AbfJWFfo (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 23 Oct 2019 01:35:44 -0400
Received: from conssluserg-05.nifty.com ([210.131.2.90]:17695 "EHLO
        conssluserg-05.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725775AbfJWFfn (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 23 Oct 2019 01:35:43 -0400
Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com [209.85.217.47]) (authenticated)
        by conssluserg-05.nifty.com with ESMTP id x9N5ZSuU017272
        for <linux-kbuild@vger.kernel.org>; Wed, 23 Oct 2019 14:35:29 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-05.nifty.com x9N5ZSuU017272
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1571808929;
        bh=NueME2EJpUmLm7Dkneyk1fT6NgfIx3eNUdU4IQuIuqI=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=t4w3Ym8Puv231fLIWOHkPVwP8/9vt/PSpfYdw8A1eEB0aF+i6WICTM4pBlmvAF0cV
         T2y0Zb3tCvxyL3v3g2jSJQ3DTkD39277DCGzjAnacj9zSnEZ37QllhQF7at9Ll8vl+
         /jn/1bOpdYIMh4J4vLdMEQf859+c8bejwbBUg3kmAshMP52cfUDn+2BGM135TH/DdZ
         rmieNYUho8Iqp6/VqSMovPTSTz+6EkxavWoT1oCEm123I9U+GqIFZZz9ZuZYSy0qNy
         HoM3+fm80VhSPu1omJ1f3AwBwJpH898cQkSpc2VDOox7utmmTyGkxWjTV4y7EmVWog
         sKSLDfFL2nQ2w==
X-Nifty-SrcIP: [209.85.217.47]
Received: by mail-vs1-f47.google.com with SMTP id j85so3893932vsd.11
        for <linux-kbuild@vger.kernel.org>; Tue, 22 Oct 2019 22:35:29 -0700 (PDT)
X-Gm-Message-State: APjAAAXFN6BjLJKPP4+KWs3NrL3mq4zZ/4/r8f1lZS4IHFykjC6qZbBq
        VJ9Hi11sewLEPjBnw7SjwMhR3FtBiTuOU2261DY=
X-Google-Smtp-Source: APXvYqy+YY9msg8CFNNcpXbFGjWRXaexqfw/Nn131pGhm0hTzMq6xn7Drb7lUGDv7KFPGhLlXR9SPzbuPSkk4i0BdVY=
X-Received: by 2002:a67:f897:: with SMTP id h23mr2858779vso.155.1571808928370;
 Tue, 22 Oct 2019 22:35:28 -0700 (PDT)
MIME-Version: 1.0
References: <20191003031312.157994411@gmail.com> <20191003031312.374601455@gmail.com>
In-Reply-To: <20191003031312.374601455@gmail.com>
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
Date:   Wed, 23 Oct 2019 14:34:52 +0900
X-Gmail-Original-Message-ID: <CAK7LNAR_qK72-j=heEtvUp_DXt-uMGSJguMMzApFFKFyuj3dzg@mail.gmail.com>
Message-ID: <CAK7LNAR_qK72-j=heEtvUp_DXt-uMGSJguMMzApFFKFyuj3dzg@mail.gmail.com>
Subject: Re: [PATCH 3/4] scripts: namespace.pl: add .o to nmexception file
 names and fix "acpica"
To:     rd.dunlab@gmail.com
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Randy Dunlap <rdunlap@infradead.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, Oct 3, 2019 at 12:18 PM <rd.dunlab@gmail.com> wrote:


The same comment as 2/4.
I doubt if %nmexception is maintainable.


For example, you are fixing fs/ext3/bitmap to fs/ext3/bitmap.o
but I do not see the directory fs/ext3/.

How many entries in the %nmexception are still valid?





--
Best Regards
Masahiro Yamada
