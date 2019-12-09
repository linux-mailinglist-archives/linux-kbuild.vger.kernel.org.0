Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2D43F116E30
	for <lists+linux-kbuild@lfdr.de>; Mon,  9 Dec 2019 14:53:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727455AbfLINxu (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 9 Dec 2019 08:53:50 -0500
Received: from mail-oi1-f169.google.com ([209.85.167.169]:39903 "EHLO
        mail-oi1-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727436AbfLINxu (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 9 Dec 2019 08:53:50 -0500
Received: by mail-oi1-f169.google.com with SMTP id a67so6338826oib.6
        for <linux-kbuild@vger.kernel.org>; Mon, 09 Dec 2019 05:53:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=9xiMUcQREG3eByi2Ki5LpPjkeilehybucqh8gxwE7vo=;
        b=CAoYfrMSeEX8nmCFMq8ixeSkDU2rUx7OIZQarGWLma2yFHhj3dwE270ri0Z2LKrP0s
         w/NDL/C/WsUbezw8qnWAP/CbDhgGD4WP0gRBPzJ/bayKbpGNdUvxI7pMYr3WUVwdldam
         fGcimhNPXob1wjJliIyYqSw/QqB6m/0avQD9U/eQz8F7Rxg1KsZzCgwCoQxX5p/Fg00/
         xQr8ZiGuyRTsTJ+jNM696sxIjGDjOhFKfc41tsshcQbdHpK6Vfb9tokNeoL0B+ncZnAJ
         uao8opA9DycNfIEL226tkVEtUfPfaTR3qk53bBbE38Gj+j78PVj5Vz4XdSh204XDqE/T
         tR1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=9xiMUcQREG3eByi2Ki5LpPjkeilehybucqh8gxwE7vo=;
        b=bacLpaKC/JkNjCBsV9JnWL+UfZddQgMc+u67AiknD9YS4ETPAINdd+ew3PHXwFYjSZ
         7eO/ZioMibIt6+EURRGrd36zvBbcf0DXxVlOvhG5mKVPmS2y917sFUhLX6ns2TIs1D0e
         eZ3FzEphvwTWWsEyKkeu6Y8aAMIm0oCd7YfxT7tK4W4WlGyHBoht3ufc/+x+IjnIYImf
         Vm1krJ3nlajIHLruN5SVnS91nWqQE6BGjC+ca42YD0XJ4oB68OLahJkGCrHck8oy0T72
         hzd4TxN3CfzwAIUL+R920bjiuf0r1g8jjP5djbd3elI5LHG3x+DVpz8stH4+QnOl8Zs/
         WTMw==
X-Gm-Message-State: APjAAAWRwAR+eG4IHJiKwA0kCtUWzyM4w0CjKCcpG+U4FF/f3niHmLa/
        hu0O9jNSJTmCLblVmQ/+j3TGHWHquH5JUxh6zsrSPdiZ
X-Google-Smtp-Source: APXvYqwoHXky2vKVTrf1Z3QJpsCgC5K3SMGXchIBNv4RRzP8PSU4Bc7SGs4xpKlu4P7NzPTCeDivhgNEiQHfy2ZQvhI=
X-Received: by 2002:a05:6808:681:: with SMTP id k1mr24833888oig.117.1575899629426;
 Mon, 09 Dec 2019 05:53:49 -0800 (PST)
MIME-Version: 1.0
References: <CAN19L9G-mFN-MTmw0FS3ZX4d1MjeoL2U+s-Fk7Qw9UYWn5Q1YA@mail.gmail.com>
 <CAK7LNAR2bJW8BMq3xbt2FuuC_=uGqFrDsL9jEw6H1B78wHG_yg@mail.gmail.com>
In-Reply-To: <CAK7LNAR2bJW8BMq3xbt2FuuC_=uGqFrDsL9jEw6H1B78wHG_yg@mail.gmail.com>
From:   Martin Galvan <omgalvan.86@gmail.com>
Date:   Mon, 9 Dec 2019 10:53:38 -0300
Message-ID: <CAN19L9Hbo_uthS3OYfu4oOjGrOoiZpq9MpKMrbM=f-t=LMec1Q@mail.gmail.com>
Subject: Re: Some header files being ignored when calculating srcversion
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Rusty Russell <rusty@rustcorp.com.au>,
        Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

El lun., 9 dic. 2019 a las 3:05, Masahiro Yamada
(<masahiroy@kernel.org>) escribi=C3=B3:
> I also wondered about this design
> when I looked into this code for the first time.
>
> In my understanding, this is based on the assumption that
> headers file from the same or sub- directories are highly
> relevant to the module in question, while the header
> files from other locations are less related.

If we all agree that this behavior is not correct, I'll send a patch
to remove that check.
