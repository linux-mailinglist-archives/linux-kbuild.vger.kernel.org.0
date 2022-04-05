Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 10E364F3DFC
	for <lists+linux-kbuild@lfdr.de>; Tue,  5 Apr 2022 22:40:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241893AbiDEOLu (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 5 Apr 2022 10:11:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53366 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1386640AbiDEMzA (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 5 Apr 2022 08:55:00 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 24A9A21818
        for <linux-kbuild@vger.kernel.org>; Tue,  5 Apr 2022 04:59:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1649159946;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=caJ3Mn8x8sphClTxTGmFig0egR97QkRAGfFS5UfDfJg=;
        b=eagZh2GvOYDz6DSfB9tKu9oAI2g6mAI2TJEZ/CnV3yZeI0POknT4LLuLTyfsoDnrbimqUa
        nKEOy+0szij0qPzAyecrHtxPJYxtVXP2E01TEpBXgXAKdB0+JudNz6DUBwAYHulAyDiFCe
        axK1lpFQ4+ujEfNpLCyLYY2Y8SSR2Kg=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-473-XUelPbMpNculo_RrSOhOMg-1; Tue, 05 Apr 2022 07:59:05 -0400
X-MC-Unique: XUelPbMpNculo_RrSOhOMg-1
Received: by mail-wm1-f70.google.com with SMTP id f19-20020a7bcd13000000b0038c01defd5aso1145685wmj.7
        for <linux-kbuild@vger.kernel.org>; Tue, 05 Apr 2022 04:59:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=caJ3Mn8x8sphClTxTGmFig0egR97QkRAGfFS5UfDfJg=;
        b=qciKcf5G2zDvHEWdAukKj91HM5Cy30Mt6ZGXm9MQ9jcMUyUCIACSJoupH3IUD87xK3
         uDBiPgSK4XfS6PNiqlBpya8U8pn0RfD/9mxY1zN8RL03xNOuonTsE0wqI8QRYlEzTj1v
         TT7aL3QqbOEz/gU0KEY5/y6GS+QZzGlCuM8tPGw+BpFSPQDRwX63KZecGhagUScCjqFD
         teYRkieKwdR4z5+a3cniGAeaEQQ6IuUTrgLBMR9Uhpf+5cjgdpA3ll0V0sB49FGzBz3Z
         JyoMaUpisVzlBlha3vaX9nO8uxK9uKCLAONOygI2ou7C+4bBaMy2eJPPU4TsFAp7U80j
         GgXQ==
X-Gm-Message-State: AOAM533KfuzUU/tgxWlV6iHTFI7j1Sn/CQHE/COiyRZti7x131VdKNNt
        fhkciU3L/4TMm+rIOpV4Lwu+9h11e5PwWbHwe+TU0ZICe90A0ibXuPBszhkk94mDSII77lksAXu
        /k7v19ILnY+4wOIJDh0Zf9inZ
X-Received: by 2002:a1c:f705:0:b0:37d:f2e5:d8ec with SMTP id v5-20020a1cf705000000b0037df2e5d8ecmr2850175wmh.21.1649159944331;
        Tue, 05 Apr 2022 04:59:04 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwgAb5I4ZF3qI+9Z9tb/LO2zK3svds/SwszckCB8AT7KGF6vHKrXQi2sIZ1Gsir9F/APs8Zzw==
X-Received: by 2002:a1c:f705:0:b0:37d:f2e5:d8ec with SMTP id v5-20020a1cf705000000b0037df2e5d8ecmr2850160wmh.21.1649159944150;
        Tue, 05 Apr 2022 04:59:04 -0700 (PDT)
Received: from redhat.com ([2.52.17.211])
        by smtp.gmail.com with ESMTPSA id w7-20020a1cf607000000b00389a5390180sm1949693wmc.25.2022.04.05.04.59.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Apr 2022 04:59:03 -0700 (PDT)
Date:   Tue, 5 Apr 2022 07:59:00 -0400
From:   "Michael S. Tsirkin" <mst@redhat.com>
To:     Christoph Hellwig <hch@infradead.org>
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org,
        linux-kbuild@vger.kernel.org, linux-arch@vger.kernel.org
Subject: Re: [PATCH 8/8] virtio_ring.h: do not include <stdint.h> from
 exported header
Message-ID: <20220405075756-mutt-send-email-mst@kernel.org>
References: <20220404061948.2111820-1-masahiroy@kernel.org>
 <20220404061948.2111820-9-masahiroy@kernel.org>
 <Ykqh3mEy5uY8spe8@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Ykqh3mEy5uY8spe8@infradead.org>
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Mon, Apr 04, 2022 at 12:44:30AM -0700, Christoph Hellwig wrote:
> On Mon, Apr 04, 2022 at 03:19:48PM +0900, Masahiro Yamada wrote:
> >  	vr->num = num;
> >  	vr->desc = p;
> >  	vr->avail = (struct vring_avail *)((char *)p + num * sizeof(struct vring_desc));
> > -	vr->used = (void *)(((uintptr_t)&vr->avail->ring[num] + sizeof(__virtio16)
> > +	vr->used = (void *)(((__kernel_uintptr_t)&vr->avail->ring[num] + sizeof(__virtio16)
> >  		+ align-1) & ~(align - 1));
> 
> This really does not look like it should be in a uapi header to start
> with.

It's a way to document a complex structure layout of virtio 0.9. It's
ugly but it's been like this for years. For virtio 1.0 we moved away
from this but a bunch of tools keep using legacy.

-- 
MST

