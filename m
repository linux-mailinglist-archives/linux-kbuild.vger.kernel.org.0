Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4EE523C93F1
	for <lists+linux-kbuild@lfdr.de>; Thu, 15 Jul 2021 00:42:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236817AbhGNWnZ (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 14 Jul 2021 18:43:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35600 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236625AbhGNWnY (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 14 Jul 2021 18:43:24 -0400
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D96EBC061760
        for <linux-kbuild@vger.kernel.org>; Wed, 14 Jul 2021 15:40:31 -0700 (PDT)
Received: by mail-lf1-x130.google.com with SMTP id f30so6388048lfj.1
        for <linux-kbuild@vger.kernel.org>; Wed, 14 Jul 2021 15:40:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=XF9g4Kiw/Fnjhra0A3NHssg/L+MsgY/bbhNOhs2yWkg=;
        b=XwnAiopxVuee/+xvAawo1KbGDlP9AIOqV52u6nh+zQy7X8YyvYLVsIWrsG5z4hsAZo
         Us04RZB8+P1gHRtT9c5f7srdMs0z/wnINhl02yV17re/Cvj3nskjZ10AhDcDnZq6QQVD
         AjLwXMP+HKQ5AC55ituGLykCuW4g6U7vxsBmc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=XF9g4Kiw/Fnjhra0A3NHssg/L+MsgY/bbhNOhs2yWkg=;
        b=A3wkyDVDTTy80+Dn63HIUM7f/F7QdwAzUmOml2Bl+NUhXt415Dxd5Bgz4LNpWC9ZIR
         ZkmxdEzC69O7mSNmC2jS+eHWaWKxZxrCAg5bPA9OlqnytVqr3+XRPmtR2HB71l5vN74m
         Zm3EoYl0mEDTv285xRtoFyfdq+ZuUFBTIRlqA2ljMTyhrNqWeKdkqnog2hcM9TR/S96A
         HR81vTW1Bvoo/9w/zWD11e3xUOK/Z7vBRisdmjK6VRFPbveTkwAUuNH6EOdY/RnDUiSi
         im05VLxOVyyaogY2OqIWDFzrdF5hjmmxpk7VTS/WJ8WYsR1m9oWgZgJVUzcTLE0hqUos
         d+/g==
X-Gm-Message-State: AOAM5330KrNUJjUD+PM/boXEJq0K1uGfo7cKn6tkRbkLwSN1OPBM6zfo
        hr7Cqs0P7VIOCs4IGktjOX4/1R+Ut8tlYR0B
X-Google-Smtp-Source: ABdhPJwIYFa8/W8SkGwoYctha5lQ9+F37WX8E92T+Y7PYiBSmNVKq7YxVMqZ4L/WOaZ/kUqd8uIEXA==
X-Received: by 2002:a05:6512:2314:: with SMTP id o20mr265896lfu.531.1626302430091;
        Wed, 14 Jul 2021 15:40:30 -0700 (PDT)
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com. [209.85.167.50])
        by smtp.gmail.com with ESMTPSA id a10sm386221ljj.94.2021.07.14.15.40.28
        for <linux-kbuild@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Jul 2021 15:40:28 -0700 (PDT)
Received: by mail-lf1-f50.google.com with SMTP id x25so6311599lfu.13
        for <linux-kbuild@vger.kernel.org>; Wed, 14 Jul 2021 15:40:28 -0700 (PDT)
X-Received: by 2002:a05:6512:3f82:: with SMTP id x2mr265721lfa.421.1626302428152;
 Wed, 14 Jul 2021 15:40:28 -0700 (PDT)
MIME-Version: 1.0
References: <20210704202756.29107-1-ojeda@kernel.org> <20210704202756.29107-3-ojeda@kernel.org>
 <CAKwvOdmhRuF5eTZ2ztZBrL6BvDkA57B7OfVuvCaEMfV8nkLXCQ@mail.gmail.com>
 <CAHk-=whzXv=Fu7dQshSTyd9H1-JS5=gyKwW-GMNGccAKs4Mwpg@mail.gmail.com>
 <87mtqo1wv6.fsf@disp2133> <CAHk-=whdi_biEOrzrYn7OC+wq+ckoaa5dFAATdM=n9P7Dp0YOA@mail.gmail.com>
 <87a6mo1v0q.fsf@disp2133>
In-Reply-To: <87a6mo1v0q.fsf@disp2133>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Wed, 14 Jul 2021 15:40:12 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjWiu5uak824BeWu5J+9n1NhQ9UKDGgcUfrumra6r+Z0A@mail.gmail.com>
Message-ID: <CAHk-=wjWiu5uak824BeWu5J+9n1NhQ9UKDGgcUfrumra6r+Z0A@mail.gmail.com>
Subject: Re: [PATCH 02/17] kallsyms: increase maximum kernel symbol length to 512
To:     "Eric W. Biederman" <ebiederm@xmission.com>
Cc:     Nick Desaulniers <ndesaulniers@google.com>,
        Miguel Ojeda <ojeda@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        rust-for-linux <rust-for-linux@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Alex Gaynor <alex.gaynor@gmail.com>,
        Geoffrey Thomas <geofft@ldpreload.com>,
        Finn Behrens <me@kloenk.de>,
        Adam Bratschi-Kaye <ark.email@gmail.com>,
        Wedson Almeida Filho <wedsonaf@google.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, Jul 14, 2021 at 1:49 PM Eric W. Biederman <ebiederm@xmission.com> wrote:
>
> Sorry I was meaning to ask should the C symbols that get hashed
> include their types in the hash as well?  Because if everything
> is going to be hashed we need to clear definition of what we do
> with good old C symbols as well.

Oh, I guess if we wanted to be fancy, we could make the modversion
information be part of the hash.

Because we already have that, and that's kind of what it is. But I
wasn't actually thinking that fancy - I'd leave the C hash as just the
name hash with no type info.

Unless somebody really wants to do that modversions thing. It *would*
be a very natural thing to do in that "link using hashes" world view..

                Linus
