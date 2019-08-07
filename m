Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3B1AA84F8F
	for <lists+linux-kbuild@lfdr.de>; Wed,  7 Aug 2019 17:13:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729278AbfHGPNG (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 7 Aug 2019 11:13:06 -0400
Received: from conssluserg-03.nifty.com ([210.131.2.82]:17775 "EHLO
        conssluserg-03.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726773AbfHGPNF (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 7 Aug 2019 11:13:05 -0400
Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com [209.85.222.54]) (authenticated)
        by conssluserg-03.nifty.com with ESMTP id x77FCnrq010499;
        Thu, 8 Aug 2019 00:12:50 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-03.nifty.com x77FCnrq010499
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1565190770;
        bh=XMNA60wRAOzSL1uB07FT9Mk5JB9lAGHaUwpsWNnQtEA=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=G94bXiS82+L4z619k2H6+p8sx6dXwiPhKN0AiTNVX41HeFvgFRTla/SrlegWf69nB
         lbfi8xY50vucLOObFV31c9uTlEqjohIaC/8BITQ8B53u4WicL9Q9/VtVmH2gHU2nup
         dOtQd0X/RQRq0PIbzdJ/ONs8IvM3HiXHM8z/gmEW9qelWhyPQ9jRZ3Gx/ko2aIhsfj
         OAfezTFbSZPU7/CqZlZN3bDNhrimFf0uxHE6P/0jMihdBjKAYuSYBHfx18c934FZD1
         sPpv3+PkqBkyg/5rxxYU+tW80WTcJ8jRvdYdURgiaCLVDA4Pxy9/I1HRmEDywQQdjj
         uHGrJJd3nL6XQ==
X-Nifty-SrcIP: [209.85.222.54]
Received: by mail-ua1-f54.google.com with SMTP id g11so8330440uak.0;
        Wed, 07 Aug 2019 08:12:50 -0700 (PDT)
X-Gm-Message-State: APjAAAVCCrBgx8UwGGI6j2jw+x0lWUDbK0NQFWvxbjxCvtdWUJ0fdIre
        RIoflfTH8sTsQ90AJnbBSF7sdz2c18DlaccbD0Y=
X-Google-Smtp-Source: APXvYqxFamI8oMtXQhiaXeYmfMDFOMb3+xZSQ+j/gvZNSHS0gXKkYxm5dg+rdli0FnwavvbtiJ46H8U4OuCWsJ7u/is=
X-Received: by 2002:ab0:234e:: with SMTP id h14mr5964979uao.25.1565190768849;
 Wed, 07 Aug 2019 08:12:48 -0700 (PDT)
MIME-Version: 1.0
References: <20190714152817.24693-1-efremov@linux.com> <20190801060657.5932-1-efremov@linux.com>
In-Reply-To: <20190801060657.5932-1-efremov@linux.com>
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
Date:   Thu, 8 Aug 2019 00:12:12 +0900
X-Gmail-Original-Message-ID: <CAK7LNASdhyhhqyf1wcga7UDYoo=2t-0ZaqTmQdcsFOfAR580sw@mail.gmail.com>
Message-ID: <CAK7LNASdhyhhqyf1wcga7UDYoo=2t-0ZaqTmQdcsFOfAR580sw@mail.gmail.com>
Subject: Re: [PATCH v5] modpost: check for static EXPORT_SYMBOL* functions
To:     Denis Efremov <efremov@linux.com>
Cc:     Michal Marek <michal.lkml@markovi.net>,
        Emil Velikov <emil.l.velikov@gmail.com>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, Aug 1, 2019 at 3:07 PM Denis Efremov <efremov@linux.com> wrote:
>
> This patch adds a check to warn about static EXPORT_SYMBOL* functions
> during the modpost. In most of the cases, a static symbol marked for
> exporting is an odd combination that should be fixed either by deleting
> the exporting mark or by removing the static attribute and adding the
> appropriate declaration to headers.
>
> This check could help to detect the following problems:
> 1. 550113d4e9f5 ("i2c: add newly exported functions to the header, too")
> 2. 54638c6eaf44 ("net: phy: make exported variables non-static")
> 3. 98ef2046f28b ("mm: remove the exporting of totalram_pages")
> 4. 73df167c819e ("s390/zcrypt: remove the exporting of ap_query_configuration")
> 5. a57caf8c527f ("sunrpc/cache: remove the exporting of cache_seq_next")
> 6. e4e4730698c9 ("crypto: skcipher - remove the exporting of skcipher_walk_next")
> 7. 14b4c48bb1ce ("gve: Remove the exporting of gve_probe")
> 8. 9b79ee9773a8 ("scsi: libsas: remove the exporting of sas_wait_eh")
> 9. ...
>
> The build time impact is very limited and is almost at the unnoticeable
> level (< 1 sec).
>
> Acked-by: Emil Velikov <emil.l.velikov@gmail.com>
> Signed-off-by: Denis Efremov <efremov@linux.com>
> ---

Applied to linux-kbuild. Thanks.




-- 
Best Regards
Masahiro Yamada
