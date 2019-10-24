Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7FA3AE390E
	for <lists+linux-kbuild@lfdr.de>; Thu, 24 Oct 2019 18:59:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405981AbfJXQ7R (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 24 Oct 2019 12:59:17 -0400
Received: from conssluserg-05.nifty.com ([210.131.2.90]:49133 "EHLO
        conssluserg-05.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2405976AbfJXQ7R (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 24 Oct 2019 12:59:17 -0400
Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com [209.85.221.173]) (authenticated)
        by conssluserg-05.nifty.com with ESMTP id x9OGwwbf014422
        for <linux-kbuild@vger.kernel.org>; Fri, 25 Oct 2019 01:58:59 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-05.nifty.com x9OGwwbf014422
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1571936339;
        bh=0Xutos3NgWr029+tExXoQQ20sW0IICPyqacwSrEg3jk=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=GuG3Qrh4hh1IHRYXxOvLBE8KLST6JzK2LszL5YkTK/USK7/+Gr3kE+tu//xOUb58L
         M6NIm0jTdCh/7b0g4BWlD7/oS6FBoGfjY2duh5ouEto1bgZU+14es0DpcTgWHECU3s
         FsrhjtaUmiqYPEW4DrKCjKL28MUWzuSwnJtWYXy8jx2HFT/V441Fs5qtOQEBrs8U9L
         zGqGFMcJp7L5Jpw4XxP7Bs0jfXH+umpJ9KtE+lw6nqMpAg5IGyb44ya5XgB+aJV3fu
         VT7XvbKm9GMii0MAu+3px/Us96jYuAGrCejNvpvB5t5AHmObGL10OUibGl2vx7Y5t/
         47H7nu3+ixLuw==
X-Nifty-SrcIP: [209.85.221.173]
Received: by mail-vk1-f173.google.com with SMTP id r85so1864306vke.3
        for <linux-kbuild@vger.kernel.org>; Thu, 24 Oct 2019 09:58:59 -0700 (PDT)
X-Gm-Message-State: APjAAAV29WId/a4x5Rd8ss5O/QXjqQ3NN1t0HjfhbTyBZafKGEW9gHf+
        A7PJKobX56EHrvH2LO/p1Uk1NFcAWuDoa7Q+K8s=
X-Google-Smtp-Source: APXvYqxHaElbDfU1q38nj9H0DbNcD6/Fnd5bvr3Ps6edqaEv37T8/NeUzhOHTQW97SoRvfO2dZSXfw3l00Dv1CfBj1Y=
X-Received: by 2002:ac5:c34c:: with SMTP id l12mr4349570vkk.96.1571936337925;
 Thu, 24 Oct 2019 09:58:57 -0700 (PDT)
MIME-Version: 1.0
References: <20191023015426.31169-1-unixbhaskar@gmail.com>
In-Reply-To: <20191023015426.31169-1-unixbhaskar@gmail.com>
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
Date:   Fri, 25 Oct 2019 01:58:20 +0900
X-Gmail-Original-Message-ID: <CAK7LNARQ_XW9FGs0YkneR-4UomP=0Cj7D7cKpJCQ_EUYEkJ-gA@mail.gmail.com>
Message-ID: <CAK7LNARQ_XW9FGs0YkneR-4UomP=0Cj7D7cKpJCQ_EUYEkJ-gA@mail.gmail.com>
Subject: Re: [PATCH RESEND] scripts: setlocalversion: replace backquote to
 dollar parenthesis
To:     Bhaskar Chowdhury <unixbhaskar@gmail.com>
Cc:     Michal Marek <michal.lkml@markovi.net>,
        Nico Schottelius <nico-linuxsetlocalversion@schottelius.org>,
        Randy Dunlap <rdunlap@infradead.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, Oct 23, 2019 at 10:56 AM Bhaskar Chowdhury
<unixbhaskar@gmail.com> wrote:
>
> This patch replace backquote to dollar parenthesis syntax for better
> readability.
>
> Signed-off-by: Bhaskar Chowdhury <unixbhaskar@gmail.com>
>      Acked-by: Randy Dunlap <rdunlap@infradead.org>
>      Acked-by: Nico Schottelius <nico-linuxsetlocalversion@schottelius.org>
> ---

Applied to linux-kbuild. Thanks.





-- 
Best Regards
Masahiro Yamada
