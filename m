Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1266022FC26
	for <lists+linux-kbuild@lfdr.de>; Tue, 28 Jul 2020 00:30:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726171AbgG0Wax (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 27 Jul 2020 18:30:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57056 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727090AbgG0Waw (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 27 Jul 2020 18:30:52 -0400
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com [IPv6:2607:f8b0:4864:20::1036])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 75EFBC061794
        for <linux-kbuild@vger.kernel.org>; Mon, 27 Jul 2020 15:30:52 -0700 (PDT)
Received: by mail-pj1-x1036.google.com with SMTP id o22so10431879pjw.2
        for <linux-kbuild@vger.kernel.org>; Mon, 27 Jul 2020 15:30:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=TOvQ1VnWyG/OnvhNgurvxwrmtR7oK2D6CyEB7iw19aQ=;
        b=I4P+wcYUdU3lmHev0tDY9dkn1Zvl3qZD2/nET4And8drecCI1+QuixlaHj3pVvzIP4
         nQp7aphuRXNv/ZYIMr3RV0Yy2nKbQ3/v9QwggOEdvJmt1mtvvhZVWasu08iCCFRLtoFd
         X38QuiyzY2S3YzxmDCqkcP/6L2L1gJbfteWuOEKNFSl4UosAdDiMg6vL/iQYNI0yhqum
         WKAUVRbU3Z5FYkRAyrU5/62X345GBrJwCGCc2FEAlJTXnpzGOZlE+FAG6M1gUHTQE/jm
         ZMYxvQn6ujKmI0siClPcrTeCN94vGBpr8Spg+2zODaVlq1LeOPXbTULJFUOhempib0pA
         fZSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=TOvQ1VnWyG/OnvhNgurvxwrmtR7oK2D6CyEB7iw19aQ=;
        b=e7taET4Ai9LYVHH5Yjvj99RnLwwZT/RoDoG3rVcJTcsvRN/KtG5BhjTMCu6tbN73gk
         /HQjKDzbX46AxGVt5ayFR094BzR9uUOcLi9f+e2luilP2YT1E5KcsmV7AIFash6UogyG
         wmDG0d7Rz7yZcPocyJGEf/aIaGBPCCtozw9JjHMT/uuiwdibjkmYFuQvB5NkOON2XnB5
         I/Nsz+JcLlecMLdxkZOc7gMsHNDupPHVWEhpQJjdO59ehKZghgC9R3Ele1OIr7SpS4HF
         2/EB1vx4oF9r/M0ASJVPfxF8YEB3wpMScMm1Zf/vKf4WbDqYtPxxD9BtK9x8ExE/Od3y
         rd5Q==
X-Gm-Message-State: AOAM533hNoLFmXQJ5d0lw+BT2VVMSGkBQQUrwPB4UfSvF0VEdQ3m1gfc
        T760WRODsmR5AqzLHeqjf80Sf7Of5nLM00FGYaTyDw==
X-Google-Smtp-Source: ABdhPJy/5+EuXgNPHAPu/yfMjp7j2SRhs0ZnhWu3vW7vpiajAndVnEyqx/ETcSiL8VoDkRBu9R4kfVg8UtLqUsmMUgU=
X-Received: by 2002:a17:902:6bc2:: with SMTP id m2mr19569648plt.119.1595889051673;
 Mon, 27 Jul 2020 15:30:51 -0700 (PDT)
MIME-Version: 1.0
References: <RT-Ticket-93182@linuxfoundation> <CAKwvOd=i8mLYsSNtJTcZ=RTk76F_mYy9fM9FBtDveFybxyGyiw@mail.gmail.com>
 <CAK7LNARc4L18CP6ZbTheh43VobQZ1s_2Q=4O7oKmTZRLgiTw6Q@mail.gmail.com>
 <f30f6849-9d94-4ba9-f875-9ab8c0700620@infradead.org> <CAKwvOdnknZNPuucvy0Kim6xCfyUhmNKXQiERCQcoSMYdo6=6FQ@mail.gmail.com>
 <rt-4.4.0-1686-1594408327-1443.93182-6-0@linuxfoundation> <0101017392319714-3d813ac3-7620-4874-8320-ff1f5de1d149-000000@us-west-2.amazonses.com>
In-Reply-To: <0101017392319714-3d813ac3-7620-4874-8320-ff1f5de1d149-000000@us-west-2.amazonses.com>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Mon, 27 Jul 2020 15:30:39 -0700
Message-ID: <CAKwvOdmbEOWdfFrXwWcakLSdZMQonLpneLm-OU9uFh17doGekA@mail.gmail.com>
Subject: Re: [Kernel.org Helpdesk #93182] Re: linux-kbuild missing from lore?
To:     kernel-helpdesk@rt.linuxfoundation.org
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Nathan Huckleberry <nhuck@google.com>,
        Randy Dunlap <rdunlap@infradead.org>,
        Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Mon, Jul 27, 2020 at 2:33 PM Chris Hoy Poy via RT
<kernel-helpdesk@rt.linuxfoundation.org> wrote:
>
> Hi all,
>
> Apologies for delays!
>
> Have just tried to grab this shared file, and I'm getting 403'd (violates terms),
>
> I have an archiver subscribed, so new emails are being collected.

Ever since a certain engineer decided to exfiltrate documents
regarding LIDAR we now internally have a completely locked down (read:
useless) version of google drive.  If you can send me your email
(other than kernel-helpdesk@rt.linuxfoundation) off list, then I might
be able to share this with you that way.  I was able to send an invite
to the helpdesk email, but I suspect that just filed a ticket
somewhere.

>
> cheers
> /Chris
>
>
> On Sat Jul 11 03:12:07 2020, ndesaulniers@google.com wrote:
> > Hello, can the admin of the lore.kernel.org helpdesk please accept the
> > following sanitized archive?
> >
> > https://drive.google.com/file/d/1d0oS3fCYxGhB0p_IQum9Gh20B3aFxKeI/view?usp=sharing
> >
> > With generous assistance from Hank Leininger from marc.info, I was
> > able to get mbox's for linux-kbuild@vger.kernel.org dating back to
> > 2008.
> >
> > The archive was provided as a tarball of directories of gzip archives.
> > To generate the above, I ran:
> >
> > $ tar xvf linux-kbuild_2008-2020.tar
> > $ find . -name \*.gz | xargs gunzip
> > $ for F in $(find untared -type f); do ./list-archive-maker.py -s $F
> > -e linux-kbuild -k linux-kbuild-known-ids.txt -l linux-
> > kbuild.vger.kernel.org; done
> > $ tar cf linux-kbuild.tar linux-kbuild
> > $ xz -9 linux-kbuild.tar
> >
> > as per https://korg.docs.kernel.org/lore.html.
> >
> > This response is via the ticket #93182 filed at
> > rt.linuxfoundation.org's web site.
> > Thanks,
> > ~Nick Desaulniers
>
>
> --
> Chris Hoy Poy
> Collaborative Projects IT
> The Linux Foundation



-- 
Thanks,
~Nick Desaulniers
