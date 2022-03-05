Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 31B114CE727
	for <lists+linux-kbuild@lfdr.de>; Sat,  5 Mar 2022 22:09:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232603AbiCEVKO (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 5 Mar 2022 16:10:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59624 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232611AbiCEVKN (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 5 Mar 2022 16:10:13 -0500
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 998866A06C
        for <linux-kbuild@vger.kernel.org>; Sat,  5 Mar 2022 13:09:22 -0800 (PST)
Received: by mail-lf1-x133.google.com with SMTP id w27so19963511lfa.5
        for <linux-kbuild@vger.kernel.org>; Sat, 05 Mar 2022 13:09:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=s2/4A0u52052NhlLyv5JICwZ+hKXNcyjgvPejm7yB/I=;
        b=g8gQIPzfZ2LG3gjucY5ZIcN2ya279MiioMJ7uCceoo9vkrRICzK31sZf9y8ntZ/OSZ
         zhNbSxIWHh/6mLmeJ3TGYLeWaMuJcyFXU4X67ktDHsEMcoPGvxH3OT6tsXf+Mv+yzcoc
         1mE2TNZgL4GXuqrwWSr6hHya2FaGxdYrQzaZU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=s2/4A0u52052NhlLyv5JICwZ+hKXNcyjgvPejm7yB/I=;
        b=kcj30+9v3FrJiuLNAcolFNnK7jAz3ejooz3mFOncM0yQBqmqSifzDfDRpjaTfdXuY3
         oV5GFB4EBGclKiY//lNUeNbuFjdOv0LlE9Qwn18ArKoMkhya4reg0UsSgIRBSIm+6LdX
         uJfMgDQtJpVyoQyiSIramkQwuQMN6LyAT5bdFrjAMoKvN3NKN6+9VMQAHVApk3CxnMUa
         FRKJyJ0uZqBoKy4tDfcW5lbprgnFGUkJZvRlCKydybEMTW/qeKWlkEQtVIplBvrm9k4C
         T+J1UGv9Tq1x1yt2QrvXKgdcaQHyAUaskooOtWENvyGYVMseCS5QbJzpaVI7t6Es+t0Y
         NEyw==
X-Gm-Message-State: AOAM531rG5Xk44yf2ChWFUn9cAz7D3xsXAo+Uo+yeRqgQ8WauBOv14dg
        7Hx12Uh6e/vjexUbkuiiSb5bac8bGMZKgWm/5mU=
X-Google-Smtp-Source: ABdhPJxR77zKYoY/f6PTYEOj1XsUCI7/Z7Kjb0v2jmfoc+zVkv56hVCbyB1yfZOcQ+B6i6CPWN0k7A==
X-Received: by 2002:a05:6512:2808:b0:443:4cd7:fc3c with SMTP id cf8-20020a056512280800b004434cd7fc3cmr3027286lfb.527.1646514560661;
        Sat, 05 Mar 2022 13:09:20 -0800 (PST)
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com. [209.85.208.174])
        by smtp.gmail.com with ESMTPSA id f36-20020a0565123b2400b0043795432e87sm1865346lfv.150.2022.03.05.13.09.17
        for <linux-kbuild@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 05 Mar 2022 13:09:19 -0800 (PST)
Received: by mail-lj1-f174.google.com with SMTP id l12so15332403ljh.12
        for <linux-kbuild@vger.kernel.org>; Sat, 05 Mar 2022 13:09:17 -0800 (PST)
X-Received: by 2002:a2e:80c6:0:b0:246:3334:9778 with SMTP id
 r6-20020a2e80c6000000b0024633349778mr2967024ljg.443.1646514557473; Sat, 05
 Mar 2022 13:09:17 -0800 (PST)
MIME-Version: 1.0
References: <CAHk-=whJX52b1jNsmzXeVr6Z898R=9rBcSYx2oLt69XKDbqhOg@mail.gmail.com>
 <20220304025109.15501-1-xiam0nd.tong@gmail.com>
In-Reply-To: <20220304025109.15501-1-xiam0nd.tong@gmail.com>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Sat, 5 Mar 2022 13:09:01 -0800
X-Gmail-Original-Message-ID: <CAHk-=wjesxw9U6JvTw34FREFAsayEE196Fi=VHtJXL8_9wgi=A@mail.gmail.com>
Message-ID: <CAHk-=wjesxw9U6JvTw34FREFAsayEE196Fi=VHtJXL8_9wgi=A@mail.gmail.com>
Subject: Re: [PATCH 2/6] list: add new MACROs to make iterator invisiable
 outside the loop
To:     Xiaomeng Tong <xiam0nd.tong@gmail.com>
Cc:     Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jakob Koschel <jakobkoschel@gmail.com>,
        Jann Horn <jannh@google.com>,
        Kees Cook <keescook@chromium.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux-MM <linux-mm@kvack.org>, Netdev <netdev@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, Mar 3, 2022 at 6:51 PM Xiaomeng Tong <xiam0nd.tong@gmail.com> wrote:
>
> >  - it means that the already *good* cases are the ones that are
> > penalized by having to change
>
> Yes, but it also kills potential risks that one day somebody mistakely
> uses iterator after the loop in this already *good* cases, as it removed
> the original declare of pos and any use-after-loop will be catched by
> compiler.

The thing is, I think we already have a solution to that case.

I think it's the bad "entry used outside" that we need to care about doing well.

> 3. restore all name back to list_for_each_entry after everything is done:
>    (minus 2 chars)

You are ignoring the big elephant in the room - counting the small
things, but not counting the BIG thing.

That type name argument is long.

Right now we avoid it by pre-declaring it, and that's in many ways the
natural thing to do in C (you don't declare types in the place that
uses them, you declare the types in the variable declarations above
the code).

Now, I'd love for the list head entry itself to "declare the type",
and solve it that way. That would in many ways be the optimal
situation, in that when a structure has that

        struct list_head xyz;

entry, it would be lovely to declare *there* what the list entry type
is - and have 'list_for_each_entry()' just pick it up that way.

It would be doable in theory - with some preprocessor trickery all the
'struct list_head' things *could* be made to be unnamed unions of the
list head, and the actual type it points to, ie something like

   #define declare_list_head(type,type) union { struct list_head x;
type *x##_list_type; }

and then (to pick one particular example), we could make the "struct
task_struct" entry for children be

-       struct list_head                children;
+       declare_list_head(struct task_struct, children);

and now when you use

        list_for_each_entry(p, &father->children, sibling) {

you could actually pick out the type with some really ugly
preprocessor crud, by doing 'typeof(*head##_list_type)' to get the
type of the thing we iterate over.

So we *could* embed the type that a list head points to with tricks
like that. The it would actually be type-safe, and not need a
declaration of the type anywhere. And it would be kind of nice to
document "this is a list head pointer to this kind of type".

And yes, it would be even better if we could also encode the member
name that contains the list entries somehow (ie in this case the
'sibling' list entry of the task struct) so that you'd really document
the full chain. But even my twisted mind cannot come up with any
tricks to do *that*.

But the above would be quite a *major* change.

And the above kind of preprocessor trickery and encoding a secondary
type as a union entry that isn't actually used for anythign else may
be too ugly to live anyway.

                 Linus
