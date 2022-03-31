Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0DDF84ED4CD
	for <lists+linux-kbuild@lfdr.de>; Thu, 31 Mar 2022 09:30:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231458AbiCaHc0 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 31 Mar 2022 03:32:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53206 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232196AbiCaHcW (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 31 Mar 2022 03:32:22 -0400
Received: from conssluserg-02.nifty.com (conssluserg-02.nifty.com [210.131.2.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E521A1DE594;
        Thu, 31 Mar 2022 00:30:34 -0700 (PDT)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177]) (authenticated)
        by conssluserg-02.nifty.com with ESMTP id 22V7UGG0029675;
        Thu, 31 Mar 2022 16:30:16 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-02.nifty.com 22V7UGG0029675
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1648711817;
        bh=9Htjky9XkVnyUWia+NbkPjjSVOOOk9oXjJ0/73vR0WE=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=09j5XpbnARkHo1663RYGjwTfTBie0lA6g7DBnrSnRwJB/vkVDQBEJ1Tc08L22nx6Q
         KuZksZsWTQW4Km9WjQSm4ThFKU6eCc4c8yDaNwx/mmVPH6E18M00WxIdU1pcnS7PcZ
         VdGaWBPoM8XFvo+PvG0E5CziaPO+nHGQwz8OxS48uSULGDoN/5br05H4R2x6fMembO
         I1iJY+SB4ICnalDIfkFFQ3fy3rKgjT4heOuIqj14Q6P2K1ao1LiEB8EWBr5+J7/ryS
         qdGiTO56TWr9c0t4xa4c6aAEM4mVeKIoBR1e5snLBY0TRcODSmCmDORA6gvTWFDGEG
         TrLUpGhQOSxFw==
X-Nifty-SrcIP: [209.85.214.177]
Received: by mail-pl1-f177.google.com with SMTP id x2so22632292plm.7;
        Thu, 31 Mar 2022 00:30:16 -0700 (PDT)
X-Gm-Message-State: AOAM531n4e5f9Bpi0v/t6Gz6VS4aPojPRmF+cRMFYi7z6khmIkt8WefZ
        fKrH7EtwpW8tyJVo8KzhulhA9XlufutR/IOA0BQ=
X-Google-Smtp-Source: ABdhPJxUYlg8xglwS7unqeL3Qg1V0KxRq8m3F9e9rDzp88ArQtlOndUIMBaAh9o1sujNi92PFsOKGmNv02Edcu1ePLA=
X-Received: by 2002:a17:90b:4d01:b0:1c9:ec79:1b35 with SMTP id
 mw1-20020a17090b4d0100b001c9ec791b35mr4459174pjb.77.1648711815860; Thu, 31
 Mar 2022 00:30:15 -0700 (PDT)
MIME-Version: 1.0
References: <20220330201755.29319-1-mathieu.desnoyers@efficios.com> <20220330162152.17b1b660@gandalf.local.home>
In-Reply-To: <20220330162152.17b1b660@gandalf.local.home>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Thu, 31 Mar 2022 16:29:30 +0900
X-Gmail-Original-Message-ID: <CAK7LNATm5FjZsXL6aKUMhXwQAqTuO9+LmAk3LGjpAib7NZBDmg@mail.gmail.com>
Message-ID: <CAK7LNATm5FjZsXL6aKUMhXwQAqTuO9+LmAk3LGjpAib7NZBDmg@mail.gmail.com>
Subject: Re: [PATCH] tracing: do not export user_events uapi
To:     Steven Rostedt <rostedt@goodmis.org>
Cc:     Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Beau Belgrave <beaub@linux.microsoft.com>,
        Masami Hiramatsu <mhiramat@kernel.org>,
        linux-trace-devel <linux-trace-devel@vger.kernel.org>,
        bpf <bpf@vger.kernel.org>,
        Network Development <netdev@vger.kernel.org>,
        Alexei Starovoitov <alexei.starovoitov@gmail.com>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_SOFTFAIL,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, Mar 31, 2022 at 5:21 AM Steven Rostedt <rostedt@goodmis.org> wrote:
>
>
> Adding the build maintainers.
>
> -- Steve
>
> On Wed, 30 Mar 2022 16:17:55 -0400
> Mathieu Desnoyers <mathieu.desnoyers@efficios.com> wrote:
>
> > In addition to mark the USER_EVENTS feature BROKEN until all interested
> > parties figure out the user-space API, do not install the uapi header.
> >
> > This prevents situations where a non-final uapi header would end up
> > being installed into a distribution image and used to build user-space
> > programs that would then run against newer kernels that will implement
> > user events with a different ABI.
> >
> > Link: https://lore.kernel.org/all/20220330155835.5e1f6669@gandalf.local.home
> >
> > Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
> > ---
> >  include/uapi/Kbuild | 3 +++
> >  1 file changed, 3 insertions(+)
> >
> > diff --git a/include/uapi/Kbuild b/include/uapi/Kbuild
> > index 61ee6e59c930..425ea8769ddc 100644
> > --- a/include/uapi/Kbuild
> > +++ b/include/uapi/Kbuild
> > @@ -12,3 +12,6 @@ ifeq ($(wildcard $(objtree)/arch/$(SRCARCH)/include/generated/uapi/asm/kvm_para.
> >  no-export-headers += linux/kvm_para.h
> >  endif
> >  endif
> > +
> > +# API is not finalized
> > +no-export-headers += linux/user_events.h
>


Well, the intended usage of no-export-headers is to
cater to the UAPI supported by only some architectures.
We have kvm(_para).h here because not all architectures
support kvm.

If you do not want to export the UAPI,
you should not put it in include/uapi/.

After the API is finalized, you can move it to
include/uapi.


-- 
Best Regards
Masahiro Yamada
