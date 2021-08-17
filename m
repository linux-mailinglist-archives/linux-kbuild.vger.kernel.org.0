Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AA4783EE0F5
	for <lists+linux-kbuild@lfdr.de>; Tue, 17 Aug 2021 02:33:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232911AbhHQAeU (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 16 Aug 2021 20:34:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35194 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234966AbhHQAeU (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 16 Aug 2021 20:34:20 -0400
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9B5D9C061764
        for <linux-kbuild@vger.kernel.org>; Mon, 16 Aug 2021 17:33:47 -0700 (PDT)
Received: by mail-lj1-x22d.google.com with SMTP id x7so30045783ljn.10
        for <linux-kbuild@vger.kernel.org>; Mon, 16 Aug 2021 17:33:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=LXkg0uuZjwmrxhW7SPbGzmnzmULPLysmFfrB59XW54Q=;
        b=cpAFuBSQSnE1/YWUOEIT6TWQsTZ5gCrSDMyPPHaCltEQIxn9I35dPlkfVuiBVW2f+e
         Zu0Y30Kh/TWbsjDIMpvRKGJ1U3f6dwXLwKKFs+kKpAsGekKLmBS285HPoO8d/fDoUjxX
         2tNV66l89wnqMYWiKiLTMzwG5PoYk6uujo3S0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=LXkg0uuZjwmrxhW7SPbGzmnzmULPLysmFfrB59XW54Q=;
        b=knge87uZW2nCPo9RTOMm/re29nc3AFytmszCiVQ+108XhPuKvP/eoZY8I3HjaKV2k0
         Fi/zSoslqbAS9+CEvPvimTPPO0kvyCuOJqzijfw6ZUQAPjxjHE7eNcMx5nqgYkG/MQpz
         BWMiKE/vdCHQgrrUewEpdDBsLdtCKERiaO8rdICvMvdwqUolU65kg3aQLbsesjOiJjCD
         mIb1hBoq4lKHb5FRggVBbpc9z+SQfcIVab6zXtCTGnmHt+LVEVtnZGT6abJrjyYl6RcX
         ZWL5f1xc7orxfyW6Ewsr2XJFnG1R1FtN1eNPLLUh2YpbL2MDNbzWE9m5kqcMQDQcqxEW
         XDGw==
X-Gm-Message-State: AOAM5339camhvrHrv+uUD4MAPevFe/EK0fM1DBRC0xOJUOtUDnkce1bK
        +Gm9KzcXZzdiYwJrfO2lAkHN23oPK56JdJFs
X-Google-Smtp-Source: ABdhPJwG9PPJk0hziiB0qeug43dBycomAOMzXs5B5QJsxQva0JG5L+CYL0OM2TG30oYbSGYvmELq4w==
X-Received: by 2002:a2e:9852:: with SMTP id e18mr705968ljj.173.1629160425903;
        Mon, 16 Aug 2021 17:33:45 -0700 (PDT)
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com. [209.85.167.51])
        by smtp.gmail.com with ESMTPSA id c19sm41266lfc.70.2021.08.16.17.33.45
        for <linux-kbuild@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Aug 2021 17:33:45 -0700 (PDT)
Received: by mail-lf1-f51.google.com with SMTP id d4so37885904lfk.9
        for <linux-kbuild@vger.kernel.org>; Mon, 16 Aug 2021 17:33:45 -0700 (PDT)
X-Received: by 2002:a05:6512:2091:: with SMTP id t17mr346498lfr.253.1629160424992;
 Mon, 16 Aug 2021 17:33:44 -0700 (PDT)
MIME-Version: 1.0
References: <20210813224131.25803-1-rdunlap@infradead.org> <CAHk-=wj4chmL3TUdXHhAV+eU-YVNj-ZtZBjNJEFBzTnPMP3_bA@mail.gmail.com>
In-Reply-To: <CAHk-=wj4chmL3TUdXHhAV+eU-YVNj-ZtZBjNJEFBzTnPMP3_bA@mail.gmail.com>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Mon, 16 Aug 2021 14:33:28 -1000
X-Gmail-Original-Message-ID: <CAHk-=wgnvC=Tyejg_ts1O7yZYRxAgS+mxStCWM+PcyFPnaw1sw@mail.gmail.com>
Message-ID: <CAHk-=wgnvC=Tyejg_ts1O7yZYRxAgS+mxStCWM+PcyFPnaw1sw@mail.gmail.com>
Subject: Re: [PATCH] Makefile: use -Wno-main in the full kernel tree
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Steven Rostedt <rostedt@goodmis.org>,
        Daniel Bristot de Oliveira <bristot@kernel.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Content-Type: multipart/mixed; boundary="0000000000006a1f5a05c9b678d6"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

--0000000000006a1f5a05c9b678d6
Content-Type: text/plain; charset="UTF-8"

On Fri, Aug 13, 2021 at 2:01 PM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> From a quick google, it seems like '-Wmain' means something else for
> clang. But it is probably ok.

So the warnings that clang gives with -Wmain seem to be much more reasonable.

Which makes me think that the '-Wno-main' thing would likely be better
as a gcc-only thing.

Maybe something like this instead?

              Linus

--0000000000006a1f5a05c9b678d6
Content-Type: text/x-patch; charset="US-ASCII"; name="patch.diff"
Content-Disposition: attachment; filename="patch.diff"
Content-Transfer-Encoding: base64
Content-ID: <f_ksfc1eec0>
X-Attachment-Id: f_ksfc1eec0

IE1ha2VmaWxlIHwgMiArKwogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKQoKZGlmZiAt
LWdpdCBhL01ha2VmaWxlIGIvTWFrZWZpbGUKaW5kZXggYzE5ZDE2MzhkYTI1Li5hMzNmYmEwODNk
ZjcgMTAwNjQ0Ci0tLSBhL01ha2VmaWxlCisrKyBiL01ha2VmaWxlCkBAIC04MDMsNiArODAzLDgg
QEAgZWxzZQogIyBEaXNhYmxlZCBmb3IgY2xhbmcgd2hpbGUgY29tbWVudCB0byBhdHRyaWJ1dGUg
Y29udmVyc2lvbiBoYXBwZW5zIGFuZAogIyBodHRwczovL2dpdGh1Yi5jb20vQ2xhbmdCdWlsdExp
bnV4L2xpbnV4L2lzc3Vlcy82MzYgaXMgZGlzY3Vzc2VkLgogS0JVSUxEX0NGTEFHUyArPSAkKGNh
bGwgY2Mtb3B0aW9uLC1XaW1wbGljaXQtZmFsbHRocm91Z2g9NSwpCisjIGdjYyBpbmFuZWx5IHdh
cm5zIGFib3V0IGxvY2FsIHZhcmlhYmxlcyBjYWxsZWQgJ21haW4nCitLQlVJTERfQ0ZMQUdTICs9
IC1Xbm8tbWFpbgogZW5kaWYKIAogIyBUaGVzZSB3YXJuaW5ncyBnZW5lcmF0ZWQgdG9vIG11Y2gg
bm9pc2UgaW4gYSByZWd1bGFyIGJ1aWxkLgo=
--0000000000006a1f5a05c9b678d6--
