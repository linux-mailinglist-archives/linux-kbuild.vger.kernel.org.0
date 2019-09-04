Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A09D8A7D52
	for <lists+linux-kbuild@lfdr.de>; Wed,  4 Sep 2019 10:08:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729235AbfIDIII (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 4 Sep 2019 04:08:08 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:44439 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727787AbfIDIIH (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 4 Sep 2019 04:08:07 -0400
Received: by mail-wr1-f66.google.com with SMTP id 30so9194890wrk.11;
        Wed, 04 Sep 2019 01:08:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:reply-to:from:date:message-id
         :subject:to:cc;
        bh=nRtC49Dm/rhUCn03iQZHARrHypohCTGXnVaebgfWCr0=;
        b=W1CN2OWfVk8dwEdpRBlWRuh/WBOMuqkk/Su+crqHtBonBdJEzJs2sIM8TMuf3DadE2
         5OuWyQXztSt7vctlnrfT0V/oVs1VSUPGlWRcslay3Br5ITISQYPWVcciX4d+PFhUNMbu
         Yuebsjc3W+/5e24deAiZ534hX8Ro1FGE5czxZNolQWNOBeNYD9KWgSb1plJp4ymqmoQB
         JWHS3jX4K/VYRAXPvuahMfrka8x4MmnxdinPMXbSzfXwrpv7rYTGQwrt6bjqq+Ob/14Q
         QK4XQcZ7btbHvSEM2PWEvJ26Av4rDa8PO5asNTB4QTz4vmTr4Dq1MQvhtZU2tRaWypWq
         TQxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:reply-to
         :from:date:message-id:subject:to:cc;
        bh=nRtC49Dm/rhUCn03iQZHARrHypohCTGXnVaebgfWCr0=;
        b=siAIEElFzYybaC7g/pLu2ZU6x4O3JBhuGgOzEPuudJEHEw/MeyMvP+SPkUJm+MDTU+
         uK4URN96s5u4Y3hrr6YsUtf20fu/gts6hDHdmMgRll+RVyx6LeajcXFb8u1+xtvOTS7V
         4ytoD8k1+waxrlkmhxa5CFTbctKhz5arOVbG1xr8lYrrJ5q6MIbxR3Z7C7Di+abZns5R
         a9nt1EOsiEDhhkfTWjcE80wwWDGTddFTRgdePz3934ttNMucSjcrFnFceEfm0hfEceRp
         PX08pA8FAp7k15n0Gn9XVGuLQ6G7tBx614zwJvjLuyKV8jVHbaHzCa+i9V41Ziz3JLes
         OYKQ==
X-Gm-Message-State: APjAAAUZxMI8kEdaDV+YW9nI+uhxs90naaJ6QqXBT0tr+UOEoegDYuIB
        msg3PXAhlHCOGBli1OK1iK02BeGiVP2uuB/TbBc=
X-Google-Smtp-Source: APXvYqxznwQy1JumjNN35qcyJdAdBOQOClaRolrP6cNdeYdf5NjHOpZAkJi0AzkDh9g5KfL3qkfeJbOUCZdSw5fJRM4=
X-Received: by 2002:a5d:69c8:: with SMTP id s8mr12470313wrw.353.1567584485275;
 Wed, 04 Sep 2019 01:08:05 -0700 (PDT)
MIME-Version: 1.0
References: <20190831162555.31887-1-yamada.masahiro@socionext.com>
 <20190831162555.31887-2-yamada.masahiro@socionext.com> <CAKwvOdm0zcyaBLdSVc7PmjUa-wyVuCaN=6qZoPLvnoJC1ammog@mail.gmail.com>
 <CA+icZUWzSsFXLmrO2G7ochE62e=kByEV6UKregcJqZrJN1WJxQ@mail.gmail.com>
In-Reply-To: <CA+icZUWzSsFXLmrO2G7ochE62e=kByEV6UKregcJqZrJN1WJxQ@mail.gmail.com>
Reply-To: sedat.dilek@gmail.com
From:   Sedat Dilek <sedat.dilek@gmail.com>
Date:   Wed, 4 Sep 2019 10:07:51 +0200
Message-ID: <CA+icZUXboR-0TzpSHf7a8MSjxPWxdC13Oudu8D+b+umtvWCCkg@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] kbuild: rename KBUILD_ENABLE_EXTRA_GCC_CHECKS to KBUILD_EXTRA_WARN
To:     Nick Desaulniers <ndesaulniers@google.com>
Cc:     Masahiro Yamada <yamada.masahiro@socionext.com>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Nathan Chancellor <natechancellor@gmail.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Michal Marek <michal.lkml@markovi.net>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        linux-doc@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, Sep 4, 2019 at 8:58 AM Sedat Dilek <sedat.dilek@gmail.com> wrote:
>
> On Tue, Sep 3, 2019 at 11:50 PM Nick Desaulniers
> <ndesaulniers@google.com> wrote:
> >
> > On Sat, Aug 31, 2019 at 9:26 AM Masahiro Yamada
> > <yamada.masahiro@socionext.com> wrote:
> > >
> > > KBUILD_ENABLE_EXTRA_GCC_CHECKS started as a switch to add extra warning
> > > options for GCC, but now it is a historical misnomer since we use it
> > > also for Clang, DTC, and even kernel-doc.
> >
> > Thanks for the patch!
> > Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>
> >
>
> Thanks for the patch.
> I like the backward compatibility and am OK with pointing to 'make
> --help' for the documentation part (KISS - Keep It Simple and
> Short/Stupid).
>
> Reviewed-by: Sedat Dilek <sedat.dilek@gmail.com>

If you will do a next version...

- @echo  '  make W=n   [targets] Enable extra gcc checks, n=1,2,3 where'
+ @echo  '  make W=n   [targets] Enable extra checks, n=1,2,3 where'

...clarify on extra checks for compiler...

+ @echo  '  make W=n   [targets] Enable extra *compiler* checks, n=1,2,3 where'

Thanks in advance.

- Sedat -
