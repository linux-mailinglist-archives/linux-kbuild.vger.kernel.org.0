Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 52014750FAD
	for <lists+linux-kbuild@lfdr.de>; Wed, 12 Jul 2023 19:33:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232444AbjGLRc7 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 12 Jul 2023 13:32:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39786 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233215AbjGLRcx (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 12 Jul 2023 13:32:53 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B2A031BD
        for <linux-kbuild@vger.kernel.org>; Wed, 12 Jul 2023 10:32:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1689183123;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=qzLHaOUPiBIKfrMeX2derolpKqiXBhXG2VPutoTiNt8=;
        b=W1ALDIy9LcCL/Hh7at8fJVhDfF/v7vzCYUjxUYeKqFz3qSxTVRvkRGPfDIflKcx1v0snCQ
        7DUM39NUN2soy4VjrPjLSjVoDJYC9TaZkHcC7QXzALlTJmNtJaJ66EJIALc6hNjc6b6uxv
        M3extCLGg02pY+KSmIJIZE08I72Dh5c=
Received: from mail-yw1-f200.google.com (mail-yw1-f200.google.com
 [209.85.128.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-589-wiDKGtGOMXunejbteokSnw-1; Wed, 12 Jul 2023 13:32:02 -0400
X-MC-Unique: wiDKGtGOMXunejbteokSnw-1
Received: by mail-yw1-f200.google.com with SMTP id 00721157ae682-573cacf4804so70503907b3.1
        for <linux-kbuild@vger.kernel.org>; Wed, 12 Jul 2023 10:32:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689183121; x=1691775121;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qzLHaOUPiBIKfrMeX2derolpKqiXBhXG2VPutoTiNt8=;
        b=GfFiJ+59HMRdvU62rKrhU0cMJxKLBKMTQHGDow6HSIfUbmbBVNtQH4Goxh0VPnaOZb
         9I+LBjTOwLaiyG2HI/W68PPxU8GZxHwfF0t5L+DY8UX9Z9r3TzL/mj6y0EENq6TNToLS
         98E8c7b7iEJnfr6IJUvZKYiygfPsQaygxifI4emTFuBmG4Zg1uR+IoqolTvDnec7fg09
         YoL04IpeIU7/E0Yy2bvBlJBKCjBOxpItXWszra+X/dLv7hOTjE2X9SNBffuy6QB1rQhC
         IHu/x3nkpewbv1/jtJIYBXi9DPLZqV7E9nCE1dHFcwoc4Mm3gksLXUj18hdV4Zv8MBuP
         YfgQ==
X-Gm-Message-State: ABy/qLbxx8MRo+A13hZ9JMar7XB5ahSCtZlSuRdd3maxPKddWtCGDf1l
        UneMAhkfLuXZ+2m62/KKvimZx4O1xY/7Mvz6P6dtyO2fymyYVv0p7yOPzsvaJmZnNpNV+LsuOqJ
        NRKpq6E3xDks4lsmPwWnOmp1zCcipNOG9YZgup3x1mo5MdZj0
X-Received: by 2002:a25:40c5:0:b0:c6f:b2de:21ba with SMTP id n188-20020a2540c5000000b00c6fb2de21bamr12826073yba.17.1689183121217;
        Wed, 12 Jul 2023 10:32:01 -0700 (PDT)
X-Google-Smtp-Source: APBJJlHZ6hbXHLanSFHeeqS4XAVElzwLOqxTrCkDU6/JrN90B7fKz81eVOqDmGcZtwI+vKGbGsPTMnqvplkv+h0Kpsw=
X-Received: by 2002:a25:40c5:0:b0:c6f:b2de:21ba with SMTP id
 n188-20020a2540c5000000b00c6fb2de21bamr12826064yba.17.1689183120900; Wed, 12
 Jul 2023 10:32:00 -0700 (PDT)
MIME-Version: 1.0
References: <CAK18DXagdLgwFG-ed97vVzMXC1BTCVbQrNQKXPwyH9HYy4TeJw@mail.gmail.com>
 <CAK18DXZHn28mZ-Sr5x_Lwn0SSisgcGqcBdt5MQNRXuNVYbnKZw@mail.gmail.com> <52f2cfab-4a5e-3331-424e-181860e4df66@intel.com>
In-Reply-To: <52f2cfab-4a5e-3331-424e-181860e4df66@intel.com>
From:   Donald Zickus <dzickus@redhat.com>
Date:   Wed, 12 Jul 2023 13:31:49 -0400
Message-ID: <CAK18DXafQ=ofjMyBxa+TCjvrxk183p79H-UwNBpo33L4yar8rw@mail.gmail.com>
Subject: Re: [RESEND] Looking for a hack to remove auto-selected items from
 .config output
To:     Alexander Lobakin <aleksander.lobakin@intel.com>
Cc:     masahiroy@kernel.org, linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hi Alexander,

On Wed, Jul 12, 2023 at 10:17=E2=80=AFAM Alexander Lobakin
<aleksander.lobakin@intel.com> wrote:
>
> From: Donald Zickus <dzickus@redhat.com>
> Date: Wed, 12 Jul 2023 09:58:35 -0400
>
> > Resending without the html cruft to pass through the linux-kbuild mail =
daemon
> >
> > ---------- Forwarded message ---------
> > From: Donald Zickus <dzickus@redhat.com>
> > Date: Tue, Jul 11, 2023 at 6:27=E2=80=AFPM
> > Subject: Looking for a hack to remove auto-selected items from .config =
output
> > To: <masahiroy@kernel.org>
> > Cc: <linux-kbuild@vger.kernel.org>
> >
> >
> > Hi Masahiro,
> >
> > I am trying to cleanup some stale config data with some of the Red Hat
> > configs.  Like most distros, Red Hat sets a bunch of 'menu choice'
> > configs and then merges them together then runs something like 'make
> > olddefconfig' to autoselect the rest of the configs.  Been working
> > great for many years.
> >
> > Lately, we are trying to audit the configs and ran into many stale Red
> > Hat set configs that no longer exist upstream (removed, renamed,
> > whatever).  Ok, running a script detects these and we can remove them
> > by hand.
> >
> > One corner case we ran into is dropping configs.  Like upstream we try
> > and match the merged configs with the final setting from 'make
> > olddefconfig' and fail if there is a mismatch.  However, not every
> > config is applicable to every arch, so those configs are dropped and
> > we were always ok with it.  But now those dropped configs are
> > confusing folks who think configs are set but they are really dropped.
> > Yes, a Red Hat problem.
> >
> > I am trying to untangle this.  Is there a hack I can use that takes a
> > generated .config file and removes all the 'selected' and 'implied'
> > options out?  Leaving me with just the minimum configs that need to be
> > set?  Then I can de-merge it and re-create our original set config
>
> `make savedefconfig`? It saves a very minimal config with only manually
> selectable entries, which differ from the default config. IOW, if you
> take the default config and then change only CONFIG_FOO, your config
> saved via this command will contain 1 entry, even if _FOO also
> automatically selects _BAR.

Oh neat!  Yes, when I combine the output of savedefconfig with the
output of listnewconfig, it appears I am able to create the minimal
config layout which exposes all the unnecessary cruft.

Thank you!!

Cheers,
Don

>
> > options.  Basically reversing the normal config generating process, I
> > think.
> >
> > Not looking for anything complicated, just something simple I can quick=
ly apply.
> >
> > Thoughts?
> >
> > Cheers,
> > Don
> >
> >
>
> Thanks,
> Olek
>

