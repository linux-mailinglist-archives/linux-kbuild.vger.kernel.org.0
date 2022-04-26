Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 32DD65103B9
	for <lists+linux-kbuild@lfdr.de>; Tue, 26 Apr 2022 18:40:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244933AbiDZQoE (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 26 Apr 2022 12:44:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53056 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348665AbiDZQoD (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 26 Apr 2022 12:44:03 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0E2E2BE13
        for <linux-kbuild@vger.kernel.org>; Tue, 26 Apr 2022 09:40:55 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id x17so32943625lfa.10
        for <linux-kbuild@vger.kernel.org>; Tue, 26 Apr 2022 09:40:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=fqueYHGBpkvl2UC9CcSLlzu06+co5a0HYwKYVQXXlxQ=;
        b=Wu/cE5RmdzCdeA3QYzRxKb85+k8dUOSdgrDnfs1bHmFy29o1q3eL+ejynv2C1zYwj2
         /e08ICmkzYVL+XbYklwlwgU+etvnKR3e4QCiVdPxsiwaoGAnLSy2mvz+jni2+aIsx+sL
         IcIs8tWyE4STzyWj4xnt8DbhqTS2/1B2s+RkYy8wTaAjIbkeFIr1e04UmERJW8J54lqR
         SaIhle7LscGB8w08xoMghGyDKQFp+wqgQPkGuCDPw0LjmgBVSxiDh4eCEyLk5CaVgcFk
         XEmEx8mfjWHk/81HoPiudE3USckaPUksJgHBhBUEORvZBXRcNbalsZvZILODS92lA/mg
         mAww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=fqueYHGBpkvl2UC9CcSLlzu06+co5a0HYwKYVQXXlxQ=;
        b=YHSqrdcV6+TvpkCzS7U+Ovgdrph5U7a9bMXATn3/o7iOLT3Jzfd6Fs8MFYjYqnEMTI
         vRT6KMDYzfczmOrwRVeZ2s2wU2JKwZSe/1+RhbeW1b7ZQBLqN1X74YbzxJr99RL82+Ze
         HOMJr2tdhEBk7MnOLq6S0nPaxJldI25f59gSGOpNLMPUu/J5epy2kuonMtagL/PTf065
         OV2wqQCyD9rDX4hWMJU9B1Fz/t5aaYKqZevkLPHHnLb8143KfAFx606XkMue6WoQexW7
         CmFagILIRUis2C/XvipsikLJWGHbO1J7YqtqliayP5oThNvsMo1eiD+2hq9C2d1C1e7d
         LSPQ==
X-Gm-Message-State: AOAM533pL6duWT1DzEaHJFTWGVKSjqXH769rg0oCrF6etruSX1bf+yf3
        HtY+rV4bwAvqLGCACsDNyB/CLvUaRfhnJXPLCjlQiTIhpU0=
X-Google-Smtp-Source: ABdhPJyJzubFSWnwzD9vAlMyHZanErLBPeKAQeH2atwZT+VQLnRDa34pRUDJO2+m/FtJUXlMpFMMmPypgOQHd/Y9wDc=
X-Received: by 2002:ac2:5223:0:b0:448:5100:e427 with SMTP id
 i3-20020ac25223000000b004485100e427mr17294136lfl.87.1650991253103; Tue, 26
 Apr 2022 09:40:53 -0700 (PDT)
MIME-Version: 1.0
References: <20220424190811.1678416-1-masahiroy@kernel.org>
 <20220424190811.1678416-10-masahiroy@kernel.org> <CAKwvOdkac4Bk+u=v2dwSD=X0kZo2y4UxRUNHJdYiTLTPSp7=kQ@mail.gmail.com>
 <CAK7LNAR4N_OAUJJnCoZWA3OKWPFJHgOTLmsgY+DHaXRJFwGsGQ@mail.gmail.com>
In-Reply-To: <CAK7LNAR4N_OAUJJnCoZWA3OKWPFJHgOTLmsgY+DHaXRJFwGsGQ@mail.gmail.com>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Tue, 26 Apr 2022 09:40:41 -0700
Message-ID: <CAKwvOd=W3sgPFie_WzOGqfkhht-_cfyOnWqaiCuDpFid=uibFA@mail.gmail.com>
Subject: Re: [PATCH 09/27] modpost: add sym_add_unresolved() helper
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Michal Marek <michal.lkml@markovi.net>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Mon, Apr 25, 2022 at 9:00 PM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> On Tue, Apr 26, 2022 at 3:41 AM Nick Desaulniers
> <ndesaulniers@google.com> wrote:
> >
> > On Sun, Apr 24, 2022 at 12:09 PM Masahiro Yamada <masahiroy@kernel.org> wrote:
> > >
> > > Add a small helper, sym_add_unresolved() to ease the further
> > > refactoring.
> > >
> > > Remove the 'weak' argument from alloc_symbol() because it is sensible
> > > only for unresolved symbols.
> >
> > I did not yet read the rest of the series to see how else your newly
> > added helper `sym_add_unresolved` is used.
> > Perhaps the callers of `alloc_symbol` should just set the symbol's
> > weak member to true if needed, and alloc_symbol can default to setting
> > it false (as the memset currently does)?
> >
> > Then, you don't need the helper, and just `handle_symbol` needs the
> > assignment when `ELF_ST_BIND(sym->st_info) == STB_WEAK`?
>
>
> I will change this in the later commit:
> https://patchwork.kernel.org/project/linux-kbuild/patch/20220424190811.1678416-11-masahiroy@kernel.org/
>
> I think this is a good case for a new helper.
>
> If you look at the entire series,
> "allocate a new symbol and connect it to the proper linked list or hash_table"
> is consistently done in a helper function.
>
>
> Also, I chose the function name as they look symmetrical.
>
>  sym_add_unresolved()
>  sym_add_exported()
>  sym_add_crc()

Ok.
Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>
-- 
Thanks,
~Nick Desaulniers
