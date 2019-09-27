Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1F431C08F5
	for <lists+linux-kbuild@lfdr.de>; Fri, 27 Sep 2019 17:54:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727273AbfI0PyN (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 27 Sep 2019 11:54:13 -0400
Received: from conssluserg-06.nifty.com ([210.131.2.91]:50376 "EHLO
        conssluserg-06.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726251AbfI0PyN (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 27 Sep 2019 11:54:13 -0400
Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com [209.85.217.46]) (authenticated)
        by conssluserg-06.nifty.com with ESMTP id x8RFrxZa011551
        for <linux-kbuild@vger.kernel.org>; Sat, 28 Sep 2019 00:54:00 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-06.nifty.com x8RFrxZa011551
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1569599640;
        bh=w35eGQMi6hnxWU7YENOeWL4mJUZbqrUakjrNABMiBEA=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=NRIIQaKNdA5tiKVWx6LGL1e0l1yclsb5DhMFfh9piElT+fkDAuIr5T6k3LRy7l08Y
         Ck57Tz0TsqxLxysOVNcCMADH7sDLfXMg0gPpZFJtey3J7MF7MDAns4Oht1MC8tF14q
         JGU44DXIYPyXzDxd0gAKuas+YG2hMBYh42LfcJOKlEMruJizpjoo2nmasBRclDP9Es
         AxWw9MMVhHvnJl3AlGcviH4x969pH4gKxrirSXaan8SS0GEYrC+ZTBf5c7rpwXkfvW
         3IQy7DZC+jZ5HEGkt8wX8o4zQFNo7+JPXtPt9cpcOG/EIJb7c7SoXGiuHu5I2GtDPd
         TbTkJOTUjeiPw==
X-Nifty-SrcIP: [209.85.217.46]
Received: by mail-vs1-f46.google.com with SMTP id d3so2214968vsr.1
        for <linux-kbuild@vger.kernel.org>; Fri, 27 Sep 2019 08:53:59 -0700 (PDT)
X-Gm-Message-State: APjAAAU4rDvRc/TZi55VtJNo9D9r2Pii4vQLysd5dUpL93WLE9gDzy5M
        dPJIbp4+9UDV/R3dJh9wooFjOqTANJW2mLNLfrE=
X-Google-Smtp-Source: APXvYqzkqY/GFTF3wt6Xnlh+FUx+67DaxauvTj//l78R2iLdJn+zcHcdeILZiSw4k0lWnJSLrJqdA5hziAOVSNLOWo8=
X-Received: by 2002:a67:1a41:: with SMTP id a62mr2931760vsa.54.1569599638539;
 Fri, 27 Sep 2019 08:53:58 -0700 (PDT)
MIME-Version: 1.0
References: <CAKYFi-4i-rspPYsYPznjcU+_v02sKEewxFLQuHyx6i11v85UWQ@mail.gmail.com>
In-Reply-To: <CAKYFi-4i-rspPYsYPznjcU+_v02sKEewxFLQuHyx6i11v85UWQ@mail.gmail.com>
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
Date:   Sat, 28 Sep 2019 00:53:22 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQ8xu=6PD_Pz8wPrshsTtHprwjQEj7qFoFsq80rc5bDZg@mail.gmail.com>
Message-ID: <CAK7LNAQ8xu=6PD_Pz8wPrshsTtHprwjQEj7qFoFsq80rc5bDZg@mail.gmail.com>
Subject: Re: scripts/kconfig/nconf.c stuck in infinite loop in search
To:     constant override <constantoverride@gmail.com>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Fri, Sep 27, 2019 at 2:41 AM constant override
<constantoverride@gmail.com> wrote:
>
> please have a look at the path/solution here:
> https://bugzilla.kernel.org/show_bug.cgi?id=203437#c0
>
> thanks!

Could you send it in a patch form to this ML?


Please add the subject in the form:

kconfig: <one-line description in imperative mood>


Also, one important thing is
to add your Signed-off-by:

For the patch submission rule, you can refer to:

https://github.com/torvalds/linux/blob/master/Documentation/process/submitting-patches.rst



-- 
Best Regards
Masahiro Yamada
