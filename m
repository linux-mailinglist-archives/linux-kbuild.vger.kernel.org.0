Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B47AE3BAF2A
	for <lists+linux-kbuild@lfdr.de>; Sun,  4 Jul 2021 23:18:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229869AbhGDVUi (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sun, 4 Jul 2021 17:20:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49350 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229681AbhGDVUi (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 4 Jul 2021 17:20:38 -0400
Received: from mail-il1-x129.google.com (mail-il1-x129.google.com [IPv6:2607:f8b0:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D63F2C061574;
        Sun,  4 Jul 2021 14:18:01 -0700 (PDT)
Received: by mail-il1-x129.google.com with SMTP id s19so15497822ilj.1;
        Sun, 04 Jul 2021 14:18:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=aho8kAFcAYgKyxcXg7COYxXSvcFYFdMATaJp8RQ8Yaw=;
        b=MF/aKff8GG4AdkTnGwg50IGns9gYgFH2EA8ubxLe7P5cxgcrjY3mMKXli3kCrWufKB
         U/Z8Bnf+69FBhaEaaX5+X3XFYTZnF0F9NOe+n+AnHWZMsmDflqhHRDiWD8qohFjhzfSo
         82pkggGzRIHRbDj5NBtz3OtVPgvr9OmBD9oy2wUDTuGI1fH+kT4wSv6Wu7yaWgyaY1RO
         6PSBmWC6XENh1CQs0m+blR60eaaRXAED8zvOJPpPnPrHszdXAXcm5ngyGdXImG3VZfyK
         hgfkljehCIlg/qy6UcrAkJ2kYDzWzhstDZcsgXE0XYr6HHhT9zrcsA2n4skgeSO1tcTs
         Eing==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=aho8kAFcAYgKyxcXg7COYxXSvcFYFdMATaJp8RQ8Yaw=;
        b=hrRJsDPcTHRGtqxEzebS/ZVLRSCG6NCzKBTXFjFPVl1F6kSIPBURRdGbLspTsYvoP5
         bcYZA8UsbI40051wgfR0eBQo+7U1Fkw5/1vJ8LahsSeAwNEKHDD55h7h/7VGnzpjoeFr
         6pUj8rWtYezKloyJlJEBcjWDRfcShGnSePbnHNHByv1W7lEty0p7C7OMgqicVLfwCfDX
         +WbMCp5A4PCFecjiK4LPjEI8tM5b5jst3BNdMFTpQrEvH4/T7CHS3UEWusdTVwLTLvoJ
         mWYulooLZ3ewelB/gbQ3EOxRZwXwMsqm33aCL0mw7WlHyTmW4EpbMOIJkf2kpCHgNUuL
         esLQ==
X-Gm-Message-State: AOAM531wY6hdkZIymp1Ze1p8/hliTsco/iX53WPZBqDn9ryg1ddmYYAG
        rYg5YCDuBTrNDQ7OLgdPniSwX3NFGPHt4p3GfEY=
X-Google-Smtp-Source: ABdhPJyWtN2YvYH6Wr78DDZ6DVdTxCd3OBXIBRtcb/M6N3KUlI00+3tGrY3dpGD1SdcS9FfE23AN+v6TTZghbh0FXDk=
X-Received: by 2002:a05:6e02:12e3:: with SMTP id l3mr8272230iln.203.1625433481306;
 Sun, 04 Jul 2021 14:18:01 -0700 (PDT)
MIME-Version: 1.0
References: <20210704202756.29107-1-ojeda@kernel.org> <20210704202756.29107-2-ojeda@kernel.org>
 <YOIicc94zvSjrKfe@casper.infradead.org>
In-Reply-To: <YOIicc94zvSjrKfe@casper.infradead.org>
From:   Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date:   Sun, 4 Jul 2021 23:17:50 +0200
Message-ID: <CANiq72=eHs870jbmZz8CUEUuN2NOCaKS9-F6-jAb0QXje2x1Eg@mail.gmail.com>
Subject: Re: [PATCH 01/17] kallsyms: support big kernel symbols (2-byte lengths)
To:     Matthew Wilcox <willy@infradead.org>
Cc:     Miguel Ojeda <ojeda@kernel.org>,
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
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Sun, Jul 4, 2021 at 11:05 PM Matthew Wilcox <willy@infradead.org> wrote:
>
> What happened to my suggestion from last time of encoding symbols < 128
> as 0-127 and symbols larger than that as (data[0] - 128) * 256 +
> data[1]) ?

Nothing, sorry, we focused on other parts (e.g. the allocation panics)
during this iteration. I can take a look for v2.

Cheers,
Miguel
