Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7E5375103B6
	for <lists+linux-kbuild@lfdr.de>; Tue, 26 Apr 2022 18:40:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1353059AbiDZQnS (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 26 Apr 2022 12:43:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50858 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347384AbiDZQnP (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 26 Apr 2022 12:43:15 -0400
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com [IPv6:2a00:1450:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9169413E83
        for <linux-kbuild@vger.kernel.org>; Tue, 26 Apr 2022 09:40:07 -0700 (PDT)
Received: by mail-lj1-x22f.google.com with SMTP id q14so22715690ljc.12
        for <linux-kbuild@vger.kernel.org>; Tue, 26 Apr 2022 09:40:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=cB5NjQgyHxPYEpDTZ0PSuz+LJmELdLbWCQhQbA445xM=;
        b=jIea80rv6317KJHDIdWEbWLBH461Z6ATA9dHEddVM6shF40hnoZ/lnlgYWIl1caWXG
         Yb/G0dSCt5pOJZdvCTEDTQrIg045MQkLNpLdop5n97g8AavwMV2wfDM3puA15FUjILKx
         8MBe4JSCXWmgocvd1aXyzegdZiEZFRlgw2J7xvdT1yj4JaKHfkKZeFo/awKotDRDuPJn
         +RzFukr2Ks+iaDANd0a83Usr7Xto7N6PiN1/9da4lpYRdntlJem0jBBIdrO959nSeSf+
         Dkj+H1b+xJNcmsONZxRDhqxHl8H0EnAGmUQSo4ts0TxJnlECnnqc/QWm9y4clr6yXM9c
         OGNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=cB5NjQgyHxPYEpDTZ0PSuz+LJmELdLbWCQhQbA445xM=;
        b=0XmsB7zvjrXkRpLlf1greKawMcBcl/M7JdCxjWsV2s/DW+pyCbpidcxKO0lQ4m04ZI
         +6rLTfpIq0R4lpYw3mTDtop4zY4kh6s06ZqCCDE0XKuNcoMEw/wP66yVMSDx5GoLAXiv
         KZ651hhPRS9bgHTUi2AOrLBsZeqUjjHCmy6RSA6+PHdQ/sede5NfWm9gM2bF5L7aX0k9
         NEFPg/f8I2bJGk2Mr6wr7x+rIB89v6ygNVBpaG6+YynIokk1O5bNxBFNOhkZSop0KZHL
         LxuE5P/aLpdKS2w5PEvNpQY5rM3AyByKp+8PHsV4OMmUUecPHp+Gd2055A5jX9S8Ve5T
         jLdQ==
X-Gm-Message-State: AOAM531EUCVt5HQkNgexbtkC5krGouXqC3/n/AYMcSIpv3GNDuKoItMc
        pknTUl8T55wTU8PiXNLBUCtsaPr7qzF87khdXamzSw==
X-Google-Smtp-Source: ABdhPJzCHG1DW6WwNCEQQr1E6ENnVyF3MYLe1M7kwazJPqDOFzVfHEITcsPFkNsdFROU9SnNXltpQ8u9ocAyT++DhiQ=
X-Received: by 2002:a2e:a7d4:0:b0:24d:b0c3:9683 with SMTP id
 x20-20020a2ea7d4000000b0024db0c39683mr14669411ljp.472.1650991205358; Tue, 26
 Apr 2022 09:40:05 -0700 (PDT)
MIME-Version: 1.0
References: <20220424190811.1678416-1-masahiroy@kernel.org>
 <20220424190811.1678416-17-masahiroy@kernel.org> <CAKwvOdk1nt4b9am=_BP=U3igkSRBN14nx+5oS8iaaw9zhbH5JA@mail.gmail.com>
 <CAK7LNAR-u=EVzPL+iJHoBW62AK2ViD3nVnL79EdxNS03UxmkBA@mail.gmail.com>
In-Reply-To: <CAK7LNAR-u=EVzPL+iJHoBW62AK2ViD3nVnL79EdxNS03UxmkBA@mail.gmail.com>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Tue, 26 Apr 2022 09:39:54 -0700
Message-ID: <CAKwvOd=9ffHMynzCPXPAAdz90BcW0JhihjqnRNneFqMq3u+59Q@mail.gmail.com>
Subject: Re: [PATCH 16/27] modpost: make multiple export error
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Michal Marek <michal.lkml@markovi.net>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Mon, Apr 25, 2022 at 9:10 PM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> On Tue, Apr 26, 2022 at 3:48 AM Nick Desaulniers
> <ndesaulniers@google.com> wrote:
> >
> > On Sun, Apr 24, 2022 at 12:09 PM Masahiro Yamada <masahiroy@kernel.org> wrote:
> > >
> > > This is currently a warning, but I think modpost should stop building
> > > in this case.
> > >
> > > If the same symbol is exported multiple times and we let it keep going,
> > > the sanity check becomes difficult.
> > >
> > > Only the legitimate case is that an external module overrides the
> > > corresponding in-tree module to provide a different implementation
> > > with the same interface.
> >
> > Could the same module export a weak version of a symbol, and a strong one?
>
> No.  There is no concept like   EXPORT_SYMBOL_WEAK.
>
> I am talking about kmod things.
> You can modprobe an external module instead of the in-kernel one.

Ok, this patch seems fine to me.
Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>
-- 
Thanks,
~Nick Desaulniers
