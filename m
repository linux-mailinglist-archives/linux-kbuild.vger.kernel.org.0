Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B20FF4D0F29
	for <lists+linux-kbuild@lfdr.de>; Tue,  8 Mar 2022 06:27:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243704AbiCHF2B (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 8 Mar 2022 00:28:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48260 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232750AbiCHF2A (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 8 Mar 2022 00:28:00 -0500
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com [IPv6:2607:f8b0:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 502D93B57C
        for <linux-kbuild@vger.kernel.org>; Mon,  7 Mar 2022 21:27:05 -0800 (PST)
Received: by mail-pf1-x435.google.com with SMTP id s8so12314521pfk.12
        for <linux-kbuild@vger.kernel.org>; Mon, 07 Mar 2022 21:27:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=oPr7jbEQjZcFbPcnfK3KFYS7eLKVUp4KxioDBpQLsHE=;
        b=KFudWe1Vy5F9opv/soKhgh7FbpSJlX8UMUatuMgFRoPStXK8BeJYII3IzceeF4CUsE
         tbZtmjAemFX5zvbE6wUAsuHZbZjxHyMXZWeEZcotbpQPuVRvG0M7k6VpuXKY6pkei48H
         zXfV9NCW2jKEE17DZ9Ra4LgaKKzI3Af1gO2wcA7ElXQGZWb4NCyLsLzkpbYM8UT9vsEO
         pUu9p56Gp1SA3gnsGePgMqiQbP60EhVUK9DOvNBmk8vIgN7nMuOBxQ+IB8iUaUiYu2Qb
         2Pna2NPt9syIKgvHRHKvIJRPlI6Fu620/j9bCtoglu3IB7vYM/lS7I1CEm9Rb4f9/4gY
         lvcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=oPr7jbEQjZcFbPcnfK3KFYS7eLKVUp4KxioDBpQLsHE=;
        b=Rca+riXV5zho36YXdnZxJhsIEpPlotJLZXZaNbB82qlT5RDQ6uJj7kGC1NZWmF0fO5
         84Ez8hb7pBUNwvKIzLJHmtdSwGTC/rwNeSFS1hYDWXVRpTfp5Iad0lrr+SjlgAYnYqRQ
         NA6x3JAW8mSaYDVcGcO9R8wgPenVH1OlCKBbSwDSIyMFMxtN65hAflutKh15h+FyPVJj
         8pfHm0sJ44t5PD7aJ68jNXJS9hF3SJLJY5abdiAl9ZDz/D7l/7FDSO3/92u1qd8Iu9T8
         OXfeOocDnfpj1uiRqXNlyuXF+iBMZalWTsQbDcx+hPi6Y6SIVI7YqVTm+xGIJGSqQ7aR
         TfaA==
X-Gm-Message-State: AOAM530+MFyK2ItSIW38dRFl53Y50UB2TpguhZ4tLPTqrE6DAqQFDfcD
        BLuNe2WeOI2ZcxIVIJCQnBQGYA==
X-Google-Smtp-Source: ABdhPJyH9JQVBjUGI9YE7QPYpbcBryWFyGEZ7zSUSAdXkhoivPgJwH+prK8BW8Uov0OvBfEDSxptFQ==
X-Received: by 2002:a63:d018:0:b0:374:a3c1:dfed with SMTP id z24-20020a63d018000000b00374a3c1dfedmr12888737pgf.155.1646717224619;
        Mon, 07 Mar 2022 21:27:04 -0800 (PST)
Received: from google.com (223.103.125.34.bc.googleusercontent.com. [34.125.103.223])
        by smtp.gmail.com with ESMTPSA id b2-20020a056a000a8200b004e1414f0bb1sm18580376pfl.135.2022.03.07.21.27.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Mar 2022 21:27:04 -0800 (PST)
Date:   Tue, 8 Mar 2022 05:26:59 +0000
From:   Chun-Tse Shao <ctshao@google.com>
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Nick Desaulniers <ndesaulniers@google.com>,
        Steven Rostedt <rostedt@goodmis.org>,
        Nicolas Schier <nicolas@fjasle.eu>,
        Rob Herring <robh+dt@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        David Howells <dhowells@redhat.com>,
        David Woodhouse <dwmw2@infradead.org>,
        Frank Rowand <frowand.list@gmail.com>,
        Josh Poimboeuf <jpoimboe@redhat.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        keyrings@vger.kernel.org, DTML <devicetree@vger.kernel.org>
Subject: Re: [PATCH v4] config: Allow kernel installation packaging to
 override pkg-config
Message-ID: <YibpI1MkqVUvEl9h@google.com>
References: <20220306223016.2239094-1-ctshao@google.com>
 <CAKwvOdnmtRYnSx3VvG=PEnzpzWa8f=0bn1xDymjER5EShS2tmw@mail.gmail.com>
 <YiaMJCHOOuujHwiK@google.com>
 <CAK7LNAS-=Fne6fyiqzQ6DwNLOdF-HAY9Libn10uyV9GmQQMUKQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAK7LNAS-=Fne6fyiqzQ6DwNLOdF-HAY9Libn10uyV9GmQQMUKQ@mail.gmail.com>
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, Mar 08, 2022 at 01:01:45PM +0900, Masahiro Yamada wrote:
> On Tue, Mar 8, 2022 at 7:50 AM Chun-Tse Shao <ctshao@google.com> wrote:
> >
> > On Mon, Mar 07, 2022 at 10:17:17AM -0800, Nick Desaulniers wrote:
> > > On Sun, Mar 6, 2022 at 2:39 PM Chun-Tse Shao <ctshao@google.com> wrote:
> > > >
> > > > Add HOSTPKG_CONFIG to allow tooling that builds the kernel to override
> > > > what pkg-config and parameters are used.
> > >
> > > Sorry, kind a late thought here for v4, but we don't seem to prefix
> > > many other host side tools with HOST_, i.e. LEX, YACC, AWK, PERL,
> > > PYTHON3, etc.  Maybe just having the variable identifier be simply
> > > PKGCONFIG rather than HOSTPKG_CONFIG then put it at the end of the
> > > list in the top level Makefile after ZSTD (i.e. the list of host
> > > tools)?  There's HOST_ prefixes when there's more than one tool
> > > involved (i.e. host compiler vs target compiler), but I suspect
> > > there's no such distinction for the existing uses of pkg-config?
> > >
> > Thanks for your suggestion, Nick! Yes I think it makes sense with PKGCONFIG
> > instead of HOSTPKG_CONFIG since there is only one tool involved. I will
> > work on it and submit a new patch.
> >
>
> Please hold on.
>
> I was also wondering what to do with the "HOST" prefix.
>
> Libraries are usually arch-dependent.
> (in other words, pkg-config should return different library paths
> for $(CC) and $(HOSTCC) )
>
> You already understood this, so you added "HOST" prefix.
>
>
> Please let me take time for further discussion.
> I will come back to this when I get some time.
>
>
> In the meantime,
>   a8a5cd8b472ca20e5b8fa649c43b3756867322f8
> as reference info if you have not seen it.
>
>
> How many distros support something like
> "aarch64-linux-gnu-pkg-config"  ?
>
> Ubuntu 18.04 and 20.04 seem to support it.
> I do not know for others.
>
>
>
>
>
> --
> Best Regards
>
> Masahiro Yamada

Thanks Masahiro! Will wait for your suggestion.

-CT
