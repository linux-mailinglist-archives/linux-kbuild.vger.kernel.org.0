Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3536B3C7611
	for <lists+linux-kbuild@lfdr.de>; Tue, 13 Jul 2021 20:02:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230376AbhGMSFG (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 13 Jul 2021 14:05:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37240 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229478AbhGMSFG (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 13 Jul 2021 14:05:06 -0400
Received: from mail-qk1-x72d.google.com (mail-qk1-x72d.google.com [IPv6:2607:f8b0:4864:20::72d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8B365C0613DD;
        Tue, 13 Jul 2021 11:02:15 -0700 (PDT)
Received: by mail-qk1-x72d.google.com with SMTP id r125so14939516qkf.1;
        Tue, 13 Jul 2021 11:02:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=8TTYSZMJTfaJpr238K/4LxyKEosHZCJyy+F52YED+TY=;
        b=o8JQakp2L+wWqKAhlxER0A1Sdy69isN9DelFCPMnxusbF07+0A6O0ooBS4zvVCXUMn
         3o0xvXRgMhFtlgJFsdojsDOnjDGA23bQD6ypvXeS2KiJqYZAPqqiBgahCyiNvEQjYLCM
         rZ1F54wWBYdlEHdsWnKL7p7FaPO0dtk5bx4FcHEkrcCyAkOo6s3YodIqZBQbOqsrLk2J
         I9NIPje25WvpV+H5d1GQGP7SK5ihVH/E/vtXMI076zuG21/sdJWg9esi8iVTYF0fljTz
         1AZmO7gh+Wt1U6ZouQMF2jvtAiyidjCX2ZlBaPUrLXZ1RkJ1erg2RXPub1hDyV3ey5kz
         Y6dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=8TTYSZMJTfaJpr238K/4LxyKEosHZCJyy+F52YED+TY=;
        b=g/JYCogEo9h7I13VWk/kIZ6/OBsctTyqy39EP2Z+98Yl8RFzjFA7wvYJa5VSzzQsdd
         SO+l3i1FDUbZquue0jqCk758Wd19v0qfgendA18R60sxph9n5DuD+duabRFmdlU+wIW2
         wya5GTc7D+DzMhzHt4Kcm1D1yjowzmouvRaPbhIs4Qc92YG+rQoEvHkre/bvKgsXMLLx
         Sb2oOBiwH4pn7sG2RIs4+L691whdSP6yPIBgxS+oyQs+pYFYZksbfp+hGReNKkb3MKNt
         szXtVLJGtMefTESPpR48zv6pW76jxNUdoQeV84WedkLxo+tKswEIvcpKAvrWLml4sV/N
         28JA==
X-Gm-Message-State: AOAM533RS+WUtNa3Y/oDHKCsE//TN26k6fVYekV+98ypi1A8OzeIL6JZ
        OcKuXsnYi0vvToI8enLRfQ==
X-Google-Smtp-Source: ABdhPJz0HI60ldyJ5cJ+YVmgPU3mxyQfCUjFVA6TQwhU9M3cus7hi8hB1CHbClmj1siUP422pqYJbg==
X-Received: by 2002:a05:620a:1526:: with SMTP id n6mr5405097qkk.401.1626199334533;
        Tue, 13 Jul 2021 11:02:14 -0700 (PDT)
Received: from moria.home.lan (c-73-219-103-14.hsd1.vt.comcast.net. [73.219.103.14])
        by smtp.gmail.com with ESMTPSA id p22sm3001052qtq.64.2021.07.13.11.02.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jul 2021 11:02:14 -0700 (PDT)
Date:   Tue, 13 Jul 2021 14:02:10 -0400
From:   Kent Overstreet <kent.overstreet@gmail.com>
To:     Matthew Wilcox <willy@infradead.org>
Cc:     Gary Guo <gary@garyguo.net>,
        Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
        Miguel Ojeda <ojeda@kernel.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        rust-for-linux <rust-for-linux@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Alex Gaynor <alex.gaynor@gmail.com>,
        Geoffrey Thomas <geofft@ldpreload.com>,
        Finn Behrens <me@kloenk.de>,
        Adam Bratschi-Kaye <ark.email@gmail.com>,
        Wedson Almeida Filho <wedsonaf@google.com>
Subject: Re: [PATCH 01/17] kallsyms: support big kernel symbols (2-byte
 lengths)
Message-ID: <YO3VIjpaCSZnNapB@moria.home.lan>
References: <20210704202756.29107-1-ojeda@kernel.org>
 <20210704202756.29107-2-ojeda@kernel.org>
 <YOIicc94zvSjrKfe@casper.infradead.org>
 <CANiq72=eHs870jbmZz8CUEUuN2NOCaKS9-F6-jAb0QXje2x1Eg@mail.gmail.com>
 <YOIpM3iFT5roz69i@casper.infradead.org>
 <20210704232007.0000357e@garyguo.net>
 <YOI5O6/RpaN1P6mM@casper.infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YOI5O6/RpaN1P6mM@casper.infradead.org>
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Sun, Jul 04, 2021 at 11:42:03PM +0100, Matthew Wilcox wrote:
> On Sun, Jul 04, 2021 at 11:20:07PM +0100, Gary Guo wrote:
> > This is big endian.
> 
> Fundamentally, it doesn't matter whether it's encoded as top-7 +
> bottom-8 or bottom-7 + top-8.  It could just as well be:
> 
>         if (len >= 128) {
>                 len -= 128;
>                 len += *data * 256;
>                 data++;
>         }
> 
> It doesn't matter whether it's compatible with some other encoding.
> This encoding has one producer and one consumer.  As long as they agree,
> it's fine.  If you want to make an argument about extensibiity, then
> I'm going to suggest that wanting a symbol name more than 32kB in size
> is a sign you've done something else very, very wrong.
> 
> At that point, you should probably switch to comparing hashes of the
> symbol instead of the symbol.  Indeed, I think we're already there at
> 300 byte symbols; we should probably SipHash the full, unmangled symbol
> [1].  At 33k symbols in the current kernel, the risk of a collision of
> a 64-bit value is negligible, and almost every kernel symbol is longer
> than 7 bytes (thankfully).

We really should have a better standard varint encoding - open coding varint
encodings in 2021 is offensive, and LEB128 is retarded due to using the high bit
of _every_ byte. Here's the encoding I did for bcachefs, which I nominate for a
standard varint encoding, unless someone knows of a way to do better:

https://evilpiepirate.org/git/bcachefs.git/tree/fs/bcachefs/varint.c
