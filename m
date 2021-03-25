Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BAC0A348906
	for <lists+linux-kbuild@lfdr.de>; Thu, 25 Mar 2021 07:22:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229653AbhCYGVg (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 25 Mar 2021 02:21:36 -0400
Received: from conssluserg-02.nifty.com ([210.131.2.81]:57541 "EHLO
        conssluserg-02.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229908AbhCYGVJ (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 25 Mar 2021 02:21:09 -0400
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42]) (authenticated)
        by conssluserg-02.nifty.com with ESMTP id 12P6Kq8r011624;
        Thu, 25 Mar 2021 15:20:52 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-02.nifty.com 12P6Kq8r011624
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1616653252;
        bh=8zBxAZTZhqLVUdKtdKT+NTy/7cM48Qg0YutzNlS3X6s=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=fWZd68fmvrHmXIx5oQOXJKQgO435qyVj26+ZbHiTwB3U+JkxI+p1FBaQBM6Y/zLFr
         7iXMkheE3myrxel7oEuzli4ik+1euTWhveTN+r8xNkTRZjI3QXIYnlbtvklO5CmTfq
         qEwLTOpk+MEdgW3e+YWRqU3xQui6OT8rxqbZ+xNfDmvX0aIXwpuI3LnoOvH3krpXNj
         QEJQq08my8RDaYgD5G0rGKG33aOsoLEwCn9zYEpA1ymqc3JPOMZfOcu9+8hvjYNcUB
         udqNg4rUNJGzDFNX+RHNtVorVN+Uly7fiXhYgDUBL+tzQJf6RYRzzgbQdZ+zegy3Kq
         ytChctXpYxQbA==
X-Nifty-SrcIP: [209.85.216.42]
Received: by mail-pj1-f42.google.com with SMTP id x7-20020a17090a2b07b02900c0ea793940so2278971pjc.2;
        Wed, 24 Mar 2021 23:20:52 -0700 (PDT)
X-Gm-Message-State: AOAM533dnBOk0CBqCfhpnST8r3Sr9iVPE1KvCeU4+8g091WlYCFItfMH
        CBsjqkXalZKPvR7lsszmWdM0ZJYbRuaUPvtTFTI=
X-Google-Smtp-Source: ABdhPJxvLfC9axA1MpCDg04uRGzNnQxbk0faM3oWk73TIoATXtrSQagtfAXZvlu++rP4dz5+oh09Y9PXIiojsJABBEM=
X-Received: by 2002:a17:90a:fb54:: with SMTP id iq20mr6910829pjb.153.1616653251472;
 Wed, 24 Mar 2021 23:20:51 -0700 (PDT)
MIME-Version: 1.0
References: <20210322213806.089334551@goodmis.org> <20210322214032.293992979@goodmis.org>
 <CAK7LNAQh=zKVTwup5Kh39oTnVEUNotX-Ce7_+2uRO1GNVOaDbw@mail.gmail.com> <20210324095417.49c6377b@gandalf.local.home>
In-Reply-To: <20210324095417.49c6377b@gandalf.local.home>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Thu, 25 Mar 2021 15:20:13 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQ4uRB+9M4h0KVwEQUnX1XZrsE30KP_pqJqYjF2FcsHZA@mail.gmail.com>
Message-ID: <CAK7LNAQ4uRB+9M4h0KVwEQUnX1XZrsE30KP_pqJqYjF2FcsHZA@mail.gmail.com>
Subject: Re: [PATCH 2/2] streamline_config.pl: Add softtabstop=4 for vim users
To:     Steven Rostedt <rostedt@goodmis.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        "John (Warthog9) Hawley" <warthog9@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, Mar 24, 2021 at 10:54 PM Steven Rostedt <rostedt@goodmis.org> wrote:
>
> On Wed, 24 Mar 2021 15:01:13 +0900
> Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> > On Tue, Mar 23, 2021 at 6:40 AM Steven Rostedt <rostedt@goodmis.org> wrote:
> > >
> > > From: "Steven Rostedt (VMware)" <rostedt@goodmis.org>
> > >
> > > The tab stop for Perl files is by default (at least in emacs) to be 4
> > > spaces, where a tab is used for all 8 spaces. Add a local variable comment
> > > to make vim do the same by default, and this will help keep the file
> > > consistent in the future when others edit it via vim and not emacs.
> > >
> > > Signed-off-by: Steven Rostedt (VMware) <rostedt@goodmis.org>
> >
> >
> > Documentation/process/coding-style.rst says "do not do this".
>
> I take that file more as for C code, never took it for Perl ;-)
>
> >
> > Rather, I want to remove this ugly stuff entirely.
> > https://lore.kernel.org/patchwork/patch/1401439/
>
> And I totally agree it does not belong in C code.
>
> >
> > Adding .editorconfig seems OK to me, but
> > Doing this in individual files in an editor-specific
> > manner is a horror.
>
> Is there a way to add this for the directory?
>
> The reason I added this was because of the different ways that vim and
> emacs handle Perl files. I just added this to ktest.pl because I want it to
> be consistent.
>
> The emacs way to edit Perl is to have 4 space indentation, but use tabs for
> every 8 spaces. That is, you have:
>
>     (4 spaces)
>         (1 tab)
>             (1 tab and 4 spaces)
>                 (2 tabs)
>                     (2 tabs and 4 spaces)
>
> etc.


The root cause of inconsistency is that
you mix up space-indentation and tab-indentation.
I do not know if it is a standard way either.

For example, scripts/checkpatch.pl uses only tabs,
which I think is more robust.

Unfortunately, we do not have standardized indentation style
for scripts yet, and people can go in any direction.

The editorconfig patch [1] proposed to always use 4-space
indentation for *.pl files.
(that is, do not replace 8 spaces with a tab).

I do not know whether the kernel will adopt .editorconfig or not,
but if that patch is applied, your 1/2 will be a step backward.

My got-feeling is, you will never reach the goal as long as
you adopt a strange indentation style, which is obscure
to other contributors.

Not all people use vim.
I am not interested in 1/2 either.

If you insist on this patch set, apply it to your tree
and send a pull request by yourself.


[1]: https://lore.kernel.org/lkml/20200703073143.423557-1-danny@kdrag0n.dev/



>
> What I found from people who edit Perl code is that they will either just
> indent 8 (with tabs), or just use all spaces. Then you have:
>
>             (1 tab and 4 spaces)
>             (followed by 12 spaces!)
>
> The way to make vim work the same is to add the softtabspace=4 command.
>
> We can not add this, but then have to either police the patches coming in,
> or constantly clean up the code after the fact.
>
> This code doesn't change much, so I'm fine with that. But for ktest.pl, I'm
> adding it.
>
> -- Steve



-- 
Best Regards
Masahiro Yamada
