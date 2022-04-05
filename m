Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BACFB4F3E6C
	for <lists+linux-kbuild@lfdr.de>; Tue,  5 Apr 2022 22:44:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241251AbiDEOLZ (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 5 Apr 2022 10:11:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49448 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1381345AbiDEMy3 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 5 Apr 2022 08:54:29 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 4825229C93
        for <linux-kbuild@vger.kernel.org>; Tue,  5 Apr 2022 04:57:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1649159848;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=yZyeehLgo43vPEC1Sp1n3r3jpBNtdCjtLwgkplLP3v4=;
        b=Gh1urVgDOeB9+9TxPEQeRkhcqCncaFa8w1U9aVXPwWd9+BzvwtLgauDuT5npxZ7ZsYGpEy
        +2cLGfjg87/sbCwjZPmJfPObdYuRuPoNUmNfjDY/szAPb3aPdw9c1mV+t+FVj9LCzmEPm1
        ma0vA+nyG5qidYPD19KL428n3aY96z4=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-145-96xcR1bqOhyJE--DWQat9A-1; Tue, 05 Apr 2022 07:57:27 -0400
X-MC-Unique: 96xcR1bqOhyJE--DWQat9A-1
Received: by mail-wr1-f72.google.com with SMTP id p18-20020adfba92000000b001e8f7697cc7so2403842wrg.20
        for <linux-kbuild@vger.kernel.org>; Tue, 05 Apr 2022 04:57:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=yZyeehLgo43vPEC1Sp1n3r3jpBNtdCjtLwgkplLP3v4=;
        b=mNWPLms9vv3PbZo7zVlV2OGiY6qQy3PILPd2l9lWhQSCtwefAGWCQJB2NCDF45CdnI
         Rf8ATkLl+6qYhFkajxzwjHWupdM+zi4gr533SVXjNj5/GRSyum5doxg6mbuxKV2VrMpv
         ZyrcqF8fJtkFppx2bCur68pZ40XGohRsDcUuA7SJFxzmPc43hT1YwvP10S2lBvbpm59m
         8tDRcqOJXh8qwY6vTgOdOITj0Sgkf1WbQ89ER9qGbmojsJ7LnN1B5h8qGorQ9GovT2Jo
         xumDBo4aD0ZQ8+yciBOPeSBOge6617jUIB7tYAkqiYtD9VSdFekXw4TG6GfKe4FgRQxy
         /TEQ==
X-Gm-Message-State: AOAM53274fNEWQp8yfU4zmWumE1C/3kxCdVBFWpinPobaWa7VNGPaD8p
        rTmn5IB4Br9ZLAU8DqnYc18PD5wGPFWTOR6p2MyVZiae7wvsCLfTOtmNI13idsbSxXUIu4YFdts
        ks0uT/zbrtkNfJAqGQI1XHOCN
X-Received: by 2002:a05:6000:184a:b0:203:f8f0:3407 with SMTP id c10-20020a056000184a00b00203f8f03407mr2604221wri.190.1649159846181;
        Tue, 05 Apr 2022 04:57:26 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJypIKxQBes9FfmGLsTQSI+o8ZS7lLWmQJBmsfPcPeNLWB/aoHg6W8W0oB4kBqUTKA7V4gN8eQ==
X-Received: by 2002:a05:6000:184a:b0:203:f8f0:3407 with SMTP id c10-20020a056000184a00b00203f8f03407mr2604202wri.190.1649159845981;
        Tue, 05 Apr 2022 04:57:25 -0700 (PDT)
Received: from redhat.com ([2.52.17.211])
        by smtp.gmail.com with ESMTPSA id m4-20020a7bcb84000000b00389efb7a5b4sm1883255wmi.17.2022.04.05.04.57.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Apr 2022 04:57:25 -0700 (PDT)
Date:   Tue, 5 Apr 2022 07:57:21 -0400
From:   "Michael S. Tsirkin" <mst@redhat.com>
To:     Arnd Bergmann <arnd@arndb.de>
Cc:     Christoph Hellwig <hch@infradead.org>,
        linux-arch <linux-arch@vger.kernel.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        virtualization list <virtualization@lists.linux-foundation.org>
Subject: Re: [PATCH 8/8] virtio_ring.h: do not include <stdint.h> from
 exported header
Message-ID: <20220405075627-mutt-send-email-mst@kernel.org>
References: <20220404061948.2111820-1-masahiroy@kernel.org>
 <20220404061948.2111820-9-masahiroy@kernel.org>
 <Ykqh3mEy5uY8spe8@infradead.org>
 <CAK8P3a07ZdqA0UBC_qkqzMsZWLUK=Rti3AkFe2VVEWLivuZAqA@mail.gmail.com>
 <YkvVOLj/Rv4yPf5K@infradead.org>
 <CAK8P3a0FjfSyUtv9a9dM7ixsK2oY9VF7WZPvDctn2JRi7A0YyQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAK8P3a0FjfSyUtv9a9dM7ixsK2oY9VF7WZPvDctn2JRi7A0YyQ@mail.gmail.com>
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, Apr 05, 2022 at 08:29:36AM +0200, Arnd Bergmann wrote:
> On Tue, Apr 5, 2022 at 7:35 AM Christoph Hellwig <hch@infradead.org> wrote:
> >
> > On Mon, Apr 04, 2022 at 10:04:02AM +0200, Arnd Bergmann wrote:
> > > The header is shared between kernel and other projects using virtio, such as
> > > qemu and any boot loaders booting from virtio devices. It's not technically a
> > > /kernel/ ABI, but it is an ABI and for practical reasons the kernel version is
> > > maintained as the master copy if I understand it correctly.
> >
> > Besides that fact that as you correctly states these are not a UAPI at
> > all, qemu and bootloades are not specific to Linux and can't require a
> > specific kernel version.  So the same thing we do for file system
> > formats or network protocols applies here:  just copy the damn header.
> > And as stated above any reasonably portable userspace needs to have a
> > copy anyway.
> 
> I think the users all have their own copies, at least the ones I could
> find on codesearch.debian.org.

kvmtool does not seem to have its own copy, just grep vring_init.

> However, there are 27 virtio_*.h
> files in include/uapi/linux that probably should stay together for
> the purpose of defining the virtio protocol, and some others might
> be uapi relevant.
> 
> I see that at least include/uapi/linux/vhost.h has ioctl() definitions
> in it, and includes the virtio_ring.h header indirectly.
> 
> Adding the virtio maintainers to Cc to see if they can provide
> more background on this.
> 
> > If it is just as a "master copy" it can live in drivers/virtio/, just
> > like we do for other formats.
> 
> It has to be in include/linux/ at least because it's used by a number
> of drivers outside of drivers/virtio/.
> 
>         Arnd
> _______________________________________________
> Virtualization mailing list
> Virtualization@lists.linux-foundation.org
> https://lists.linuxfoundation.org/mailman/listinfo/virtualization
> 

