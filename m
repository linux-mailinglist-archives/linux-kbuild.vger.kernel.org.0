Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7671E750FAE
	for <lists+linux-kbuild@lfdr.de>; Wed, 12 Jul 2023 19:33:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231520AbjGLRdo (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 12 Jul 2023 13:33:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40020 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229757AbjGLRdo (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 12 Jul 2023 13:33:44 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 92AA81BD
        for <linux-kbuild@vger.kernel.org>; Wed, 12 Jul 2023 10:32:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1689183176;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=YjgG09KAcW3kXxhNR34jsr4Q7m16YLv1VyWrfkzUS70=;
        b=DSQ7meGsKOXnpy08hHSQIRewAi8+nGs3JN6+dVRcIJ13l28idVqpZLccJiS6NwITK9LGSl
        x+/QVF7plME4VfF9gg4W9ulzd0YUfRBdw2vDD9ReSIgwpCFBl327NLYrBmKQfabPvdRgwL
        0WHj1XOgnowsnzNKzR/tL+G8lKZeRBw=
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com
 [209.85.221.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-394-jompmNS7MVa3cJTm_0urRg-1; Wed, 12 Jul 2023 13:32:55 -0400
X-MC-Unique: jompmNS7MVa3cJTm_0urRg-1
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-481493d0ff4so94401e0c.3
        for <linux-kbuild@vger.kernel.org>; Wed, 12 Jul 2023 10:32:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689183175; x=1691775175;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YjgG09KAcW3kXxhNR34jsr4Q7m16YLv1VyWrfkzUS70=;
        b=ksbcL4rWa2+D5cPJFikfWTkjXyqv8xT5rPdK/y4sdR07QYc5lLZe0jto1Hq64keFTe
         57ZVTTE8UGcG8mtEcg5HQGC4yRnoJC3pB371rkTx+nkp1kq4GY2wi4AjGkL+jXBHPamD
         hQXIFKC+mhH01pbCH1gbSlrABlvdg4UlXymfT0l0K8ykA5Of8udVmL+ZXkaJbxOD/PsP
         se3wbCrjxsxKSpZL5A/DlVXiZQu8cCW6fZLABuPoH7lP578pzxwQA3tvoOms/NvA53jw
         8nWdk27exBKQygJu5Z1HOAFCG9MfZe45gH5YQwfS5iudnMFODNdr4GH+eQwWx+kx5voq
         xY6Q==
X-Gm-Message-State: ABy/qLZtXYQJC5fO9FUsADBrzaxmoQne4RSm8ynmhsga8q5SW2m3BOM8
        Rm260344laTO78uq3U7TBgC7tgG0Cq4B1NttMp7tYcFzDlg6jeiPtnWBe+z3QMbyEnDBuIIDFCT
        R9tNJGmfej1CI6jz1x511cTOm9RhOzMi37tSvuYdC
X-Received: by 2002:a1f:d0c2:0:b0:46e:9f33:add1 with SMTP id h185-20020a1fd0c2000000b0046e9f33add1mr9644561vkg.6.1689183175072;
        Wed, 12 Jul 2023 10:32:55 -0700 (PDT)
X-Google-Smtp-Source: APBJJlHATVug5P2+hlbgvwwYxAxjbAstCN+IY25BhctgJ2XgCP7k9fDUnz0VR+dYCm3qvrzWA8vlludYgUhzXmCaCPE=
X-Received: by 2002:a1f:d0c2:0:b0:46e:9f33:add1 with SMTP id
 h185-20020a1fd0c2000000b0046e9f33add1mr9644559vkg.6.1689183174856; Wed, 12
 Jul 2023 10:32:54 -0700 (PDT)
MIME-Version: 1.0
References: <CAK18DXagdLgwFG-ed97vVzMXC1BTCVbQrNQKXPwyH9HYy4TeJw@mail.gmail.com>
 <CAK18DXZHn28mZ-Sr5x_Lwn0SSisgcGqcBdt5MQNRXuNVYbnKZw@mail.gmail.com>
 <52f2cfab-4a5e-3331-424e-181860e4df66@intel.com> <CAK18DXafQ=ofjMyBxa+TCjvrxk183p79H-UwNBpo33L4yar8rw@mail.gmail.com>
In-Reply-To: <CAK18DXafQ=ofjMyBxa+TCjvrxk183p79H-UwNBpo33L4yar8rw@mail.gmail.com>
From:   Donald Zickus <dzickus@redhat.com>
Date:   Wed, 12 Jul 2023 13:32:43 -0400
Message-ID: <CAK18DXZHATtbJ_zWaPpkW5OfU3XpYCs6U+Lznvi+zFkfUQYGxA@mail.gmail.com>
Subject: Re: [RESEND] Looking for a hack to remove auto-selected items from
 .config output
To:     Alexander Lobakin <aleksander.lobakin@intel.com>
Cc:     masahiroy@kernel.org, linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, Jul 12, 2023 at 1:31=E2=80=AFPM Donald Zickus <dzickus@redhat.com> =
wrote:
>
> Hi Alexander,

Oops.  Hi Olek,

(sorry about that!)

>
> On Wed, Jul 12, 2023 at 10:17=E2=80=AFAM Alexander Lobakin
> <aleksander.lobakin@intel.com> wrote:
> >
> > From: Donald Zickus <dzickus@redhat.com>
> > Date: Wed, 12 Jul 2023 09:58:35 -0400
> >
> > > Resending without the html cruft to pass through the linux-kbuild mai=
l daemon
> > >
> > > ---------- Forwarded message ---------
> > > From: Donald Zickus <dzickus@redhat.com>
> > > Date: Tue, Jul 11, 2023 at 6:27=E2=80=AFPM
> > > Subject: Looking for a hack to remove auto-selected items from .confi=
g output
> > > To: <masahiroy@kernel.org>
> > > Cc: <linux-kbuild@vger.kernel.org>
> > >
> > >
> > > Hi Masahiro,
> > >
> > > I am trying to cleanup some stale config data with some of the Red Ha=
t
> > > configs.  Like most distros, Red Hat sets a bunch of 'menu choice'
> > > configs and then merges them together then runs something like 'make
> > > olddefconfig' to autoselect the rest of the configs.  Been working
> > > great for many years.
> > >
> > > Lately, we are trying to audit the configs and ran into many stale Re=
d
> > > Hat set configs that no longer exist upstream (removed, renamed,
> > > whatever).  Ok, running a script detects these and we can remove them
> > > by hand.
> > >
> > > One corner case we ran into is dropping configs.  Like upstream we tr=
y
> > > and match the merged configs with the final setting from 'make
> > > olddefconfig' and fail if there is a mismatch.  However, not every
> > > config is applicable to every arch, so those configs are dropped and
> > > we were always ok with it.  But now those dropped configs are
> > > confusing folks who think configs are set but they are really dropped=
.
> > > Yes, a Red Hat problem.
> > >
> > > I am trying to untangle this.  Is there a hack I can use that takes a
> > > generated .config file and removes all the 'selected' and 'implied'
> > > options out?  Leaving me with just the minimum configs that need to b=
e
> > > set?  Then I can de-merge it and re-create our original set config
> >
> > `make savedefconfig`? It saves a very minimal config with only manually
> > selectable entries, which differ from the default config. IOW, if you
> > take the default config and then change only CONFIG_FOO, your config
> > saved via this command will contain 1 entry, even if _FOO also
> > automatically selects _BAR.
>
> Oh neat!  Yes, when I combine the output of savedefconfig with the
> output of listnewconfig, it appears I am able to create the minimal
> config layout which exposes all the unnecessary cruft.
>
> Thank you!!
>
> Cheers,
> Don
>
> >
> > > options.  Basically reversing the normal config generating process, I
> > > think.
> > >
> > > Not looking for anything complicated, just something simple I can qui=
ckly apply.
> > >
> > > Thoughts?
> > >
> > > Cheers,
> > > Don
> > >
> > >
> >
> > Thanks,
> > Olek
> >

