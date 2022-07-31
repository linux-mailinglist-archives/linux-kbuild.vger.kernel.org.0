Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F327C586015
	for <lists+linux-kbuild@lfdr.de>; Sun, 31 Jul 2022 19:16:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229977AbiGaRQg (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sun, 31 Jul 2022 13:16:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33362 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229495AbiGaRQf (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 31 Jul 2022 13:16:35 -0400
Received: from mail-oa1-x36.google.com (mail-oa1-x36.google.com [IPv6:2001:4860:4864:20::36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A5B8CD106
        for <linux-kbuild@vger.kernel.org>; Sun, 31 Jul 2022 10:16:34 -0700 (PDT)
Received: by mail-oa1-x36.google.com with SMTP id 586e51a60fabf-f2a4c51c45so11142795fac.9
        for <linux-kbuild@vger.kernel.org>; Sun, 31 Jul 2022 10:16:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:from:date:message-id:subject:to;
        bh=9dLDnMmzK+zaqYvrwtwhdbhQ0GIFqFkbzomqMEDuvOY=;
        b=Mh0Q9MSIMFHMtCKylnu14DZ8ZS3L8+PPADIAZdKjcDPitHudVGcy4Rr3L/FHtIfO+n
         6yAuyriNu29Rdp7nl6A/zF534pPnqnO1w+RalW+xHKrQQHwrqUM4NFz3hO+GuVyETWyd
         HsgCVmkkTpOnXpCpRYxzXkQ8sC4zWVlOm7BhJhea4lpJADx+THJeiby+cqTnkPORzQ3w
         Rb9YCLoRY4QefTus4WopNI2sK1OE/kRT+50NIVpKqCl35LzBHzUS1KE00EsvTfqYZk0H
         kPCJmI2Gw9DVMQTisxpggP09nhdOBFnHXhWUyV7r9RQovuJaniM1JpeiP2DnCG4pZ+/K
         yIpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=9dLDnMmzK+zaqYvrwtwhdbhQ0GIFqFkbzomqMEDuvOY=;
        b=Fadqi695jTdoUw5EL2DcXHi7JSJAhGDR9Ftq49qwCSYmWm3+RMSChCivd8Zn0UQtkz
         rT79xdaRnOaYi6hVgydPv/xXv6PQmadxyPvycPOWoTZpTcA6jDCg/MWheke3F7vt1xdE
         QW0gFRORu0718gTeWtfQEXjGSShVeHGQm/NZRn7rwSC1i7P4NWjvoF7a9L/IMZSQ/z03
         bc4I/rJ9Q40Xbnzw2Pmb4eam4Mo1jcmMomfhRC43rcHbalMoWyK/xkBAEx0JQo5Bl88B
         Dctc5SZNP123w9VDQom4/U45dBdmH3YSoIqQFpq5koX3NWxisKJYV7mb5itu1GtPfaG0
         mM6w==
X-Gm-Message-State: AJIora/T6vroBo6Uqltoq4TcFEbUr6nT/eBCTrKHnl4OGHQVqU57cykD
        SJtYg6D7KlBNE8RqYZKnxCQHvltZM0pLWV/YVlcamb8V11U=
X-Google-Smtp-Source: AGRyM1tglia+PPEAbS4pDxA3HdvrPD+e6SGhQVUcGz8doqbWM/JDb2cCa3W3hE5v/CZmEXjzrzbA/ib+pVD/qsY1LqM=
X-Received: by 2002:a05:6870:6027:b0:101:696e:d594 with SMTP id
 t39-20020a056870602700b00101696ed594mr6275745oaa.245.1659287793489; Sun, 31
 Jul 2022 10:16:33 -0700 (PDT)
MIME-Version: 1.0
From:   "David F." <df7729@gmail.com>
Date:   Sun, 31 Jul 2022 10:16:22 -0700
Message-ID: <CAGRSmLsBwZdDhcKjnC0=COU7B+kM8vuRjPv_znZ5=p3k+QCONg@mail.gmail.com>
Subject: kbuild self-created module file errors with: ERROR: modpos: missing MODULE_LICENSE
To:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Years ago I set up a series of makefiles and bash scripts to build
both a support library for kernel modules and my own kernel modules.
Now years later, I don't recall much about how all this works but it
has until moving to 5.15 (from 5.10. kernels).  Although, there was an
issue with it not supporting libraries at some upgrade point, but this
list helped me with a patch so it would build the .a libraries and
link with them.

Looking at the makefile for building the library it has a note that I
needed to set up a fake obj-m for it to actually build the library.
So what I have is:

# Setup module name for kbuild
obj-m:=junk.o
junk-objs:=lib.a

There is no reference to any junk_mod.c file, it appears kbuild
automatically creates the junk-mod.c file itself.   The problem is the
build now fails due to the:
ERROR: modpost: missing MODULE_LICENSE() in /.../junk.obj

Is there some other makefile option to make kbuild set the
MODULE_LICENSE() or perhaps ignore it since it's not needed in this
type of case?

Or should I take this junk.mod.c file and now modify it and then
actually copy it over as the actual source to use to force the library
to be created?

Thanks!!
