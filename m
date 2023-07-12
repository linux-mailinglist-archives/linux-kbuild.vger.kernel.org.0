Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 203F8750A3B
	for <lists+linux-kbuild@lfdr.de>; Wed, 12 Jul 2023 15:59:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231522AbjGLN7p (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 12 Jul 2023 09:59:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39206 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231364AbjGLN7o (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 12 Jul 2023 09:59:44 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8235A1BD7
        for <linux-kbuild@vger.kernel.org>; Wed, 12 Jul 2023 06:58:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1689170328;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=kdw8uAxHlNPXNGahE+KfJjl2Q6GUtgS/21+dy53UJBA=;
        b=BEM6Ul2WttyeHmRXZ1GsZEU5qTLo3jV87CD/46uehmh5LC46EYtFMdUskvngGIQBobYNgp
        VP5ZOPbEtAGXXtBheSaeTy7fDipoyvZbpJ6/MWptGcbAz44+h4xBxJ5BoCz5cYLziVxQv9
        83ZJqmP5lnl3m4t4AnqxQj2++H2OAoo=
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com
 [209.85.167.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-542-oAJHEQChOz62ktle_ZoCGw-1; Wed, 12 Jul 2023 09:58:47 -0400
X-MC-Unique: oAJHEQChOz62ktle_ZoCGw-1
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-3a426e7058cso918274b6e.3
        for <linux-kbuild@vger.kernel.org>; Wed, 12 Jul 2023 06:58:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689170326; x=1691762326;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kdw8uAxHlNPXNGahE+KfJjl2Q6GUtgS/21+dy53UJBA=;
        b=jJni7BZC1MZolqtnCDni8pEqx1FszgnxBRt1n2CUPE4bnDKkQPYGrnINosIIxMjGpu
         Wp8dH5encolIIZnwtfes4/XZcM93E+gOp9FUhd6qfDnQIE3z4oTd9CM+Z5n5z6tbdeKZ
         Gc24s7zCpmhAatyaxrTd4thD4Jf4CsYUjiHnoMwu8Wizjvzy8+eJ9evyz3B6dsX1Ubal
         jA8p1HpJSsx5EUcerTvhuAMnv2GN0K3PY8IGSewSytSGbbXQbYrq0vLE6SP0AxCMKKbd
         6xVTFdqoi4UGn6OUaXRqqC0+J7yw7h0crQ/NnYGI+OOPqVLl09rgWhtNiCsZbDi6aCDi
         ul0w==
X-Gm-Message-State: ABy/qLaKxcf/N2G/1PXRRWyBtgwCftRiU0o/jPw2pFrn6tfNtPcD3pdn
        a5vXG1eEu7oY0OQuKvT7mowx6sNzdIKi0TyKcbivNhEkX7VW7wyNsXsPUIVHm4jHOTSDoj52AAd
        U2S/SSxFOD5G7QQY131YMmXOu8hQdEaULkGcq4SXI
X-Received: by 2002:a05:6808:14d3:b0:3a3:67cb:61e3 with SMTP id f19-20020a05680814d300b003a367cb61e3mr20971072oiw.25.1689170326739;
        Wed, 12 Jul 2023 06:58:46 -0700 (PDT)
X-Google-Smtp-Source: APBJJlHzvlFZ++qJUEwu1gqyN1kSKaU5kZ42u9NYIWco6QD9pz8UTV9DG9szFx5i2iCh3yXJptd2FCc9ShbH1RT7y5M=
X-Received: by 2002:a05:6808:14d3:b0:3a3:67cb:61e3 with SMTP id
 f19-20020a05680814d300b003a367cb61e3mr20971056oiw.25.1689170326524; Wed, 12
 Jul 2023 06:58:46 -0700 (PDT)
MIME-Version: 1.0
References: <CAK18DXagdLgwFG-ed97vVzMXC1BTCVbQrNQKXPwyH9HYy4TeJw@mail.gmail.com>
In-Reply-To: <CAK18DXagdLgwFG-ed97vVzMXC1BTCVbQrNQKXPwyH9HYy4TeJw@mail.gmail.com>
From:   Donald Zickus <dzickus@redhat.com>
Date:   Wed, 12 Jul 2023 09:58:35 -0400
Message-ID: <CAK18DXZHn28mZ-Sr5x_Lwn0SSisgcGqcBdt5MQNRXuNVYbnKZw@mail.gmail.com>
Subject: [RESEND] Looking for a hack to remove auto-selected items from
 .config output
To:     masahiroy@kernel.org
Cc:     linux-kbuild@vger.kernel.org
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

Resending without the html cruft to pass through the linux-kbuild mail daem=
on

---------- Forwarded message ---------
From: Donald Zickus <dzickus@redhat.com>
Date: Tue, Jul 11, 2023 at 6:27=E2=80=AFPM
Subject: Looking for a hack to remove auto-selected items from .config outp=
ut
To: <masahiroy@kernel.org>
Cc: <linux-kbuild@vger.kernel.org>


Hi Masahiro,

I am trying to cleanup some stale config data with some of the Red Hat
configs.  Like most distros, Red Hat sets a bunch of 'menu choice'
configs and then merges them together then runs something like 'make
olddefconfig' to autoselect the rest of the configs.  Been working
great for many years.

Lately, we are trying to audit the configs and ran into many stale Red
Hat set configs that no longer exist upstream (removed, renamed,
whatever).  Ok, running a script detects these and we can remove them
by hand.

One corner case we ran into is dropping configs.  Like upstream we try
and match the merged configs with the final setting from 'make
olddefconfig' and fail if there is a mismatch.  However, not every
config is applicable to every arch, so those configs are dropped and
we were always ok with it.  But now those dropped configs are
confusing folks who think configs are set but they are really dropped.
Yes, a Red Hat problem.

I am trying to untangle this.  Is there a hack I can use that takes a
generated .config file and removes all the 'selected' and 'implied'
options out?  Leaving me with just the minimum configs that need to be
set?  Then I can de-merge it and re-create our original set config
options.  Basically reversing the normal config generating process, I
think.

Not looking for anything complicated, just something simple I can quickly a=
pply.

Thoughts?

Cheers,
Don

