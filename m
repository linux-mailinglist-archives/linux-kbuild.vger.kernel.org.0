Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8399B8A284
	for <lists+linux-kbuild@lfdr.de>; Mon, 12 Aug 2019 17:42:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726296AbfHLPmG (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 12 Aug 2019 11:42:06 -0400
Received: from conssluserg-02.nifty.com ([210.131.2.81]:55794 "EHLO
        conssluserg-02.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726200AbfHLPmG (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 12 Aug 2019 11:42:06 -0400
Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com [209.85.217.54]) (authenticated)
        by conssluserg-02.nifty.com with ESMTP id x7CFfuYK031604;
        Tue, 13 Aug 2019 00:41:57 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-02.nifty.com x7CFfuYK031604
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1565624517;
        bh=xqHdXxdJ6PpxUGE19Z5I8gZYC03sN81+SNVOX9WunLw=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=s2sbP698KVZjpkMdu+7kK70Sn1Rqv8epPpoFREIaRVFyqUe0c2NyKI70vDYQwO2us
         bxjrjb9DLuljQgrP5YcLGnDmXkhHtixAARtyUiIWjMdflAPqKHMOUoa33lhnlw64Vo
         ZBhFSH8/c+HANrbyu7xlabkn/mKYcV/7udrVGVllBXnTXYEr02JVlGUKWYwdHYkXFC
         4XExguFbbjFT4uG4aJu0WqU/k4bH1Tf4XJj5GDtVXTg9tqWxSRhx8f+OajVBF8gwtd
         yMcLO9UjDOPFeGe9D0O73gDi5VdsfH/AodMFiK7Xvyl/vaPmIpN5fG9CDgRJ2wLVIH
         I43hO72t1RaJg==
X-Nifty-SrcIP: [209.85.217.54]
Received: by mail-vs1-f54.google.com with SMTP id c7so2426496vse.11;
        Mon, 12 Aug 2019 08:41:57 -0700 (PDT)
X-Gm-Message-State: APjAAAUZelj76bPNthSi9BCgIToV5mOXuC8lknn+w8QQ8OSJovGB6pLZ
        HAN7793gde0XmhhR3XvTEIwDPvIU6aNkHq52FXY=
X-Google-Smtp-Source: APXvYqytSUiGQcS2gin7TbDYNo9UYz+qDVE/MiFNs/W15KPy8rSuXUdEXsLePT/n974yfEL4sAdwjb2qsj8wwf9nRUI=
X-Received: by 2002:a67:8e0a:: with SMTP id q10mr21454837vsd.215.1565624516047;
 Mon, 12 Aug 2019 08:41:56 -0700 (PDT)
MIME-Version: 1.0
References: <20190810075226.GA24085@lst.de>
In-Reply-To: <20190810075226.GA24085@lst.de>
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
Date:   Tue, 13 Aug 2019 00:41:20 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQfQWNMMLS1-3mE41Ffy3MV9i3VpbWtmKQdUqZjyk8Yqg@mail.gmail.com>
Message-ID: <CAK7LNAQfQWNMMLS1-3mE41Ffy3MV9i3VpbWtmKQdUqZjyk8Yqg@mail.gmail.com>
Subject: Re: can we use mandatory-y for non-uapi headers?
To:     Christoph Hellwig <hch@lst.de>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Christoph,


On Sat, Aug 10, 2019 at 4:52 PM Christoph Hellwig <hch@lst.de> wrote:
>
> Hi Masahiro,
>
> what is the reason that the documentation says mandatory-y should only
> be used for uapi headers?

Where is it documented?

Documentation/kbuild/makefiles.rst section 7.4 describes
mandatory-y is essentially used by include/(uapi/)asm-generic/Kbuild

include/(uapi/)asm-generic/Kbuild means:

include/uapi/asm-generic/Kbuild
include/asm-generic/Kbuild




-- 
Best Regards
Masahiro Yamada
